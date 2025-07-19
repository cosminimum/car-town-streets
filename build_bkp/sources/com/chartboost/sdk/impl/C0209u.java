package com.chartboost.sdk.impl;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.os.Handler;
import android.view.View;
import com.chartboost.sdk.C0038Chartboost;
import com.chartboost.sdk.Libraries.CBOrientation;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import java.lang.reflect.Method;

/* renamed from: com.chartboost.sdk.impl.u */
public class C0209u extends View {

    /* renamed from: a */
    private Handler f370a;
    /* access modifiers changed from: private */

    /* renamed from: b */
    public float f371b;

    /* renamed from: c */
    private long f372c;

    /* renamed from: d */
    private Paint f373d;

    /* renamed from: e */
    private Paint f374e;

    /* renamed from: f */
    private Path f375f;

    /* renamed from: g */
    private Path f376g;

    /* renamed from: h */
    private RectF f377h;

    /* renamed from: i */
    private RectF f378i;

    /* renamed from: j */
    private Bitmap f379j = null;

    /* renamed from: k */
    private Canvas f380k = null;

    /* renamed from: l */
    private Runnable f381l = new Runnable() {
        public void run() {
            CBOrientation.Difference forcedOrientationDifference = C0038Chartboost.sharedChartboost().getForcedOrientationDifference();
            float f = C0209u.this.getContext().getResources().getDisplayMetrics().density;
            C0209u uVar = C0209u.this;
            uVar.f371b = uVar.f371b + (1.0f * f);
            float width = ((float) (forcedOrientationDifference.isOdd() ? C0209u.this.getWidth() : C0209u.this.getHeight())) - (f * 9.0f);
            if (C0209u.this.f371b > width) {
                C0209u uVar2 = C0209u.this;
                uVar2.f371b = uVar2.f371b - (width * 2.0f);
            }
            if (C0209u.this.getWindowVisibility() == 0) {
                C0209u.this.invalidate();
            }
        }
    };

    public C0209u(Context context) {
        super(context);
        m454a(context);
    }

