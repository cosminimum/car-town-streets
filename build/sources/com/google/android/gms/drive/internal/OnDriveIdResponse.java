package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.DriveId;

public class OnDriveIdResponse implements SafeParcelable {
    public static final Parcelable.Creator<OnDriveIdResponse> CREATOR = new C0742t();

    /* renamed from: kg */
    final int f1478kg;

    /* renamed from: rr */
    DriveId f1479rr;

    OnDriveIdResponse(int versionCode, DriveId driveId) {
        this.f1478kg = versionCode;
        this.f1479rr = driveId;
    }

    public int describeContents() {
        return 0;
    }

    public DriveId getDriveId() {
        return this.f1479rr;
    }

    public void writeToParcel(Parcel dest, int flags) {
        C0742t.m1582a(this, dest, flags);
    }
}
