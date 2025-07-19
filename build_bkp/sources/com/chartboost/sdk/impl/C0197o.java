package com.chartboost.sdk.impl;

import android.content.Context;
import android.graphics.drawable.GradientDrawable;
import android.view.View;
import android.view.animation.AlphaAnimation;
import android.widget.RelativeLayout;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;

/* renamed from: com.chartboost.sdk.impl.o */
public class C0197o extends RelativeLayout {

    /* renamed from: a */
    public C0198a f334a;
    /* access modifiers changed from: private */

    /* renamed from: b */
    public boolean f335b;

    public C0197o(Context context) {
        super(context);
        this.f334a = new C0198a(context);
        this.f334a.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
        addView(this.f334a);
        setFocusable(false);
    }

    /* renamed from: a */
    public void mo1483a(View view) {
        AlphaAnimation alphaAnimation = new AlphaAnimation(BitmapDescriptorFactory.HUE_RED, 1.0f);
        alphaAnimation.setDuration(510);
        alphaAnimation.setFillAfter(true);
        view.startAnimation(alphaAnimation);
    }

    /* renamed from: a */
    public void mo1482a() {
        mo1483a((View) this.f334a);
    }

    /* renamed from: a */
    public void mo1484a(boolean z) {
        this.f335b = z;
        this.f334a.mo1485a();
    }

    /* renamed from: com.chartboost.sdk.impl.o$a */
    private class C0198a extends View {
        public C0198a(Context context) {
            super(context);
            setFocusable(false);
        }

        /* access modifiers changed from: protected */
        public void onSizeChanged(int w, int h, int oldw, int oldh) {
            super.onSizeChanged(w, h, oldw, oldh);
            mo1485a();
        }

        /* renamed from: a */
        public void mo1485a() {
            int i = -872415232;
            int i2 = C0197o.this.f335b ? -2013265920 : -872415232;
            if (!C0197o.this.f335b) {
                i = -2013265920;
            }
            GradientDrawable gradientDrawable = new GradientDrawable(GradientDrawable.Orientation.TL_BR, new int[]{i, i2});
            gradientDrawable.setGradientType(1);
            gradientDrawable.setGradientRadius(((float) Math.min(getWidth(), getHeight())) / 2.0f);
            gradientDrawable.setGradientCenter(((float) getWidth()) / 2.0f, ((float) getHeight()) / 2.0f);
            setBackgroundDrawable(gradientDrawable);
        }
    }
}
