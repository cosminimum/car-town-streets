package com.google.ads.doubleclick;

import android.app.Activity;
import android.content.Context;
import android.util.AttributeSet;
import com.google.ads.AdSize;
import com.google.ads.AdView;
import com.google.ads.AppEventListener;
/* loaded from: classes.dex */
public class DfpAdView extends AdView {
    public DfpAdView(Activity activity, AdSize adSize, String adUnitId) {
        super(activity, adSize, adUnitId);
    }

    public DfpAdView(Activity activity, AdSize[] adSizes, String adUnitId) {
        super(activity, adSizes, adUnitId);
    }

    public DfpAdView(Context context, AttributeSet attrs) {
        super(context, attrs);
    }

    public DfpAdView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    @Override // com.google.ads.AdView
    public void setAppEventListener(AppEventListener appEventListener) {
        super.setAppEventListener(appEventListener);
    }

    @Override // com.google.ads.AdView
    public void setSupportedAdSizes(AdSize... adSizes) {
        super.setSupportedAdSizes(adSizes);
    }
}
