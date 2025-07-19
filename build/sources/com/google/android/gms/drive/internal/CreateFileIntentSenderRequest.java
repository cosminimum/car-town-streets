package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;

public class CreateFileIntentSenderRequest implements SafeParcelable {
    public static final Parcelable.Creator<CreateFileIntentSenderRequest> CREATOR = new C0688d();

    /* renamed from: kg */
    final int f1459kg;

    /* renamed from: qE */
    final int f1460qE;

    /* renamed from: qL */
    final String f1461qL;

    /* renamed from: qM */
    final DriveId f1462qM;

    /* renamed from: qZ */
    final MetadataBundle f1463qZ;

    CreateFileIntentSenderRequest(int versionCode, MetadataBundle metadata, int requestId, String title, DriveId startFolder) {
        this.f1459kg = versionCode;
        this.f1463qZ = metadata;
        this.f1460qE = requestId;
        this.f1461qL = title;
        this.f1462qM = startFolder;
    }

    public CreateFileIntentSenderRequest(MetadataBundle metadata, int requestId, String title, DriveId startFolder) {
        this(1, metadata, requestId, title, startFolder);
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        C0688d.m1453a(this, dest, flags);
    }
}
