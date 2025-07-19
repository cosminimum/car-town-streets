package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class OnListEntriesResponse implements SafeParcelable {
    public static final Parcelable.Creator<OnListEntriesResponse> CREATOR = new u();
    final int kg;
    final DataHolder rz;

    OnListEntriesResponse(int versionCode, DataHolder entries) {
        this.kg = versionCode;
        this.rz = entries;
    }

    public DataHolder cT() {
        return this.rz;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        u.a(this, dest, flags);
    }
}
