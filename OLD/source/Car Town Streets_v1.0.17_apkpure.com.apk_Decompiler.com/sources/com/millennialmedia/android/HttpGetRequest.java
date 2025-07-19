package com.millennialmedia.android;

import com.millennialmedia.android.MMAdViewSDK;
import java.io.IOException;
import java.net.URI;
import java.net.URLEncoder;
import java.util.Map;
import java.util.TreeMap;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

class HttpGetRequest {
    private HttpClient client = new DefaultHttpClient();
    private HttpGet getRequest = new HttpGet();

    HttpGetRequest() {
    }

    /* access modifiers changed from: package-private */
    public HttpResponse get(String url) throws Exception {
        try {
            this.getRequest.setURI(new URI(url));
            return this.client.execute(this.getRequest);
        } catch (OutOfMemoryError e) {
            MMAdViewSDK.Log.e("Out of memory!");
            return null;
        }
    }

    /* access modifiers changed from: package-private */
    public void trackConversion(String goalId, String auid, boolean isFirstLaunch, long installTime, TreeMap<String, String> extraParams) throws Exception {
        try {
            StringBuilder urlBuilder = new StringBuilder("http://cvt.mydas.mobi/handleConversion?firstlaunch=" + (isFirstLaunch ? 1 : 0));
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
                    urlBuilder.append(String.format("&%s=%s", new Object[]{entry.getKey(), URLEncoder.encode(entry.getValue(), "UTF-8")}));
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

    /* JADX WARNING: Removed duplicated region for block: B:19:0x004c A[SYNTHETIC, Splitter:B:19:0x004c] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    static java.lang.String convertStreamToString(java.io.InputStream r7) throws java.io.IOException {
        /*
            r2 = 0
            r1 = 0
            if (r7 != 0) goto L_0x000c
            java.io.IOException r5 = new java.io.IOException
            java.lang.String r6 = "Stream is null."
            r5.<init>(r6)
            throw r5
        L_0x000c:
            java.io.BufferedReader r3 = new java.io.BufferedReader     // Catch:{ OutOfMemoryError -> 0x0067 }
            java.io.InputStreamReader r5 = new java.io.InputStreamReader     // Catch:{ OutOfMemoryError -> 0x0067 }
            r5.<init>(r7)     // Catch:{ OutOfMemoryError -> 0x0067 }
            r6 = 4096(0x1000, float:5.74E-42)
            r3.<init>(r5, r6)     // Catch:{ OutOfMemoryError -> 0x0067 }
            java.lang.StringBuilder r4 = new java.lang.StringBuilder     // Catch:{ OutOfMemoryError -> 0x003a, all -> 0x0064 }
            r4.<init>()     // Catch:{ OutOfMemoryError -> 0x003a, all -> 0x0064 }
        L_0x001d:
            java.lang.String r1 = r3.readLine()     // Catch:{ OutOfMemoryError -> 0x003a, all -> 0x0064 }
            if (r1 == 0) goto L_0x0050
            java.lang.StringBuilder r5 = new java.lang.StringBuilder     // Catch:{ OutOfMemoryError -> 0x003a, all -> 0x0064 }
            r5.<init>()     // Catch:{ OutOfMemoryError -> 0x003a, all -> 0x0064 }
            java.lang.StringBuilder r5 = r5.append(r1)     // Catch:{ OutOfMemoryError -> 0x003a, all -> 0x0064 }
            java.lang.String r6 = "\n"
            java.lang.StringBuilder r5 = r5.append(r6)     // Catch:{ OutOfMemoryError -> 0x003a, all -> 0x0064 }
            java.lang.String r5 = r5.toString()     // Catch:{ OutOfMemoryError -> 0x003a, all -> 0x0064 }
            r4.append(r5)     // Catch:{ OutOfMemoryError -> 0x003a, all -> 0x0064 }
            goto L_0x001d
        L_0x003a:
            r0 = move-exception
            r2 = r3
        L_0x003c:
            r4 = 0
            r1 = 0
            com.millennialmedia.android.MMAdViewSDK.Log.d((java.lang.Throwable) r0)     // Catch:{ all -> 0x0049 }
            java.io.IOException r5 = new java.io.IOException     // Catch:{ all -> 0x0049 }
            java.lang.String r6 = "Out of memory."
            r5.<init>(r6)     // Catch:{ all -> 0x0049 }
            throw r5     // Catch:{ all -> 0x0049 }
        L_0x0049:
            r5 = move-exception
        L_0x004a:
            if (r2 == 0) goto L_0x004f
            r2.close()     // Catch:{ IOException -> 0x005f }
        L_0x004f:
            throw r5
        L_0x0050:
            if (r3 == 0) goto L_0x0055
            r3.close()     // Catch:{ IOException -> 0x005a }
        L_0x0055:
            java.lang.String r5 = r4.toString()
            return r5
        L_0x005a:
            r0 = move-exception
            com.millennialmedia.android.MMAdViewSDK.Log.d((java.lang.Throwable) r0)
            goto L_0x0055
        L_0x005f:
            r0 = move-exception
            com.millennialmedia.android.MMAdViewSDK.Log.d((java.lang.Throwable) r0)
            goto L_0x004f
        L_0x0064:
            r5 = move-exception
            r2 = r3
            goto L_0x004a
        L_0x0067:
            r0 = move-exception
            goto L_0x003c
        */
        throw new UnsupportedOperationException("Method not decompiled: com.millennialmedia.android.HttpGetRequest.convertStreamToString(java.io.InputStream):java.lang.String");
    }

    static void log(final String url) {
        if (url != null && url.length() > 0) {
            new Thread(new Runnable() {
                public void run() {
                    MMAdViewSDK.Log.v("Logging event to: %s", url);
                    try {
                        new HttpGetRequest().get(url);
                    } catch (Exception e) {
                        MMAdViewSDK.Log.v(e.getMessage());
                    }
                }
            }).start();
        }
    }

    static void log(final String[] urls) {
        if (urls != null && urls.length > 0) {
            new Thread(new Runnable() {
                public void run() {
                    for (String url : urls) {
                        MMAdViewSDK.Log.v("Logging event to: %s", url);
                        try {
                            new HttpGetRequest().get(url);
                        } catch (Exception e) {
                            MMAdViewSDK.Log.v(e.getMessage());
                        }
                    }
                }
            }).start();
        }
    }
}
