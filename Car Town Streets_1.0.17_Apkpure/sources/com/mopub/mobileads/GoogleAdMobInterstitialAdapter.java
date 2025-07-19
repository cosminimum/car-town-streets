package com.mopub.mobileads;

import android.location.Location;
import android.util.Log;
import com.google.ads.Ad;
import com.google.ads.AdListener;
import com.google.ads.AdRequest;
import com.google.ads.InterstitialAd;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;
/* loaded from: classes.dex */
public class GoogleAdMobInterstitialAdapter extends BaseInterstitialAdapter implements AdListener {
    private boolean mHasAlreadyRegisteredClick;
    private boolean mHasPrefetchedInterstitial;
    private InterstitialAd mInterstitialAd;

    @Override // com.mopub.mobileads.BaseInterstitialAdapter
    public void init(MoPubInterstitial interstitial, String jsonParams) {
        super.init(interstitial, jsonParams);
        try {
            JSONObject object = (JSONObject) new JSONTokener(this.mJsonParams).nextValue();
            String pubId = object.getString("adUnitID");
            this.mInterstitialAd = new InterstitialAd(this.mInterstitial.getActivity(), pubId);
            this.mInterstitialAd.setAdListener(this);
        } catch (JSONException e) {
            if (this.mAdapterListener != null) {
                this.mAdapterListener.onNativeInterstitialFailed(this);
            }
        }
    }

    @Override // com.mopub.mobileads.BaseInterstitialAdapter
    public void loadInterstitial() {
        if (!isInvalidated()) {
            AdRequest adRequest = new AdRequest();
            Location location = this.mInterstitial.getLocation();
            if (location != null) {
                adRequest.setLocation(location);
            }
            this.mHasPrefetchedInterstitial = false;
            this.mInterstitialAd.loadAd(adRequest);
        }
    }

    @Override // com.mopub.mobileads.BaseInterstitialAdapter
    public void showInterstitial() {
        if (!isInvalidated() && this.mHasPrefetchedInterstitial) {
            this.mInterstitialAd.show();
        }
    }

    @Override // com.google.ads.AdListener
    public void onDismissScreen(Ad arg0) {
    }

    @Override // com.google.ads.AdListener
    public void onFailedToReceiveAd(Ad arg0, AdRequest.ErrorCode arg1) {
        if (!isInvalidated()) {
            Log.d("MoPub", "Google AdMob interstitial failed. Trying another");
            this.mHasPrefetchedInterstitial = false;
            if (this.mAdapterListener != null) {
                this.mAdapterListener.onNativeInterstitialFailed(this);
            }
        }
    }

    @Override // com.google.ads.AdListener
    public void onLeaveApplication(Ad arg0) {
        if (!isInvalidated()) {
            Log.d("MoPub", "Google AdMob interstitial was clicked, leaving application");
            if (!this.mHasAlreadyRegisteredClick) {
                this.mHasAlreadyRegisteredClick = true;
                if (this.mAdapterListener != null) {
                    this.mAdapterListener.onNativeInterstitialClicked(this);
                }
            }
        }
    }

    @Override // com.google.ads.AdListener
    public void onPresentScreen(Ad arg0) {
    }

    @Override // com.google.ads.AdListener
    public void onReceiveAd(Ad arg0) {
        if (!isInvalidated()) {
            Log.d("MoPub", "Google AdMob interstitial received an ad successfully.");
            this.mHasPrefetchedInterstitial = true;
            if (this.mAdapterListener != null) {
                this.mAdapterListener.onNativeInterstitialLoaded(this);
            }
        }
    }
}
