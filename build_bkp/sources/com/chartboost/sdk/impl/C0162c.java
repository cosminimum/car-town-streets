package com.chartboost.sdk.impl;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Shader;
import android.view.View;
import android.widget.LinearLayout;
import com.chartboost.sdk.impl.C0168h;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;

/* renamed from: com.chartboost.sdk.impl.c */
public abstract class C0162c extends LinearLayout implements C0168h.C0178b {

    /* renamed from: a */
    protected View.OnClickListener f233a = null;

    /* renamed from: b */
    private RectF f234b = new RectF();

    /* renamed from: c */
    private Paint f235c = null;

    /* renamed from: d */
    private Paint f236d = null;

    /* renamed from: e */
    private RectF f237e = null;

    public C0162c(Context context) {
        super(context);
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        this.f234b.set(BitmapDescriptorFactory.HUE_RED, BitmapDescriptorFactory.HUE_RED, (float) getWidth(), (float) mo1438a());
        m329a(canvas, this.f234b);
        m330b(canvas, this.f234b);
    }

    /* renamed from: a */
    private void m329a(Canvas canvas, RectF rectF) {
        if (this.f236d == null) {
            this.f236d = new Paint();
            this.f236d.setStyle(Paint.Style.FILL);
            this.f236d.setAntiAlias(true);
        }
        if (this.f237e == null || Math.abs(rectF.top - this.f237e.top) > 0.1f || Math.abs(rectF.bottom - this.f237e.bottom) > 0.1f) {
            this.f236d.setShader(new LinearGradient(BitmapDescriptorFactory.HUE_RED, rectF.top, BitmapDescriptorFactory.HUE_RED, rectF.bottom, -1447447, -2302756, Shader.TileMode.CLAMP));
        }
        canvas.drawRect(rectF, this.f236d);
    }

    /* renamed from: b */
    private void m330b(Canvas canvas, RectF rectF) {
        if (this.f235c == null) {
            this.f235c = new Paint();
            this.f235c.setStyle(Paint.Style.FILL);
            this.f235c.setAntiAlias(true);
        }
        this.f235c.setColor(-723724);
        canvas.drawRect(rectF.left, rectF.top, rectF.right, rectF.top + 1.0f, this.f235c);
        this.f235c.setColor(-3355444);
        canvas.drawRect(rectF.left, rectF.bottom - 1.0f, rectF.right, rectF.bottom, this.f235c);
    }
}
