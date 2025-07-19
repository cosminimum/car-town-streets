package com.AdX.tag;

import android.util.Log;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.util.EntityUtils;
/* loaded from: classes.dex */
public class AdXURLConnection {
    public static String connectToURL(String url, String params) {
        String httpResponse = null;
        try {
            String requestURL = String.valueOf(url) + params;
            HttpGet http = new HttpGet(requestURL.replaceAll(" ", "%20"));
            BasicHttpParams basicHttpParams = new BasicHttpParams();
            HttpConnectionParams.setConnectionTimeout(basicHttpParams, 15000);
            HttpConnectionParams.setSoTimeout(basicHttpParams, 30000);
            HttpResponse response = new DefaultHttpClient(basicHttpParams).execute(http);
            HttpEntity entity = response.getEntity();
            httpResponse = EntityUtils.toString(entity);
            Log.i("AdXAppTracker", "--------------------");
            Log.i("AdXAppTracker", "response status: " + response.getStatusLine().getStatusCode());
            Log.i("AdXAppTracker", "response size: " + httpResponse.length());
            Log.i("AdXAppTracker", "response: ");
            Log.i("AdXAppTracker", httpResponse);
            Log.i("AdXAppTracker", "--------------------");
            return httpResponse;
        } catch (Exception e) {
            Log.e("AdXAppTracker", "Exception: " + e.toString());
            return httpResponse;
        }
    }
}
