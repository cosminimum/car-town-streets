package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.internal.C1115es;

/* renamed from: com.google.android.gms.internal.et */
public class C1118et implements Parcelable.Creator<C1115es.C1116a> {
    /* renamed from: a */
    static void m2696a(C1115es.C1116a aVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, aVar.getVersionCode());
        C0677b.m1412c(parcel, 2, aVar.mo7609ch());
        C0677b.m1404a(parcel, 3, aVar.mo7612cn());
        C0677b.m1412c(parcel, 4, aVar.mo7610ci());
        C0677b.m1404a(parcel, 5, aVar.mo7613co());
        C0677b.m1401a(parcel, 6, aVar.mo7614cp(), false);
        C0677b.m1412c(parcel, 7, aVar.mo7615cq());
        C0677b.m1401a(parcel, 8, aVar.mo7617cs(), false);
        C0677b.m1399a(parcel, 9, (Parcelable) aVar.mo7619cu(), i, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: R */
    public C1115es.C1116a[] newArray(int i) {
        return new C1115es.C1116a[i];
    }

    /* renamed from: t */
    public C1115es.C1116a createFromParcel(Parcel parcel) {
        C1109en enVar = null;
        int i = 0;
        int n = C0675a.m1375n(parcel);
        String str = null;
        String str2 = null;
        boolean z = false;
        int i2 = 0;
        boolean z2 = false;
        int i3 = 0;
        int i4 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i4 = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    i3 = C0675a.m1367g(parcel, m);
                    break;
                case 3:
                    z2 = C0675a.m1363c(parcel, m);
                    break;
                case 4:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                case 5:
                    z = C0675a.m1363c(parcel, m);
                    break;
                case 6:
                    str2 = C0675a.m1374m(parcel, m);
                    break;
                case 7:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 8:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 9:
                    enVar = (C1109en) C0675a.m1356a(parcel, m, C1109en.CREATOR);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new C1115es.C1116a(i4, i3, z2, i2, z, str2, i, str, enVar);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }
}
