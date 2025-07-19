package com.flurry.android;

import android.content.Context;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class d implements Runnable {
    private /* synthetic */ Context a;
    private /* synthetic */ boolean b;
    private /* synthetic */ FlurryAgent c;

    /* JADX INFO: Access modifiers changed from: package-private */
    public d(FlurryAgent flurryAgent, Context context, boolean z) {
        this.c = flurryAgent;
        this.a = context;
        this.b = z;
    }

    @Override // java.lang.Runnable
    public final void run() {
        boolean z;
        z = this.c.u;
        if (!z) {
            this.c.a(this.a);
        }
        FlurryAgent.a(this.c, this.a, this.b);
    }
}
