package tapjoy;

import android.net.Uri;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.util.EntityUtils;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

public class TapjoyURLConnection {
    private static final String TAPJOY_URL_CONNECTION = "TapjoyURLConnection";
    public static final int TYPE_GET = 0;
    public static final int TYPE_POST = 1;

    public TapjoyHttpURLResponse getResponseFromURL(String url, String params) {
        return getResponseFromURL(url, params, 0);
    }

    /* JADX WARNING: type inference failed for: r13v22, types: [java.net.URLConnection] */
    /* JADX WARNING: Multi-variable type inference failed */
    /* JADX WARNING: Removed duplicated region for block: B:15:0x00eb A[SYNTHETIC, Splitter:B:15:0x00eb] */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public com.tapjoy.TapjoyHttpURLResponse getResponseFromURL(String r17, String r18, int r19) {
        /*
            r16 = this;
            com.tapjoy.TapjoyHttpURLResponse r12 = new com.tapjoy.TapjoyHttpURLResponse
            r12.<init>()
            r1 = 0
            r7 = 0
            r10 = 0
            r6 = 0
            java.lang.StringBuilder r13 = new java.lang.StringBuilder     // Catch:{ Exception -> 0x01ea }
            r13.<init>()     // Catch:{ Exception -> 0x01ea }
            r0 = r17
            java.lang.StringBuilder r13 = r13.append(r0)     // Catch:{ Exception -> 0x01ea }
            r0 = r18
            java.lang.StringBuilder r13 = r13.append(r0)     // Catch:{ Exception -> 0x01ea }
            java.lang.String r9 = r13.toString()     // Catch:{ Exception -> 0x01ea }
            java.lang.String r13 = " "
            java.lang.String r14 = "%20"
            java.lang.String r9 = r9.replaceAll(r13, r14)     // Catch:{ Exception -> 0x01ea }
            java.lang.String r13 = "TapjoyURLConnection"
            java.lang.StringBuilder r14 = new java.lang.StringBuilder     // Catch:{ Exception -> 0x01ea }
            r14.<init>()     // Catch:{ Exception -> 0x01ea }
            java.lang.String r15 = "baseURL: "
            java.lang.StringBuilder r14 = r14.append(r15)     // Catch:{ Exception -> 0x01ea }
            r0 = r17
            java.lang.StringBuilder r14 = r14.append(r0)     // Catch:{ Exception -> 0x01ea }
            java.lang.String r14 = r14.toString()     // Catch:{ Exception -> 0x01ea }
            com.tapjoy.TapjoyLog.i(r13, r14)     // Catch:{ Exception -> 0x01ea }
            java.lang.String r13 = "TapjoyURLConnection"
            java.lang.StringBuilder r14 = new java.lang.StringBuilder     // Catch:{ Exception -> 0x01ea }
            r14.<init>()     // Catch:{ Exception -> 0x01ea }
            java.lang.String r15 = "requestURL: "
            java.lang.StringBuilder r14 = r14.append(r15)     // Catch:{ Exception -> 0x01ea }
            java.lang.StringBuilder r14 = r14.append(r9)     // Catch:{ Exception -> 0x01ea }
            java.lang.String r14 = r14.toString()     // Catch:{ Exception -> 0x01ea }
            com.tapjoy.TapjoyLog.i(r13, r14)     // Catch:{ Exception -> 0x01ea }
            java.lang.String r13 = "TapjoyURLConnection"
            java.lang.StringBuilder r14 = new java.lang.StringBuilder     // Catch:{ Exception -> 0x01ea }
            r14.<init>()     // Catch:{ Exception -> 0x01ea }
            java.lang.String r15 = "type: "
            java.lang.StringBuilder r14 = r14.append(r15)     // Catch:{ Exception -> 0x01ea }
            r0 = r19
            java.lang.StringBuilder r14 = r14.append(r0)     // Catch:{ Exception -> 0x01ea }
            java.lang.String r14 = r14.toString()     // Catch:{ Exception -> 0x01ea }
            com.tapjoy.TapjoyLog.i(r13, r14)     // Catch:{ Exception -> 0x01ea }
            java.net.URL r5 = new java.net.URL     // Catch:{ Exception -> 0x01ea }
            r5.<init>(r9)     // Catch:{ Exception -> 0x01ea }
            java.net.URLConnection r13 = r5.openConnection()     // Catch:{ Exception -> 0x01ea }
            r0 = r13
            java.net.HttpURLConnection r0 = (java.net.HttpURLConnection) r0     // Catch:{ Exception -> 0x01ea }
            r1 = r0
            r13 = 15000(0x3a98, float:2.102E-41)
            r1.setConnectTimeout(r13)     // Catch:{ Exception -> 0x01ea }
            r13 = 30000(0x7530, float:4.2039E-41)
            r1.setReadTimeout(r13)     // Catch:{ Exception -> 0x01ea }
            r13 = 1
            r0 = r19
            if (r0 != r13) goto L_0x0093
            java.lang.String r13 = "POST"
            r1.setRequestMethod(r13)     // Catch:{ Exception -> 0x01ea }
        L_0x0093:
            r1.connect()     // Catch:{ Exception -> 0x01ea }
            int r13 = r1.getResponseCode()     // Catch:{ Exception -> 0x01ea }
            r12.statusCode = r13     // Catch:{ Exception -> 0x01ea }
            java.io.BufferedReader r8 = new java.io.BufferedReader     // Catch:{ Exception -> 0x01ea }
            java.io.InputStreamReader r13 = new java.io.InputStreamReader     // Catch:{ Exception -> 0x01ea }
            java.io.InputStream r14 = r1.getInputStream()     // Catch:{ Exception -> 0x01ea }
            r13.<init>(r14)     // Catch:{ Exception -> 0x01ea }
            r8.<init>(r13)     // Catch:{ Exception -> 0x01ea }
            java.lang.StringBuilder r11 = new java.lang.StringBuilder     // Catch:{ Exception -> 0x01ef }
            r11.<init>()     // Catch:{ Exception -> 0x01ef }
        L_0x00af:
            java.lang.String r6 = r8.readLine()     // Catch:{ Exception -> 0x00cc }
            if (r6 == 0) goto L_0x01a0
            java.lang.StringBuilder r13 = new java.lang.StringBuilder     // Catch:{ Exception -> 0x00cc }
            r13.<init>()     // Catch:{ Exception -> 0x00cc }
            java.lang.StringBuilder r13 = r13.append(r6)     // Catch:{ Exception -> 0x00cc }
            r14 = 10
            java.lang.StringBuilder r13 = r13.append(r14)     // Catch:{ Exception -> 0x00cc }
            java.lang.String r13 = r13.toString()     // Catch:{ Exception -> 0x00cc }
            r11.append(r13)     // Catch:{ Exception -> 0x00cc }
            goto L_0x00af
        L_0x00cc:
            r3 = move-exception
        L_0x00cd:
            java.lang.String r13 = "TapjoyURLConnection"
            java.lang.StringBuilder r14 = new java.lang.StringBuilder
            r14.<init>()
            java.lang.String r15 = "Exception: "
            java.lang.StringBuilder r14 = r14.append(r15)
            java.lang.String r15 = r3.toString()
            java.lang.StringBuilder r14 = r14.append(r15)
            java.lang.String r14 = r14.toString()
            com.tapjoy.TapjoyLog.e(r13, r14)
            if (r1 == 0) goto L_0x01f3
            java.lang.String r13 = r12.response     // Catch:{ Exception -> 0x01e1 }
            if (r13 != 0) goto L_0x01f3
            java.io.BufferedReader r7 = new java.io.BufferedReader     // Catch:{ Exception -> 0x01e1 }
            java.io.InputStreamReader r13 = new java.io.InputStreamReader     // Catch:{ Exception -> 0x01e1 }
            java.io.InputStream r14 = r1.getErrorStream()     // Catch:{ Exception -> 0x01e1 }
            r13.<init>(r14)     // Catch:{ Exception -> 0x01e1 }
            r7.<init>(r13)     // Catch:{ Exception -> 0x01e1 }
            java.lang.StringBuilder r10 = new java.lang.StringBuilder     // Catch:{ Exception -> 0x01e6 }
            r10.<init>()     // Catch:{ Exception -> 0x01e6 }
        L_0x0102:
            java.lang.String r6 = r7.readLine()     // Catch:{ Exception -> 0x011f }
            if (r6 == 0) goto L_0x01d9
            java.lang.StringBuilder r13 = new java.lang.StringBuilder     // Catch:{ Exception -> 0x011f }
            r13.<init>()     // Catch:{ Exception -> 0x011f }
            java.lang.StringBuilder r13 = r13.append(r6)     // Catch:{ Exception -> 0x011f }
            r14 = 10
            java.lang.StringBuilder r13 = r13.append(r14)     // Catch:{ Exception -> 0x011f }
            java.lang.String r13 = r13.toString()     // Catch:{ Exception -> 0x011f }
            r10.append(r13)     // Catch:{ Exception -> 0x011f }
            goto L_0x0102
        L_0x011f:
            r4 = move-exception
        L_0x0120:
            java.lang.String r13 = "TapjoyURLConnection"
            java.lang.StringBuilder r14 = new java.lang.StringBuilder
            r14.<init>()
            java.lang.String r15 = "Exception trying to get error code/content: "
            java.lang.StringBuilder r14 = r14.append(r15)
            java.lang.String r15 = r4.toString()
            java.lang.StringBuilder r14 = r14.append(r15)
            java.lang.String r14 = r14.toString()
            com.tapjoy.TapjoyLog.e(r13, r14)
        L_0x013c:
            java.lang.String r13 = "TapjoyURLConnection"
            java.lang.String r14 = "--------------------"
            com.tapjoy.TapjoyLog.i(r13, r14)
            java.lang.String r13 = "TapjoyURLConnection"
            java.lang.StringBuilder r14 = new java.lang.StringBuilder
            r14.<init>()
            java.lang.String r15 = "response status: "
            java.lang.StringBuilder r14 = r14.append(r15)
            int r15 = r12.statusCode
            java.lang.StringBuilder r14 = r14.append(r15)
            java.lang.String r14 = r14.toString()
            com.tapjoy.TapjoyLog.i(r13, r14)
            java.lang.String r13 = "TapjoyURLConnection"
            java.lang.StringBuilder r14 = new java.lang.StringBuilder
            r14.<init>()
            java.lang.String r15 = "response size: "
            java.lang.StringBuilder r14 = r14.append(r15)
            int r15 = r12.contentLength
            java.lang.StringBuilder r14 = r14.append(r15)
            java.lang.String r14 = r14.toString()
            com.tapjoy.TapjoyLog.i(r13, r14)
            java.lang.String r13 = "TapjoyURLConnection"
            java.lang.String r14 = "response: "
            com.tapjoy.TapjoyLog.i(r13, r14)
            java.lang.String r13 = "TapjoyURLConnection"
            java.lang.StringBuilder r14 = new java.lang.StringBuilder
            r14.<init>()
            java.lang.String r15 = ""
            java.lang.StringBuilder r14 = r14.append(r15)
            java.lang.String r15 = r12.response
            java.lang.StringBuilder r14 = r14.append(r15)
            java.lang.String r14 = r14.toString()
            com.tapjoy.TapjoyLog.i(r13, r14)
            java.lang.String r13 = "TapjoyURLConnection"
            java.lang.String r14 = "--------------------"
            com.tapjoy.TapjoyLog.i(r13, r14)
            return r12
        L_0x01a0:
            java.lang.String r13 = r11.toString()     // Catch:{ Exception -> 0x00cc }
            r12.response = r13     // Catch:{ Exception -> 0x00cc }
            java.lang.String r13 = "content-length"
            java.lang.String r2 = r1.getHeaderField(r13)     // Catch:{ Exception -> 0x00cc }
            if (r2 == 0) goto L_0x01b8
            java.lang.Integer r13 = java.lang.Integer.valueOf(r2)     // Catch:{ Exception -> 0x01bb }
            int r13 = r13.intValue()     // Catch:{ Exception -> 0x01bb }
            r12.contentLength = r13     // Catch:{ Exception -> 0x01bb }
        L_0x01b8:
            r10 = r11
            r7 = r8
            goto L_0x013c
        L_0x01bb:
            r3 = move-exception
            java.lang.String r13 = "TapjoyURLConnection"
            java.lang.StringBuilder r14 = new java.lang.StringBuilder     // Catch:{ Exception -> 0x00cc }
            r14.<init>()     // Catch:{ Exception -> 0x00cc }
            java.lang.String r15 = "Exception: "
            java.lang.StringBuilder r14 = r14.append(r15)     // Catch:{ Exception -> 0x00cc }
            java.lang.String r15 = r3.toString()     // Catch:{ Exception -> 0x00cc }
            java.lang.StringBuilder r14 = r14.append(r15)     // Catch:{ Exception -> 0x00cc }
            java.lang.String r14 = r14.toString()     // Catch:{ Exception -> 0x00cc }
            com.tapjoy.TapjoyLog.e(r13, r14)     // Catch:{ Exception -> 0x00cc }
            goto L_0x01b8
        L_0x01d9:
            java.lang.String r13 = r10.toString()     // Catch:{ Exception -> 0x011f }
            r12.response = r13     // Catch:{ Exception -> 0x011f }
            goto L_0x013c
        L_0x01e1:
            r4 = move-exception
            r10 = r11
            r7 = r8
            goto L_0x0120
        L_0x01e6:
            r4 = move-exception
            r10 = r11
            goto L_0x0120
        L_0x01ea:
            r3 = move-exception
            r11 = r10
            r8 = r7
            goto L_0x00cd
        L_0x01ef:
            r3 = move-exception
            r11 = r10
            goto L_0x00cd
        L_0x01f3:
            r10 = r11
            r7 = r8
            goto L_0x013c
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tapjoy.TapjoyURLConnection.getResponseFromURL(java.lang.String, java.lang.String, int):com.tapjoy.TapjoyHttpURLResponse");
    }

    public String connectToURL(String url) {
        return connectToURL(url, "");
    }

    public String connectToURL(String url, String params) {
        String httpResponse = null;
        try {
            String requestURL = (url + params).replaceAll(" ", "%20");
            TapjoyLog.i(TAPJOY_URL_CONNECTION, "baseURL: " + url);
            TapjoyLog.i(TAPJOY_URL_CONNECTION, "requestURL: " + requestURL);
            HttpURLConnection connection = (HttpURLConnection) new URL(requestURL).openConnection();
            connection.setConnectTimeout(15000);
            connection.setReadTimeout(30000);
            httpResponse = connection.getResponseMessage();
            connection.connect();
            BufferedReader rd = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            try {
                StringBuilder sb = new StringBuilder();
                while (true) {
                    try {
                        String line = rd.readLine();
                        if (line == null) {
                            break;
                        }
                        sb.append(line + 10);
                    } catch (Exception e) {
                        e = e;
                        StringBuilder sb2 = sb;
                        BufferedReader bufferedReader = rd;
                        TapjoyLog.e(TAPJOY_URL_CONNECTION, "Exception: " + e.toString());
                        return httpResponse;
                    }
                }
                httpResponse = sb.toString();
                TapjoyLog.i(TAPJOY_URL_CONNECTION, "--------------------");
                TapjoyLog.i(TAPJOY_URL_CONNECTION, "response size: " + httpResponse.length());
                TapjoyLog.i(TAPJOY_URL_CONNECTION, "response: ");
                TapjoyLog.i(TAPJOY_URL_CONNECTION, "" + httpResponse);
                TapjoyLog.i(TAPJOY_URL_CONNECTION, "--------------------");
                StringBuilder sb3 = sb;
                BufferedReader bufferedReader2 = rd;
            } catch (Exception e2) {
                e = e2;
                BufferedReader bufferedReader3 = rd;
                TapjoyLog.e(TAPJOY_URL_CONNECTION, "Exception: " + e.toString());
                return httpResponse;
            }
        } catch (Exception e3) {
            e = e3;
            TapjoyLog.e(TAPJOY_URL_CONNECTION, "Exception: " + e.toString());
            return httpResponse;
        }
        return httpResponse;
    }

    public String getContentLength(String url) {
        String contentLength = null;
        try {
            String requestURL = url.replaceAll(" ", "%20");
            TapjoyLog.i(TAPJOY_URL_CONNECTION, "requestURL: " + requestURL);
            HttpURLConnection connection = (HttpURLConnection) new URL(requestURL).openConnection();
            connection.setConnectTimeout(15000);
            connection.setReadTimeout(30000);
            contentLength = connection.getHeaderField("content-length");
        } catch (Exception e) {
            TapjoyLog.e(TAPJOY_URL_CONNECTION, "Exception: " + e.toString());
        }
        TapjoyLog.i(TAPJOY_URL_CONNECTION, "content-length: " + contentLength);
        return contentLength;
    }

    public String connectToURLwithPOST(String url, Hashtable<String, String> params, Hashtable<String, String> paramsData) {
        try {
            String requestURL = url.replaceAll(" ", "%20");
            TapjoyLog.i(TAPJOY_URL_CONNECTION, "baseURL: " + url);
            TapjoyLog.i(TAPJOY_URL_CONNECTION, "requestURL: " + requestURL);
            HttpPost httpPost = new HttpPost(requestURL);
            List<NameValuePair> pairs = new ArrayList<>();
            for (Map.Entry<String, String> item : params.entrySet()) {
                pairs.add(new BasicNameValuePair(item.getKey(), item.getValue()));
                TapjoyLog.i(TAPJOY_URL_CONNECTION, "key: " + item.getKey() + ", value: " + Uri.encode(item.getValue()));
            }
            if (paramsData != null) {
                if (paramsData.size() > 0) {
                    for (Map.Entry<String, String> item2 : paramsData.entrySet()) {
                        pairs.add(new BasicNameValuePair("data[" + item2.getKey() + "]", item2.getValue()));
                        TapjoyLog.i(TAPJOY_URL_CONNECTION, "key: " + item2.getKey() + ", value: " + Uri.encode(item2.getValue()));
                    }
                }
            }
            httpPost.setEntity(new UrlEncodedFormEntity(pairs));
            TapjoyLog.i(TAPJOY_URL_CONNECTION, "HTTP POST: " + httpPost.toString());
            HttpParams httpParameters = new BasicHttpParams();
            HttpConnectionParams.setConnectionTimeout(httpParameters, 15000);
            HttpConnectionParams.setSoTimeout(httpParameters, 30000);
            HttpResponse response = new DefaultHttpClient(httpParameters).execute(httpPost);
            String httpResponse = EntityUtils.toString(response.getEntity());
            TapjoyLog.i(TAPJOY_URL_CONNECTION, "--------------------");
            TapjoyLog.i(TAPJOY_URL_CONNECTION, "response status: " + response.getStatusLine().getStatusCode());
            TapjoyLog.i(TAPJOY_URL_CONNECTION, "response size: " + httpResponse.length());
            TapjoyLog.i(TAPJOY_URL_CONNECTION, "response: ");
            TapjoyLog.i(TAPJOY_URL_CONNECTION, "" + httpResponse);
            TapjoyLog.i(TAPJOY_URL_CONNECTION, "--------------------");
            return httpResponse;
        } catch (Exception e) {
            TapjoyLog.e(TAPJOY_URL_CONNECTION, "Exception: " + e.toString());
            return null;
        }
    }
}
