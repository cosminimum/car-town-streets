package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.internal.C1115es;
import com.google.android.gms.internal.C1120ev;

/* renamed from: com.google.android.gms.internal.eu */
public class C1119eu implements Parcelable.Creator<C1120ev.C1122b> {
    /* renamed from: a */
    static void m2699a(C1120ev.C1122b bVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, bVar.versionCode);
        C0677b.m1401a(parcel, 2, bVar.f2666qw, false);
        C0677b.m1399a(parcel, 3, (Parcelable) bVar.f2667qx, i, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: S */
    public C1120ev.C1122b[] newArray(int i) {
        return new C1120ev.C1122b[i];
    }

    /* renamed from: u */
    public C1120ev.C1122b createFromParcel(Parcel parcel) {
        C1115es.C1116a aVar = null;
        int n = C0675a.m1375n(parcel);
        int i = 0;
        String str = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 3:
                    aVar = (C1115es.C1116a) C0675a.m1356a(parcel, m, C1115es.C1116a.CREATOR);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new C1120ev.C1122b(i, str, aVar);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }
}
