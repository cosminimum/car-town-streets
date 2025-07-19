package com.mopub.mobileads;

import android.view.View;
import com.mopub.mobileads.MoPubView;

public class MoPubActivity extends BaseActivity implements MoPubView.OnAdLoadedListener {
    public static final int MOPUB_ACTIVITY_NO_AD = 1234;
    private MoPubView mMoPubView;

    public View getAdView() {
        String adUnitId = getIntent().getStringExtra("com.mopub.mobileads.AdUnitId");
        String keywords = getIntent().getStringExtra("com.mopub.mobileads.Keywords");
        String clickthroughUrl = getIntent().getStringExtra("com.mopub.mobileads.ClickthroughUrl");
        int timeout = getIntent().getIntExtra("com.mopub.mobileads.Timeout", 0);
        if (adUnitId == null) {
            throw new RuntimeException("AdUnitId isn't set in com.mopub.mobileads.MoPubActivity");
        }
        this.mMoPubView = new MoPubView(this);
        this.mMoPubView.setAdUnitId(adUnitId);
        this.mMoPubView.setKeywords(keywords);
        this.mMoPubView.setClickthroughUrl(clickthroughUrl);
        this.mMoPubView.setTimeout(timeout);
        this.mMoPubView.setOnAdLoadedListener(this);
        String source = getIntent().getStringExtra("com.mopub.mobileads.Source");
        if (source != null) {
            this.mMoPubView.loadHtmlString(sourceWithImpressionTrackingDisabled(source));
        }
        return this.mMoPubView;
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        this.mMoPubView.destroy();
        super.onDestroy();
    }

    private String sourceWithImpressionTrackingDisabled(String source) {
        return source.replaceAll("http://ads.mopub.com/m/imp", "mopub://null");
    }

    public void OnAdLoaded(MoPubView m) {
        m.adAppeared();
    }
}
