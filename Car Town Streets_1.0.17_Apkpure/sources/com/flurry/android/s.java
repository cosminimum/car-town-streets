package com.flurry.android;

import android.content.Context;
import android.graphics.BitmapFactory;
import android.widget.ImageView;
import android.widget.LinearLayout;
/* loaded from: classes.dex */
final class s extends LinearLayout {
    public s(CatalogActivity catalogActivity, Context context) {
        super(context);
        u uVar;
        setBackgroundColor(-1);
        uVar = catalogActivity.e;
        AdImage m = uVar.m();
        if (m != null) {
            ImageView imageView = new ImageView(context);
            imageView.setId(10000);
            byte[] bArr = m.e;
            if (bArr != null) {
                imageView.setImageBitmap(BitmapFactory.decodeByteArray(bArr, 0, bArr.length));
            }
            r.a(context, imageView, r.a(context, m.b), r.a(context, m.c));
            LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, -2);
            layoutParams.setMargins(0, 0, 0, -3);
            setGravity(3);
            addView(imageView, layoutParams);
        }
    }
}
