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

public class GoogleAdMobInterstitialAdapter extends BaseInterstitialAdapter implements AdListener {
    private boolean mHasAlreadyRegisteredClick;
    private boolean mHasPrefetchedInterstitial;
    private InterstitialAd mInterstitialAd;

    public void init(MoPubInterstitial interstitial, String jsonParams) {
        super.init(interstitial, jsonParams);
        try {
            this.mInterstitialAd = new InterstitialAd(this.mInterstitial.getActivity(), ((JSONObject) new JSONTokener(this.mJsonParams).nextValue()).getString("adUnitID"));
            this.mInterstitialAd.setAdListener(this);
        } catch (JSONException e) {
            if (this.mAdapterListener != null) {
                this.mAdapterListener.onNativeInterstitialFailed(this);
            }
        }
    }

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

    public void showInterstitial() {
        if (!isInvalidated() && this.mHasPrefetchedInterstitial) {
            this.mInterstitialAd.show();
        }
    }

    public void onDismissScreen(Ad arg0) {
    }

    public void onFailedToReceiveAd(Ad arg0, AdRequest.ErrorCode arg1) {
        if (!isInvalidated()) {
            Log.d("MoPub", "Google AdMob interstitial failed. Trying another");
            this.mHasPrefetchedInterstitial = false;
            if (this.mAdapterListener != null) {
                this.mAdapterListener.onNativeInterstitialFailed(this);
            }
        }
    }

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

    public void onPresentScreen(Ad arg0) {
    }

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
