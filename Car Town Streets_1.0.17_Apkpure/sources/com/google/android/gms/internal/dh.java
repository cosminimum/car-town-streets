package com.google.android.gms.internal;
/* loaded from: classes.dex */
public final class dh {
    public static <T> boolean a(T t, T t2) {
        return (t == null && t2 == null) || !(t == null || t2 == null || !t.equals(t2));
    }

    public static long b(double d) {
        return (long) (1000.0d * d);
    }

    public static double h(long j) {
        return j / 1000.0d;
    }
}
