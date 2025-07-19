package com.mopub.mobileads;

import android.content.Context;
import android.provider.Settings;
import android.util.Log;
import com.tapjoy.TapjoyConstants;
import java.io.IOException;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

public class MoPubConversionTracker {
    /* access modifiers changed from: private */
    public static String TRACK_HANDLER = "/m/open";
    /* access modifiers changed from: private */
    public static String TRACK_HOST = MoPubView.HOST;
    /* access modifiers changed from: private */
    public Context mContext;
    /* access modifiers changed from: private */
    public String mPackageName;
    Runnable mTrackOpen = new Runnable() {
        public void run() {
            StringBuilder sz = new StringBuilder("http://" + MoPubConversionTracker.TRACK_HOST + MoPubConversionTracker.TRACK_HANDLER);
            sz.append("?v=6&id=" + MoPubConversionTracker.this.mPackageName);
            String udid = Settings.Secure.getString(MoPubConversionTracker.this.mContext.getContentResolver(), TapjoyConstants.TJC_ANDROID_ID);
            sz.append("&udid=sha:" + (udid == null ? "" : Utils.sha1(udid)));
            String url = sz.toString();
            Log.d("MoPub", "Conversion track: " + url);
            try {
                HttpResponse response = new DefaultHttpClient().execute(new HttpGet(url));
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
                MoPubConversionTracker.this.mContext.getSharedPreferences("mopubSettings", 0).edit().putBoolean(MoPubConversionTracker.this.mPackageName + " tracked", true).commit();
            } catch (ClientProtocolException e) {
                Log.d("MoPub", "Conversion track failed: ClientProtocolException (no signal?)");
            } catch (IOException e2) {
                Log.d("MoPub", "Conversion track failed: IOException (no signal?)");
            }
        }
    };

    public void reportAppOpen(Context context) {
        if (context != null) {
            this.mContext = context;
            this.mPackageName = this.mContext.getPackageName();
            if (!this.mContext.getSharedPreferences("mopubSettings", 0).getBoolean(this.mPackageName + " tracked", false)) {
                new Thread(this.mTrackOpen).start();
            } else {
                Log.d("MoPub", "Conversion already tracked");
            }
        }
    }
}
