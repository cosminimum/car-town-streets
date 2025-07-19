package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class CreateContentsRequest implements SafeParcelable {
    public static final Parcelable.Creator<CreateContentsRequest> CREATOR = new C0687c();

    /* renamed from: kg */
    final int f1458kg;

    public CreateContentsRequest() {
        this(1);
    }

    CreateContentsRequest(int versionCode) {
        this.f1458kg = versionCode;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        C0687c.m1450a(this, dest, flags);
    }
}
