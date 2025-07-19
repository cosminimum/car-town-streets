package com.flurry.android;

/* renamed from: com.flurry.android.ad */
final class C0295ad implements Runnable {

    /* renamed from: a */
    private /* synthetic */ int f498a;

    /* renamed from: b */
    private /* synthetic */ C0323u f499b;

    C0295ad(C0323u uVar, int i) {
        this.f499b = uVar;
        this.f498a = i;
    }

    public final void run() {
        this.f499b.f642y.onAdsUpdated(new CallbackEvent(this.f498a));
    }
}
