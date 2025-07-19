package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.DriveId;

public class OpenContentsRequest implements SafeParcelable {
    public static final Parcelable.Creator<OpenContentsRequest> CREATOR = new C0745w();

    /* renamed from: kg */
    final int f1484kg;

    /* renamed from: qF */
    final int f1485qF;

    /* renamed from: rr */
    final DriveId f1486rr;

    OpenContentsRequest(int versionCode, DriveId id, int mode) {
        this.f1484kg = versionCode;
        this.f1486rr = id;
        this.f1485qF = mode;
    }

    public OpenContentsRequest(DriveId id, int mode) {
        this(1, id, mode);
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        C0745w.m1591a(this, dest, flags);
    }
}
