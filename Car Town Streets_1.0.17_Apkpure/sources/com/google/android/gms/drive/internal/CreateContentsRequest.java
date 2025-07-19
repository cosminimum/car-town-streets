package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
/* loaded from: classes.dex */
public class CreateContentsRequest implements SafeParcelable {
    public static final Parcelable.Creator<CreateContentsRequest> CREATOR = new c();
    final int kg;

    public CreateContentsRequest() {
        this(1);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public CreateContentsRequest(int versionCode) {
        this.kg = versionCode;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        c.a(this, dest, flags);
    }
}
