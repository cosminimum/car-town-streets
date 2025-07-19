package com.AdX.tag;

import android.util.Log;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.util.EntityUtils;

public class AdXURLConnection {
    public static String connectToURL(String url, String params) {
        String httpResponse = null;
        try {
            HttpGet http = new HttpGet((String.valueOf(url) + params).replaceAll(" ", "%20"));
            HttpParams httpParameters = new BasicHttpParams();
            HttpConnectionParams.setConnectionTimeout(httpParameters, 15000);
            HttpConnectionParams.setSoTimeout(httpParameters, 30000);
            HttpResponse response = new DefaultHttpClient(httpParameters).execute(http);
            httpResponse = EntityUtils.toString(response.getEntity());
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
