package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.query.Query;

public class QueryRequest implements SafeParcelable {
    public static final Parcelable.Creator<QueryRequest> CREATOR = new C0747y();

    /* renamed from: kg */
    final int f1491kg;

    /* renamed from: rA */
    final Query f1492rA;

    QueryRequest(int versionCode, Query query) {
        this.f1491kg = versionCode;
        this.f1492rA = query;
    }

    public QueryRequest(Query query) {
        this(1, query);
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        C0747y.m1597a(this, dest, flags);
    }
}
