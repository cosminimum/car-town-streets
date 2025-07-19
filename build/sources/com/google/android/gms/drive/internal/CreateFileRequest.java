package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.Contents;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;
import com.google.android.gms.internal.C1102eg;

public class CreateFileRequest implements SafeParcelable {
    public static final Parcelable.Creator<CreateFileRequest> CREATOR = new C0689e();

    /* renamed from: kg */
    final int f1464kg;

    /* renamed from: qX */
    final Contents f1465qX;

    /* renamed from: qZ */
    final MetadataBundle f1466qZ;

    /* renamed from: ra */
    final DriveId f1467ra;

    CreateFileRequest(int versionCode, DriveId parentDriveId, MetadataBundle metadata, Contents contentsReference) {
        this.f1464kg = versionCode;
        this.f1467ra = (DriveId) C1102eg.m2616f(parentDriveId);
        this.f1466qZ = (MetadataBundle) C1102eg.m2616f(metadata);
        this.f1465qX = (Contents) C1102eg.m2616f(contentsReference);
    }

    public CreateFileRequest(DriveId parentDriveId, MetadataBundle metadata, Contents contentsReference) {
        this(1, parentDriveId, metadata, contentsReference);
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        C0689e.m1456a(this, dest, flags);
    }
}
