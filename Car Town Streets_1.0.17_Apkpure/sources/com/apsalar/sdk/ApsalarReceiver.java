package com.apsalar.sdk;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ActivityInfo;
import android.content.pm.ResolveInfo;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes.dex */
public class ApsalarReceiver extends BroadcastReceiver {
    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        intent.setComponent(null);
        for (ResolveInfo resolveInfo : context.getPackageManager().queryBroadcastReceivers(intent, 0)) {
            ActivityInfo activityInfo = resolveInfo.activityInfo;
            if (activityInfo.enabled && activityInfo.exported && activityInfo.packageName.equals(context.getPackageName())) {
                String str = activityInfo.name;
                if (activityInfo.name.equals(getClass().getName())) {
                    if (!intent.getAction().equals("com.android.vending.INSTALL_REFERRER")) {
                        continue;
                    } else {
                        String stringExtra = intent.getStringExtra("referrer");
                        if (stringExtra != null && stringExtra.length() != 0) {
                            try {
                                saveCSIReferrer(context, URLDecoder.decode(stringExtra, "UTF-8"));
                            } catch (UnsupportedEncodingException e) {
                                return;
                            }
                        } else {
                            return;
                        }
                    }
                } else {
                    try {
                        intent.setClassName(context, str);
                        ((BroadcastReceiver) Class.forName(str).newInstance()).onReceive(context, intent);
                    } catch (Throwable th) {
                    }
                }
            }
        }
    }

    public static Map<String, String> retrieveCSIReferrer(Context context) {
        HashMap hashMap = new HashMap();
        if (context != null) {
            SharedPreferences sharedPreferences = context.getSharedPreferences("apsalar_csi_" + context.getPackageName(), 0);
            for (String str : sharedPreferences.getAll().keySet()) {
                String string = sharedPreferences.getString(str, null);
                if (string != null) {
                    hashMap.put(str, string);
                }
            }
        }
        return hashMap;
    }

    public static void saveCSIReferrer(Context context, String str) {
        if (context != null) {
            SharedPreferences.Editor edit = context.getSharedPreferences("apsalar_csi_" + context.getPackageName(), 0).edit();
            edit.putString("referrer", str);
            edit.commit();
        }
    }
}
