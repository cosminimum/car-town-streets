package com.google.android.gms.internal;

import android.os.Looper;
import android.text.TextUtils;

/* renamed from: com.google.android.gms.internal.eg */
public final class C1102eg {
    /* renamed from: N */
    public static void m2609N(String str) {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            throw new IllegalStateException(str);
        }
    }

    /* renamed from: O */
    public static void m2610O(String str) {
        if (Looper.myLooper() == Looper.getMainLooper()) {
            throw new IllegalStateException(str);
        }
    }

    /* renamed from: U */
    public static String m2611U(String str) {
        if (!TextUtils.isEmpty(str)) {
            return str;
        }
        throw new IllegalArgumentException("Given String is empty or null");
    }

    /* renamed from: a */
    public static void m2612a(boolean z, Object obj) {
        if (!z) {
            throw new IllegalStateException(String.valueOf(obj));
        }
    }

    /* renamed from: a */
    public static void m2613a(boolean z, String str, Object... objArr) {
        if (!z) {
            throw new IllegalArgumentException(String.format(str, objArr));
        }
    }

    /* renamed from: b */
    public static <T> T m2614b(T t, Object obj) {
        if (t != null) {
            return t;
        }
        throw new NullPointerException(String.valueOf(obj));
    }

    /* renamed from: b */
    public static void m2615b(boolean z, Object obj) {
        if (!z) {
            throw new IllegalArgumentException(String.valueOf(obj));
        }
    }

    /* renamed from: f */
    public static <T> T m2616f(T t) {
        if (t != null) {
            return t;
        }
        throw new NullPointerException("null reference");
    }

    /* renamed from: p */
    public static void m2617p(boolean z) {
        if (!z) {
            throw new IllegalStateException();
        }
    }

    /* renamed from: r */
    public static void m2618r(boolean z) {
        if (!z) {
            throw new IllegalArgumentException();
        }
    }
}