    /* renamed from: a */
    private void m454a(Context context) {
        float f = context.getResources().getDisplayMetrics().density;
        this.f371b = BitmapDescriptorFactory.HUE_RED;
        this.f370a = new Handler();
        this.f372c = (long) (((double) System.nanoTime()) / 1000000.0d);
        this.f373d = new Paint();
        this.f373d.setColor(-1);
        this.f373d.setStyle(Paint.Style.STROKE);
        this.f373d.setStrokeWidth(f * 3.0f);
        this.f373d.setAntiAlias(true);
        this.f374e = new Paint();
        this.f374e.setColor(-1);
        this.f374e.setStyle(Paint.Style.FILL);
        this.f374e.setAntiAlias(true);
        this.f375f = new Path();
        this.f376g = new Path();
        this.f378i = new RectF();
        this.f377h = new RectF();
        try {
            Method method = getClass().getMethod("setLayerType", new Class[]{Integer.TYPE, Paint.class});
            Object[] objArr = new Object[2];
            objArr[0] = 1;
            method.invoke(this, objArr);
        } catch (Exception e) {
        }
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        float width;
        float f = getContext().getResources().getDisplayMetrics().density;
        if (!(this.f379j != null && this.f379j.getWidth() == canvas.getWidth() && this.f379j.getHeight() == canvas.getHeight())) {
            if (this.f379j != null && !this.f379j.isRecycled()) {
                this.f379j.recycle();
            }
            this.f379j = Bitmap.createBitmap(canvas.getWidth(), canvas.getHeight(), Bitmap.Config.ARGB_8888);
            this.f380k = new Canvas(this.f379j);
        }
        this.f379j.eraseColor(0);
        Canvas canvas2 = this.f380k;
        CBOrientation.Difference forcedOrientationDifference = C0038Chartboost.sharedChartboost().getForcedOrientationDifference();
        canvas2.save();
        if (forcedOrientationDifference.isReverse()) {
            canvas2.rotate(180.0f, ((float) getWidth()) / 2.0f, ((float) getHeight()) / 2.0f);
        }
        this.f377h.set(BitmapDescriptorFactory.HUE_RED, BitmapDescriptorFactory.HUE_RED, (float) getWidth(), (float) getHeight());
        this.f377h.inset(1.5f * f, 1.5f * f);
        float width2 = ((float) (forcedOrientationDifference.isOdd() ? getWidth() : getHeight())) / 2.0f;
        canvas2.drawRoundRect(this.f377h, width2, width2, this.f373d);
        this.f378i.set(this.f377h);
        this.f378i.inset(3.0f * f, f * 3.0f);
        float width3 = (forcedOrientationDifference.isOdd() ? this.f378i.width() : this.f378i.height()) / 2.0f;
        this.f375f.reset();
        this.f375f.addRoundRect(this.f378i, width3, width3, Path.Direction.CW);
        float width4 = forcedOrientationDifference.isOdd() ? this.f378i.width() : this.f378i.height();
        this.f376g.reset();
        if (forcedOrientationDifference.isOdd()) {
            this.f376g.moveTo(width4, BitmapDescriptorFactory.HUE_RED);
            this.f376g.lineTo(width4, width4);
            this.f376g.lineTo(BitmapDescriptorFactory.HUE_RED, width4 * 2.0f);
            this.f376g.lineTo(BitmapDescriptorFactory.HUE_RED, width4);
        } else {
            this.f376g.moveTo(BitmapDescriptorFactory.HUE_RED, width4);
            this.f376g.lineTo(width4, width4);
            this.f376g.lineTo(width4 * 2.0f, BitmapDescriptorFactory.HUE_RED);
            this.f376g.lineTo(width4, BitmapDescriptorFactory.HUE_RED);
        }
        this.f376g.close();
        canvas2.save();
        canvas2.clipPath(this.f375f);
        float f2 = -width4;
        float f3 = this.f371b;
        while (true) {
            f2 += f3;
            if (forcedOrientationDifference.isOdd()) {
                width = this.f378i.height();
            } else {
                width = this.f378i.width();
            }
            if (f2 >= width + width4) {
                break;
            }
            float f4 = (forcedOrientationDifference.isOdd() ? this.f378i.top : this.f378i.left) + f2;
            canvas2.save();
            if (forcedOrientationDifference.isOdd()) {
                canvas2.translate(this.f378i.left, f4);
            } else {
                canvas2.translate(f4, this.f378i.top);
            }
            canvas2.drawPath(this.f376g, this.f374e);
            canvas2.restore();
            f3 = 2.0f * width4;
        }
        canvas2.restore();
        canvas2.restore();
        if (canvas != null) {
            canvas.drawBitmap(this.f379j, BitmapDescriptorFactory.HUE_RED, BitmapDescriptorFactory.HUE_RED, (Paint) null);
        } else {
            Canvas canvas3 = canvas2;
        }
        long max = Math.max(0, 16 - (((long) (((double) System.nanoTime()) / 1000000.0d)) - this.f372c));
        this.f370a.removeCallbacks(this.f381l);
        this.f370a.postDelayed(this.f381l, max);
    }

    /* access modifiers changed from: protected */
    public void onWindowVisibilityChanged(int visibility) {
        super.onWindowVisibilityChanged(visibility);
        this.f370a.removeCallbacks(this.f381l);
        if (visibility == 0) {
            this.f370a.post(this.f381l);
        }
    }

    /* access modifiers changed from: protected */
    public void onAttachedToWindow() {
        this.f370a.removeCallbacks(this.f381l);
        this.f370a.post(this.f381l);
    }

    /* access modifiers changed from: protected */
    public void onDetachedFromWindow() {
        this.f370a.removeCallbacks(this.f381l);
        if (this.f379j != null && !this.f379j.isRecycled()) {
            this.f379j.recycle();
        }
        this.f379j = null;
    }
}
