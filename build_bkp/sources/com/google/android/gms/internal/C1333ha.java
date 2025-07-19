package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.internal.C1336hd;

/* renamed from: com.google.android.gms.internal.ha */
public class C1333ha implements Parcelable.Creator<C1336hd.C1337a> {
    /* renamed from: a */
    static void m3551a(C1336hd.C1337a aVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1401a(parcel, 1, aVar.mo8199eh(), false);
        C0677b.m1412c(parcel, 1000, aVar.f3172kg);
        C0677b.m1401a(parcel, 2, aVar.getTag(), false);
        C0677b.m1401a(parcel, 3, aVar.mo8200ei(), false);
        C0677b.m1412c(parcel, 4, aVar.mo8201ej());
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: am */
    public C1336hd.C1337a createFromParcel(Parcel parcel) {
        int i = 0;
        String str = null;
        int n = C0675a.m1375n(parcel);
        String str2 = null;
        String str3 = null;
        int i2 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    str3 = C0675a.m1374m(parcel, m);
                    break;
                case 2:
                    str2 = C0675a.m1374m(parcel, m);
                    break;
                case 3:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 4:
                    i = C0675a.m1367g(parcel, m);
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
            return new C1336hd.C1337a(i2, str3, str2, str, i);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: bb */
    public C1336hd.C1337a[] newArray(int i) {
        return new C1336hd.C1337a[i];
    }
}
