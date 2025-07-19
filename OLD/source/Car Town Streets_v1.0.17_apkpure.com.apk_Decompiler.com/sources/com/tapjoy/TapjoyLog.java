package com.tapjoy;

import android.util.Log;

public class TapjoyLog {
    private static final int MAX_STRING_SIZE = 4096;
    private static boolean showLog = false;

    public static void enableLogging(boolean enable) {
        Log.i("TapjoyLog", "enableLogging: " + enable);
        showLog = enable;
    }

    public static void i(String tag, String msg) {
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

    public static void e(String tag, String msg) {
        if (showLog) {
            Log.e(tag, msg);
        }
    }

    public static void w(String tag, String msg) {
        if (showLog) {
            Log.w(tag, msg);
        }
    }

    public static void d(String tag, String msg) {
        if (showLog) {
            Log.d(tag, msg);
        }
    }

    public static void v(String tag, String msg) {
        if (showLog) {
            Log.v(tag, msg);
        }
    }
}
