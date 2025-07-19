package com.google.ads;

import android.app.Activity;
/* loaded from: classes.dex */
public class InterstitialAd implements Ad {
    private com.google.ads.internal.d a;

    public InterstitialAd(Activity activity, String adUnitId) {
        this(activity, adUnitId, false);
    }

    public InterstitialAd(Activity activity, String adUnitId, boolean shortTimeout) {
        this.a = new com.google.ads.internal.d(this, activity, null, adUnitId, null, shortTimeout);
    }

    @Override // com.google.ads.Ad
    public boolean isReady() {
        return this.a.r();
    }

    @Override // com.google.ads.Ad
    public void loadAd(AdRequest adRequest) {
        this.a.a(adRequest);
    }

    public void show() {
        this.a.z();
    }

    @Override // com.google.ads.Ad
    public void setAdListener(AdListener adListener) {
        this.a.h().m.a(adListener);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setAppEventListener(AppEventListener appEventListener) {
        this.a.h().n.a(appEventListener);
    }

    @Override // com.google.ads.Ad
    public void stopLoading() {
        this.a.A();
    }
}
