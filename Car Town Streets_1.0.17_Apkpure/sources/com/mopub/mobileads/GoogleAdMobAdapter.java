package com.mopub.mobileads;

import android.location.Location;
import android.util.Log;
import android.widget.FrameLayout;
import com.getjar.sdk.utilities.Constants;
import com.google.ads.Ad;
import com.google.ads.AdListener;
import com.google.ads.AdRequest;
import com.google.ads.AdSize;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;
/* loaded from: classes.dex */
public class GoogleAdMobAdapter extends BaseAdapter implements AdListener {
    private com.google.ads.AdView mAdMobView;

    @Override // com.mopub.mobileads.BaseAdapter
    public void loadAd() {
        AdSize adType;
        if (!isInvalidated()) {
            AdSize adSize = AdSize.BANNER;
            try {
                JSONObject object = (JSONObject) new JSONTokener(this.mJsonParams).nextValue();
                String adUnitId = object.getString("adUnitID");
                int adWidth = object.getInt("adWidth");
                int adHeight = object.getInt("adHeight");
                if (adWidth <= AdSize.BANNER.getWidth() && adHeight <= AdSize.BANNER.getHeight()) {
                    adType = AdSize.BANNER;
                } else if (adWidth <= AdSize.IAB_MRECT.getWidth() && adHeight <= AdSize.IAB_MRECT.getHeight()) {
                    adType = AdSize.IAB_MRECT;
                } else if (adWidth <= AdSize.IAB_BANNER.getWidth() && adHeight <= AdSize.IAB_BANNER.getHeight()) {
                    adType = AdSize.IAB_BANNER;
                } else if (adWidth <= AdSize.IAB_LEADERBOARD.getWidth() && adHeight <= AdSize.IAB_LEADERBOARD.getHeight()) {
                    adType = AdSize.IAB_LEADERBOARD;
                } else {
                    Log.e("MoPub", "Failed to retrieve ad from AdMob native. Unsupported ad size: " + adWidth + Constants.X + adHeight);
                    this.mMoPubView.loadFailUrl();
                    return;
                }
                this.mAdMobView = new com.google.ads.AdView(this.mMoPubView.getActivity(), adType, adUnitId);
                this.mAdMobView.setAdListener(this);
                AdRequest request = new AdRequest();
                Location location = this.mMoPubView.getLocation();
                if (location != null) {
                    this.mMoPubView.setLocation(location);
                }
                this.mAdMobView.loadAd(request);
            } catch (JSONException e) {
                this.mMoPubView.loadFailUrl();
            }
        }
    }

    @Override // com.mopub.mobileads.BaseAdapter
    public void invalidate() {
        if (this.mAdMobView != null) {
            this.mMoPubView.removeView(this.mAdMobView);
            this.mAdMobView.destroy();
        }
        super.invalidate();
    }

    @Override // com.google.ads.AdListener
    public void onDismissScreen(Ad ad) {
    }

    @Override // com.google.ads.AdListener
    public void onFailedToReceiveAd(Ad ad, AdRequest.ErrorCode error) {
        if (!isInvalidated()) {
            Log.d("MoPub", "Google AdMob failed. Trying another");
            this.mMoPubView.loadFailUrl();
        }
    }

    @Override // com.google.ads.AdListener
    public void onLeaveApplication(Ad ad) {
    }

    @Override // com.google.ads.AdListener
    public void onPresentScreen(Ad ad) {
        if (!isInvalidated()) {
            Log.d("MoPub", "Google AdMob clicked");
            this.mMoPubView.registerClick();
        }
    }

    @Override // com.google.ads.AdListener
    public void onReceiveAd(Ad ad) {
        if (!isInvalidated()) {
            Log.d("MoPub", "Google AdMob load succeeded. Showing ad...");
            this.mMoPubView.removeAllViews();
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -1);
            layoutParams.gravity = 17;
            this.mMoPubView.addView(this.mAdMobView, layoutParams);
            this.mMoPubView.nativeAdLoaded();
            this.mMoPubView.trackNativeImpression();
        }
    }
}
