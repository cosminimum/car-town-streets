package com.google.android.gms.drive.query;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.drive.query.internal.LogicalFilter;

/* renamed from: com.google.android.gms.drive.query.a */
public class C0755a implements Parcelable.Creator<Query> {
    /* renamed from: a */
    static void m1653a(Query query, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1000, query.f1564kg);
        C0677b.m1399a(parcel, 1, (Parcelable) query.f1565rO, i, false);
        C0677b.m1401a(parcel, 3, query.f1566rP, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: Q */
    public Query createFromParcel(Parcel parcel) {
        String m;
        LogicalFilter logicalFilter;
        int i;
        String str = null;
        int n = C0675a.m1375n(parcel);
        int i2 = 0;
        LogicalFilter logicalFilter2 = null;
        while (parcel.dataPosition() < n) {
            int m2 = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m2)) {
                case 1:
                    i = i2;
                    LogicalFilter logicalFilter3 = (LogicalFilter) C0675a.m1356a(parcel, m2, LogicalFilter.CREATOR);
                    m = str;
                    logicalFilter = logicalFilter3;
                    break;
                case 3:
                    m = C0675a.m1374m(parcel, m2);
                    logicalFilter = logicalFilter2;
                    i = i2;
                    break;
                case 1000:
                    String str2 = str;
                    logicalFilter = logicalFilter2;
                    i = C0675a.m1367g(parcel, m2);
                    m = str2;
                    break;
                default:
                    C0675a.m1360b(parcel, m2);
                    m = str;
                    logicalFilter = logicalFilter2;
                    i = i2;
                    break;
            }
            i2 = i;
            logicalFilter2 = logicalFilter;
            str = m;
        }
        if (parcel.dataPosition() == n) {
            return new Query(i2, logicalFilter2, str);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: aq */
    public Query[] newArray(int i) {
        return new Query[i];
    }
}
