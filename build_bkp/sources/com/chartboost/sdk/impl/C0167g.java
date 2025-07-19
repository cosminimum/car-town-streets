package com.chartboost.sdk.impl;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.RectF;
import android.graphics.Xfermode;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.widget.ImageView;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;

/* renamed from: com.chartboost.sdk.impl.g */
public class C0167g extends ImageView {

    /* renamed from: a */
    private RectF f257a;

    /* renamed from: b */
    private Paint f258b;

    /* renamed from: c */
    private Xfermode f259c;

    public C0167g(Context context) {
        super(context);
        m347a(context);
    }

    /* renamed from: a */
    private void m347a(Context context) {
        float f = getContext().getResources().getDisplayMetrics().density;
        this.f259c = new PorterDuffXfermode(PorterDuff.Mode.SRC_IN);
        this.f257a = new RectF();
        this.f258b = new Paint();
        this.f258b.setStyle(Paint.Style.STROKE);
        this.f258b.setColor(-1509949440);
        this.f258b.setStrokeWidth(Math.max(1.0f, f * 1.0f));
        this.f258b.setAntiAlias(true);
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        float f = getContext().getResources().getDisplayMetrics().density;
        float f2 = 10.0f * f;
        float f3 = 1.0f * f;
        Drawable drawable = getDrawable();
        if (drawable instanceof BitmapDrawable) {
            Paint paint = ((BitmapDrawable) drawable).getPaint();
            this.f257a.set(drawable.getBounds());
            if (getImageMatrix() != null) {
                getImageMatrix().mapRect(this.f257a);
            }
            int saveLayer = canvas.saveLayer(this.f257a, (Paint) null, 31);
            paint.setAntiAlias(true);
            canvas.drawARGB(0, 0, 0, 0);
            paint.setColor(-16777216);
            canvas.drawRoundRect(this.f257a, f2, f2, paint);
            Xfermode xfermode = paint.getXfermode();
            paint.setXfermode(this.f259c);
            super.onDraw(canvas);
            paint.setXfermode(xfermode);
            canvas.restoreToCount(saveLayer);
        } else {
            super.onDraw(canvas);
        }
        this.f257a.set(BitmapDescriptorFactory.HUE_RED, BitmapDescriptorFactory.HUE_RED, (float) getWidth(), (float) getHeight());
        this.f257a.inset(f3 / 2.0f, f3 / 2.0f);
        canvas.drawRoundRect(this.f257a, f2, f2, this.f258b);
    }
}
