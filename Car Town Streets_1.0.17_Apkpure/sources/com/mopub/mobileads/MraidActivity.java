package com.mopub.mobileads;

import android.view.View;
import com.mopub.mobileads.MraidView;
/* loaded from: classes.dex */
public class MraidActivity extends BaseActivity {
    private MraidView mAdView;

    @Override // com.mopub.mobileads.BaseActivity
    public View getAdView() {
        this.mAdView = new MraidView(this, MraidView.ExpansionStyle.DISABLED, MraidView.NativeCloseButtonStyle.AD_CONTROLLED, MraidView.PlacementType.INTERSTITIAL);
        this.mAdView.setOnReadyListener(new MraidView.OnReadyListener() { // from class: com.mopub.mobileads.MraidActivity.1
            @Override // com.mopub.mobileads.MraidView.OnReadyListener
            public void onReady(MraidView view) {
                MraidActivity.this.showInterstitialCloseButton();
            }
        });
        this.mAdView.setOnCloseButtonStateChange(new MraidView.OnCloseButtonStateChangeListener() { // from class: com.mopub.mobileads.MraidActivity.2
            @Override // com.mopub.mobileads.MraidView.OnCloseButtonStateChangeListener
            public void onCloseButtonStateChange(MraidView view, boolean enabled) {
                if (!enabled) {
                    MraidActivity.this.hideInterstitialCloseButton();
                } else {
                    MraidActivity.this.showInterstitialCloseButton();
                }
            }
        });
        this.mAdView.setOnCloseListener(new MraidView.OnCloseListener() { // from class: com.mopub.mobileads.MraidActivity.3
            @Override // com.mopub.mobileads.MraidView.OnCloseListener
            public void onClose(MraidView view, MraidView.ViewState newViewState) {
                MraidActivity.this.finish();
            }
        });
        String source = getIntent().getStringExtra("com.mopub.mobileads.Source");
        this.mAdView.loadHtmlData(source);
        return this.mAdView;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.mopub.mobileads.BaseActivity, android.app.Activity
    public void onDestroy() {
        this.mAdView.destroy();
        super.onDestroy();
    }
}
