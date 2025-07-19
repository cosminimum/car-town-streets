package com.mopub.mobileads;

import android.app.Activity;
import android.location.Location;
import android.os.Handler;
import android.util.Log;
import com.millennialmedia.android.MMAdView;
import com.millennialmedia.android.MMAdViewSDK;
import java.lang.ref.WeakReference;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;
/* loaded from: classes.dex */
public class MillennialInterstitialAdapter extends BaseInterstitialAdapter implements MMAdView.MMAdListener {
    private WeakReference<Activity> mActivityReference;
    private final Handler mHandler = new Handler();
    private boolean mHasAlreadyRegisteredClick;
    private MMAdView mMillennialAdView;

    @Override // com.mopub.mobileads.BaseInterstitialAdapter
    public void init(MoPubInterstitial interstitial, String jsonParams) {
        super.init(interstitial, jsonParams);
        this.mActivityReference = new WeakReference<>(interstitial.getActivity());
        try {
            JSONObject object = (JSONObject) new JSONTokener(this.mJsonParams).nextValue();
            String pubId = object.getString("adUnitID");
            this.mMillennialAdView = new MMAdView(this.mActivityReference.get(), pubId, MMAdView.FULLSCREEN_AD_TRANSITION, -1);
            this.mMillennialAdView.setId(MMAdViewSDK.DEFAULT_VIEWID);
            this.mMillennialAdView.setListener(this);
        } catch (JSONException e) {
            if (this.mAdapterListener != null) {
                this.mAdapterListener.onNativeInterstitialFailed(this);
            }
        }
    }

    @Override // com.mopub.mobileads.BaseInterstitialAdapter
    public void invalidate() {
        this.mMillennialAdView.removeAllViews();
        this.mActivityReference = null;
        super.invalidate();
    }

    @Override // com.mopub.mobileads.BaseInterstitialAdapter
    public boolean isInvalidated() {
        if (this.mActivityReference == null || this.mActivityReference.get() == null) {
            return true;
        }
        return super.isInvalidated();
    }

    @Override // com.mopub.mobileads.BaseInterstitialAdapter
    public void loadInterstitial() {
        if (!isInvalidated()) {
            Log.d("MoPub", "Fetching Millennial ad...");
            Location location = this.mInterstitial.getLocation();
            if (location != null) {
                this.mMillennialAdView.updateUserLocation(location);
            }
            this.mMillennialAdView.setVisibility(4);
            this.mHasAlreadyRegisteredClick = false;
            this.mMillennialAdView.fetch();
        }
    }

    @Override // com.mopub.mobileads.BaseInterstitialAdapter
    public void showInterstitial() {
        if (!isInvalidated()) {
            if (!this.mMillennialAdView.check()) {
                Log.d("MoPub", "Tried to show a Millennial interstitial before it finished caching. Please try again.");
            } else {
                this.mMillennialAdView.display();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void recordClickIfNecessary() {
        if (!this.mHasAlreadyRegisteredClick) {
            this.mHasAlreadyRegisteredClick = true;
            if (this.mAdapterListener != null) {
                this.mAdapterListener.onNativeInterstitialClicked(this);
            }
        }
    }

    @Override // com.millennialmedia.android.MMAdView.MMAdListener
    public void MMAdFailed(MMAdView adview) {
        this.mHandler.post(new Runnable() { // from class: com.mopub.mobileads.MillennialInterstitialAdapter.1
            @Override // java.lang.Runnable
            public void run() {
                if (!MillennialInterstitialAdapter.this.isInvalidated()) {
                    Log.d("MoPub", "Millennial interstitial failed. Trying another.");
                    if (MillennialInterstitialAdapter.this.mAdapterListener != null) {
                        MillennialInterstitialAdapter.this.mAdapterListener.onNativeInterstitialFailed(MillennialInterstitialAdapter.this);
                    }
                }
            }
        });
    }

    @Override // com.millennialmedia.android.MMAdView.MMAdListener
    public void MMAdReturned(MMAdView adview) {
        this.mHandler.post(new Runnable() { // from class: com.mopub.mobileads.MillennialInterstitialAdapter.2
            @Override // java.lang.Runnable
            public void run() {
                if (!MillennialInterstitialAdapter.this.isInvalidated()) {
                    Log.d("MoPub", "Millennial interstitial returned an ad.");
                    if (MillennialInterstitialAdapter.this.mAdapterListener != null) {
                    }
                }
            }
        });
    }

    @Override // com.millennialmedia.android.MMAdView.MMAdListener
    public void MMAdClickedToOverlay(MMAdView adview) {
        this.mHandler.post(new Runnable() { // from class: com.mopub.mobileads.MillennialInterstitialAdapter.3
            @Override // java.lang.Runnable
            public void run() {
                if (!MillennialInterstitialAdapter.this.isInvalidated()) {
                    Log.d("MoPub", "Millennial interstitial clicked to overlay");
                    MillennialInterstitialAdapter.this.recordClickIfNecessary();
                }
            }
        });
    }

    @Override // com.millennialmedia.android.MMAdView.MMAdListener
    public void MMAdOverlayLaunched(MMAdView adview) {
        this.mHandler.post(new Runnable() { // from class: com.mopub.mobileads.MillennialInterstitialAdapter.4
            @Override // java.lang.Runnable
            public void run() {
                if (!MillennialInterstitialAdapter.this.isInvalidated()) {
                    Log.d("MoPub", "Millennial interstitial launched overlay");
                    if (MillennialInterstitialAdapter.this.mAdapterListener != null) {
                        MillennialInterstitialAdapter.this.mAdapterListener.onNativeInterstitialExpired(MillennialInterstitialAdapter.this);
                    }
                }
            }
        });
    }

    @Override // com.millennialmedia.android.MMAdView.MMAdListener
    public void MMAdCachingCompleted(MMAdView adview, boolean success) {
        this.mHandler.post(new Runnable() { // from class: com.mopub.mobileads.MillennialInterstitialAdapter.5
            @Override // java.lang.Runnable
            public void run() {
                if (!MillennialInterstitialAdapter.this.isInvalidated() && MillennialInterstitialAdapter.this.mAdapterListener != null) {
                    if (MillennialInterstitialAdapter.this.mMillennialAdView.check()) {
                        Log.d("MoPub", "Millennial interstitial caching completed.");
                        MillennialInterstitialAdapter.this.mAdapterListener.onNativeInterstitialLoaded(MillennialInterstitialAdapter.this);
                        return;
                    }
                    Log.d("MoPub", "Millennial interstitial caching failed. Trying another.");
                    MillennialInterstitialAdapter.this.mAdapterListener.onNativeInterstitialFailed(MillennialInterstitialAdapter.this);
                }
            }
        });
    }

    @Override // com.millennialmedia.android.MMAdView.MMAdListener
    public void MMAdRequestIsCaching(MMAdView adview) {
        Log.d("MoPub", "Millennial interstitial is caching.");
    }
}
