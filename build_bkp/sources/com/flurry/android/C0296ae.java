package com.flurry.android;

/* renamed from: com.flurry.android.ae */
final class C0296ae implements Runnable {

    /* renamed from: a */
    private /* synthetic */ String f500a;

    /* renamed from: b */
    private /* synthetic */ C0323u f501b;

    C0296ae(C0323u uVar, String str) {
        this.f501b = uVar;
        this.f500a = str;
    }

    public final void run() {
        CallbackEvent callbackEvent = new CallbackEvent(101);
        callbackEvent.setMessage(this.f500a);
        this.f501b.f642y.onMarketAppLaunchError(callbackEvent);
    }
}
