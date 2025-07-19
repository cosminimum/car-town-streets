package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.internal.C1407ig;
import java.util.HashSet;
import java.util.Set;

/* renamed from: com.google.android.gms.internal.ip */
public class C1426ip implements Parcelable.Creator<C1407ig.C1416g> {
    /* renamed from: a */
    static void m3893a(C1407ig.C1416g gVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        Set<Integer> fa = gVar.mo8688fa();
        if (fa.contains(1)) {
            C0677b.m1412c(parcel, 1, gVar.getVersionCode());
        }
        if (fa.contains(2)) {
            C0677b.m1404a(parcel, 2, gVar.isPrimary());
        }
        if (fa.contains(3)) {
            C0677b.m1401a(parcel, 3, gVar.getValue(), true);
        }
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: aC */
    public C1407ig.C1416g createFromParcel(Parcel parcel) {
        boolean z = false;
        int n = C0675a.m1375n(parcel);
        HashSet hashSet = new HashSet();
        String str = null;
        int i = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    hashSet.add(1);
                    break;
                case 2:
                    z = C0675a.m1363c(parcel, m);
                    hashSet.add(2);
                    break;
                case 3:
                    str = C0675a.m1374m(parcel, m);
                    hashSet.add(3);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new C1407ig.C1416g(hashSet, i, z, str);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: bu */
    public C1407ig.C1416g[] newArray(int i) {
        return new C1407ig.C1416g[i];
    }
}
