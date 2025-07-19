package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
/* loaded from: classes.dex */
public class OnDownloadProgressResponse implements SafeParcelable {
    public static final Parcelable.Creator<OnDownloadProgressResponse> CREATOR = new s();
    final int kg;
    final long rx;
    final long ry;

    /* JADX INFO: Access modifiers changed from: package-private */
    public OnDownloadProgressResponse(int versionCode, long bytesLoaded, long bytesExpected) {
        this.kg = versionCode;
        this.rx = bytesLoaded;
        this.ry = bytesExpected;
    }

    public long cR() {
        return this.rx;
    }

    public long cS() {
        return this.ry;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        s.a(this, dest, flags);
    }
}
