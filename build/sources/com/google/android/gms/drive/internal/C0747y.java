package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.drive.query.Query;

/* renamed from: com.google.android.gms.drive.internal.y */
public class C0747y implements Parcelable.Creator<QueryRequest> {
    /* renamed from: a */
    static void m1597a(QueryRequest queryRequest, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, queryRequest.f1491kg);
        C0677b.m1399a(parcel, 2, (Parcelable) queryRequest.f1492rA, i, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: N */
    public QueryRequest createFromParcel(Parcel parcel) {
        int n = C0675a.m1375n(parcel);
        int i = 0;
        Query query = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    query = (Query) C0675a.m1356a(parcel, m, Query.CREATOR);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new QueryRequest(i, query);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: an */
    public QueryRequest[] newArray(int i) {
        return new QueryRequest[i];
    }
}
