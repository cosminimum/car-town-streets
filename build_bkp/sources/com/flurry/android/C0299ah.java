package com.flurry.android;

import android.util.Log;

/* renamed from: com.flurry.android.ah */
final class C0299ah {

    /* renamed from: a */
    private static boolean f509a = false;

    /* renamed from: b */
    private static int f510b = 5;

    C0299ah() {
    }

    /* renamed from: a */
    static void m534a() {
        f509a = true;
    }

    /* renamed from: b */
    static void m539b() {
        f509a = false;
    }

    /* renamed from: a */
    static void m535a(int i) {
        f510b = i;
    }

    /* renamed from: a */
    static boolean m536a(String str) {
        return Log.isLoggable(str, 3);
    }

    /* renamed from: a */
    static int m533a(String str, String str2, Throwable th) {
        if (f509a || f510b <= 3) {
            return 0;
        }
        return Log.d(str, str2, th);
    }

    /* renamed from: a */
    static int m532a(String str, String str2) {
        if (f509a || f510b <= 3) {
            return 0;
        }
        return Log.d(str, str2);
    }

    /* renamed from: b */
    static int m538b(String str, String str2, Throwable th) {
        if (f509a || f510b <= 6) {
            return 0;
        }
        return Log.e(str, str2, th);
    }

    /* renamed from: b */
    static int m537b(String str, String str2) {
        if (f509a || f510b <= 6) {
            return 0;
        }
        return Log.e(str, str2);
    }

    /* renamed from: c */
    static int m541c(String str, String str2, Throwable th) {
        if (f509a || f510b <= 4) {
            return 0;
        }
        return Log.i(str, str2, th);
    }

    /* renamed from: c */
    static int m540c(String str, String str2) {
        if (f509a || f510b <= 4) {
            return 0;
        }
        return Log.i(str, str2);
    }

    /* renamed from: d */
    static int m543d(String str, String str2, Throwable th) {
        if (f509a || f510b <= 5) {
            return 0;
        }
        return Log.w(str, str2, th);
    }

    /* renamed from: d */
    static int m542d(String str, String str2) {
        if (f509a || f510b <= 5) {
            return 0;
        }
        return Log.w(str, str2);
    }
}
