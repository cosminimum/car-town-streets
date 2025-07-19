package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

/* renamed from: com.google.android.gms.internal.bj */
public final class C0938bj implements SafeParcelable {
    public static final C0937bi CREATOR = new C0937bi();

    /* renamed from: gn */
    public final String f2234gn;

    /* renamed from: go */
    public final String f2235go;

    /* renamed from: gp */
    public final String f2236gp;

    /* renamed from: gq */
    public final String f2237gq;

    /* renamed from: gr */
    public final String f2238gr;
    public final String mimeType;
    public final String packageName;
    public final int versionCode;

    public C0938bj(int i, String str, String str2, String str3, String str4, String str5, String str6, String str7) {
        this.versionCode = i;
        this.f2234gn = str;
        this.f2235go = str2;
        this.mimeType = str3;
        this.packageName = str4;
        this.f2236gp = str5;
        this.f2237gq = str6;
        this.f2238gr = str7;
    }

    public C0938bj(String str, String str2, String str3, String str4, String str5, String str6, String str7) {
        this(1, str, str2, str3, str4, str5, str6, str7);
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel out, int flags) {
        C0937bi.m2032a(this, out, flags);
    }
}
