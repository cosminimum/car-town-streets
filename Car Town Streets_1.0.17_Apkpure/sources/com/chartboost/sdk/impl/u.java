package com.chartboost.sdk.impl;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.os.Handler;
import android.view.View;
import com.chartboost.sdk.Chartboost;
import com.chartboost.sdk.Libraries.CBOrientation;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import java.lang.reflect.Method;
/* loaded from: classes.dex */
public class u extends View {
    private Handler a;
    private float b;
    private long c;
    private Paint d;
    private Paint e;
    private Path f;
    private Path g;
    private RectF h;
    private RectF i;
    private Bitmap j = null;
    private Canvas k = null;
    private Runnable l = new Runnable() { // from class: com.chartboost.sdk.impl.u.1
        @Override // java.lang.Runnable
        public void run() {
            CBOrientation.Difference forcedOrientationDifference = Chartboost.sharedChartboost().getForcedOrientationDifference();
            float f = u.this.getContext().getResources().getDisplayMetrics().density;
            u.this.b += 1.0f * f;
            float width = (forcedOrientationDifference.isOdd() ? u.this.getWidth() : u.this.getHeight()) - (f * 9.0f);
            if (u.this.b > width) {
                u.this.b -= width * 2.0f;
            }
            if (u.this.getWindowVisibility() == 0) {
                u.this.invalidate();
            }
        }
    };

    public u(Context context) {
        super(context);
        a(context);
    }

    private void a(Context context) {
        float f = context.getResources().getDisplayMetrics().density;
        this.b = BitmapDescriptorFactory.HUE_RED;
        this.a = new Handler();
        this.c = (long) (System.nanoTime() / 1000000.0d);
        this.d = new Paint();
        this.d.setColor(-1);
        this.d.setStyle(Paint.Style.STROKE);
        this.d.setStrokeWidth(f * 3.0f);
        this.d.setAntiAlias(true);
        this.e = new Paint();
        this.e.setColor(-1);
        this.e.setStyle(Paint.Style.FILL);
        this.e.setAntiAlias(true);
        this.f = new Path();
        this.g = new Path();
        this.i = new RectF();
        this.h = new RectF();
        try {
            Method method = getClass().getMethod("setLayerType", Integer.TYPE, Paint.class);
            Object[] objArr = new Object[2];
            objArr[0] = 1;
            method.invoke(this, objArr);
        } catch (Exception e) {
        }
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        float f = getContext().getResources().getDisplayMetrics().density;
        if (this.j == null || this.j.getWidth() != canvas.getWidth() || this.j.getHeight() != canvas.getHeight()) {
            if (this.j != null && !this.j.isRecycled()) {
                this.j.recycle();
            }
            this.j = Bitmap.createBitmap(canvas.getWidth(), canvas.getHeight(), Bitmap.Config.ARGB_8888);
            this.k = new Canvas(this.j);
        }
        this.j.eraseColor(0);
        Canvas canvas2 = this.k;
        CBOrientation.Difference forcedOrientationDifference = Chartboost.sharedChartboost().getForcedOrientationDifference();
        canvas2.save();
        if (forcedOrientationDifference.isReverse()) {
            canvas2.rotate(180.0f, getWidth() / 2.0f, getHeight() / 2.0f);
        }
        this.h.set(BitmapDescriptorFactory.HUE_RED, BitmapDescriptorFactory.HUE_RED, getWidth(), getHeight());
        this.h.inset(1.5f * f, 1.5f * f);
        float width = (forcedOrientationDifference.isOdd() ? getWidth() : getHeight()) / 2.0f;
        canvas2.drawRoundRect(this.h, width, width, this.d);
        this.i.set(this.h);
        this.i.inset(3.0f * f, f * 3.0f);
        float width2 = (forcedOrientationDifference.isOdd() ? this.i.width() : this.i.height()) / 2.0f;
        this.f.reset();
        this.f.addRoundRect(this.i, width2, width2, Path.Direction.CW);
        float width3 = forcedOrientationDifference.isOdd() ? this.i.width() : this.i.height();
        this.g.reset();
        if (forcedOrientationDifference.isOdd()) {
            this.g.moveTo(width3, BitmapDescriptorFactory.HUE_RED);
            this.g.lineTo(width3, width3);
            this.g.lineTo(BitmapDescriptorFactory.HUE_RED, width3 * 2.0f);
            this.g.lineTo(BitmapDescriptorFactory.HUE_RED, width3);
        } else {
            this.g.moveTo(BitmapDescriptorFactory.HUE_RED, width3);
            this.g.lineTo(width3, width3);
            this.g.lineTo(width3 * 2.0f, BitmapDescriptorFactory.HUE_RED);
            this.g.lineTo(width3, BitmapDescriptorFactory.HUE_RED);
        }
        this.g.close();
        canvas2.save();
        canvas2.clipPath(this.f);
        float f2 = -width3;
        float f3 = this.b;
        while (true) {
            f2 += f3;
            if (f2 >= (forcedOrientationDifference.isOdd() ? this.i.height() : this.i.width()) + width3) {
                break;
            }
            float f4 = (forcedOrientationDifference.isOdd() ? this.i.top : this.i.left) + f2;
            canvas2.save();
            if (forcedOrientationDifference.isOdd()) {
                canvas2.translate(this.i.left, f4);
            } else {
                canvas2.translate(f4, this.i.top);
            }
            canvas2.drawPath(this.g, this.e);
            canvas2.restore();
            f3 = 2.0f * width3;
        }
        canvas2.restore();
        canvas2.restore();
        if (canvas != null) {
            canvas.drawBitmap(this.j, BitmapDescriptorFactory.HUE_RED, BitmapDescriptorFactory.HUE_RED, (Paint) null);
        }
        long max = Math.max(0L, 16 - (((long) (System.nanoTime() / 1000000.0d)) - this.c));
        this.a.removeCallbacks(this.l);
        this.a.postDelayed(this.l, max);
    }

    @Override // android.view.View
    protected void onWindowVisibilityChanged(int visibility) {
        super.onWindowVisibilityChanged(visibility);
        this.a.removeCallbacks(this.l);
        if (visibility == 0) {
            this.a.post(this.l);
        }
    }

    @Override // android.view.View
    protected void onAttachedToWindow() {
        this.a.removeCallbacks(this.l);
        this.a.post(this.l);
    }

    @Override // android.view.View
    protected void onDetachedFromWindow() {
        this.a.removeCallbacks(this.l);
        if (this.j != null && !this.j.isRecycled()) {
            this.j.recycle();
        }
        this.j = null;
    }
}
