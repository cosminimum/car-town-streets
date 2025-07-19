package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.location.e */
public class C1475e implements Parcelable.Creator<C1474d> {
    /* renamed from: a */
    static void m4098a(C1474d dVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, dVar.f3518xG);
        C0677b.m1412c(parcel, 1000, dVar.getVersionCode());
        C0677b.m1412c(parcel, 2, dVar.f3519xH);
        C0677b.m1395a(parcel, 3, dVar.f3520xI);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: aS */
    public C1474d[] newArray(int i) {
        return new C1474d[i];
    }

    /* renamed from: af */
    public C1474d createFromParcel(Parcel parcel) {
        int i = 1;
        int n = C0675a.m1375n(parcel);
        int i2 = 0;
        long j = 0;
        int i3 = 1;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i3 = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 3:
                    j = C0675a.m1368h(parcel, m);
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
            return new C1474d(i2, i3, i, j);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }
}
