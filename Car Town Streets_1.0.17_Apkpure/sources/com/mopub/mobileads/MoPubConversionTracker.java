package com.mopub.mobileads;

import android.content.Context;
import android.content.SharedPreferences;
import android.provider.Settings;
import android.util.Log;
import com.tapjoy.TapjoyConstants;
import java.io.IOException;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
/* loaded from: classes.dex */
public class MoPubConversionTracker {
    private Context mContext;
    private String mPackageName;
    Runnable mTrackOpen = new Runnable() { // from class: com.mopub.mobileads.MoPubConversionTracker.1
        @Override // java.lang.Runnable
        public void run() {
            StringBuilder sz = new StringBuilder("http://" + MoPubConversionTracker.TRACK_HOST + MoPubConversionTracker.TRACK_HANDLER);
            sz.append("?v=6&id=" + MoPubConversionTracker.this.mPackageName);
            String udid = Settings.Secure.getString(MoPubConversionTracker.this.mContext.getContentResolver(), TapjoyConstants.TJC_ANDROID_ID);
            String udidDigest = udid == null ? "" : Utils.sha1(udid);
            sz.append("&udid=sha:" + udidDigest);
            String url = sz.toString();
            Log.d("MoPub", "Conversion track: " + url);
            DefaultHttpClient httpclient = new DefaultHttpClient();
            HttpGet httpget = new HttpGet(url);
            try {
                HttpResponse response = httpclient.execute(httpget);
                if (response.getStatusLine().getStatusCode() != 200) {
                    Log.d("MoPub", "Conversion track failed: Status code != 200");
                    return;
                }
                HttpEntity entity = response.getEntity();
                if (entity == null || entity.getContentLength() == 0) {
                    Log.d("MoPub", "Conversion track failed: Response was empty");
                    return;
                }
                Log.d("MoPub", "Conversion track successful");
                SharedPreferences.Editor editor = MoPubConversionTracker.this.mContext.getSharedPreferences("mopubSettings", 0).edit();
                editor.putBoolean(MoPubConversionTracker.this.mPackageName + " tracked", true).commit();
            } catch (IOException e) {
                Log.d("MoPub", "Conversion track failed: IOException (no signal?)");
            } catch (ClientProtocolException e2) {
                Log.d("MoPub", "Conversion track failed: ClientProtocolException (no signal?)");
            }
        }
    };
    private static String TRACK_HOST = MoPubView.HOST;
    private static String TRACK_HANDLER = "/m/open";

    public void reportAppOpen(Context context) {
        if (context != null) {
            this.mContext = context;
            this.mPackageName = this.mContext.getPackageName();
            SharedPreferences settings = this.mContext.getSharedPreferences("mopubSettings", 0);
            if (!settings.getBoolean(this.mPackageName + " tracked", false)) {
                new Thread(this.mTrackOpen).start();
            } else {
                Log.d("MoPub", "Conversion already tracked");
            }
        }
    }
}
