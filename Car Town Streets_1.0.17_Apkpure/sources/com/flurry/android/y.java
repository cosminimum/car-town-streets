package com.flurry.android;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BlurMaskFilter;
import android.graphics.Canvas;
import android.graphics.NinePatch;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.NinePatchDrawable;
import android.os.Build;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class y extends RelativeLayout {
    private u a;
    private p b;
    private String c;
    private int d;

    public y(Context context, u uVar, p pVar, e eVar, int i, boolean z) {
        super(context);
        this.a = uVar;
        this.b = pVar;
        v vVar = pVar.b;
        this.d = i;
        switch (this.d) {
            case 2:
                if (z) {
                    a(context, eVar, vVar, false);
                } else {
                    a(context, eVar, vVar, true);
                }
            case 1:
                if (!z) {
                    a(context, eVar, vVar, true);
                    break;
                } else {
                    a(context, eVar, vVar, false);
                    break;
                }
        }
        setFocusable(true);
    }

    private void a(Context context, e eVar, v vVar, boolean z) {
        Drawable bitmapDrawable;
        Bitmap bitmap;
        int[] iArr;
        setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
        c cVar = eVar.d;
        ImageView imageView = new ImageView(context);
        imageView.setId(1);
        AdImage adImage = vVar.h;
        if (adImage != null) {
            byte[] bArr = adImage.e;
            Bitmap decodeByteArray = BitmapFactory.decodeByteArray(bArr, 0, bArr.length);
            if (decodeByteArray == null) {
                ah.a("FlurryAgent", "Ad with bad image: " + vVar.d + ", data: " + bArr);
            }
            if (decodeByteArray != null) {
                Bitmap createBitmap = Bitmap.createBitmap(decodeByteArray.getWidth(), decodeByteArray.getHeight(), Bitmap.Config.ARGB_8888);
                Canvas canvas = new Canvas(createBitmap);
                Paint paint = new Paint();
                Rect rect = new Rect(0, 0, decodeByteArray.getWidth(), decodeByteArray.getHeight());
                RectF rectF = new RectF(rect);
                float a = r.a(context, 8);
                paint.setAntiAlias(true);
                canvas.drawARGB(0, 0, 0, 0);
                paint.setColor(-16777216);
                canvas.drawRoundRect(rectF, a, a, paint);
                paint.setXfermode(new PorterDuffXfermode(PorterDuff.Mode.SRC_IN));
                canvas.drawBitmap(decodeByteArray, rect, rect, paint);
                if (Integer.parseInt(Build.VERSION.SDK) > 4) {
                    BlurMaskFilter blurMaskFilter = new BlurMaskFilter(3.0f, BlurMaskFilter.Blur.OUTER);
                    Paint paint2 = new Paint();
                    paint2.setMaskFilter(blurMaskFilter);
                    bitmap = createBitmap.extractAlpha(paint2, new int[2]).copy(Bitmap.Config.ARGB_8888, true);
                    new Canvas(bitmap).drawBitmap(createBitmap, -iArr[0], -iArr[1], (Paint) null);
                } else {
                    bitmap = createBitmap;
                }
                imageView.setImageBitmap(bitmap);
                r.a(context, imageView, r.a(context, cVar.m), r.a(context, cVar.n));
                imageView.setScaleType(ImageView.ScaleType.FIT_XY);
            }
        }
        AdImage a2 = this.a.a(cVar.c);
        if (a2 != null) {
            byte[] bArr2 = a2.e;
            Bitmap decodeByteArray2 = BitmapFactory.decodeByteArray(bArr2, 0, bArr2.length);
            if (NinePatch.isNinePatchChunk(decodeByteArray2.getNinePatchChunk())) {
                bitmapDrawable = new NinePatchDrawable(decodeByteArray2, decodeByteArray2.getNinePatchChunk(), new Rect(0, 0, 0, 0), null);
            } else {
                bitmapDrawable = new BitmapDrawable(decodeByteArray2);
            }
            setBackgroundDrawable(bitmapDrawable);
        }
        TextView textView = new TextView(context);
        textView.setId(5);
        textView.setPadding(0, 0, 0, 0);
        TextView textView2 = new TextView(context);
        textView2.setId(3);
        textView2.setPadding(0, 0, 0, 0);
        if (z) {
            textView.setTextColor(cVar.f);
            textView.setTextSize(cVar.e);
            textView.setText(new String("• " + cVar.b));
            textView.setTypeface(Typeface.create(cVar.d, 0));
            textView2.setTextColor(cVar.i);
            textView2.setTextSize(cVar.h);
            textView2.setTypeface(Typeface.create(cVar.g, 0));
            textView2.setText(vVar.d);
        } else {
            textView.setId(3);
            textView.setText(vVar.d);
            textView.setTextColor(cVar.i);
            textView.setTextSize(cVar.h);
            textView.setTypeface(Typeface.create(cVar.g, 0));
            textView2.setId(4);
            textView2.setText(vVar.c);
            textView2.setTextColor(cVar.l);
            textView2.setTextSize(cVar.k);
            textView2.setTypeface(Typeface.create(cVar.j, 0));
        }
        setLayoutParams(new ViewGroup.LayoutParams(-2, -2));
        addView(new ImageView(context), new RelativeLayout.LayoutParams(-1, -2));
        int i = (cVar.q - (cVar.o << 1)) - cVar.m;
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.addRule(9);
        layoutParams.setMargins(cVar.o, cVar.p, i, 0);
        addView(imageView, layoutParams);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams2.addRule(6, imageView.getId());
        layoutParams2.addRule(1, imageView.getId());
        layoutParams2.setMargins(0, 0, 0, 0);
        addView(textView, layoutParams2);
        RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams3.addRule(1, imageView.getId());
        layoutParams3.addRule(3, textView.getId());
        layoutParams3.setMargins(0, -2, 0, 0);
        addView(textView2, layoutParams3);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void a(String str) {
        this.c = str;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final String b(String str) {
        return str + this.c + System.currentTimeMillis();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final p a() {
        return this.b;
    }
}
