package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.drive.query.internal.c */
public class C0758c implements Parcelable.Creator<FilterHolder> {
    /* renamed from: a */
    static void m1662a(FilterHolder filterHolder, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1399a(parcel, 1, (Parcelable) filterHolder.f1578rU, i, false);
        C0677b.m1412c(parcel, 1000, filterHolder.f1577kg);
        C0677b.m1399a(parcel, 2, (Parcelable) filterHolder.f1579rV, i, false);
        C0677b.m1399a(parcel, 3, (Parcelable) filterHolder.f1580rW, i, false);
        C0677b.m1399a(parcel, 4, (Parcelable) filterHolder.f1581rX, i, false);
        C0677b.m1399a(parcel, 5, (Parcelable) filterHolder.f1582rY, i, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: T */
    public FilterHolder createFromParcel(Parcel parcel) {
        InFilter inFilter = null;
        int n = C0675a.m1375n(parcel);
        int i = 0;
        NotFilter notFilter = null;
        LogicalFilter logicalFilter = null;
        FieldOnlyFilter fieldOnlyFilter = null;
        ComparisonFilter comparisonFilter = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    comparisonFilter = (ComparisonFilter) C0675a.m1356a(parcel, m, ComparisonFilter.CREATOR);
                    break;
                case 2:
                    fieldOnlyFilter = (FieldOnlyFilter) C0675a.m1356a(parcel, m, FieldOnlyFilter.CREATOR);
                    break;
                case 3:
                    logicalFilter = (LogicalFilter) C0675a.m1356a(parcel, m, LogicalFilter.CREATOR);
                    break;
                case 4:
                    notFilter = (NotFilter) C0675a.m1356a(parcel, m, NotFilter.CREATOR);
                    break;
                case 5:
                    inFilter = (InFilter) C0675a.m1356a(parcel, m, InFilter.CREATOR);
                    break;
                case 1000:
                    i = C0675a.m1367g(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new FilterHolder(i, comparisonFilter, fieldOnlyFilter, logicalFilter, notFilter, inFilter);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: at */
    public FilterHolder[] newArray(int i) {
        return new FilterHolder[i];
    }
}
