package com.tapjoy;

import android.util.Log;

public class TapjoyLog {
    private static final int MAX_STRING_SIZE = 4096;
    private static boolean showLog = false;

    public static void enableLogging(boolean enable) {
        Log.i("TapjoyLog", "enableLogging: " + enable);
        showLog = enable;
    }

    /* renamed from: i */
    public static void m4436i(String tag, String msg) {
        if (!showLog) {
            return;
        }
        if (msg.length() > 4096) {
            for (int i = 0; i <= msg.length() / 4096; i++) {
                int start = i * 4096;
                int end = (i + 1) * 4096;
                if (end > msg.length()) {
                    end = msg.length();
                }
                Log.i(tag, msg.substring(start, end));
            }
            return;
        }
        Log.i(tag, msg);
    }

    /* renamed from: e */
    public static void m4435e(String tag, String msg) {
        if (showLog) {
            Log.e(tag, msg);
        }
    }

    /* renamed from: w */
    public static void m4438w(String tag, String msg) {
        if (showLog) {
            Log.w(tag, msg);
        }
    }

    /* renamed from: d */
    public static void m4434d(String tag, String msg) {
        if (showLog) {
            Log.d(tag, msg);
        }
    }

    /* renamed from: v */
    public static void m4437v(String tag, String msg) {
        if (showLog) {
            Log.v(tag, msg);
        }
    }
}
