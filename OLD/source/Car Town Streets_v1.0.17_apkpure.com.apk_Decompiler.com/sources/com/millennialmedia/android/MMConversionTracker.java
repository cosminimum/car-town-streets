package com.millennialmedia.android;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import com.getjar.sdk.utilities.Utility;
import com.millennialmedia.android.MMAdViewSDK;
import java.net.URLDecoder;
import java.util.GregorianCalendar;
import java.util.TimeZone;
import java.util.TreeMap;

public final class MMConversionTracker extends BroadcastReceiver {
    private static final String ACTION_REFERRER = "com.android.vending.INSTALL_REFERRER";
    private static final String EXTRA_REFERRER = "referrer";
    private static final String KEY_REFERRER = "installReferrer";

    public void onReceive(Context context, Intent intent) {
        String referrerString;
        if (intent.getAction().equals(ACTION_REFERRER) && (referrerString = intent.getStringExtra(EXTRA_REFERRER)) != null && referrerString.length() != 0) {
            String referrerString2 = URLDecoder.decode(referrerString);
            MMAdViewSDK.Log.i("Received referrer: %s", referrerString2);
            SharedPreferences.Editor editor = context.getSharedPreferences("MillennialMediaSettings", 0).edit();
            editor.putString(KEY_REFERRER, referrerString2);
            editor.commit();
        }
    }

    public static synchronized void trackConversion(Context context, String goalId) {
        final TreeMap<String, String> extraParams;
        synchronized (MMConversionTracker.class) {
            long installTime = 0;
            if (!(context == null || goalId == null)) {
                if (goalId.length() != 0) {
                    SharedPreferences settings = context.getSharedPreferences("MillennialMediaSettings", 0);
                    final boolean isFirstLaunch = settings.getBoolean("firstLaunch_" + goalId, true);
                    String referrerString = settings.getString(KEY_REFERRER, (String) null);
                    if (referrerString != null) {
                        extraParams = new TreeMap<>();
                        for (String param : referrerString.split(Utility.QUERY_APPENDIX)) {
                            String[] subComponents = param.split("=");
                            if (subComponents.length >= 2) {
                                extraParams.put(subComponents[0], subComponents[1]);
                            }
                        }
                    } else {
                        extraParams = null;
                    }
                    if (isFirstLaunch) {
                        SharedPreferences.Editor editor = settings.edit();
                        editor.putBoolean("firstLaunch_" + goalId, false);
                        editor.commit();
                    }
                    try {
                        PackageInfo info = context.getPackageManager().getPackageInfo(context.getPackageName(), 0);
                        try {
                            installTime = info.getClass().getField("firstInstallTime").getLong(info);
                        } catch (Exception e) {
                        }
                    } catch (PackageManager.NameNotFoundException e2) {
                    }
                    if (installTime > 0) {
                        GregorianCalendar calendar = new GregorianCalendar();
                        calendar.setTimeInMillis(installTime);
                        calendar.setTimeZone(TimeZone.getTimeZone("GMT"));
                        installTime = calendar.getTimeInMillis();
                    }
                    final long installTimeUTC = installTime;
                    final String auid = MMAdViewSDK.getHdid(context);
                    if (MMAdViewSDK.isConnected(context)) {
                        final String str = goalId;
                        new Thread() {
                            public void run() {
                                try {
                                    new HttpGetRequest().trackConversion(str, auid, isFirstLaunch, installTimeUTC, extraParams);
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            }
                        }.start();
                    } else {
                        MMAdViewSDK.Log.w("No network available for conversion tracking.");
                    }
                }
            }
        }
    }
}
