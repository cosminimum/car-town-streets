package com.google.android.gms.common.images;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.widget.ImageView;
import android.widget.TextView;
import com.google.android.gms.common.images.ImageManager;
import com.google.android.gms.internal.C1060dq;
import com.google.android.gms.internal.C1065dr;
import com.google.android.gms.internal.C1066ds;
import com.google.android.gms.internal.C1098ee;
import com.google.android.gms.internal.C1135fg;
import java.lang.ref.WeakReference;

/* renamed from: com.google.android.gms.common.images.a */
public final class C0672a {

    /* renamed from: op */
    final C0673a f1416op;

    /* renamed from: oq */
    private int f1417oq;

    /* renamed from: or */
    private int f1418or;

    /* renamed from: os */
    int f1419os;

    /* renamed from: ot */
    private int f1420ot;

    /* renamed from: ou */
    private WeakReference<ImageManager.OnImageLoadedListener> f1421ou;

    /* renamed from: ov */
    private WeakReference<ImageView> f1422ov;

    /* renamed from: ow */
    private WeakReference<TextView> f1423ow;

    /* renamed from: ox */
    private int f1424ox;

    /* renamed from: oy */
    private boolean f1425oy;

    /* renamed from: oz */
    private boolean f1426oz;

    /* renamed from: com.google.android.gms.common.images.a$a */
    public static final class C0673a {
        public final Uri uri;

        public C0673a(Uri uri2) {
            this.uri = uri2;
        }

        public boolean equals(Object obj) {
            if (!(obj instanceof C0673a)) {
                return false;
            }
            return this == obj || ((C0673a) obj).hashCode() == hashCode();
        }

        public int hashCode() {
            return C1098ee.hashCode(this.uri);
        }
    }

    public C0672a(int i) {
        this.f1417oq = 0;
        this.f1418or = 0;
        this.f1424ox = -1;
        this.f1425oy = true;
        this.f1426oz = false;
        this.f1416op = new C0673a((Uri) null);
        this.f1418or = i;
    }

    public C0672a(Uri uri) {
        this.f1417oq = 0;
        this.f1418or = 0;
        this.f1424ox = -1;
        this.f1425oy = true;
        this.f1426oz = false;
        this.f1416op = new C0673a(uri);
        this.f1418or = 0;
    }

    /* renamed from: a */
    private C1060dq m1339a(Drawable drawable, Drawable drawable2) {
        if (drawable == null) {
            drawable = null;
        } else if (drawable instanceof C1060dq) {
            drawable = ((C1060dq) drawable).mo7404bC();
        }
        return new C1060dq(drawable, drawable2);
    }

    /* renamed from: a */
    private void m1340a(Drawable drawable, boolean z, boolean z2, boolean z3) {
        ImageManager.OnImageLoadedListener onImageLoadedListener;
        switch (this.f1419os) {
            case 1:
                if (!z2 && (onImageLoadedListener = (ImageManager.OnImageLoadedListener) this.f1421ou.get()) != null) {
                    onImageLoadedListener.onImageLoaded(this.f1416op.uri, drawable, z3);
                    return;
                }
                return;
            case 2:
                ImageView imageView = (ImageView) this.f1422ov.get();
                if (imageView != null) {
                    m1341a(imageView, drawable, z, z2, z3);
                    return;
                }
                return;
            case 3:
                TextView textView = (TextView) this.f1423ow.get();
                if (textView != null) {
                    m1342a(textView, this.f1424ox, drawable, z, z2);
                    return;
                }
                return;
            default:
                return;
        }
    }

    /* renamed from: a */
    private void m1341a(ImageView imageView, Drawable drawable, boolean z, boolean z2, boolean z3) {
        boolean z4 = !z2 && !z3;
        if (z4 && (imageView instanceof C1065dr)) {
            int bE = ((C1065dr) imageView).mo7430bE();
            if (this.f1418or != 0 && bE == this.f1418or) {
                return;
            }
        }
        boolean a = m1343a(z, z2);
        Drawable a2 = a ? m1339a(imageView.getDrawable(), drawable) : drawable;
        imageView.setImageDrawable(a2);
        if (imageView instanceof C1065dr) {
            C1065dr drVar = (C1065dr) imageView;
            drVar.mo7431d(z3 ? this.f1416op.uri : null);
            drVar.mo7429H(z4 ? this.f1418or : 0);
        }
        if (a) {
            ((C1060dq) a2).startTransition(250);
        }
    }

    /* renamed from: a */
    private void m1342a(TextView textView, int i, Drawable drawable, boolean z, boolean z2) {
        boolean a = m1343a(z, z2);
        Drawable[] compoundDrawablesRelative = C1135fg.m2770cI() ? textView.getCompoundDrawablesRelative() : textView.getCompoundDrawables();
        Drawable a2 = a ? m1339a(compoundDrawablesRelative[i], drawable) : drawable;
        Drawable drawable2 = i == 0 ? a2 : compoundDrawablesRelative[0];
        Drawable drawable3 = i == 1 ? a2 : compoundDrawablesRelative[1];
        Drawable drawable4 = i == 2 ? a2 : compoundDrawablesRelative[2];
        Drawable drawable5 = i == 3 ? a2 : compoundDrawablesRelative[3];
        if (C1135fg.m2770cI()) {
            textView.setCompoundDrawablesRelativeWithIntrinsicBounds(drawable2, drawable3, drawable4, drawable5);
        } else {
            textView.setCompoundDrawablesWithIntrinsicBounds(drawable2, drawable3, drawable4, drawable5);
        }
        if (a) {
            ((C1060dq) a2).startTransition(250);
        }
    }

    /* renamed from: a */
    private boolean m1343a(boolean z, boolean z2) {
        return this.f1425oy && !z2 && (!z || this.f1426oz);
    }

    /* renamed from: F */
    public void mo6019F(int i) {
        this.f1418or = i;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public void mo6020a(Context context, Bitmap bitmap, boolean z) {
        C1066ds.m2458d(bitmap);
        m1340a(new BitmapDrawable(context.getResources(), bitmap), z, false, true);
    }

    /* renamed from: a */
    public void mo6021a(ImageView imageView) {
        C1066ds.m2458d(imageView);
        this.f1421ou = null;
        this.f1422ov = new WeakReference<>(imageView);
        this.f1423ow = null;
        this.f1424ox = -1;
        this.f1419os = 2;
        this.f1420ot = imageView.hashCode();
    }

    /* renamed from: a */
    public void mo6022a(ImageManager.OnImageLoadedListener onImageLoadedListener) {
        C1066ds.m2458d(onImageLoadedListener);
        this.f1421ou = new WeakReference<>(onImageLoadedListener);
        this.f1422ov = null;
        this.f1423ow = null;
        this.f1424ox = -1;
        this.f1419os = 1;
        this.f1420ot = C1098ee.hashCode(onImageLoadedListener, this.f1416op);
    }

    /* access modifiers changed from: package-private */
    /* renamed from: b */
    public void mo6023b(Context context, boolean z) {
        Drawable drawable = null;
        if (this.f1418or != 0) {
            drawable = context.getResources().getDrawable(this.f1418or);
        }
        m1340a(drawable, z, false, false);
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof C0672a)) {
            return false;
        }
        return this == obj || ((C0672a) obj).hashCode() == hashCode();
    }

    public int hashCode() {
        return this.f1420ot;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: r */
    public void mo6026r(Context context) {
        Drawable drawable = null;
        if (this.f1417oq != 0) {
            drawable = context.getResources().getDrawable(this.f1417oq);
        }
        m1340a(drawable, false, true, false);
    }
}
