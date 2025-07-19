package com.flurry.android;

import android.content.Context;
import android.graphics.BitmapFactory;
import android.widget.ImageView;
import android.widget.LinearLayout;

/* renamed from: com.flurry.android.s */
final class C0321s extends LinearLayout {
    public C0321s(CatalogActivity catalogActivity, Context context) {
        super(context);
        setBackgroundColor(-1);
        AdImage m = catalogActivity.f416e.mo2455m();
        if (m != null) {
            ImageView imageView = new ImageView(context);
            imageView.setId(10000);
            byte[] bArr = m.f408e;
            if (bArr != null) {
                imageView.setImageBitmap(BitmapFactory.decodeByteArray(bArr, 0, bArr.length));
            }
            C0320r.m560a(context, imageView, C0320r.m557a(context, m.f405b), C0320r.m557a(context, m.f406c));
            LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, -2);
            layoutParams.setMargins(0, 0, 0, -3);
            setGravity(3);
            addView(imageView, layoutParams);
        }
    }
}
