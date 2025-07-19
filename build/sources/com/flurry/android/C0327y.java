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

/* renamed from: com.flurry.android.y */
final class C0327y extends RelativeLayout {

    /* renamed from: a */
    private C0323u f658a;

    /* renamed from: b */
    private C0318p f659b;

    /* renamed from: c */
    private String f660c;

    /* renamed from: d */
    private int f661d;

    public C0327y(Context context, C0323u uVar, C0318p pVar, C0307e eVar, int i, boolean z) {
        super(context);
        this.f658a = uVar;
        this.f659b = pVar;
        C0324v vVar = pVar.f610b;
        this.f661d = i;
        switch (this.f661d) {
            case 1:
                break;
            case 2:
                if (!z) {
                    m617a(context, eVar, vVar, true);
                    break;
                } else {
                    m617a(context, eVar, vVar, false);
                    break;
                }
        }
        if (z) {
            m617a(context, eVar, vVar, false);
        } else {
            m617a(context, eVar, vVar, true);
        }
        setFocusable(true);
    }

    /* renamed from: a */
    private void m617a(Context context, C0307e eVar, C0324v vVar, boolean z) {
        Drawable bitmapDrawable;
        Bitmap bitmap;
        setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
        C0305c cVar = eVar.f587d;
        ImageView imageView = new ImageView(context);
        imageView.setId(1);
        AdImage adImage = vVar.f650h;
        if (adImage != null) {
            byte[] bArr = adImage.f408e;
            Bitmap decodeByteArray = BitmapFactory.decodeByteArray(bArr, 0, bArr.length);
            if (decodeByteArray == null) {
                C0299ah.m532a("FlurryAgent", "Ad with bad image: " + vVar.f646d + ", data: " + bArr);
            }
            if (decodeByteArray != null) {
                Bitmap createBitmap = Bitmap.createBitmap(decodeByteArray.getWidth(), decodeByteArray.getHeight(), Bitmap.Config.ARGB_8888);
                Canvas canvas = new Canvas(createBitmap);
                Paint paint = new Paint();
                Rect rect = new Rect(0, 0, decodeByteArray.getWidth(), decodeByteArray.getHeight());
                RectF rectF = new RectF(rect);
                float a = (float) C0320r.m557a(context, 8);
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
                    int[] iArr = new int[2];
                    bitmap = createBitmap.extractAlpha(paint2, iArr).copy(Bitmap.Config.ARGB_8888, true);
                    new Canvas(bitmap).drawBitmap(createBitmap, (float) (-iArr[0]), (float) (-iArr[1]), (Paint) null);
                } else {
                    bitmap = createBitmap;
                }
                imageView.setImageBitmap(bitmap);
                C0320r.m560a(context, imageView, C0320r.m557a(context, cVar.f567m), C0320r.m557a(context, cVar.f568n));
                imageView.setScaleType(ImageView.ScaleType.FIT_XY);
            }
        }
        AdImage a2 = this.f658a.mo2427a(cVar.f557c);
        if (a2 != null) {
            byte[] bArr2 = a2.f408e;
            Bitmap decodeByteArray2 = BitmapFactory.decodeByteArray(bArr2, 0, bArr2.length);
            if (NinePatch.isNinePatchChunk(decodeByteArray2.getNinePatchChunk())) {
                bitmapDrawable = new NinePatchDrawable(decodeByteArray2, decodeByteArray2.getNinePatchChunk(), new Rect(0, 0, 0, 0), (String) null);
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
            textView.setTextColor(cVar.f560f);
            textView.setTextSize((float) cVar.f559e);
            textView.setText(new String("• " + cVar.f556b));
            textView.setTypeface(Typeface.create(cVar.f558d, 0));
            textView2.setTextColor(cVar.f563i);
            textView2.setTextSize((float) cVar.f562h);
            textView2.setTypeface(Typeface.create(cVar.f561g, 0));
            textView2.setText(vVar.f646d);
        } else {
            textView.setId(3);
            textView.setText(vVar.f646d);
            textView.setTextColor(cVar.f563i);
            textView.setTextSize((float) cVar.f562h);
            textView.setTypeface(Typeface.create(cVar.f561g, 0));
            textView2.setId(4);
            textView2.setText(vVar.f645c);
            textView2.setTextColor(cVar.f566l);
            textView2.setTextSize((float) cVar.f565k);
            textView2.setTypeface(Typeface.create(cVar.f564j, 0));
        }
        setLayoutParams(new ViewGroup.LayoutParams(-2, -2));
        addView(new ImageView(context), new RelativeLayout.LayoutParams(-1, -2));
        int i = (cVar.f571q - (cVar.f569o << 1)) - cVar.f567m;
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.addRule(9);
        layoutParams.setMargins(cVar.f569o, cVar.f570p, i, 0);
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

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final void mo2466a(String str) {
        this.f660c = str;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: b */
    public final String mo2467b(String str) {
        return str + this.f660c + System.currentTimeMillis();
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final C0318p mo2465a() {
        return this.f659b;
    }
}
