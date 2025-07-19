package com.mopub.mobileads;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.location.Location;
import android.util.Log;
import com.mopub.mobileads.BaseInterstitialAdapter;
import com.mopub.mobileads.MoPubView;
import java.util.HashMap;

public class MoPubInterstitial implements MoPubView.OnAdLoadedListener, MoPubView.OnAdFailedListener {
    private Activity mActivity;
    private String mAdUnitId;
    private BaseInterstitialAdapter.BaseInterstitialAdapterListener mAdapterListener;
    /* access modifiers changed from: private */
    public InterstitialState mCurrentInterstitialState;
    private DefaultInterstitialAdapterListener mDefaultAdapterListener;
    /* access modifiers changed from: private */
    public BaseInterstitialAdapter mInterstitialAdapter;
    /* access modifiers changed from: private */
    public MoPubInterstitialView mInterstitialView = new MoPubInterstitialView(this.mActivity);
    /* access modifiers changed from: private */
    public MoPubInterstitialListener mListener;

    private enum InterstitialState {
        HTML_AD_READY,
        NATIVE_AD_READY,
        NOT_READY
    }

    public interface MoPubInterstitialListener {
        void OnInterstitialFailed();

        void OnInterstitialLoaded();
    }

    public MoPubInterstitial(Activity activity, String id) {
        this.mActivity = activity;
        this.mAdUnitId = id;
        this.mInterstitialView.setAdUnitId(this.mAdUnitId);
        this.mCurrentInterstitialState = InterstitialState.NOT_READY;
        this.mDefaultAdapterListener = new DefaultInterstitialAdapterListener();
        this.mAdapterListener = this.mDefaultAdapterListener;
    }

    public void load() {
        this.mCurrentInterstitialState = InterstitialState.NOT_READY;
        if (this.mInterstitialAdapter != null) {
            this.mInterstitialAdapter.invalidate();
            this.mInterstitialAdapter = null;
        }
        this.mAdapterListener = this.mDefaultAdapterListener;
        this.mInterstitialView.setOnAdLoadedListener(this);
        this.mInterstitialView.setOnAdFailedListener(this);
        this.mInterstitialView.loadAd();
    }

    public boolean isReady() {
        return this.mCurrentInterstitialState == InterstitialState.HTML_AD_READY || this.mCurrentInterstitialState == InterstitialState.NATIVE_AD_READY;
    }

    public boolean show() {
        switch (this.mCurrentInterstitialState) {
            case HTML_AD_READY:
                showHtmlInterstitial();
                return true;
            case NATIVE_AD_READY:
                showNativeInterstitial();
                return true;
            default:
                return false;
        }
    }

    private void showHtmlInterstitial() {
        String responseString = this.mInterstitialView.getResponseString();
        Intent i = new Intent(this.mActivity, MoPubActivity.class);
        i.putExtra("com.mopub.mobileads.AdUnitId", this.mAdUnitId);
        i.putExtra("com.mopub.mobileads.Keywords", this.mInterstitialView.getKeywords());
        i.putExtra("com.mopub.mobileads.Source", responseString);
        i.putExtra("com.mopub.mobileads.ClickthroughUrl", this.mInterstitialView.getClickthroughUrl());
        this.mActivity.startActivity(i);
    }

    private void showNativeInterstitial() {
        if (this.mInterstitialAdapter != null) {
            this.mInterstitialAdapter.showInterstitial();
        }
    }

    public void OnAdFailed(MoPubView m) {
        this.mCurrentInterstitialState = InterstitialState.NOT_READY;
        if (this.mListener != null) {
            this.mListener.OnInterstitialFailed();
        }
    }

    public void OnAdLoaded(MoPubView m) {
        this.mCurrentInterstitialState = InterstitialState.HTML_AD_READY;
        if (this.mInterstitialAdapter != null) {
            this.mInterstitialAdapter.invalidate();
            this.mInterstitialAdapter = null;
        }
        if (this.mListener != null) {
            this.mListener.OnInterstitialLoaded();
        }
    }

    public void customEventDidLoadAd() {
        if (this.mInterstitialView != null) {
            this.mInterstitialView.trackImpression();
        }
    }

    public void customEventDidFailToLoadAd() {
        if (this.mInterstitialView != null) {
            this.mInterstitialView.loadFailUrl();
        }
    }

    public void customEventActionWillBegin() {
        if (this.mInterstitialView != null) {
            this.mInterstitialView.registerClick();
        }
    }

    @Deprecated
    public void showAd() {
        this.mAdapterListener = new DefaultInterstitialAdapterListener() {
            public void onNativeInterstitialLoaded(BaseInterstitialAdapter adapter) {
                super.onNativeInterstitialLoaded(adapter);
                MoPubInterstitial.this.show();
            }
        };
        this.mInterstitialView.setOnAdLoadedListener(new MoPubView.OnAdLoadedListener() {
            public void OnAdLoaded(MoPubView m) {
                MoPubInterstitial.this.OnAdLoaded(m);
                MoPubInterstitial.this.show();
            }
        });
        this.mInterstitialView.loadAd();
    }

