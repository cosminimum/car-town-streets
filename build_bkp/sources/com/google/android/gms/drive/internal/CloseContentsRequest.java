package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.Contents;

public class CloseContentsRequest implements SafeParcelable {
    public static final Parcelable.Creator<CloseContentsRequest> CREATOR = new C0686b();

    /* renamed from: kg */
    final int f1455kg;

    /* renamed from: qX */
    final Contents f1456qX;

    /* renamed from: qY */
    final Boolean f1457qY;

    CloseContentsRequest(int versionCode, Contents contentsReference, Boolean saveResults) {
        this.f1455kg = versionCode;
        this.f1456qX = contentsReference;
        this.f1457qY = saveResults;
    }

    public CloseContentsRequest(Contents contentsReference, boolean saveResults) {
        this(1, contentsReference, Boolean.valueOf(saveResults));
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        C0686b.m1447a(this, dest, flags);
    }
}
