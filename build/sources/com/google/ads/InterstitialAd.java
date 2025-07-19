package com.google.ads;

import android.app.Activity;
import android.view.ViewGroup;
import com.google.ads.internal.C0475d;

public class InterstitialAd implements C0423Ad {

    /* renamed from: a */
    private C0475d f723a;

    public InterstitialAd(Activity activity, String adUnitId) {
        this(activity, adUnitId, false);
    }

    public InterstitialAd(Activity activity, String adUnitId, boolean shortTimeout) {
        this.f723a = new C0475d(this, activity, (AdSize) null, adUnitId, (ViewGroup) null, shortTimeout);
    }

    public boolean isReady() {
        return this.f723a.mo3718r();
    }

    public void loadAd(AdRequest adRequest) {
        this.f723a.mo3690a(adRequest);
    }

    public void show() {
        this.f723a.mo3726z();
    }

    public void setAdListener(AdListener adListener) {
        this.f723a.mo3708h().f992m.mo3876a(adListener);
    }

    /* access modifiers changed from: protected */
    public void setAppEventListener(AppEventListener appEventListener) {
        this.f723a.mo3708h().f993n.mo3876a(appEventListener);
    }

    public void stopLoading() {
        this.f723a.mo3680A();
    }
}
