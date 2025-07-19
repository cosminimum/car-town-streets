package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import java.util.ArrayList;

/* renamed from: com.google.android.gms.internal.gu */
public class C1324gu implements Parcelable.Creator<C1323gt> {
    /* renamed from: a */
    static void m3530a(C1323gt gtVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, gtVar.mo8123dO());
        C0677b.m1412c(parcel, 1000, gtVar.f3003kg);
        C0677b.m1411b(parcel, 2, gtVar.f3005yg, false);
        C0677b.m1401a(parcel, 3, gtVar.mo8124dP(), false);
        C0677b.m1401a(parcel, 4, gtVar.mo8125dQ(), false);
        C0677b.m1404a(parcel, 5, gtVar.mo8126dR());
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: aY */
    public C1323gt[] newArray(int i) {
        return new C1323gt[i];
    }

    /* renamed from: aj */
    public C1323gt createFromParcel(Parcel parcel) {
        String str = null;
        boolean z = false;
        int n = C0675a.m1375n(parcel);
        String str2 = null;
        ArrayList arrayList = null;
        int i = 0;
        int i2 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    arrayList = C0675a.m1362c(parcel, m, C1327gx.CREATOR);
                    break;
                case 3:
                    str2 = C0675a.m1374m(parcel, m);
                    break;
                case 4:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 5:
                    z = C0675a.m1363c(parcel, m);
                    break;
                case 1000:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new C1323gt(i2, i, arrayList, str2, str, z);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }
}
