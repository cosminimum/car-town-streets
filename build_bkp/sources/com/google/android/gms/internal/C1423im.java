package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.internal.C1407ig;
import java.util.HashSet;
import java.util.Set;

/* renamed from: com.google.android.gms.internal.im */
public class C1423im implements Parcelable.Creator<C1407ig.C1412c> {
    /* renamed from: a */
    static void m3884a(C1407ig.C1412c cVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        Set<Integer> fa = cVar.mo8635fa();
        if (fa.contains(1)) {
            C0677b.m1412c(parcel, 1, cVar.getVersionCode());
        }
        if (fa.contains(2)) {
            C0677b.m1401a(parcel, 2, cVar.getUrl(), true);
        }
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: az */
    public C1407ig.C1412c createFromParcel(Parcel parcel) {
        int n = C0675a.m1375n(parcel);
        HashSet hashSet = new HashSet();
        int i = 0;
        String str = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    hashSet.add(1);
                    break;
                case 2:
                    str = C0675a.m1374m(parcel, m);
                    hashSet.add(2);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new C1407ig.C1412c(hashSet, i, str);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: br */
    public C1407ig.C1412c[] newArray(int i) {
        return new C1407ig.C1412c[i];
    }
}
