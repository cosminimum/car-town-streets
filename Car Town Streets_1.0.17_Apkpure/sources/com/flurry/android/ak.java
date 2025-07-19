package com.flurry.android;

import android.content.Context;
import android.os.Handler;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class ak implements Runnable {
    final /* synthetic */ String a;
    final /* synthetic */ Context b;
    final /* synthetic */ p c;
    final /* synthetic */ u d;

    /* JADX INFO: Access modifiers changed from: package-private */
    public ak(u uVar, String str, Context context, p pVar) {
        this.d = uVar;
        this.a = str;
        this.b = context;
        this.c = pVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        String d;
        d = this.d.d(this.a);
        new Handler().post(new m(this, d));
    }
}
