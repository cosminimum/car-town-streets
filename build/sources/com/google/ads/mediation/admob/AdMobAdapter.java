package com.google.ads.mediation.admob;

import android.app.Activity;
import android.content.Context;
import android.view.View;
import com.google.ads.AdListener;
import com.google.ads.AdRequest;
import com.google.ads.AdSize;
import com.google.ads.AdView;
import com.google.ads.C0423Ad;
import com.google.ads.InterstitialAd;
import com.google.ads.mediation.MediationAdRequest;
import com.google.ads.mediation.MediationBannerAdapter;
import com.google.ads.mediation.MediationBannerListener;
import com.google.ads.mediation.MediationInterstitialAdapter;
import com.google.ads.mediation.MediationInterstitialListener;
import com.google.ads.util.AdUtil;

public class AdMobAdapter implements MediationBannerAdapter<AdMobAdapterExtras, AdMobAdapterServerParameters>, MediationInterstitialAdapter<AdMobAdapterExtras, AdMobAdapterServerParameters> {
    /* access modifiers changed from: private */

    /* renamed from: a */
    public MediationBannerListener f997a;
    /* access modifiers changed from: private */

    /* renamed from: b */
    public MediationInterstitialListener f998b;

    /* renamed from: c */
    private AdView f999c;

    /* renamed from: d */
    private InterstitialAd f1000d;

    /* renamed from: a */
    private void m961a() {
        if (m963b()) {
            throw new IllegalStateException("Adapter has already been destroyed");
        }
    }

    /* renamed from: b */
    private boolean m963b() {
        return this.f999c == null && this.f1000d == null;
    }

    /* renamed from: a */
    private AdRequest m959a(Activity activity, AdMobAdapterServerParameters adMobAdapterServerParameters, MediationAdRequest mediationAdRequest, AdMobAdapterExtras adMobAdapterExtras) {
        AdMobAdapterExtras adMobAdapterExtras2 = new AdMobAdapterExtras(adMobAdapterExtras);
        adMobAdapterExtras2.addExtra("_norefresh", "t");
        adMobAdapterExtras2.addExtra("gw", 1);
        if (adMobAdapterServerParameters.allowHouseAds != null) {
            adMobAdapterExtras2.addExtra("mad_hac", adMobAdapterServerParameters.allowHouseAds);
        }
        AdRequest networkExtras = new AdRequest().setBirthday(mediationAdRequest.getBirthday()).setGender(mediationAdRequest.getGender()).setKeywords(mediationAdRequest.getKeywords()).setLocation(mediationAdRequest.getLocation()).setNetworkExtras(adMobAdapterExtras2);
        if (mediationAdRequest.isTesting()) {
            networkExtras.addTestDevice(AdUtil.m986a((Context) activity));
        }
        return networkExtras;
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public AdView mo3809a(Activity activity, AdSize adSize, String str) {
        return new AdView(activity, adSize, str);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public InterstitialAd mo3810a(Activity activity, String str) {
        return new InterstitialAd(activity, str);
    }

    public Class<AdMobAdapterExtras> getAdditionalParametersType() {
        return AdMobAdapterExtras.class;
    }

    public Class<AdMobAdapterServerParameters> getServerParametersType() {
        return AdMobAdapterServerParameters.class;
    }

    public void requestBannerAd(MediationBannerListener listener, Activity activity, AdMobAdapterServerParameters serverParameters, AdSize adSize, MediationAdRequest mediationAdRequest, AdMobAdapterExtras extras) {
        this.f997a = listener;
        if (adSize.isAutoHeight() || adSize.isFullWidth() || ((extras != null && extras.getUseExactAdSize()) || (adSize = adSize.findBestSize(AdSize.BANNER, AdSize.IAB_BANNER, AdSize.IAB_LEADERBOARD, AdSize.IAB_MRECT, AdSize.IAB_WIDE_SKYSCRAPER)) != null)) {
            this.f999c = mo3809a(activity, adSize, serverParameters.adUnitId);
            this.f999c.setAdListener(new C0493a());
            this.f999c.loadAd(m959a(activity, serverParameters, mediationAdRequest, extras));
            return;
        }
        listener.onFailedToReceiveAd(this, AdRequest.ErrorCode.NO_FILL);
    }

    public View getBannerView() {
        return this.f999c;
    }

    public void destroy() {
        m961a();
        if (this.f999c != null) {
            this.f999c.stopLoading();
            this.f999c.destroy();
            this.f999c = null;
        }
        if (this.f1000d != null) {
            this.f1000d.stopLoading();
            this.f1000d = null;
        }
    }

    public void requestInterstitialAd(MediationInterstitialListener listener, Activity activity, AdMobAdapterServerParameters serverParameters, MediationAdRequest mediationAdRequest, AdMobAdapterExtras extras) {
        this.f998b = listener;
        this.f1000d = mo3810a(activity, serverParameters.adUnitId);
        this.f1000d.setAdListener(new C0494b());
        this.f1000d.loadAd(m959a(activity, serverParameters, mediationAdRequest, extras));
    }

    public void showInterstitial() {
        this.f1000d.show();
    }

    /* renamed from: com.google.ads.mediation.admob.AdMobAdapter$a */
    private class C0493a implements AdListener {
        private C0493a() {
        }

        public void onReceiveAd(C0423Ad ad) {
            AdMobAdapter.this.f997a.onReceivedAd(AdMobAdapter.this);
        }

        public void onFailedToReceiveAd(C0423Ad ad, AdRequest.ErrorCode error) {
            AdMobAdapter.this.f997a.onFailedToReceiveAd(AdMobAdapter.this, error);
        }

        public void onPresentScreen(C0423Ad ad) {
            AdMobAdapter.this.f997a.onClick(AdMobAdapter.this);
            AdMobAdapter.this.f997a.onPresentScreen(AdMobAdapter.this);
        }

        public void onDismissScreen(C0423Ad ad) {
            AdMobAdapter.this.f997a.onDismissScreen(AdMobAdapter.this);
        }

        public void onLeaveApplication(C0423Ad ad) {
            AdMobAdapter.this.f997a.onLeaveApplication(AdMobAdapter.this);
        }
    }

    /* renamed from: com.google.ads.mediation.admob.AdMobAdapter$b */
    private class C0494b implements AdListener {
        private C0494b() {
        }

        public void onReceiveAd(C0423Ad ad) {
            AdMobAdapter.this.f998b.onReceivedAd(AdMobAdapter.this);
        }

        public void onFailedToReceiveAd(C0423Ad ad, AdRequest.ErrorCode error) {
            AdMobAdapter.this.f998b.onFailedToReceiveAd(AdMobAdapter.this, error);
        }

        public void onPresentScreen(C0423Ad ad) {
            AdMobAdapter.this.f998b.onPresentScreen(AdMobAdapter.this);
        }

        public void onDismissScreen(C0423Ad ad) {
            AdMobAdapter.this.f998b.onDismissScreen(AdMobAdapter.this);
        }

        public void onLeaveApplication(C0423Ad ad) {
            AdMobAdapter.this.f998b.onLeaveApplication(AdMobAdapter.this);
        }
    }
}
