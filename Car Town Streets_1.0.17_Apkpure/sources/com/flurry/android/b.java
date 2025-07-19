package com.flurry.android;

import android.content.Context;
import android.os.Handler;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class b implements Runnable {
    final /* synthetic */ Context a;
    final /* synthetic */ FlurryAgent b;
    private /* synthetic */ boolean c;

    /* JADX INFO: Access modifiers changed from: package-private */
    public b(FlurryAgent flurryAgent, boolean z, Context context) {
        this.b = flurryAgent;
        this.c = z;
        this.a = context;
    }

    @Override // java.lang.Runnable
    public final void run() {
        boolean z;
        u uVar;
        Handler handler;
        long j;
        this.b.i();
        this.b.l();
        if (!this.c) {
            handler = this.b.q;
            l lVar = new l(this);
            j = FlurryAgent.i;
            handler.postDelayed(lVar, j);
        }
        z = FlurryAgent.o;
        if (z) {
            uVar = this.b.Y;
            uVar.d();
        }
    }
}
