package com.google.android.gms.internal;

import android.os.Looper;
import android.util.Log;

/* renamed from: com.google.android.gms.internal.ds */
public final class C1066ds {
    /* renamed from: N */
    public static void m2455N(String str) {
        if (Looper.getMainLooper().getThread() != Thread.currentThread()) {
            Log.e("Asserts", "checkMainThread: current thread " + Thread.currentThread() + " IS NOT the main thread " + Looper.getMainLooper().getThread() + "!");
            throw new IllegalStateException(str);
        }
    }

    /* renamed from: O */
    public static void m2456O(String str) {
        if (Looper.getMainLooper().getThread() == Thread.currentThread()) {
            Log.e("Asserts", "checkNotMainThread: current thread " + Thread.currentThread() + " IS the main thread " + Looper.getMainLooper().getThread() + "!");
            throw new IllegalStateException(str);
        }
    }

    /* renamed from: a */
    public static void m2457a(boolean z, Object obj) {
        if (!z) {
            throw new IllegalStateException(String.valueOf(obj));
        }
    }

    /* renamed from: d */
    public static void m2458d(Object obj) {
        if (obj == null) {
            throw new IllegalArgumentException("null reference");
        }
    }

    /* renamed from: p */
    public static void m2459p(boolean z) {
        if (!z) {
            throw new IllegalStateException();
        }
    }
}
