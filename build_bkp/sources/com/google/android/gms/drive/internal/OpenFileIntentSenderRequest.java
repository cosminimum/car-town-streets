package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.DriveId;

public class OpenFileIntentSenderRequest implements SafeParcelable {
    public static final Parcelable.Creator<OpenFileIntentSenderRequest> CREATOR = new C0746x();

    /* renamed from: kg */
    final int f1487kg;

    /* renamed from: qL */
    final String f1488qL;

    /* renamed from: qM */
    final DriveId f1489qM;

    /* renamed from: qW */
    final String[] f1490qW;

    OpenFileIntentSenderRequest(int versionCode, String title, String[] mimeTypes, DriveId startFolder) {
        this.f1487kg = versionCode;
        this.f1488qL = title;
        this.f1490qW = mimeTypes;
        this.f1489qM = startFolder;
    }

    public OpenFileIntentSenderRequest(String title, String[] mimeTypes, DriveId startFolder) {
        this(1, title, mimeTypes, startFolder);
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        C0746x.m1594a(this, dest, flags);
    }
}
