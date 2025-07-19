package com.flurry.android;

import android.content.Context;
import android.os.Handler;

/* renamed from: com.flurry.android.ak */
final class C0302ak implements Runnable {

    /* renamed from: a */
    final /* synthetic */ String f512a;

    /* renamed from: b */
    final /* synthetic */ Context f513b;

    /* renamed from: c */
    final /* synthetic */ C0318p f514c;

    /* renamed from: d */
    final /* synthetic */ C0323u f515d;

    C0302ak(C0323u uVar, String str, Context context, C0318p pVar) {
        this.f515d = uVar;
        this.f512a = str;
        this.f513b = context;
        this.f514c = pVar;
    }

    public final void run() {
        new Handler().post(new C0315m(this, this.f515d.m573d(this.f512a)));
    }
}
