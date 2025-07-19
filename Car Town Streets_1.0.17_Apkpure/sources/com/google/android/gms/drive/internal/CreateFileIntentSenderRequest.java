package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;
/* loaded from: classes.dex */
public class CreateFileIntentSenderRequest implements SafeParcelable {
    public static final Parcelable.Creator<CreateFileIntentSenderRequest> CREATOR = new d();
    final int kg;
    final int qE;
    final String qL;
    final DriveId qM;
    final MetadataBundle qZ;

    /* JADX INFO: Access modifiers changed from: package-private */
    public CreateFileIntentSenderRequest(int versionCode, MetadataBundle metadata, int requestId, String title, DriveId startFolder) {
        this.kg = versionCode;
        this.qZ = metadata;
        this.qE = requestId;
        this.qL = title;
        this.qM = startFolder;
    }

    public CreateFileIntentSenderRequest(MetadataBundle metadata, int requestId, String title, DriveId startFolder) {
        this(1, metadata, requestId, title, startFolder);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        d.a(this, dest, flags);
    }
}
