package com.google.android.gms.ads;

import android.content.Context;
import com.google.android.gms.internal.C0867ah;

public final class InterstitialAd {

    /* renamed from: ea */
    private final C0867ah f1114ea;

    public InterstitialAd(Context context) {
        this.f1114ea = new C0867ah(context);
    }

    public AdListener getAdListener() {
        return this.f1114ea.getAdListener();
    }

    public String getAdUnitId() {
        return this.f1114ea.getAdUnitId();
    }

    public boolean isLoaded() {
        return this.f1114ea.isLoaded();
    }

    public void loadAd(AdRequest adRequest) {
        this.f1114ea.mo7053a(adRequest.mo5435v());
    }

    public void setAdListener(AdListener adListener) {
        this.f1114ea.setAdListener(adListener);
    }

    public void setAdUnitId(String adUnitId) {
        this.f1114ea.setAdUnitId(adUnitId);
    }

    public void show() {
        this.f1114ea.show();
    }
}
