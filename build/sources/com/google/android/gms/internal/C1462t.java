package com.google.android.gms.internal;

import com.google.android.gms.ads.AdListener;
import com.google.android.gms.internal.C0852ab;

/* renamed from: com.google.android.gms.internal.t */
public final class C1462t extends C0852ab.C0853a {

    /* renamed from: ev */
    private final AdListener f3475ev;

    public C1462t(AdListener adListener) {
        this.f3475ev = adListener;
    }

    public void onAdClosed() {
        this.f3475ev.onAdClosed();
    }

    public void onAdFailedToLoad(int errorCode) {
        this.f3475ev.onAdFailedToLoad(errorCode);
    }

    public void onAdLeftApplication() {
        this.f3475ev.onAdLeftApplication();
    }

    public void onAdLoaded() {
        this.f3475ev.onAdLoaded();
    }

    public void onAdOpened() {
        this.f3475ev.onAdOpened();
    }
}
