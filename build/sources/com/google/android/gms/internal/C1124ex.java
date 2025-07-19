package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.internal.C1120ev;
import java.util.ArrayList;

/* renamed from: com.google.android.gms.internal.ex */
public class C1124ex implements Parcelable.Creator<C1120ev.C1121a> {
    /* renamed from: a */
    static void m2715a(C1120ev.C1121a aVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, aVar.versionCode);
        C0677b.m1401a(parcel, 2, aVar.className, false);
        C0677b.m1411b(parcel, 3, aVar.f2665qv, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: U */
    public C1120ev.C1121a[] newArray(int i) {
        return new C1120ev.C1121a[i];
    }

    /* renamed from: w */
    public C1120ev.C1121a createFromParcel(Parcel parcel) {
        ArrayList arrayList = null;
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
                    arrayList = C0675a.m1362c(parcel, m, C1120ev.C1122b.CREATOR);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new C1120ev.C1121a(i, str, arrayList);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }
}
