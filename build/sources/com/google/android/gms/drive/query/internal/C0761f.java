package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import java.util.ArrayList;
import java.util.List;

/* renamed from: com.google.android.gms.drive.query.internal.f */
public class C0761f implements Parcelable.Creator<LogicalFilter> {
    /* renamed from: a */
    static void m1669a(LogicalFilter logicalFilter, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1000, logicalFilter.f1587kg);
        C0677b.m1399a(parcel, 1, (Parcelable) logicalFilter.f1589rR, i, false);
        C0677b.m1411b(parcel, 2, logicalFilter.f1590sb, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: V */
    public LogicalFilter createFromParcel(Parcel parcel) {
        ArrayList<FilterHolder> c;
        Operator operator;
        int i;
        ArrayList<FilterHolder> arrayList = null;
        int n = C0675a.m1375n(parcel);
        int i2 = 0;
        Operator operator2 = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = i2;
                    Operator operator3 = (Operator) C0675a.m1356a(parcel, m, Operator.CREATOR);
                    c = arrayList;
                    operator = operator3;
                    break;
                case 2:
                    c = C0675a.m1362c(parcel, m, FilterHolder.CREATOR);
                    operator = operator2;
                    i = i2;
                    break;
                case 1000:
                    ArrayList<FilterHolder> arrayList2 = arrayList;
                    operator = operator2;
                    i = C0675a.m1367g(parcel, m);
                    c = arrayList2;
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    c = arrayList;
                    operator = operator2;
                    i = i2;
                    break;
            }
            i2 = i;
            operator2 = operator;
            arrayList = c;
        }
        if (parcel.dataPosition() == n) {
            return new LogicalFilter(i2, operator2, (List<FilterHolder>) arrayList);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: av */
    public LogicalFilter[] newArray(int i) {
        return new LogicalFilter[i];
    }
}
