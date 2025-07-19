package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class OnDownloadProgressResponse implements SafeParcelable {
    public static final Parcelable.Creator<OnDownloadProgressResponse> CREATOR = new C0741s();

    /* renamed from: kg */
    final int f1475kg;

    /* renamed from: rx */
    final long f1476rx;

    /* renamed from: ry */
    final long f1477ry;

    OnDownloadProgressResponse(int versionCode, long bytesLoaded, long bytesExpected) {
        this.f1475kg = versionCode;
        this.f1476rx = bytesLoaded;
        this.f1477ry = bytesExpected;
    }

    /* renamed from: cR */
    public long mo6136cR() {
        return this.f1476rx;
    }

    /* renamed from: cS */
    public long mo6137cS() {
        return this.f1477ry;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        C0741s.m1579a(this, dest, flags);
    }
}
