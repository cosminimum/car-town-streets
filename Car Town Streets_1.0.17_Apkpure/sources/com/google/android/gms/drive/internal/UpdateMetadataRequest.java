package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;
/* loaded from: classes.dex */
public class UpdateMetadataRequest implements SafeParcelable {
    public static final Parcelable.Creator<UpdateMetadataRequest> CREATOR = new aa();
    final int kg;
    final MetadataBundle rB;
    final DriveId rr;

    /* JADX INFO: Access modifiers changed from: package-private */
    public UpdateMetadataRequest(int versionCode, DriveId id, MetadataBundle metadataChangeSet) {
        this.kg = versionCode;
        this.rr = id;
        this.rB = metadataChangeSet;
    }

    public UpdateMetadataRequest(DriveId id, MetadataBundle metadataChangeSet) {
        this(1, id, metadataChangeSet);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        aa.a(this, dest, flags);
    }
}
