package com.flurry.android;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class ae implements Runnable {
    private /* synthetic */ String a;
    private /* synthetic */ u b;

    /* JADX INFO: Access modifiers changed from: package-private */
    public ae(u uVar, String str) {
        this.b = uVar;
        this.a = str;
    }

    @Override // java.lang.Runnable
    public final void run() {
        AppCircleCallback appCircleCallback;
        CallbackEvent callbackEvent = new CallbackEvent(101);
        callbackEvent.setMessage(this.a);
        appCircleCallback = this.b.y;
        appCircleCallback.onMarketAppLaunchError(callbackEvent);
    }
}
