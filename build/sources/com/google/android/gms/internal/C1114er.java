package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.internal.C1111ep;

/* renamed from: com.google.android.gms.internal.er */
public class C1114er implements Parcelable.Creator<C1111ep.C1112a> {
    /* renamed from: a */
    static void m2655a(C1111ep.C1112a aVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, aVar.versionCode);
        C0677b.m1401a(parcel, 2, aVar.f2648qg, false);
        C0677b.m1412c(parcel, 3, aVar.f2649qh);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: Q */
    public C1111ep.C1112a[] newArray(int i) {
        return new C1111ep.C1112a[i];
    }

    /* renamed from: s */
    public C1111ep.C1112a createFromParcel(Parcel parcel) {
        int i = 0;
        int n = C0675a.m1375n(parcel);
        String str = null;
        int i2 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 3:
                    i = C0675a.m1367g(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new C1111ep.C1112a(i2, str, i);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }
}
