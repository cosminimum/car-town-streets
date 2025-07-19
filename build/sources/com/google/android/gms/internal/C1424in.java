package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.internal.C1407ig;
import java.util.HashSet;
import java.util.Set;

/* renamed from: com.google.android.gms.internal.in */
public class C1424in implements Parcelable.Creator<C1407ig.C1413d> {
    /* renamed from: a */
    static void m3887a(C1407ig.C1413d dVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        Set<Integer> fa = dVar.mo8644fa();
        if (fa.contains(1)) {
            C0677b.m1412c(parcel, 1, dVar.getVersionCode());
        }
        if (fa.contains(2)) {
            C0677b.m1401a(parcel, 2, dVar.getFamilyName(), true);
        }
        if (fa.contains(3)) {
            C0677b.m1401a(parcel, 3, dVar.getFormatted(), true);
        }
        if (fa.contains(4)) {
            C0677b.m1401a(parcel, 4, dVar.getGivenName(), true);
        }
        if (fa.contains(5)) {
            C0677b.m1401a(parcel, 5, dVar.getHonorificPrefix(), true);
        }
        if (fa.contains(6)) {
            C0677b.m1401a(parcel, 6, dVar.getHonorificSuffix(), true);
        }
        if (fa.contains(7)) {
            C0677b.m1401a(parcel, 7, dVar.getMiddleName(), true);
        }
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: aA */
    public C1407ig.C1413d createFromParcel(Parcel parcel) {
        String str = null;
        int n = C0675a.m1375n(parcel);
        HashSet hashSet = new HashSet();
        int i = 0;
        String str2 = null;
        String str3 = null;
        String str4 = null;
        String str5 = null;
        String str6 = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    hashSet.add(1);
                    break;
                case 2:
                    str6 = C0675a.m1374m(parcel, m);
                    hashSet.add(2);
                    break;
                case 3:
                    str5 = C0675a.m1374m(parcel, m);
                    hashSet.add(3);
                    break;
                case 4:
                    str4 = C0675a.m1374m(parcel, m);
                    hashSet.add(4);
                    break;
                case 5:
                    str3 = C0675a.m1374m(parcel, m);
                    hashSet.add(5);
                    break;
                case 6:
                    str2 = C0675a.m1374m(parcel, m);
                    hashSet.add(6);
                    break;
                case 7:
                    str = C0675a.m1374m(parcel, m);
                    hashSet.add(7);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new C1407ig.C1413d(hashSet, i, str6, str5, str4, str3, str2, str);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: bs */
    public C1407ig.C1413d[] newArray(int i) {
        return new C1407ig.C1413d[i];
    }
}
