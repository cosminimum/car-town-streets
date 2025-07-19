package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.internal.C1407ig;
import java.util.HashSet;
import java.util.Set;

/* renamed from: com.google.android.gms.internal.il */
public class C1422il implements Parcelable.Creator<C1407ig.C1409b.C1411b> {
    /* renamed from: a */
    static void m3881a(C1407ig.C1409b.C1411b bVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        Set<Integer> fa = bVar.mo8622fa();
        if (fa.contains(1)) {
            C0677b.m1412c(parcel, 1, bVar.getVersionCode());
        }
        if (fa.contains(2)) {
            C0677b.m1412c(parcel, 2, bVar.getHeight());
        }
        if (fa.contains(3)) {
            C0677b.m1401a(parcel, 3, bVar.getUrl(), true);
        }
        if (fa.contains(4)) {
            C0677b.m1412c(parcel, 4, bVar.getWidth());
        }
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: ay */
    public C1407ig.C1409b.C1411b createFromParcel(Parcel parcel) {
        int i = 0;
        int n = C0675a.m1375n(parcel);
        HashSet hashSet = new HashSet();
        String str = null;
        int i2 = 0;
        int i3 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i3 = C0675a.m1367g(parcel, m);
                    hashSet.add(1);
                    break;
                case 2:
                    i2 = C0675a.m1367g(parcel, m);
                    hashSet.add(2);
                    break;
                case 3:
                    str = C0675a.m1374m(parcel, m);
                    hashSet.add(3);
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
            return new C1407ig.C1409b.C1411b(hashSet, i3, i2, str, i);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: bq */
    public C1407ig.C1409b.C1411b[] newArray(int i) {
        return new C1407ig.C1409b.C1411b[i];
    }
}
