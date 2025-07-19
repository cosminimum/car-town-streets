package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.Contents;
/* loaded from: classes.dex */
public class CloseContentsRequest implements SafeParcelable {
    public static final Parcelable.Creator<CloseContentsRequest> CREATOR = new b();
    final int kg;
    final Contents qX;
    final Boolean qY;

    /* JADX INFO: Access modifiers changed from: package-private */
    public CloseContentsRequest(int versionCode, Contents contentsReference, Boolean saveResults) {
        this.kg = versionCode;
        this.qX = contentsReference;
        this.qY = saveResults;
    }

    public CloseContentsRequest(Contents contentsReference, boolean saveResults) {
        this(1, contentsReference, Boolean.valueOf(saveResults));
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        b.a(this, dest, flags);
    }
}
