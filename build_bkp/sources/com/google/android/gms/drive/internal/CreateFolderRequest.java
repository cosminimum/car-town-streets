package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;
import com.google.android.gms.internal.C1102eg;

public class CreateFolderRequest implements SafeParcelable {
    public static final Parcelable.Creator<CreateFolderRequest> CREATOR = new C0690f();

    /* renamed from: kg */
    final int f1468kg;

    /* renamed from: qZ */
    final MetadataBundle f1469qZ;

    /* renamed from: ra */
    final DriveId f1470ra;

    CreateFolderRequest(int versionCode, DriveId parentDriveId, MetadataBundle metadata) {
        this.f1468kg = versionCode;
        this.f1470ra = (DriveId) C1102eg.m2616f(parentDriveId);
        this.f1469qZ = (MetadataBundle) C1102eg.m2616f(metadata);
    }

    public CreateFolderRequest(DriveId parentDriveId, MetadataBundle metadata) {
        this(1, parentDriveId, metadata);
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        C0690f.m1459a(this, dest, flags);
    }
}
