package com.google.android.gms.internal;

import com.google.android.gms.ads.AdListener;
import com.google.android.gms.internal.ab;
/* loaded from: classes.dex */
public final class t extends ab.a {
    private final AdListener ev;

    public t(AdListener adListener) {
        this.ev = adListener;
    }

    @Override // com.google.android.gms.internal.ab
    public void onAdClosed() {
        this.ev.onAdClosed();
    }

    @Override // com.google.android.gms.internal.ab
    public void onAdFailedToLoad(int errorCode) {
        this.ev.onAdFailedToLoad(errorCode);
    }

    @Override // com.google.android.gms.internal.ab
    public void onAdLeftApplication() {
        this.ev.onAdLeftApplication();
    }

    @Override // com.google.android.gms.internal.ab
    public void onAdLoaded() {
        this.ev.onAdLoaded();
    }

    @Override // com.google.android.gms.internal.ab
    public void onAdOpened() {
        this.ev.onAdOpened();
    }
}
