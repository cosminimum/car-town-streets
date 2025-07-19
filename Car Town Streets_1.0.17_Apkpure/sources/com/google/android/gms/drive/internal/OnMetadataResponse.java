package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;
/* loaded from: classes.dex */
public class OnMetadataResponse implements SafeParcelable {
    public static final Parcelable.Creator<OnMetadataResponse> CREATOR = new v();
    final int kg;
    final MetadataBundle qZ;

    /* JADX INFO: Access modifiers changed from: package-private */
    public OnMetadataResponse(int versionCode, MetadataBundle metadata) {
        this.kg = versionCode;
        this.qZ = metadata;
    }

    public MetadataBundle cU() {
        return this.qZ;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        v.a(this, dest, flags);
    }
}
