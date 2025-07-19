package com.google.android.gms.ads;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import com.google.android.gms.internal.C0866ag;

public final class AdView extends ViewGroup {

    /* renamed from: dZ */
    private final C0866ag f1113dZ;

    public AdView(Context context) {
        super(context);
        this.f1113dZ = new C0866ag(this);
    }

    public AdView(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.f1113dZ = new C0866ag(this, attrs, false);
    }

    public AdView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.f1113dZ = new C0866ag(this, attrs, false);
    }

    public void destroy() {
        this.f1113dZ.destroy();
    }

    public AdListener getAdListener() {
        return this.f1113dZ.getAdListener();
    }

    public AdSize getAdSize() {
        return this.f1113dZ.getAdSize();
    }

    public String getAdUnitId() {
        return this.f1113dZ.getAdUnitId();
    }

    public void loadAd(AdRequest adRequest) {
        this.f1113dZ.mo7038a(adRequest.mo5435v());
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean changed, int left, int top, int right, int bottom) {
        View childAt = getChildAt(0);
        if (childAt != null && childAt.getVisibility() != 8) {
            int measuredWidth = childAt.getMeasuredWidth();
            int measuredHeight = childAt.getMeasuredHeight();
            int i = ((right - left) - measuredWidth) / 2;
            int i2 = ((bottom - top) - measuredHeight) / 2;
            childAt.layout(i, i2, measuredWidth + i, measuredHeight + i2);
        }
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int i;
        int i2 = 0;
        View childAt = getChildAt(0);
        AdSize adSize = getAdSize();
        if (childAt != null && childAt.getVisibility() != 8) {
            measureChild(childAt, widthMeasureSpec, heightMeasureSpec);
            i = childAt.getMeasuredWidth();
            i2 = childAt.getMeasuredHeight();
        } else if (adSize != null) {
            Context context = getContext();
            i = adSize.getWidthInPixels(context);
            i2 = adSize.getHeightInPixels(context);
        } else {
            i = 0;
        }
        setMeasuredDimension(View.resolveSize(Math.max(i, getSuggestedMinimumWidth()), widthMeasureSpec), View.resolveSize(Math.max(i2, getSuggestedMinimumHeight()), heightMeasureSpec));
    }

    public void pause() {
        this.f1113dZ.pause();
    }

    public void resume() {
        this.f1113dZ.resume();
    }

    public void setAdListener(AdListener adListener) {
        this.f1113dZ.setAdListener(adListener);
    }

    public void setAdSize(AdSize adSize) {
        this.f1113dZ.setAdSizes(adSize);
    }

    public void setAdUnitId(String adUnitId) {
        this.f1113dZ.setAdUnitId(adUnitId);
    }
}
