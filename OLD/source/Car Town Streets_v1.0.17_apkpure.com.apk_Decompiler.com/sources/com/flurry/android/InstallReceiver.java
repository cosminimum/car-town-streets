package com.flurry.android;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.HandlerThread;
import com.flurry.android.FlurryAgent;
import com.getjar.sdk.utilities.Utility;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

public final class InstallReceiver extends BroadcastReceiver {
    private final Handler a;
    /* access modifiers changed from: private */
    public File b = null;

    private InstallReceiver() {
        HandlerThread handlerThread = new HandlerThread("InstallReceiver");
        handlerThread.start();
        this.a = new Handler(handlerThread.getLooper());
    }

    public final void onReceive(Context context, Intent intent) {
        this.b = context.getFileStreamPath(".flurryinstallreceiver." + Integer.toString(FlurryAgent.e().hashCode(), 16));
        if (FlurryAgent.isCaptureUncaughtExceptions()) {
            Thread.setDefaultUncaughtExceptionHandler(new FlurryAgent.FlurryDefaultExceptionHandler());
        }
        String stringExtra = intent.getStringExtra("referrer");
        if (stringExtra != null && "com.android.vending.INSTALL_REFERRER".equals(intent.getAction())) {
            try {
                a(a(stringExtra));
            } catch (IllegalArgumentException e) {
                ah.c("InstallReceiver", "Invalid referrer Tag: " + e.getMessage());
            }
        }
    }

    private static Map a(String str) {
        if (str == null || str.trim().equals("")) {
            throw new IllegalArgumentException("Referrer is null or empty");
        }
        HashMap hashMap = new HashMap();
        String[] split = str.split(Utility.QUERY_APPENDIX);
        int length = split.length;
        for (int i = 0; i < length; i++) {
            String[] split2 = split[i].split("=");
            if (split2.length != 2) {
                ah.a("InstallReceiver", "Invalid referrer Element: " + split[i] + " in referrer tag " + str);
            } else {
                hashMap.put(split2[0], split2[1]);
            }
        }
        StringBuilder sb = new StringBuilder();
        if (hashMap.get("utm_source") == null) {
            sb.append("Campaign Source is missing.\n");
        }
        if (hashMap.get("utm_medium") == null) {
            sb.append("Campaign Medium is missing.\n");
        }
        if (hashMap.get("utm_campaign") == null) {
            sb.append("Campaign Name is missing.\n");
        }
        if (sb.length() <= 0) {
            return hashMap;
        }
        throw new IllegalArgumentException(sb.toString());
    }

    private synchronized void a(Map map) {
        this.a.post(new t(this, map));
    }
}
