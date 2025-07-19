package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.Contents;

public class CloseContentsRequest implements SafeParcelable {
    public static final Parcelable.Creator<CloseContentsRequest> CREATOR = new b();
    final int kg;
    final Contents qX;
    final Boolean qY;

    CloseContentsRequest(int versionCode, Contents contentsReference, Boolean saveResults) {
        this.kg = versionCode;
        this.qX = contentsReference;
        this.qY = saveResults;
    }

    public CloseContentsRequest(Contents contentsReference, boolean saveResults) {
        this(1, contentsReference, Boolean.valueOf(saveResults));
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        b.a(this, dest, flags);
    }
}
