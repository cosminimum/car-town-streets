package com.google.android.gms.internal;

import android.util.Log;

/* renamed from: com.google.android.gms.internal.ea */
public final class C1088ea {

    /* renamed from: pM */
    private final String f2620pM;

    public C1088ea(String str) {
        this.f2620pM = (String) C1102eg.m2616f(str);
    }

    /* renamed from: K */
    public boolean mo7502K(int i) {
        return Log.isLoggable(this.f2620pM, i);
    }

    /* renamed from: a */
    public void mo7503a(String str, String str2, Throwable th) {
        if (mo7502K(6)) {
            Log.e(str, str2, th);
        }
    }

    /* renamed from: c */
    public void mo7504c(String str, String str2) {
        if (mo7502K(5)) {
            Log.w(str, str2);
        }
    }

    /* renamed from: d */
    public void mo7505d(String str, String str2) {
        if (mo7502K(6)) {
            Log.e(str, str2);
        }
    }
}
