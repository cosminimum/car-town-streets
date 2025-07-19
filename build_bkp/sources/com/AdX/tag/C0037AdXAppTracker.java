package com.AdX.tag;

import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.util.Log;
import com.tapjoy.TapjoyConstants;
import java.util.Set;

/* renamed from: com.AdX.tag.AdXAppTracker */
public class C0037AdXAppTracker extends BroadcastReceiver {
    final String AdX_PREFERENCE = "AdXPrefrences";
    final String REFERRAL_URL = TapjoyConstants.PREF_REFERRAL_URL;

    public void onReceive(Context context, Intent intent) {
        Log.i("AdXAppTracker", "Received Referrral Intent");
        String uri = intent.toURI();
        if (uri != null && uri.length() > 0) {
            int index = uri.indexOf("referrer=");
            if (index > -1) {
                String uri2 = uri.substring(index, uri.length() - 4);
                Log.i("AdXAppTracker", "Referral URI: " + uri2);
                SharedPreferences.Editor editor = context.getSharedPreferences("AdXPrefrences", 0).edit();
                editor.putString(TapjoyConstants.PREF_REFERRAL_URL, uri2);
                editor.commit();
                Log.i("AdXAppTracker", "Cached Referral URI: " + uri2);
            } else {
                Log.i("AdXAppTracker", "No Referral URL.");
            }
        }
        AdXConnect.doBroadcastConnectInstance(context);
        pass_on_broadcast(context, intent);
        Log.i("AdXAppTracker", "End");
    }

    private void pass_on_broadcast(Context paramContext, Intent paramIntent) {
        ActivityInfo localActivityInfo;
        Set<String> localObject;
        String str1 = "";
        try {
            PackageManager localObject2 = paramContext.getPackageManager();
            if (localObject2 != null && (localActivityInfo = localObject2.getReceiverInfo(new ComponentName(paramContext, C0037AdXAppTracker.class), 128)) != null && localActivityInfo.metaData != null && (localObject = localActivityInfo.metaData.keySet()) != null) {
                for (String localObject3 : localObject) {
                    try {
                        str1 = localActivityInfo.metaData.getString(localObject3);
                        ((BroadcastReceiver) Class.forName(str1).newInstance()).onReceive(paramContext, paramIntent);
                        Log.d("AdXAppTracker", "Successfully forwarded install notification to " + str1);
                    } catch (Exception localException1) {
                        Log.w("AdXAppTracker", "Could not forward Market's INSTALL_REFERRER intent to " + str1, localException1);
                    }
                }
            }
        } catch (Exception localException2) {
            Log.w("AdXAppTracker", "Unhandled exception while forwarding install intents.  Possibly lost some install information.", localException2);
        }
    }
}
