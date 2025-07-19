package com.chartboost.sdk.impl;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.widget.Button;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
/* loaded from: classes.dex */
public class f extends Button {
    private Path a;
    private Path b;
    private Path c;
    private RectF d;
    private Paint e;
    private Paint f;
    private Shader g;
    private Shader h;
    private int i;

    public f(Context context) {
        super(context);
        a(context);
    }

    private void a(Context context) {
        float f = context.getResources().getDisplayMetrics().density;
        setTextSize(2, 13.0f);
        setShadowLayer(1.0f * f, 1.0f * f, 1.0f * f, -16757901);
        setTypeface(null, 1);
        setTextColor(-1);
        setClickable(true);
        setGravity(17);
        setPadding(Math.round(12.0f * f), Math.round(5.0f * f), Math.round(12.0f * f), Math.round(f * 5.0f));
        this.a = new Path();
        this.b = new Path();
        this.c = new Path();
        this.d = new RectF();
        this.e = new Paint();
        this.e.setStyle(Paint.Style.STROKE);
        this.e.setColor(-4496384);
        this.e.setAntiAlias(true);
        this.i = -1;
        this.f = new Paint();
        this.f.setStyle(Paint.Style.FILL);
        this.f.setAntiAlias(true);
        setBackgroundDrawable(new Drawable() { // from class: com.chartboost.sdk.impl.f.1
            boolean a = false;

            @Override // android.graphics.drawable.Drawable
            public void draw(Canvas canvas) {
                float f2 = f.this.getContext().getResources().getDisplayMetrics().density;
                boolean z = false;
                for (int i : getState()) {
                    if (i == 16842919) {
                        z = true;
                    }
                }
                float f3 = 6.0f * f2;
                f.this.a.reset();
                f.this.d.set(getBounds());
                f.this.a.addRoundRect(f.this.d, f3, f3, Path.Direction.CW);
                f.this.a();
                f.this.f.setShader(z ? f.this.h : f.this.g);
                canvas.drawPath(f.this.a, f.this.f);
                float f4 = 1.0f * f2;
                f.this.b.reset();
                f.this.d.inset(f4 / 2.0f, f4 / 2.0f);
                f.this.b.addRoundRect(f.this.d, f3, f3, Path.Direction.CW);
                f.this.c.reset();
                f.this.d.offset(BitmapDescriptorFactory.HUE_RED, f4 / 2.0f);
                f.this.c.addRoundRect(f.this.d, f3, f3, Path.Direction.CW);
                if (!z) {
                    f.this.e.setColor(-1);
                    canvas.drawPath(f.this.c, f.this.e);
                }
                f.this.e.setColor(-4496384);
                canvas.drawPath(f.this.b, f.this.e);
            }

            @Override // android.graphics.drawable.Drawable
            public void setAlpha(int alpha) {
                f.this.e.setAlpha(alpha);
                f.this.f.setAlpha(alpha);
            }

            @Override // android.graphics.drawable.Drawable
            public void setColorFilter(ColorFilter cf) {
                f.this.e.setColorFilter(cf);
                f.this.f.setColorFilter(cf);
            }

            @Override // android.graphics.drawable.Drawable
            public int getOpacity() {
                return 1;
            }

            @Override // android.graphics.drawable.Drawable
            protected boolean onStateChange(int[] states) {
                boolean z = false;
                for (int i : states) {
                    if (i == 16842919) {
                        z = true;
                    }
                }
                if (this.a != z) {
                    this.a = z;
                    invalidateSelf();
                    return true;
                }
                return false;
            }

            @Override // android.graphics.drawable.Drawable
            public boolean isStateful() {
                return true;
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a() {
        int height = getHeight();
        if (height != this.i) {
            this.i = height;
            this.g = new LinearGradient((float) BitmapDescriptorFactory.HUE_RED, (float) BitmapDescriptorFactory.HUE_RED, (float) BitmapDescriptorFactory.HUE_RED, getHeight(), new int[]{-81366, -89600, -97280}, (float[]) null, Shader.TileMode.CLAMP);
            this.h = new LinearGradient((float) BitmapDescriptorFactory.HUE_RED, (float) BitmapDescriptorFactory.HUE_RED, (float) BitmapDescriptorFactory.HUE_RED, getHeight(), new int[]{-97280, -89600, -81366}, (float[]) null, Shader.TileMode.CLAMP);
        }
    }
}