    public void setKeywords(String keywords) {
        if (this.mInterstitialView != null) {
            this.mInterstitialView.setKeywords(keywords);
        }
    }

    public String getKeywords() {
        if (this.mInterstitialView != null) {
            return this.mInterstitialView.getKeywords();
        }
        return null;
    }

    public Activity getActivity() {
        return this.mActivity;
    }

    public void setListener(MoPubInterstitialListener listener) {
        this.mListener = listener;
    }

    public MoPubInterstitialListener getListener() {
        return this.mListener;
    }

    public Location getLocation() {
        return this.mInterstitialView.getLocation();
    }

    public void destroy() {
        this.mAdapterListener = null;
        if (this.mInterstitialAdapter != null) {
            this.mInterstitialAdapter.invalidate();
            this.mInterstitialAdapter = null;
        }
        this.mInterstitialView.setOnAdLoadedListener((MoPubView.OnAdLoadedListener) null);
        this.mInterstitialView.setOnAdFailedListener((MoPubView.OnAdFailedListener) null);
        this.mInterstitialView.destroy();
    }

    public void setLocationAwareness(MoPubView.LocationAwareness awareness) {
        this.mInterstitialView.setLocationAwareness(awareness);
    }

    public MoPubView.LocationAwareness getLocationAwareness() {
        return this.mInterstitialView.getLocationAwareness();
    }

    public void setLocationPrecision(int precision) {
        this.mInterstitialView.setLocationPrecision(precision);
    }

    public int getLocationPrecision() {
        return this.mInterstitialView.getLocationPrecision();
    }

    /* access modifiers changed from: protected */
    public BaseInterstitialAdapter.BaseInterstitialAdapterListener getInterstitialAdapterListener() {
        return this.mAdapterListener;
    }

    public class DefaultInterstitialAdapterListener implements BaseInterstitialAdapter.BaseInterstitialAdapterListener {
        public DefaultInterstitialAdapterListener() {
        }

        public void onNativeInterstitialLoaded(BaseInterstitialAdapter adapter) {
            InterstitialState unused = MoPubInterstitial.this.mCurrentInterstitialState = InterstitialState.NATIVE_AD_READY;
            MoPubInterstitial.this.mInterstitialView.trackImpression();
            if (MoPubInterstitial.this.mListener != null) {
                MoPubInterstitial.this.mListener.OnInterstitialLoaded();
            }
        }

        public void onNativeInterstitialFailed(BaseInterstitialAdapter adapter) {
            InterstitialState unused = MoPubInterstitial.this.mCurrentInterstitialState = InterstitialState.NOT_READY;
            MoPubInterstitial.this.mInterstitialView.loadFailUrl();
        }

        public void onNativeInterstitialClicked(BaseInterstitialAdapter adapter) {
            MoPubInterstitial.this.mInterstitialView.registerClick();
        }

        public void onNativeInterstitialExpired(BaseInterstitialAdapter adapter) {
            InterstitialState unused = MoPubInterstitial.this.mCurrentInterstitialState = InterstitialState.NOT_READY;
        }
    }

    public class MoPubInterstitialView extends MoPubView {
        public MoPubInterstitialView(Context context) {
            super(context);
            setAutorefreshEnabled(false);
        }

        /* access modifiers changed from: protected */
        public void loadNativeSDK(HashMap<String, String> paramsHash) {
            if (paramsHash != null) {
                MoPubInterstitial interstitial = MoPubInterstitial.this;
                BaseInterstitialAdapter.BaseInterstitialAdapterListener adapterListener = interstitial.getInterstitialAdapterListener();
                String type = paramsHash.get("X-Adtype");
                if (type != null && (type.equals("interstitial") || type.equals("mraid"))) {
                    String interstitialType = type.equals("interstitial") ? paramsHash.get("X-Fulladtype") : "mraid";
                    Log.i("MoPub", "Loading native adapter for interstitial type: " + interstitialType);
                    BaseInterstitialAdapter unused = MoPubInterstitial.this.mInterstitialAdapter = BaseInterstitialAdapter.getAdapterForType(interstitialType);
                    if (MoPubInterstitial.this.mInterstitialAdapter != null) {
                        MoPubInterstitial.this.mInterstitialAdapter.init(interstitial, paramsHash.get("X-Nativeparams"));
                        MoPubInterstitial.this.mInterstitialAdapter.setAdapterListener(adapterListener);
                        MoPubInterstitial.this.mInterstitialAdapter.loadInterstitial();
                        return;
                    }
                }
                Log.i("MoPub", "Couldn't load native adapter. Trying next ad...");
                adapterListener.onNativeInterstitialFailed((BaseInterstitialAdapter) null);
            }
        }

        /* access modifiers changed from: protected */
        public void trackImpression() {
            Log.d("MoPub", "Tracking impression for interstitial.");
            if (this.mAdView != null) {
                this.mAdView.trackImpression();
            }
        }
    }
}
