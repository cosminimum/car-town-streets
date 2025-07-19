package com.flurry.android;

import android.content.Context;

/* renamed from: com.flurry.android.d */
final class C0306d implements Runnable {

    /* renamed from: a */
    private /* synthetic */ Context f581a;

    /* renamed from: b */
    private /* synthetic */ boolean f582b;

    /* renamed from: c */
    private /* synthetic */ FlurryAgent f583c;

    C0306d(FlurryAgent flurryAgent, Context context, boolean z) {
        this.f583c = flurryAgent;
        this.f581a = context;
        this.f582b = z;
    }

    public final void run() {
        if (!this.f583c.f463u) {
            this.f583c.m470a(this.f581a);
        }
        FlurryAgent.m476a(this.f583c, this.f581a, this.f582b);
    }
}
