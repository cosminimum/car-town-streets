package com.flurry.android;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class ad implements Runnable {
    private /* synthetic */ int a;
    private /* synthetic */ u b;

    /* JADX INFO: Access modifiers changed from: package-private */
    public ad(u uVar, int i) {
        this.b = uVar;
        this.a = i;
    }

    @Override // java.lang.Runnable
    public final void run() {
        AppCircleCallback appCircleCallback;
        CallbackEvent callbackEvent = new CallbackEvent(this.a);
        appCircleCallback = this.b.y;
        appCircleCallback.onAdsUpdated(callbackEvent);
    }
}
