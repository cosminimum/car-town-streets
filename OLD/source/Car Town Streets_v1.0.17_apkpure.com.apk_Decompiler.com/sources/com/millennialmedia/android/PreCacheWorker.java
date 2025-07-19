package com.millennialmedia.android;

import android.content.Context;
import com.millennialmedia.android.AdCache;
import com.millennialmedia.android.MMAdViewSDK;
import java.io.IOException;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;

class PreCacheWorker extends Thread implements AdCache.AdCacheTaskListener {
    private static boolean busy;
    private Context appContext;
    private String[] cachedVideos;

    static synchronized void preCacheVideos(String[] videos, Context context) {
        synchronized (PreCacheWorker.class) {
            if (!busy) {
                busy = true;
                new PreCacheWorker(videos, context).start();
            }
        }
    }

    private PreCacheWorker(String[] videos, Context context) {
        this.cachedVideos = videos;
        this.appContext = context.getApplicationContext();
    }

    public void downloadCompleted(CachedAd ad, boolean success) {
        synchronized (this) {
            if (success) {
                AdCache.save(this.appContext, ad);
            }
            notify();
        }
    }

    public synchronized void run() {
        for (String cachedVideo : this.cachedVideos) {
            try {
                HttpResponse httpResponse = new HttpGetRequest().get(cachedVideo);
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
                        if (!(httpHeader == null || httpHeader.getValue() == null || !httpHeader.getValue().equalsIgnoreCase("application/json"))) {
                            try {
                                VideoAd videoAd = new VideoAd(HttpGetRequest.convertStreamToString(httpEntity.getContent()));
                                if (videoAd == null) {
                                    continue;
                                } else if (videoAd.isValid()) {
                                    try {
                                        videoAd.downloadPriority = 1;
                                        AdCache.startDownloadTask(this.appContext, (String) null, videoAd, this);
                                        wait();
                                    } catch (InterruptedException e) {
                                        e.printStackTrace();
                                        MMAdViewSDK.Log.e("Pre cache worker interrupted: %s", e.getMessage());
                                    }
                                }
                            } catch (IllegalStateException e1) {
                                e1.printStackTrace();
                                MMAdViewSDK.Log.d("Pre cache worker: Millennial ad return failed. Invalid response data.");
                            } catch (IOException e12) {
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
