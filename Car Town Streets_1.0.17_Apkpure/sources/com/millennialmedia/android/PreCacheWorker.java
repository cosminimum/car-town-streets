package com.millennialmedia.android;

import android.content.Context;
import com.millennialmedia.android.AdCache;
import com.millennialmedia.android.MMAdViewSDK;
import java.io.IOException;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class PreCacheWorker extends Thread implements AdCache.AdCacheTaskListener {
    private static boolean busy;
    private Context appContext;
    private String[] cachedVideos;

    /* JADX INFO: Access modifiers changed from: package-private */
    public static synchronized void preCacheVideos(String[] videos, Context context) {
        synchronized (PreCacheWorker.class) {
            if (!busy) {
                busy = true;
                PreCacheWorker preCacheWorker = new PreCacheWorker(videos, context);
                preCacheWorker.start();
            }
        }
    }

    private PreCacheWorker(String[] videos, Context context) {
        this.cachedVideos = videos;
        this.appContext = context.getApplicationContext();
    }

    @Override // com.millennialmedia.android.AdCache.AdCacheTaskListener
    public void downloadCompleted(CachedAd ad, boolean success) {
        synchronized (this) {
            if (success) {
                AdCache.save(this.appContext, ad);
            }
            notify();
        }
    }

    @Override // java.lang.Thread, java.lang.Runnable
    public synchronized void run() {
        String[] arr$ = this.cachedVideos;
        for (String cachedVideo : arr$) {
            try {
                HttpGetRequest httpGetRequest = new HttpGetRequest();
                HttpResponse httpResponse = httpGetRequest.get(cachedVideo);
                if (httpResponse == null) {
                    MMAdViewSDK.Log.d("Pre cache worker: HTTP response is null");
                } else {
                    HttpEntity httpEntity = httpResponse.getEntity();
                    if (httpEntity == null) {
                        MMAdViewSDK.Log.d("Pre cache worker: Null HTTP entity");
                    } else if (httpEntity.getContentLength() == 0) {
                        MMAdViewSDK.Log.d("Pre cache worker: Millennial ad return failed. Zero content length returned.");
                    } else {
                        Header httpHeader = httpEntity.getContentType();
                        if (httpHeader != null && httpHeader.getValue() != null && httpHeader.getValue().equalsIgnoreCase("application/json")) {
                            try {
                                String json = HttpGetRequest.convertStreamToString(httpEntity.getContent());
                                VideoAd videoAd = new VideoAd(json);
                                if (videoAd != null && videoAd.isValid()) {
                                    try {
                                        videoAd.downloadPriority = 1;
                                        AdCache.startDownloadTask(this.appContext, null, videoAd, this);
                                        wait();
                                    } catch (InterruptedException e) {
                                        e.printStackTrace();
                                        MMAdViewSDK.Log.e("Pre cache worker interrupted: %s", e.getMessage());
                                    }
                                }
                            } catch (IOException e1) {
                                e1.printStackTrace();
                                MMAdViewSDK.Log.d("Pre cache worker: Millennial ad return failed. Invalid response data.");
                            } catch (IllegalStateException e12) {
                                e12.printStackTrace();
                                MMAdViewSDK.Log.d("Pre cache worker: Millennial ad return failed. Invalid response data.");
                            }
                        }
                    }
                }
            } catch (Exception e2) {
                MMAdViewSDK.Log.d("Pre cache worker HTTP error: %s", e2.getMessage());
            }
        }
        synchronized (PreCacheWorker.class) {
            busy = false;
        }
    }
}
