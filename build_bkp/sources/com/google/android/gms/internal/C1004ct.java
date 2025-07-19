package com.google.android.gms.internal;

import android.util.Log;
import com.google.ads.AdRequest;

/* renamed from: com.google.android.gms.internal.ct */
public final class C1004ct {
    /* renamed from: a */
    public static void m2211a(String str, Throwable th) {
        if (m2213n(3)) {
            Log.d(AdRequest.LOGTAG, str, th);
        }
    }

    /* renamed from: b */
    public static void m2212b(String str, Throwable th) {
        if (m2213n(5)) {
            Log.w(AdRequest.LOGTAG, str, th);
        }
    }

    /* renamed from: n */
    public static boolean m2213n(int i) {
        return (i >= 5 || Log.isLoggable(AdRequest.LOGTAG, i)) && i != 2;
    }

    /* renamed from: r */
    public static void m2214r(String str) {
        if (m2213n(3)) {
            Log.d(AdRequest.LOGTAG, str);
        }
    }

    /* renamed from: s */
    public static void m2215s(String str) {
        if (m2213n(6)) {
            Log.e(AdRequest.LOGTAG, str);
        }
    }

    /* renamed from: t */
    public static void m2216t(String str) {
        if (m2213n(4)) {
            Log.i(AdRequest.LOGTAG, str);
        }
    }

    /* renamed from: u */
    public static void m2217u(String str) {
        if (m2213n(2)) {
            Log.v(AdRequest.LOGTAG, str);
        }
    }

    /* renamed from: v */
    public static void m2218v(String str) {
        if (m2213n(5)) {
            Log.w(AdRequest.LOGTAG, str);
        }
    }
}
