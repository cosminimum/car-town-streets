package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
/* loaded from: classes.dex */
public final class cu implements SafeParcelable {
    public static final cv CREATOR = new cv();
    public String iJ;
    public int iK;
    public int iL;
    public boolean iM;
    public final int versionCode;

    public cu(int i, int i2, boolean z) {
        this(1, "afma-sdk-a-v" + i + "." + i2 + "." + (z ? "0" : "1"), i, i2, z);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public cu(int i, String str, int i2, int i3, boolean z) {
        this.versionCode = i;
        this.iJ = str;
        this.iK = i2;
        this.iL = i3;
        this.iM = z;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel out, int flags) {
        cv.a(this, out, flags);
    }
}
