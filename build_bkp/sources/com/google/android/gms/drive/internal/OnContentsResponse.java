package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.Contents;

public class OnContentsResponse implements SafeParcelable {
    public static final Parcelable.Creator<OnContentsResponse> CREATOR = new C0740r();

    /* renamed from: kg */
    final int f1473kg;

    /* renamed from: qK */
    final Contents f1474qK;

    OnContentsResponse(int versionCode, Contents contents) {
        this.f1473kg = versionCode;
        this.f1474qK = contents;
    }

    /* renamed from: cQ */
    public Contents mo6133cQ() {
        return this.f1474qK;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        C0740r.m1576a(this, dest, flags);
    }
}
