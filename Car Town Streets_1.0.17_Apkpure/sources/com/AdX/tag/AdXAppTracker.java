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
/* loaded from: classes.dex */
public class AdXAppTracker extends BroadcastReceiver {
    final String AdX_PREFERENCE = "AdXPrefrences";
    final String REFERRAL_URL = TapjoyConstants.PREF_REFERRAL_URL;

    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        Log.i("AdXAppTracker", "Received Referrral Intent");
        String uri = intent.toURI();
        if (uri != null && uri.length() > 0) {
            int index = uri.indexOf("referrer=");
            if (index > -1) {
                String uri2 = uri.substring(index, uri.length() - 4);
                Log.i("AdXAppTracker", "Referral URI: " + uri2);
                SharedPreferences settings = context.getSharedPreferences("AdXPrefrences", 0);
                SharedPreferences.Editor editor = settings.edit();
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
        Set<String> localObject;
        String str1 = "";
        try {
            PackageManager localObject2 = paramContext.getPackageManager();
            if (localObject2 != null) {
                ComponentName localComponentName = new ComponentName(paramContext, AdXAppTracker.class);
                ActivityInfo localActivityInfo = localObject2.getReceiverInfo(localComponentName, 128);
                if (localActivityInfo != null && localActivityInfo.metaData != null && (localObject = localActivityInfo.metaData.keySet()) != null) {
                    for (String localObject3 : localObject) {
                        try {
                            str1 = localActivityInfo.metaData.getString(localObject3);
                            ((BroadcastReceiver) Class.forName(str1).newInstance()).onReceive(paramContext, paramIntent);
                            String str2 = "Successfully forwarded install notification to " + str1;
                            Log.d("AdXAppTracker", str2);
                        } catch (Exception localException1) {
                            String str3 = "Could not forward Market's INSTALL_REFERRER intent to " + str1;
                            Log.w("AdXAppTracker", str3, localException1);
                        }
                    }
                }
            }
        } catch (Exception localException2) {
            Log.w("AdXAppTracker", "Unhandled exception while forwarding install intents.  Possibly lost some install information.", localException2);
        }
    }
}
