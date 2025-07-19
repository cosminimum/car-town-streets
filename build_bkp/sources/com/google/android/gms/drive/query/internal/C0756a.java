package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;

/* renamed from: com.google.android.gms.drive.query.internal.a */
public class C0756a implements Parcelable.Creator<ComparisonFilter> {
    /* renamed from: a */
    static void m1656a(ComparisonFilter comparisonFilter, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1000, comparisonFilter.f1570kg);
        C0677b.m1399a(parcel, 1, (Parcelable) comparisonFilter.f1571rR, i, false);
        C0677b.m1399a(parcel, 2, (Parcelable) comparisonFilter.f1572rS, i, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: R */
    public ComparisonFilter createFromParcel(Parcel parcel) {
        MetadataBundle metadataBundle;
        Operator operator;
        int i;
        MetadataBundle metadataBundle2 = null;
        int n = C0675a.m1375n(parcel);
        int i2 = 0;
        Operator operator2 = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = i2;
                    Operator operator3 = (Operator) C0675a.m1356a(parcel, m, Operator.CREATOR);
                    metadataBundle = metadataBundle2;
                    operator = operator3;
                    break;
                case 2:
                    metadataBundle = (MetadataBundle) C0675a.m1356a(parcel, m, MetadataBundle.CREATOR);
                    operator = operator2;
                    i = i2;
                    break;
                case 1000:
                    MetadataBundle metadataBundle3 = metadataBundle2;
                    operator = operator2;
                    i = C0675a.m1367g(parcel, m);
                    metadataBundle = metadataBundle3;
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    metadataBundle = metadataBundle2;
                    operator = operator2;
                    i = i2;
                    break;
            }
            i2 = i;
            operator2 = operator;
            metadataBundle2 = metadataBundle;
        }
        if (parcel.dataPosition() == n) {
            return new ComparisonFilter(i2, operator2, metadataBundle2);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: ar */
    public ComparisonFilter[] newArray(int i) {
        return new ComparisonFilter[i];
    }
}
