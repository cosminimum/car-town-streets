package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.internal.hw */
public class C1379hw implements Parcelable.Creator<C1377hu> {
    /* renamed from: a */
    static void m3714a(C1377hu huVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1401a(parcel, 1, huVar.getAccountName(), false);
        C0677b.m1412c(parcel, 1000, huVar.getVersionCode());
        C0677b.m1408a(parcel, 2, huVar.mo8312eR(), false);
        C0677b.m1408a(parcel, 3, huVar.mo8313eS(), false);
        C0677b.m1408a(parcel, 4, huVar.mo8314eT(), false);
        C0677b.m1401a(parcel, 5, huVar.mo8315eU(), false);
        C0677b.m1401a(parcel, 6, huVar.mo8316eV(), false);
        C0677b.m1401a(parcel, 7, huVar.mo8317eW(), false);
        C0677b.m1401a(parcel, 8, huVar.mo8318eX(), false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: ar */
    public C1377hu createFromParcel(Parcel parcel) {
        String str = null;
        int n = C0675a.m1375n(parcel);
        int i = 0;
        String str2 = null;
        String str3 = null;
        String str4 = null;
        String[] strArr = null;
        String[] strArr2 = null;
        String[] strArr3 = null;
        String str5 = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    str5 = C0675a.m1374m(parcel, m);
                    break;
                case 2:
                    strArr3 = C0675a.m1386x(parcel, m);
                    break;
                case 3:
                    strArr2 = C0675a.m1386x(parcel, m);
                    break;
                case 4:
                    strArr = C0675a.m1386x(parcel, m);
                    break;
                case 5:
                    str4 = C0675a.m1374m(parcel, m);
                    break;
                case 6:
                    str3 = C0675a.m1374m(parcel, m);
                    break;
                case 7:
                    str2 = C0675a.m1374m(parcel, m);
                    break;
                case 8:
                    str = C0675a.m1374m(parcel, m);
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
            return new C1377hu(i, str5, strArr3, strArr2, strArr, str4, str3, str2, str);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: bj */
    public C1377hu[] newArray(int i) {
        return new C1377hu[i];
    }
}
