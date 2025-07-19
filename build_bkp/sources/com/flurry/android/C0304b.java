package com.flurry.android;

import android.content.Context;

/* renamed from: com.flurry.android.b */
final class C0304b implements Runnable {

    /* renamed from: a */
    final /* synthetic */ Context f519a;

    /* renamed from: b */
    final /* synthetic */ FlurryAgent f520b;

    /* renamed from: c */
    private /* synthetic */ boolean f521c;

    C0304b(FlurryAgent flurryAgent, boolean z, Context context) {
        this.f520b = flurryAgent;
        this.f521c = z;
        this.f519a = context;
    }

    public final void run() {
        this.f520b.m510i();
        this.f520b.m513l();
        if (!this.f521c) {
            this.f520b.f459q.postDelayed(new C0314l(this), FlurryAgent.f426i);
        }
        if (FlurryAgent.f432o) {
            this.f520b.f458Y.mo2446d();
        }
    }
}
