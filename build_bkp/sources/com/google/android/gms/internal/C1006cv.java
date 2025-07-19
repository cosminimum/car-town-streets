package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.internal.cv */
public class C1006cv implements Parcelable.Creator<C1005cu> {
    /* renamed from: a */
    static void m2219a(C1005cu cuVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, cuVar.versionCode);
        C0677b.m1401a(parcel, 2, cuVar.f2413iJ, false);
        C0677b.m1412c(parcel, 3, cuVar.f2414iK);
        C0677b.m1412c(parcel, 4, cuVar.f2415iL);
        C0677b.m1404a(parcel, 5, cuVar.f2416iM);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: h */
    public C1005cu createFromParcel(Parcel parcel) {
        boolean z = false;
        int n = C0675a.m1375n(parcel);
        String str = null;
        int i = 0;
        int i2 = 0;
        int i3 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i3 = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 3:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                case 4:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 5:
                    z = C0675a.m1363c(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new C1005cu(i3, str, i2, i, z);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: o */
    public C1005cu[] newArray(int i) {
        return new C1005cu[i];
    }
}
