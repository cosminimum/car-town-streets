package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class OnListEntriesResponse implements SafeParcelable {
    public static final Parcelable.Creator<OnListEntriesResponse> CREATOR = new C0743u();

    /* renamed from: kg */
    final int f1480kg;

    /* renamed from: rz */
    final DataHolder f1481rz;

    OnListEntriesResponse(int versionCode, DataHolder entries) {
        this.f1480kg = versionCode;
        this.f1481rz = entries;
    }

    /* renamed from: cT */
    public DataHolder mo6143cT() {
        return this.f1481rz;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        C0743u.m1585a(this, dest, flags);
    }
}
