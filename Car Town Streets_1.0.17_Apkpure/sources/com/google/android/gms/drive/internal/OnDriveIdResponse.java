package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.DriveId;
/* loaded from: classes.dex */
public class OnDriveIdResponse implements SafeParcelable {
    public static final Parcelable.Creator<OnDriveIdResponse> CREATOR = new t();
    final int kg;
    DriveId rr;

    /* JADX INFO: Access modifiers changed from: package-private */
    public OnDriveIdResponse(int versionCode, DriveId driveId) {
        this.kg = versionCode;
        this.rr = driveId;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public DriveId getDriveId() {
        return this.rr;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        t.a(this, dest, flags);
    }
}
