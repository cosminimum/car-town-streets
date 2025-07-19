package com.chartboost.sdk.impl;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Region;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsoluteLayout;
import android.widget.HorizontalScrollView;
import android.widget.RelativeLayout;
import android.widget.ScrollView;
import com.chartboost.sdk.C0038Chartboost;
import com.chartboost.sdk.Libraries.CBOrientation;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;

/* renamed from: com.chartboost.sdk.impl.t */
public class C0208t extends AbsoluteLayout {

    /* renamed from: a */
    private Matrix f365a = new Matrix();

    /* renamed from: b */
    private Matrix f366b = new Matrix();

    /* renamed from: c */
    private float[] f367c = new float[2];

    /* renamed from: d */
    private View f368d;

    /* renamed from: e */
    private RelativeLayout f369e;

    public C0208t(Context context) {
        super(context);
        this.f369e = new RelativeLayout(context);
        addView(this.f369e, new AbsoluteLayout.LayoutParams(-1, -1, 0, 0));
        this.f368d = this.f369e;
    }

    /* renamed from: a */
    public void mo1503a(View view) {
        mo1504a(view, new RelativeLayout.LayoutParams(-2, -2));
    }

    /* renamed from: a */
    public void mo1504a(View view, RelativeLayout.LayoutParams layoutParams) {
        if (this.f369e != null) {
            this.f369e.addView(view, layoutParams);
            return;
        }
        throw new IllegalStateException("cannot call addViewToContainer() on CBRotatableContainer that was set up with a default view");
    }

    public C0208t(Context context, View view) {
        super(context);
        addView(view, new AbsoluteLayout.LayoutParams(-1, -1, 0, 0));
        this.f368d = view;
    }

    public void onSizeChanged(int w, int h, int oldw, int oldh) {
        int i;
        super.onSizeChanged(w, h, oldw, oldh);
        CBOrientation.Difference forcedOrientationDifference = C0038Chartboost.sharedChartboost().getForcedOrientationDifference();
        ViewGroup.LayoutParams layoutParams = this.f368d.getLayoutParams();
        if (forcedOrientationDifference.isOdd()) {
            i = h;
        } else {
            i = w;
        }
        layoutParams.width = i;
        if (!forcedOrientationDifference.isOdd()) {
            w = h;
        }
        layoutParams.height = w;
        this.f368d.setLayoutParams(layoutParams);
        this.f368d.measure(View.MeasureSpec.makeMeasureSpec(layoutParams.width, 1073741824), View.MeasureSpec.makeMeasureSpec(layoutParams.height, 1073741824));
        this.f368d.layout(0, 0, layoutParams.width, layoutParams.height);
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        if (C0038Chartboost.sharedChartboost().getForcedOrientationDifference().isOdd()) {
            super.onMeasure(heightMeasureSpec, widthMeasureSpec);
            setMeasuredDimension(getMeasuredHeight(), getMeasuredWidth());
            return;
        }
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);
    }

    /* access modifiers changed from: protected */
    public void dispatchDraw(Canvas canvas) {
        CBOrientation.Difference forcedOrientationDifference = C0038Chartboost.sharedChartboost().getForcedOrientationDifference();
        int asInt = forcedOrientationDifference.getAsInt();
        if (forcedOrientationDifference == CBOrientation.Difference.ANGLE_0) {
            super.dispatchDraw(canvas);
            return;
        }
        canvas.save();
        canvas.clipRect(BitmapDescriptorFactory.HUE_RED, BitmapDescriptorFactory.HUE_RED, (float) getWidth(), (float) getHeight(), Region.Op.REPLACE);
        try {
            ViewGroup viewGroup = (ViewGroup) getParent();
            try {
                ViewGroup viewGroup2 = (ViewGroup) viewGroup.getParent();
                if ((viewGroup2 instanceof ScrollView) || (viewGroup2 instanceof HorizontalScrollView)) {
                    viewGroup = viewGroup2;
                }
            } catch (Exception e) {
            }
            int left = getLeft() - viewGroup.getScrollX();
            int top = getTop() - viewGroup.getScrollY();
            canvas.clipRect((float) (0 - left), (float) (0 - top), (float) (viewGroup.getWidth() - left), (float) (viewGroup.getHeight() - top), Region.Op.INTERSECT);
        } catch (Exception e2) {
        }
        canvas.translate(((float) getWidth()) / 2.0f, ((float) getHeight()) / 2.0f);
        canvas.rotate((float) asInt);
        if (forcedOrientationDifference.isOdd()) {
            canvas.translate(((float) (-getHeight())) / 2.0f, ((float) (-getWidth())) / 2.0f);
        } else {
            canvas.translate(((float) (-getWidth())) / 2.0f, ((float) (-getHeight())) / 2.0f);
        }
        this.f365a = canvas.getMatrix();
        this.f365a.invert(this.f366b);
        super.dispatchDraw(canvas);
        canvas.restore();
    }

    public boolean dispatchTouchEvent(MotionEvent event) {
        if (C0038Chartboost.sharedChartboost().getForcedOrientationDifference() == CBOrientation.Difference.ANGLE_0) {
            return super.dispatchTouchEvent(event);
        }
        float[] fArr = this.f367c;
        fArr[0] = event.getRawX();
        fArr[1] = event.getRawY();
        this.f366b.mapPoints(fArr);
        event.setLocation(fArr[0], fArr[1]);
        return super.dispatchTouchEvent(event);
    }

    /* renamed from: a */
    public View mo1502a() {
        return this.f368d;
    }
}
