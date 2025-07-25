package com.google.ads.util;

import android.util.Log;
import com.google.ads.AdRequest;
/* loaded from: classes.dex */
public final class b {
    public static AbstractC0008b a = null;
    private static int b = 5;

    /* renamed from: com.google.ads.util.b$b  reason: collision with other inner class name */
    /* loaded from: classes.dex */
    public interface AbstractC0008b {
        void a(a aVar, String str, Throwable th);
    }

    /* loaded from: classes.dex */
    public enum a {
        VERBOSE(2),
        DEBUG(3),
        INFO(4),
        WARN(5),
        ERROR(6);
        
        public final int f;

        a(int i) {
            this.f = i;
        }
    }

    private static void a(a aVar, String str) {
        a(aVar, str, null);
    }

    private static void a(a aVar, String str, Throwable th) {
        if (a != null) {
            a.a(aVar, str, th);
        }
    }

    public static void a(String str) {
        if (a(AdRequest.LOGTAG, 3)) {
            Log.d(AdRequest.LOGTAG, str);
        }
        a(a.DEBUG, str);
    }

    public static void a(String str, Throwable th) {
        if (a(AdRequest.LOGTAG, 3)) {
            Log.d(AdRequest.LOGTAG, str, th);
        }
        a(a.DEBUG, str, th);
    }

    public static void b(String str) {
        if (a(AdRequest.LOGTAG, 6)) {
            Log.e(AdRequest.LOGTAG, str);
        }
        a(a.ERROR, str);
    }

    public static void b(String str, Throwable th) {
        if (a(AdRequest.LOGTAG, 6)) {
            Log.e(AdRequest.LOGTAG, str, th);
        }
        a(a.ERROR, str, th);
    }

    public static void c(String str) {
        if (a(AdRequest.LOGTAG, 4)) {
            Log.i(AdRequest.LOGTAG, str);
        }
        a(a.INFO, str);
    }

    public static void c(String str, Throwable th) {
        if (a(AdRequest.LOGTAG, 4)) {
            Log.i(AdRequest.LOGTAG, str, th);
        }
        a(a.INFO, str, th);
    }

    public static void d(String str) {
        if (a(AdRequest.LOGTAG, 2)) {
            Log.v(AdRequest.LOGTAG, str);
        }
        a(a.VERBOSE, str);
    }

    public static void e(String str) {
        if (a(AdRequest.LOGTAG, 5)) {
            Log.w(AdRequest.LOGTAG, str);
        }
        a(a.WARN, str);
    }

    public static void d(String str, Throwable th) {
        if (a(AdRequest.LOGTAG, 5)) {
            Log.w(AdRequest.LOGTAG, str, th);
        }
        a(a.WARN, str, th);
    }

    public static boolean a(String str, int i) {
        return a(i) || Log.isLoggable(str, i);
    }

    private static boolean a(int i) {
        return i >= b;
    }
}
