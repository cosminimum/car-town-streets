package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
/* loaded from: classes.dex */
public class OnListEntriesResponse implements SafeParcelable {
    public static final Parcelable.Creator<OnListEntriesResponse> CREATOR = new u();
    final int kg;
    final DataHolder rz;

    /* JADX INFO: Access modifiers changed from: package-private */
    public OnListEntriesResponse(int versionCode, DataHolder entries) {
        this.kg = versionCode;
        this.rz = entries;
    }

    public DataHolder cT() {
        return this.rz;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        u.a(this, dest, flags);
    }
}
