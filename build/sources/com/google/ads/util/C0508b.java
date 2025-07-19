package com.google.ads.util;

import android.util.Log;
import com.google.ads.AdRequest;

/* renamed from: com.google.ads.util.b */
public final class C0508b {

    /* renamed from: a */
    public static C0510b f1050a = null;

    /* renamed from: b */
    private static int f1051b = 5;

    /* renamed from: com.google.ads.util.b$b */
    public interface C0510b {
        /* renamed from: a */
        void mo3849a(C0509a aVar, String str, Throwable th);
    }

    /* renamed from: com.google.ads.util.b$a */
    public enum C0509a {
        VERBOSE(2),
        DEBUG(3),
        INFO(4),
        WARN(5),
        ERROR(6);
        

        /* renamed from: f */
        public final int f1058f;

        private C0509a(int i) {
            this.f1058f = i;
        }
    }

    /* renamed from: a */
    private static void m1024a(C0509a aVar, String str) {
        m1025a(aVar, str, (Throwable) null);
    }

    /* renamed from: a */
    private static void m1025a(C0509a aVar, String str, Throwable th) {
        if (f1050a != null) {
            f1050a.mo3849a(aVar, str, th);
        }
    }

    /* renamed from: a */
    public static void m1026a(String str) {
        if (m1029a(AdRequest.LOGTAG, 3)) {
            Log.d(AdRequest.LOGTAG, str);
        }
        m1024a(C0509a.DEBUG, str);
    }

    /* renamed from: a */
    public static void m1027a(String str, Throwable th) {
        if (m1029a(AdRequest.LOGTAG, 3)) {
            Log.d(AdRequest.LOGTAG, str, th);
        }
        m1025a(C0509a.DEBUG, str, th);
    }

    /* renamed from: b */
    public static void m1030b(String str) {
        if (m1029a(AdRequest.LOGTAG, 6)) {
            Log.e(AdRequest.LOGTAG, str);
        }
        m1024a(C0509a.ERROR, str);
    }

    /* renamed from: b */
    public static void m1031b(String str, Throwable th) {
        if (m1029a(AdRequest.LOGTAG, 6)) {
            Log.e(AdRequest.LOGTAG, str, th);
        }
        m1025a(C0509a.ERROR, str, th);
    }

    /* renamed from: c */
    public static void m1032c(String str) {
        if (m1029a(AdRequest.LOGTAG, 4)) {
            Log.i(AdRequest.LOGTAG, str);
        }
        m1024a(C0509a.INFO, str);
    }

    /* renamed from: c */
    public static void m1033c(String str, Throwable th) {
        if (m1029a(AdRequest.LOGTAG, 4)) {
            Log.i(AdRequest.LOGTAG, str, th);
        }
        m1025a(C0509a.INFO, str, th);
    }

    /* renamed from: d */
    public static void m1034d(String str) {
        if (m1029a(AdRequest.LOGTAG, 2)) {
            Log.v(AdRequest.LOGTAG, str);
        }
        m1024a(C0509a.VERBOSE, str);
    }

    /* renamed from: e */
    public static void m1036e(String str) {
        if (m1029a(AdRequest.LOGTAG, 5)) {
            Log.w(AdRequest.LOGTAG, str);
        }
        m1024a(C0509a.WARN, str);
    }

    /* renamed from: d */
    public static void m1035d(String str, Throwable th) {
        if (m1029a(AdRequest.LOGTAG, 5)) {
            Log.w(AdRequest.LOGTAG, str, th);
        }
        m1025a(C0509a.WARN, str, th);
    }

    /* renamed from: a */
    public static boolean m1029a(String str, int i) {
        return m1028a(i) || Log.isLoggable(str, i);
    }

    /* renamed from: a */
    private static boolean m1028a(int i) {
        return i >= f1051b;
    }
}
