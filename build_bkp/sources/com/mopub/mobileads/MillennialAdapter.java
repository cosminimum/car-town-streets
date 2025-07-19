package com.mopub.mobileads;

import android.app.Activity;
import android.location.Location;
import android.os.Handler;
import android.util.Log;
import android.widget.FrameLayout;
import com.millennialmedia.android.MMAdView;
import com.millennialmedia.android.MMAdViewSDK;
import java.lang.ref.WeakReference;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

public class MillennialAdapter extends BaseAdapter implements MMAdView.MMAdListener {
    private WeakReference<Activity> mActivityReference;
    private final Handler mHandler = new Handler();
    /* access modifiers changed from: private */
    public boolean mHasAlreadyRegisteredImpression;
    /* access modifiers changed from: private */
    public MMAdView mMillennialAdView;

    public void init(MoPubView view, String jsonParams) {
        super.init(view, jsonParams);
        this.mActivityReference = new WeakReference<>((Activity) view.getContext());
    }

    public void loadAd() {
        if (!isInvalidated()) {
            try {
                JSONObject object = (JSONObject) new JSONTokener(this.mJsonParams).nextValue();
                String pubId = object.getString("adUnitID");
                int adWidth = object.getInt("adWidth");
                int adHeight = object.getInt("adHeight");
                String mmAdType = MMAdView.BANNER_AD_TOP;
                String widthString = "320";
                String heightString = "53";
                if (adWidth == 300 && adHeight == 250) {
                    mmAdType = MMAdView.BANNER_AD_RECTANGLE;
                    widthString = Integer.toString(adWidth);
                    heightString = Integer.toString(adHeight);
                }
                this.mMillennialAdView = new MMAdView((Activity) this.mActivityReference.get(), pubId, mmAdType, -1);
                this.mMillennialAdView.setId(MMAdViewSDK.DEFAULT_VIEWID);
                this.mMillennialAdView.setListener(this);
                this.mMillennialAdView.setVisibility(4);
                this.mMillennialAdView.setWidth(widthString);
                this.mMillennialAdView.setHeight(heightString);
                Location location = this.mMoPubView.getLocation();
                if (location != null) {
                    this.mMillennialAdView.updateUserLocation(location);
                }
                this.mHasAlreadyRegisteredImpression = false;
                Log.d("MoPub", "Loading Millennial ad...");
                this.mMillennialAdView.callForAd();
            } catch (JSONException e) {
                this.mMoPubView.loadFailUrl();
            }
        }
    }

    public void invalidate() {
        if (this.mMillennialAdView != null) {
            this.mMillennialAdView.removeAllViews();
            this.mMoPubView.removeView(this.mMillennialAdView);
        }
        this.mActivityReference = null;
        super.invalidate();
    }

    public boolean isInvalidated() {
        if (this.mActivityReference == null || this.mActivityReference.get() == null) {
            return true;
        }
        return super.isInvalidated();
    }

    public void MMAdFailed(MMAdView adview) {
        this.mHandler.post(new Runnable() {
            public void run() {
                if (!MillennialAdapter.this.isInvalidated()) {
                    Log.d("MoPub", "Millennial failed. Trying another");
                    MillennialAdapter.this.mMoPubView.loadFailUrl();
                }
            }
        });
    }

    public void MMAdReturned(MMAdView adview) {
        this.mHandler.post(new Runnable() {
            public void run() {
                if (!MillennialAdapter.this.isInvalidated()) {
                    MillennialAdapter.this.mMoPubView.removeAllViews();
                    MillennialAdapter.this.mMillennialAdView.setVisibility(0);
                    MillennialAdapter.this.mMillennialAdView.setHorizontalScrollBarEnabled(false);
                    MillennialAdapter.this.mMillennialAdView.setVerticalScrollBarEnabled(false);
                    FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -1);
                    layoutParams.gravity = 17;
                    MillennialAdapter.this.mMoPubView.addView(MillennialAdapter.this.mMillennialAdView, layoutParams);
                    if (!MillennialAdapter.this.mHasAlreadyRegisteredImpression) {
                        boolean unused = MillennialAdapter.this.mHasAlreadyRegisteredImpression = true;
                        MillennialAdapter.this.mMoPubView.nativeAdLoaded();
                        MillennialAdapter.this.mMoPubView.trackNativeImpression();
                    }
                }
            }
        });
    }

    public void MMAdClickedToOverlay(MMAdView adview) {
        this.mHandler.post(new Runnable() {
            public void run() {
                if (!MillennialAdapter.this.isInvalidated()) {
                    Log.d("MoPub", "Millennial clicked");
                    MillennialAdapter.this.mMoPubView.registerClick();
                }
            }
        });
    }

    public void MMAdOverlayLaunched(MMAdView adview) {
    }

    public void MMAdRequestIsCaching(MMAdView adview) {
    }

    public void MMAdCachingCompleted(MMAdView adview, boolean success) {
    }
}
