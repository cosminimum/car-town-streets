package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.DriveId;
/* loaded from: classes.dex */
public class GetMetadataRequest implements SafeParcelable {
    public static final Parcelable.Creator<GetMetadataRequest> CREATOR = new n();
    final int kg;
    final DriveId rr;

    /* JADX INFO: Access modifiers changed from: package-private */
    public GetMetadataRequest(int versionCode, DriveId id) {
        this.kg = versionCode;
        this.rr = id;
    }

    public GetMetadataRequest(DriveId id) {
        this(1, id);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        n.a(this, dest, flags);
    }
}
