package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

/* renamed from: com.google.android.gms.internal.cu */
public final class C1005cu implements SafeParcelable {
    public static final C1006cv CREATOR = new C1006cv();

    /* renamed from: iJ */
    public String f2413iJ;

    /* renamed from: iK */
    public int f2414iK;

    /* renamed from: iL */
    public int f2415iL;

    /* renamed from: iM */
    public boolean f2416iM;
    public final int versionCode;

    /* JADX INFO: this call moved to the top of the method (can break code semantics) */
    public C1005cu(int i, int i2, boolean z) {
        this(1, "afma-sdk-a-v" + i + "." + i2 + "." + (z ? "0" : "1"), i, i2, z);
    }

    C1005cu(int i, String str, int i2, int i3, boolean z) {
        this.versionCode = i;
        this.f2413iJ = str;
        this.f2414iK = i2;
        this.f2415iL = i3;
        this.f2416iM = z;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel out, int flags) {
        C1006cv.m2219a(this, out, flags);
    }
}
