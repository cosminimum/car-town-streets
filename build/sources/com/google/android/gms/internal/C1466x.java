package com.google.android.gms.internal;

import android.content.Context;
import android.os.Parcel;
import android.util.DisplayMetrics;
import com.getjar.sdk.utilities.Constants;
import com.google.android.gms.ads.AdSize;
import com.google.android.gms.ads.C0588a;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

/* renamed from: com.google.android.gms.internal.x */
public final class C1466x implements SafeParcelable {
    public static final C1467y CREATOR = new C1467y();

    /* renamed from: eF */
    public final String f3485eF;

    /* renamed from: eG */
    public final boolean f3486eG;

    /* renamed from: eH */
    public final C1466x[] f3487eH;
    public final int height;
    public final int heightPixels;
    public final int versionCode;
    public final int width;
    public final int widthPixels;

    public C1466x() {
        this(2, "interstitial_mb", 0, 0, true, 0, 0, (C1466x[]) null);
    }

    C1466x(int i, String str, int i2, int i3, boolean z, int i4, int i5, C1466x[] xVarArr) {
        this.versionCode = i;
        this.f3485eF = str;
        this.height = i2;
        this.heightPixels = i3;
        this.f3486eG = z;
        this.width = i4;
        this.widthPixels = i5;
        this.f3487eH = xVarArr;
    }

    public C1466x(Context context, AdSize adSize) {
        this(context, new AdSize[]{adSize});
    }

    public C1466x(Context context, AdSize[] adSizeArr) {
        int i;
        AdSize adSize = adSizeArr[0];
        this.versionCode = 2;
        this.f3486eG = false;
        this.width = adSize.getWidth();
        this.height = adSize.getHeight();
        boolean z = this.width == -1;
        boolean z2 = this.height == -2;
        DisplayMetrics displayMetrics = context.getResources().getDisplayMetrics();
        if (z) {
            this.widthPixels = m4076a(displayMetrics);
            i = (int) (((float) this.widthPixels) / displayMetrics.density);
        } else {
            int i2 = this.width;
            this.widthPixels = C1003cs.m2203a(displayMetrics, this.width);
            i = i2;
        }
        int c = z2 ? m4078c(displayMetrics) : this.height;
        this.heightPixels = C1003cs.m2203a(displayMetrics, c);
        if (z || z2) {
            this.f3485eF = i + Constants.f677X + c + "_as";
        } else {
            this.f3485eF = adSize.toString();
        }
        if (adSizeArr.length > 1) {
            this.f3487eH = new C1466x[adSizeArr.length];
            for (int i3 = 0; i3 < adSizeArr.length; i3++) {
                this.f3487eH[i3] = new C1466x(context, adSizeArr[i3]);
            }
            return;
        }
        this.f3487eH = null;
    }

    public C1466x(C1466x xVar, C1466x[] xVarArr) {
        this(2, xVar.f3485eF, xVar.height, xVar.heightPixels, xVar.f3486eG, xVar.width, xVar.widthPixels, xVarArr);
    }

    /* renamed from: a */
    public static int m4076a(DisplayMetrics displayMetrics) {
        return displayMetrics.widthPixels;
    }

    /* renamed from: b */
    public static int m4077b(DisplayMetrics displayMetrics) {
        return (int) (((float) m4078c(displayMetrics)) * displayMetrics.density);
    }

    /* renamed from: c */
    private static int m4078c(DisplayMetrics displayMetrics) {
        int i = (int) (((float) displayMetrics.heightPixels) / displayMetrics.density);
        if (i <= 400) {
            return 32;
        }
        return i <= 720 ? 50 : 90;
    }

    /* renamed from: P */
    public AdSize mo8835P() {
        return C0588a.m1080a(this.width, this.height, this.f3485eF);
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel out, int flags) {
        C1467y.m4080a(this, out, flags);
    }
}
