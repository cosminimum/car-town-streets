package com.mopub.mobileads;

import android.view.View;
import com.mopub.mobileads.MraidView;

public class MraidActivity extends BaseActivity {
    private MraidView mAdView;

    public View getAdView() {
        this.mAdView = new MraidView(this, MraidView.ExpansionStyle.DISABLED, MraidView.NativeCloseButtonStyle.AD_CONTROLLED, MraidView.PlacementType.INTERSTITIAL);
        this.mAdView.setOnReadyListener(new MraidView.OnReadyListener() {
            public void onReady(MraidView view) {
                MraidActivity.this.showInterstitialCloseButton();
            }
        });
        this.mAdView.setOnCloseButtonStateChange(new MraidView.OnCloseButtonStateChangeListener() {
            public void onCloseButtonStateChange(MraidView view, boolean enabled) {
                if (enabled) {
                    MraidActivity.this.showInterstitialCloseButton();
                } else {
                    MraidActivity.this.hideInterstitialCloseButton();
                }
            }
        });
        this.mAdView.setOnCloseListener(new MraidView.OnCloseListener() {
            public void onClose(MraidView view, MraidView.ViewState newViewState) {
                MraidActivity.this.finish();
            }
        });
        this.mAdView.loadHtmlData(getIntent().getStringExtra("com.mopub.mobileads.Source"));
        return this.mAdView;
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        this.mAdView.destroy();
        super.onDestroy();
    }
}
