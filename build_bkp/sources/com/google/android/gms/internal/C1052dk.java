package com.google.android.gms.internal;

import android.util.Log;

/* renamed from: com.google.android.gms.internal.dk */
public class C1052dk {

    /* renamed from: mb */
    private static boolean f2512mb = false;
    private String mTag;

    /* renamed from: mc */
    private boolean f2513mc;

    /* renamed from: md */
    private boolean f2514md;

    public C1052dk(String str) {
        this(str, m2405bc());
    }

    public C1052dk(String str, boolean z) {
        this.mTag = str;
        this.f2513mc = z;
    }

    /* renamed from: bc */
    public static boolean m2405bc() {
        return f2512mb;
    }

    /* renamed from: a */
    public void mo7379a(String str, Object... objArr) {
        if (this.f2514md) {
            Log.v(this.mTag, String.format(str, objArr));
        }
    }

    /* renamed from: b */
    public void mo7380b(String str, Object... objArr) {
        if (this.f2513mc || f2512mb) {
            Log.d(this.mTag, String.format(str, objArr));
        }
    }

    /* renamed from: c */
    public void mo7381c(String str, Object... objArr) {
        Log.i(this.mTag, String.format(str, objArr));
    }

    /* renamed from: d */
    public void mo7382d(String str, Object... objArr) {
        Log.w(this.mTag, String.format(str, objArr));
    }
}
