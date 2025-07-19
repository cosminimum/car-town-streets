package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.internal.C1407ig;
import java.util.HashSet;
import java.util.Set;

/* renamed from: com.google.android.gms.internal.iq */
public class C1427iq implements Parcelable.Creator<C1407ig.C1417h> {
    /* renamed from: a */
    static void m3896a(C1407ig.C1417h hVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        Set<Integer> fa = hVar.mo8700fa();
        if (fa.contains(1)) {
            C0677b.m1412c(parcel, 1, hVar.getVersionCode());
        }
        if (fa.contains(3)) {
            C0677b.m1412c(parcel, 3, hVar.mo8698fN());
        }
        if (fa.contains(4)) {
            C0677b.m1401a(parcel, 4, hVar.getValue(), true);
        }
        if (fa.contains(5)) {
            C0677b.m1401a(parcel, 5, hVar.getLabel(), true);
        }
        if (fa.contains(6)) {
            C0677b.m1412c(parcel, 6, hVar.getType());
        }
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: aD */
    public C1407ig.C1417h createFromParcel(Parcel parcel) {
        String str = null;
        int i = 0;
        int n = C0675a.m1375n(parcel);
        HashSet hashSet = new HashSet();
        int i2 = 0;
        String str2 = null;
        int i3 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i3 = C0675a.m1367g(parcel, m);
                    hashSet.add(1);
                    break;
                case 3:
                    i = C0675a.m1367g(parcel, m);
                    hashSet.add(3);
                    break;
                case 4:
                    str = C0675a.m1374m(parcel, m);
                    hashSet.add(4);
                    break;
                case 5:
                    str2 = C0675a.m1374m(parcel, m);
                    hashSet.add(5);
                    break;
                case 6:
                    i2 = C0675a.m1367g(parcel, m);
                    hashSet.add(6);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new C1407ig.C1417h(hashSet, i3, str2, i2, str, i);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: bv */
    public C1407ig.C1417h[] newArray(int i) {
        return new C1407ig.C1417h[i];
    }
}
