package com.chartboost.sdk.impl;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.widget.Button;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;

/* renamed from: com.chartboost.sdk.impl.f */
public class C0165f extends Button {
    /* access modifiers changed from: private */

    /* renamed from: a */
    public Path f246a;
    /* access modifiers changed from: private */

    /* renamed from: b */
    public Path f247b;
    /* access modifiers changed from: private */

    /* renamed from: c */
    public Path f248c;
    /* access modifiers changed from: private */

    /* renamed from: d */
    public RectF f249d;
    /* access modifiers changed from: private */

    /* renamed from: e */
    public Paint f250e;
    /* access modifiers changed from: private */

    /* renamed from: f */
    public Paint f251f;
    /* access modifiers changed from: private */

    /* renamed from: g */
    public Shader f252g;
    /* access modifiers changed from: private */

    /* renamed from: h */
    public Shader f253h;

    /* renamed from: i */
    private int f254i;

    public C0165f(Context context) {
        super(context);
        m338a(context);
    }

    /* renamed from: a */
    private void m338a(Context context) {
        float f = context.getResources().getDisplayMetrics().density;
        setTextSize(2, 13.0f);
        setShadowLayer(1.0f * f, 1.0f * f, 1.0f * f, -16757901);
        setTypeface((Typeface) null, 1);
        setTextColor(-1);
        setClickable(true);
        setGravity(17);
        setPadding(Math.round(12.0f * f), Math.round(5.0f * f), Math.round(12.0f * f), Math.round(f * 5.0f));
        this.f246a = new Path();
        this.f247b = new Path();
        this.f248c = new Path();
        this.f249d = new RectF();
        this.f250e = new Paint();
        this.f250e.setStyle(Paint.Style.STROKE);
        this.f250e.setColor(-4496384);
        this.f250e.setAntiAlias(true);
        this.f254i = -1;
        this.f251f = new Paint();
        this.f251f.setStyle(Paint.Style.FILL);
        this.f251f.setAntiAlias(true);
        setBackgroundDrawable(new Drawable() {

            /* renamed from: a */
            boolean f255a = false;

            public void draw(Canvas canvas) {
                float f = C0165f.this.getContext().getResources().getDisplayMetrics().density;
                int[] state = getState();
                boolean z = false;
                for (int i : state) {
                    if (i == 16842919) {
                        z = true;
                    }
                }
                float f2 = 6.0f * f;
                C0165f.this.f246a.reset();
                C0165f.this.f249d.set(getBounds());
                C0165f.this.f246a.addRoundRect(C0165f.this.f249d, f2, f2, Path.Direction.CW);
                C0165f.this.m337a();
                C0165f.this.f251f.setShader(z ? C0165f.this.f253h : C0165f.this.f252g);
                canvas.drawPath(C0165f.this.f246a, C0165f.this.f251f);
                float f3 = 1.0f * f;
                C0165f.this.f247b.reset();
                C0165f.this.f249d.inset(f3 / 2.0f, f3 / 2.0f);
                C0165f.this.f247b.addRoundRect(C0165f.this.f249d, f2, f2, Path.Direction.CW);
                C0165f.this.f248c.reset();
                C0165f.this.f249d.offset(BitmapDescriptorFactory.HUE_RED, f3 / 2.0f);
                C0165f.this.f248c.addRoundRect(C0165f.this.f249d, f2, f2, Path.Direction.CW);
                if (!z) {
                    C0165f.this.f250e.setColor(-1);
                    canvas.drawPath(C0165f.this.f248c, C0165f.this.f250e);
                }
                C0165f.this.f250e.setColor(-4496384);
                canvas.drawPath(C0165f.this.f247b, C0165f.this.f250e);
            }

            public void setAlpha(int alpha) {
                C0165f.this.f250e.setAlpha(alpha);
                C0165f.this.f251f.setAlpha(alpha);
            }

            public void setColorFilter(ColorFilter cf) {
                C0165f.this.f250e.setColorFilter(cf);
                C0165f.this.f251f.setColorFilter(cf);
            }

            public int getOpacity() {
                return 1;
            }

            /* access modifiers changed from: protected */
            public boolean onStateChange(int[] states) {
                boolean z = false;
                for (int i : states) {
                    if (i == 16842919) {
                        z = true;
                    }
                }
                if (this.f255a == z) {
                    return false;
                }
                this.f255a = z;
                invalidateSelf();
                return true;
            }

            public boolean isStateful() {
                return true;
            }
        });
    }

    /* access modifiers changed from: private */
    /* renamed from: a */
    public void m337a() {
        int height = getHeight();
        if (height != this.f254i) {
            this.f254i = height;
            this.f252g = new LinearGradient(BitmapDescriptorFactory.HUE_RED, BitmapDescriptorFactory.HUE_RED, BitmapDescriptorFactory.HUE_RED, (float) getHeight(), new int[]{-81366, -89600, -97280}, (float[]) null, Shader.TileMode.CLAMP);
            this.f253h = new LinearGradient(BitmapDescriptorFactory.HUE_RED, BitmapDescriptorFactory.HUE_RED, BitmapDescriptorFactory.HUE_RED, (float) getHeight(), new int[]{-97280, -89600, -81366}, (float[]) null, Shader.TileMode.CLAMP);
        }
    }
}
