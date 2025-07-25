package com.google.ads.mediation.admob;

import android.app.Activity;
import android.content.Context;
import android.view.View;
import com.google.ads.Ad;
import com.google.ads.AdListener;
import com.google.ads.AdRequest;
import com.google.ads.AdSize;
import com.google.ads.AdView;
import com.google.ads.InterstitialAd;
import com.google.ads.mediation.MediationAdRequest;
import com.google.ads.mediation.MediationBannerAdapter;
import com.google.ads.mediation.MediationBannerListener;
import com.google.ads.mediation.MediationInterstitialAdapter;
import com.google.ads.mediation.MediationInterstitialListener;
import com.google.ads.util.AdUtil;
/* loaded from: classes.dex */
public class AdMobAdapter implements MediationBannerAdapter<AdMobAdapterExtras, AdMobAdapterServerParameters>, MediationInterstitialAdapter<AdMobAdapterExtras, AdMobAdapterServerParameters> {
    private MediationBannerListener a;
    private MediationInterstitialListener b;
    private AdView c;
    private InterstitialAd d;

    private void a() {
        if (b()) {
            throw new IllegalStateException("Adapter has already been destroyed");
        }
    }

    private boolean b() {
        return this.c == null && this.d == null;
    }

    private AdRequest a(Activity activity, AdMobAdapterServerParameters adMobAdapterServerParameters, MediationAdRequest mediationAdRequest, AdMobAdapterExtras adMobAdapterExtras) {
        AdMobAdapterExtras adMobAdapterExtras2 = new AdMobAdapterExtras(adMobAdapterExtras);
        adMobAdapterExtras2.mo55addExtra("_norefresh", "t");
        adMobAdapterExtras2.mo55addExtra("gw", 1);
        if (adMobAdapterServerParameters.allowHouseAds != null) {
            adMobAdapterExtras2.mo55addExtra("mad_hac", adMobAdapterServerParameters.allowHouseAds);
        }
        AdRequest networkExtras = new AdRequest().setBirthday(mediationAdRequest.getBirthday()).setGender(mediationAdRequest.getGender()).setKeywords(mediationAdRequest.getKeywords()).setLocation(mediationAdRequest.getLocation()).setNetworkExtras(adMobAdapterExtras2);
        if (mediationAdRequest.isTesting()) {
            networkExtras.addTestDevice(AdUtil.a((Context) activity));
        }
        return networkExtras;
    }

    protected AdView a(Activity activity, AdSize adSize, String str) {
        return new AdView(activity, adSize, str);
    }

    protected InterstitialAd a(Activity activity, String str) {
        return new InterstitialAd(activity, str);
    }

    @Override // com.google.ads.mediation.MediationAdapter
    public Class<AdMobAdapterExtras> getAdditionalParametersType() {
        return AdMobAdapterExtras.class;
    }

    @Override // com.google.ads.mediation.MediationAdapter
    public Class<AdMobAdapterServerParameters> getServerParametersType() {
        return AdMobAdapterServerParameters.class;
    }

    @Override // com.google.ads.mediation.MediationBannerAdapter
    public void requestBannerAd(MediationBannerListener listener, Activity activity, AdMobAdapterServerParameters serverParameters, AdSize adSize, MediationAdRequest mediationAdRequest, AdMobAdapterExtras extras) {
        this.a = listener;
        if (!adSize.isAutoHeight() && !adSize.isFullWidth() && ((extras == null || !extras.getUseExactAdSize()) && (adSize = adSize.findBestSize(AdSize.BANNER, AdSize.IAB_BANNER, AdSize.IAB_LEADERBOARD, AdSize.IAB_MRECT, AdSize.IAB_WIDE_SKYSCRAPER)) == null)) {
            listener.onFailedToReceiveAd(this, AdRequest.ErrorCode.NO_FILL);
            return;
        }
        this.c = a(activity, adSize, serverParameters.adUnitId);
        this.c.setAdListener(new a());
        this.c.loadAd(a(activity, serverParameters, mediationAdRequest, extras));
    }

    @Override // com.google.ads.mediation.MediationBannerAdapter
    public View getBannerView() {
        return this.c;
    }

    @Override // com.google.ads.mediation.MediationAdapter
    public void destroy() {
        a();
        if (this.c != null) {
            this.c.stopLoading();
            this.c.destroy();
            this.c = null;
        }
        if (this.d != null) {
            this.d.stopLoading();
            this.d = null;
        }
    }

    @Override // com.google.ads.mediation.MediationInterstitialAdapter
    public void requestInterstitialAd(MediationInterstitialListener listener, Activity activity, AdMobAdapterServerParameters serverParameters, MediationAdRequest mediationAdRequest, AdMobAdapterExtras extras) {
        this.b = listener;
        this.d = a(activity, serverParameters.adUnitId);
        this.d.setAdListener(new b());
        this.d.loadAd(a(activity, serverParameters, mediationAdRequest, extras));
    }

    @Override // com.google.ads.mediation.MediationInterstitialAdapter
    public void showInterstitial() {
        this.d.show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class a implements AdListener {
        private a() {
        }

        @Override // com.google.ads.AdListener
        public void onReceiveAd(Ad ad) {
            AdMobAdapter.this.a.onReceivedAd(AdMobAdapter.this);
        }

        @Override // com.google.ads.AdListener
        public void onFailedToReceiveAd(Ad ad, AdRequest.ErrorCode error) {
            AdMobAdapter.this.a.onFailedToReceiveAd(AdMobAdapter.this, error);
        }

        @Override // com.google.ads.AdListener
        public void onPresentScreen(Ad ad) {
            AdMobAdapter.this.a.onClick(AdMobAdapter.this);
            AdMobAdapter.this.a.onPresentScreen(AdMobAdapter.this);
        }

        @Override // com.google.ads.AdListener
        public void onDismissScreen(Ad ad) {
            AdMobAdapter.this.a.onDismissScreen(AdMobAdapter.this);
        }

        @Override // com.google.ads.AdListener
        public void onLeaveApplication(Ad ad) {
            AdMobAdapter.this.a.onLeaveApplication(AdMobAdapter.this);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class b implements AdListener {
        private b() {
        }

        @Override // com.google.ads.AdListener
        public void onReceiveAd(Ad ad) {
            AdMobAdapter.this.b.onReceivedAd(AdMobAdapter.this);
        }

        @Override // com.google.ads.AdListener
        public void onFailedToReceiveAd(Ad ad, AdRequest.ErrorCode error) {
            AdMobAdapter.this.b.onFailedToReceiveAd(AdMobAdapter.this, error);
        }

        @Override // com.google.ads.AdListener
        public void onPresentScreen(Ad ad) {
            AdMobAdapter.this.b.onPresentScreen(AdMobAdapter.this);
        }

        @Override // com.google.ads.AdListener
        public void onDismissScreen(Ad ad) {
            AdMobAdapter.this.b.onDismissScreen(AdMobAdapter.this);
        }

        @Override // com.google.ads.AdListener
        public void onLeaveApplication(Ad ad) {
            AdMobAdapter.this.b.onLeaveApplication(AdMobAdapter.this);
        }
    }
}
