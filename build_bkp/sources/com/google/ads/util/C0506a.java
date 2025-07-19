package com.google.ads.util;

import android.text.TextUtils;
import android.util.Log;

/* renamed from: com.google.ads.util.a */
public class C0506a {

    /* renamed from: a */
    private static boolean f1049a = Log.isLoggable("GoogleAdsAssertion", 3);

    /* renamed from: a */
    public static void m1018a(boolean z) {
        m1023c(z, "Assertion failed.");
    }

    /* renamed from: a */
    public static void m1019a(boolean z, String str) {
        m1023c(z, str);
    }

    /* renamed from: b */
    public static void m1021b(boolean z) {
        m1023c(!z, "Assertion failed.");
    }

    /* renamed from: b */
    public static void m1022b(boolean z, String str) {
        m1023c(!z, str);
    }

    /* renamed from: a */
    public static void m1015a(Object obj) {
        m1023c(obj == null, "Assertion that an object is null failed.");
    }

    /* renamed from: b */
    public static void m1020b(Object obj) {
        m1023c(obj != null, "Assertion that an object is not null failed.");
    }

    /* renamed from: a */
    public static void m1016a(Object obj, Object obj2) {
        m1023c(obj == obj2, "Assertion that 'a' and 'b' refer to the same object failed.a: " + obj + ", b: " + obj2);
    }

    /* renamed from: a */
    public static void m1017a(String str) {
        m1023c(!TextUtils.isEmpty(str), "Expected a non empty string, got: " + str);
    }

    /* renamed from: com.google.ads.util.a$a */
    public static class C0507a extends Error {
        public C0507a(String str) {
            super(str);
        }
    }

    /* renamed from: c */
    private static void m1023c(boolean z, String str) {
        if ((Log.isLoggable("GoogleAdsAssertion", 3) || f1049a) && !z) {
            C0507a aVar = new C0507a(str);
            Log.d("GoogleAdsAssertion", str, aVar);
            throw aVar;
        }
    }
}
