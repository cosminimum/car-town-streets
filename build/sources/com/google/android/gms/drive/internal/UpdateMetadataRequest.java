package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;

public class UpdateMetadataRequest implements SafeParcelable {
    public static final Parcelable.Creator<UpdateMetadataRequest> CREATOR = new C0685aa();

    /* renamed from: kg */
    final int f1493kg;

    /* renamed from: rB */
    final MetadataBundle f1494rB;

    /* renamed from: rr */
    final DriveId f1495rr;

    UpdateMetadataRequest(int versionCode, DriveId id, MetadataBundle metadataChangeSet) {
        this.f1493kg = versionCode;
        this.f1495rr = id;
        this.f1494rB = metadataChangeSet;
    }

    public UpdateMetadataRequest(DriveId id, MetadataBundle metadataChangeSet) {
        this(1, id, metadataChangeSet);
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        C0685aa.m1444a(this, dest, flags);
    }
}
