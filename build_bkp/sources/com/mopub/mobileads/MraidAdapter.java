package com.mopub.mobileads;

import android.widget.FrameLayout;
import com.mopub.mobileads.MraidView;

public class MraidAdapter extends BaseAdapter {
    private MraidView mMraidView;
    /* access modifiers changed from: private */
    public boolean mPreviousAutorefreshSetting;

    public void init(MoPubView view, String jsonParams) {
        super.init(view, jsonParams);
        this.mPreviousAutorefreshSetting = false;
    }

    public void loadAd() {
        if (!isInvalidated()) {
            this.mMraidView = new MraidView(this.mMoPubView.getContext());
            this.mMraidView.loadHtmlData(this.mJsonParams);
            initMraidListeners();
            this.mMoPubView.removeAllViews();
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -1);
            layoutParams.gravity = 17;
            this.mMoPubView.addView(this.mMraidView, layoutParams);
        }
    }

    public void invalidate() {
        this.mMoPubView = null;
        if (this.mMraidView != null) {
            this.mMraidView.destroy();
        }
        super.invalidate();
    }

    private void initMraidListeners() {
        this.mMraidView.setOnReadyListener(new MraidView.OnReadyListener() {
            public void onReady(MraidView view) {
                if (!MraidAdapter.this.isInvalidated()) {
                    MraidAdapter.this.mMoPubView.nativeAdLoaded();
                    MraidAdapter.this.mMoPubView.trackNativeImpression();
                }
            }
        });
        this.mMraidView.setOnExpandListener(new MraidView.OnExpandListener() {
            public void onExpand(MraidView view) {
                if (!MraidAdapter.this.isInvalidated()) {
                    boolean unused = MraidAdapter.this.mPreviousAutorefreshSetting = MraidAdapter.this.mMoPubView.getAutorefreshEnabled();
                    MraidAdapter.this.mMoPubView.setAutorefreshEnabled(false);
                    MraidAdapter.this.mMoPubView.adPresentedOverlay();
                    MraidAdapter.this.mMoPubView.registerClick();
                }
            }
        });
        this.mMraidView.setOnCloseListener(new MraidView.OnCloseListener() {
            public void onClose(MraidView view, MraidView.ViewState newViewState) {
                if (!MraidAdapter.this.isInvalidated()) {
                    MraidAdapter.this.mMoPubView.setAutorefreshEnabled(MraidAdapter.this.mPreviousAutorefreshSetting);
                    MraidAdapter.this.mMoPubView.adClosed();
                }
            }
        });
        this.mMraidView.setOnFailureListener(new MraidView.OnFailureListener() {
            public void onFailure(MraidView view) {
                if (!MraidAdapter.this.isInvalidated()) {
                    MraidAdapter.this.mMoPubView.loadFailUrl();
                }
            }
        });
    }
}
