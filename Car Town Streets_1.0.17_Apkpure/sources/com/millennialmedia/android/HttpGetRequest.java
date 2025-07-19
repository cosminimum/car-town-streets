package com.millennialmedia.android;

import com.millennialmedia.android.MMAdViewSDK;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URI;
import java.net.URLEncoder;
import java.util.Map;
import java.util.TreeMap;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
/* loaded from: classes.dex */
class HttpGetRequest {
    private HttpClient client = new DefaultHttpClient();
    private HttpGet getRequest = new HttpGet();

    /* JADX INFO: Access modifiers changed from: package-private */
    public HttpResponse get(String url) throws Exception {
        try {
            this.getRequest.setURI(new URI(url));
            return this.client.execute(this.getRequest);
        } catch (OutOfMemoryError e) {
            MMAdViewSDK.Log.e("Out of memory!");
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void trackConversion(String goalId, String auid, boolean isFirstLaunch, long installTime, TreeMap<String, String> extraParams) throws Exception {
        int i = isFirstLaunch ? 1 : 0;
        try {
            StringBuilder urlBuilder = new StringBuilder("http://cvt.mydas.mobi/handleConversion?firstlaunch=" + i);
            if (goalId != null) {
                urlBuilder.append("&goalId=" + goalId);
            }
            if (auid != null) {
                if (auid.startsWith("mmh_")) {
                    urlBuilder.append("&hdid=" + URLEncoder.encode(auid));
                } else {
                    urlBuilder.append("&auid=" + URLEncoder.encode(auid));
                }
            }
            if (installTime > 0) {
                urlBuilder.append("&installtime=" + (installTime / 1000));
            }
            if (extraParams != null) {
                for (Map.Entry<String, String> entry : extraParams.entrySet()) {
                    urlBuilder.append(String.format("&%s=%s", entry.getKey(), URLEncoder.encode(entry.getValue(), "UTF-8")));
                }
            }
            String url = urlBuilder.toString();
            MMAdViewSDK.Log.d("Sending conversion tracker report: %s", url);
            this.getRequest.setURI(new URI(url));
            HttpResponse response = this.client.execute(this.getRequest);
            if (response.getStatusLine().getStatusCode() == 200) {
                MMAdViewSDK.Log.v("Conversion tracker reponse code: %d", Integer.valueOf(response.getStatusLine().getStatusCode()));
            } else {
                MMAdViewSDK.Log.e("Conversion tracker unable to complete report: %d", Integer.valueOf(response.getStatusLine().getStatusCode()));
            }
        } catch (IOException e) {
            MMAdViewSDK.Log.e("Unable to track conversion. %s", e.getMessage());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String convertStreamToString(InputStream is) throws IOException {
        BufferedReader reader;
        BufferedReader reader2 = null;
        if (is == null) {
            throw new IOException("Stream is null.");
        }
        try {
            try {
                reader = new BufferedReader(new InputStreamReader(is), 4096);
            } catch (OutOfMemoryError e) {
                e = e;
            }
        } catch (Throwable th) {
            th = th;
        }
        try {
            StringBuilder sb = new StringBuilder();
            while (true) {
                String line = reader.readLine();
                if (line == null) {
                    break;
                }
                sb.append(line + "\n");
            }
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e2) {
                    MMAdViewSDK.Log.d(e2);
                }
            }
            return sb.toString();
        } catch (OutOfMemoryError e3) {
            e = e3;
            reader2 = reader;
            MMAdViewSDK.Log.d(e);
            throw new IOException("Out of memory.");
        } catch (Throwable th2) {
            th = th2;
            reader2 = reader;
            if (reader2 != null) {
                try {
                    reader2.close();
                } catch (IOException e4) {
                    MMAdViewSDK.Log.d(e4);
                }
            }
            throw th;
        }
    }

    static void log(final String url) {
        if (url != null && url.length() > 0) {
            new Thread(new Runnable() { // from class: com.millennialmedia.android.HttpGetRequest.1
                @Override // java.lang.Runnable
                public void run() {
                    MMAdViewSDK.Log.v("Logging event to: %s", url);
                    HttpGetRequest getRequest = new HttpGetRequest();
                    try {
                        getRequest.get(url);
                    } catch (Exception e) {
                        MMAdViewSDK.Log.v(e.getMessage());
                    }
                }
            }).start();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void log(final String[] urls) {
        if (urls != null && urls.length > 0) {
            new Thread(new Runnable() { // from class: com.millennialmedia.android.HttpGetRequest.2
                @Override // java.lang.Runnable
                public void run() {
                    String[] arr$ = urls;
                    for (String url : arr$) {
                        MMAdViewSDK.Log.v("Logging event to: %s", url);
                        try {
                            HttpGetRequest getRequest = new HttpGetRequest();
                            getRequest.get(url);
                        } catch (Exception e) {
                            MMAdViewSDK.Log.v(e.getMessage());
                        }
                    }
                }
            }).start();
        }
    }
}
