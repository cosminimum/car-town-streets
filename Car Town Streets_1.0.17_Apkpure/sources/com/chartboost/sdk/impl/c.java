package com.chartboost.sdk.impl;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Shader;
import android.view.View;
import android.widget.LinearLayout;
import com.chartboost.sdk.impl.h;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
/* loaded from: classes.dex */
public abstract class c extends LinearLayout implements h.b {
    private RectF b = new RectF();
    private Paint c = null;
    private Paint d = null;
    private RectF e = null;
    protected View.OnClickListener a = null;

    public c(Context context) {
        super(context);
    }

    @Override // android.widget.LinearLayout, android.view.View
    protected void onDraw(Canvas canvas) {
        this.b.set(BitmapDescriptorFactory.HUE_RED, BitmapDescriptorFactory.HUE_RED, getWidth(), a());
        a(canvas, this.b);
        b(canvas, this.b);
    }

    private void a(Canvas canvas, RectF rectF) {
        if (this.d == null) {
            this.d = new Paint();
            this.d.setStyle(Paint.Style.FILL);
            this.d.setAntiAlias(true);
        }
        if (this.e == null || Math.abs(rectF.top - this.e.top) > 0.1f || Math.abs(rectF.bottom - this.e.bottom) > 0.1f) {
            this.d.setShader(new LinearGradient((float) BitmapDescriptorFactory.HUE_RED, rectF.top, (float) BitmapDescriptorFactory.HUE_RED, rectF.bottom, -1447447, -2302756, Shader.TileMode.CLAMP));
        }
        canvas.drawRect(rectF, this.d);
    }

    private void b(Canvas canvas, RectF rectF) {
        if (this.c == null) {
            this.c = new Paint();
            this.c.setStyle(Paint.Style.FILL);
            this.c.setAntiAlias(true);
        }
        this.c.setColor(-723724);
        canvas.drawRect(rectF.left, rectF.top, rectF.right, rectF.top + 1.0f, this.c);
        this.c.setColor(-3355444);
        canvas.drawRect(rectF.left, rectF.bottom - 1.0f, rectF.right, rectF.bottom, this.c);
    }
}
