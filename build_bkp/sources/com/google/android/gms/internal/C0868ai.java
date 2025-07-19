package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.ads.search.SearchAdRequest;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

/* renamed from: com.google.android.gms.internal.ai */
public final class C0868ai implements SafeParcelable {
    public static final C0869aj CREATOR = new C0869aj();
    public final int backgroundColor;

    /* renamed from: eZ */
    public final int f1941eZ;

    /* renamed from: fa */
    public final int f1942fa;

    /* renamed from: fb */
    public final int f1943fb;

    /* renamed from: fc */
    public final int f1944fc;

    /* renamed from: fd */
    public final int f1945fd;

    /* renamed from: fe */
    public final int f1946fe;

    /* renamed from: ff */
    public final int f1947ff;

    /* renamed from: fg */
    public final String f1948fg;

    /* renamed from: fh */
    public final int f1949fh;

    /* renamed from: fi */
    public final String f1950fi;

    /* renamed from: fj */
    public final int f1951fj;

    /* renamed from: fk */
    public final int f1952fk;

    /* renamed from: fl */
    public final String f1953fl;
    public final int versionCode;

    C0868ai(int i, int i2, int i3, int i4, int i5, int i6, int i7, int i8, int i9, String str, int i10, String str2, int i11, int i12, String str3) {
        this.versionCode = i;
        this.f1941eZ = i2;
        this.backgroundColor = i3;
        this.f1942fa = i4;
        this.f1943fb = i5;
        this.f1944fc = i6;
        this.f1945fd = i7;
        this.f1946fe = i8;
        this.f1947ff = i9;
        this.f1948fg = str;
        this.f1949fh = i10;
        this.f1950fi = str2;
        this.f1951fj = i11;
        this.f1952fk = i12;
        this.f1953fl = str3;
    }

    public C0868ai(SearchAdRequest searchAdRequest) {
        this.versionCode = 1;
        this.f1941eZ = searchAdRequest.getAnchorTextColor();
        this.backgroundColor = searchAdRequest.getBackgroundColor();
        this.f1942fa = searchAdRequest.getBackgroundGradientBottom();
        this.f1943fb = searchAdRequest.getBackgroundGradientTop();
        this.f1944fc = searchAdRequest.getBorderColor();
        this.f1945fd = searchAdRequest.getBorderThickness();
        this.f1946fe = searchAdRequest.getBorderType();
        this.f1947ff = searchAdRequest.getCallButtonColor();
        this.f1948fg = searchAdRequest.getCustomChannels();
        this.f1949fh = searchAdRequest.getDescriptionTextColor();
        this.f1950fi = searchAdRequest.getFontFace();
        this.f1951fj = searchAdRequest.getHeaderTextColor();
        this.f1952fk = searchAdRequest.getHeaderTextSize();
        this.f1953fl = searchAdRequest.getQuery();
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel out, int flags) {
        C0869aj.m1944a(this, out, flags);
    }
}
