package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.DriveId;
/* loaded from: classes.dex */
public class OpenContentsRequest implements SafeParcelable {
    public static final Parcelable.Creator<OpenContentsRequest> CREATOR = new w();
    final int kg;
    final int qF;
    final DriveId rr;

    /* JADX INFO: Access modifiers changed from: package-private */
    public OpenContentsRequest(int versionCode, DriveId id, int mode) {
        this.kg = versionCode;
        this.rr = id;
        this.qF = mode;
    }

    public OpenContentsRequest(DriveId id, int mode) {
        this(1, id, mode);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        w.a(this, dest, flags);
    }
}
