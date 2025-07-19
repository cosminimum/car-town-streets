package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.internal.C1407ig;
import java.util.HashSet;
import java.util.Set;

/* renamed from: com.google.android.gms.internal.ij */
public class C1420ij implements Parcelable.Creator<C1407ig.C1409b> {
    /* renamed from: a */
    static void m3875a(C1407ig.C1409b bVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        Set<Integer> fa = bVar.mo8598fa();
        if (fa.contains(1)) {
            C0677b.m1412c(parcel, 1, bVar.getVersionCode());
        }
        if (fa.contains(2)) {
            C0677b.m1399a(parcel, 2, (Parcelable) bVar.mo8595fE(), i, true);
        }
        if (fa.contains(3)) {
            C0677b.m1399a(parcel, 3, (Parcelable) bVar.mo8596fF(), i, true);
        }
        if (fa.contains(4)) {
            C0677b.m1412c(parcel, 4, bVar.getLayout());
        }
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: aw */
    public C1407ig.C1409b createFromParcel(Parcel parcel) {
        C1407ig.C1409b.C1411b bVar = null;
        int i = 0;
        int n = C0675a.m1375n(parcel);
        HashSet hashSet = new HashSet();
        C1407ig.C1409b.C1410a aVar = null;
        int i2 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i2 = C0675a.m1367g(parcel, m);
                    hashSet.add(1);
                    break;
                case 2:
                    hashSet.add(2);
                    aVar = (C1407ig.C1409b.C1410a) C0675a.m1356a(parcel, m, C1407ig.C1409b.C1410a.CREATOR);
                    break;
                case 3:
                    hashSet.add(3);
                    bVar = (C1407ig.C1409b.C1411b) C0675a.m1356a(parcel, m, C1407ig.C1409b.C1411b.CREATOR);
                    break;
                case 4:
                    i = C0675a.m1367g(parcel, m);
                    hashSet.add(4);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new C1407ig.C1409b(hashSet, i2, aVar, bVar, i);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: bo */
    public C1407ig.C1409b[] newArray(int i) {
        return new C1407ig.C1409b[i];
    }
}
