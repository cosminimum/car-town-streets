package com.google.android.gms.ads.doubleclick;

import android.content.Context;
import com.google.android.gms.ads.AdListener;
import com.google.android.gms.internal.C0867ah;

public final class PublisherInterstitialAd {

    /* renamed from: ea */
    private final C0867ah f1118ea;

    public PublisherInterstitialAd(Context context) {
        this.f1118ea = new C0867ah(context);
    }

    public AdListener getAdListener() {
        return this.f1118ea.getAdListener();
    }

    public String getAdUnitId() {
        return this.f1118ea.getAdUnitId();
    }

    public AppEventListener getAppEventListener() {
        return this.f1118ea.getAppEventListener();
    }

    public boolean isLoaded() {
        return this.f1118ea.isLoaded();
    }

    public void loadAd(PublisherAdRequest publisherAdRequest) {
        this.f1118ea.mo7053a(publisherAdRequest.mo5481v());
    }

    public void setAdListener(AdListener adListener) {
        this.f1118ea.setAdListener(adListener);
    }

    public void setAdUnitId(String adUnitId) {
        this.f1118ea.setAdUnitId(adUnitId);
    }

    public void setAppEventListener(AppEventListener appEventListener) {
        this.f1118ea.setAppEventListener(appEventListener);
    }

    public void show() {
        this.f1118ea.show();
    }
}
