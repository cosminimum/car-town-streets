package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.Contents;
/* loaded from: classes.dex */
public class OnContentsResponse implements SafeParcelable {
    public static final Parcelable.Creator<OnContentsResponse> CREATOR = new r();
    final int kg;
    final Contents qK;

    /* JADX INFO: Access modifiers changed from: package-private */
    public OnContentsResponse(int versionCode, Contents contents) {
        this.kg = versionCode;
        this.qK = contents;
    }

    public Contents cQ() {
        return this.qK;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        r.a(this, dest, flags);
    }
}
