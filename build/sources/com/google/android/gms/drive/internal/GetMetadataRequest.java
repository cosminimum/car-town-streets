package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.DriveId;

public class GetMetadataRequest implements SafeParcelable {
    public static final Parcelable.Creator<GetMetadataRequest> CREATOR = new C0732n();

    /* renamed from: kg */
    final int f1471kg;

    /* renamed from: rr */
    final DriveId f1472rr;

    GetMetadataRequest(int versionCode, DriveId id) {
        this.f1471kg = versionCode;
        this.f1472rr = id;
    }

    public GetMetadataRequest(DriveId id) {
        this(1, id);
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        C0732n.m1532a(this, dest, flags);
    }
}
