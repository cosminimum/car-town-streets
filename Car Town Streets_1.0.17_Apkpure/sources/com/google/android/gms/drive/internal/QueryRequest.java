package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.query.Query;
/* loaded from: classes.dex */
public class QueryRequest implements SafeParcelable {
    public static final Parcelable.Creator<QueryRequest> CREATOR = new y();
    final int kg;
    final Query rA;

    /* JADX INFO: Access modifiers changed from: package-private */
    public QueryRequest(int versionCode, Query query) {
        this.kg = versionCode;
        this.rA = query;
    }

    public QueryRequest(Query query) {
        this(1, query);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        y.a(this, dest, flags);
    }
}
