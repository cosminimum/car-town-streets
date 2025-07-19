package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;

public class OnMetadataResponse implements SafeParcelable {
    public static final Parcelable.Creator<OnMetadataResponse> CREATOR = new C0744v();

    /* renamed from: kg */
    final int f1482kg;

    /* renamed from: qZ */
    final MetadataBundle f1483qZ;

    OnMetadataResponse(int versionCode, MetadataBundle metadata) {
        this.f1482kg = versionCode;
        this.f1483qZ = metadata;
    }

    /* renamed from: cU */
    public MetadataBundle mo6146cU() {
        return this.f1483qZ;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        C0744v.m1588a(this, dest, flags);
    }
}
