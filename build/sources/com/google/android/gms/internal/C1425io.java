package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.internal.C1407ig;
import java.util.HashSet;
import java.util.Set;

/* renamed from: com.google.android.gms.internal.io */
public class C1425io implements Parcelable.Creator<C1407ig.C1415f> {
    /* renamed from: a */
    static void m3890a(C1407ig.C1415f fVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        Set<Integer> fa = fVar.mo8663fa();
        if (fa.contains(1)) {
            C0677b.m1412c(parcel, 1, fVar.getVersionCode());
        }
        if (fa.contains(2)) {
            C0677b.m1401a(parcel, 2, fVar.getDepartment(), true);
        }
        if (fa.contains(3)) {
            C0677b.m1401a(parcel, 3, fVar.getDescription(), true);
        }
        if (fa.contains(4)) {
            C0677b.m1401a(parcel, 4, fVar.getEndDate(), true);
        }
        if (fa.contains(5)) {
            C0677b.m1401a(parcel, 5, fVar.getLocation(), true);
        }
        if (fa.contains(6)) {
            C0677b.m1401a(parcel, 6, fVar.getName(), true);
        }
        if (fa.contains(7)) {
            C0677b.m1404a(parcel, 7, fVar.isPrimary());
        }
        if (fa.contains(8)) {
            C0677b.m1401a(parcel, 8, fVar.getStartDate(), true);
        }
        if (fa.contains(9)) {
            C0677b.m1401a(parcel, 9, fVar.getTitle(), true);
        }
        if (fa.contains(10)) {
            C0677b.m1412c(parcel, 10, fVar.getType());
        }
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: aB */
    public C1407ig.C1415f createFromParcel(Parcel parcel) {
        int i = 0;
        String str = null;
        int n = C0675a.m1375n(parcel);
        HashSet hashSet = new HashSet();
        String str2 = null;
        boolean z = false;
        String str3 = null;
        String str4 = null;
        String str5 = null;
        String str6 = null;
        String str7 = null;
        int i2 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i2 = C0675a.m1367g(parcel, m);
                    hashSet.add(1);
                    break;
                case 2:
                    str7 = C0675a.m1374m(parcel, m);
                    hashSet.add(2);
                    break;
                case 3:
                    str6 = C0675a.m1374m(parcel, m);
                    hashSet.add(3);
                    break;
                case 4:
                    str5 = C0675a.m1374m(parcel, m);
                    hashSet.add(4);
                    break;
                case 5:
                    str4 = C0675a.m1374m(parcel, m);
                    hashSet.add(5);
                    break;
                case 6:
                    str3 = C0675a.m1374m(parcel, m);
                    hashSet.add(6);
                    break;
                case 7:
                    z = C0675a.m1363c(parcel, m);
                    hashSet.add(7);
                    break;
                case 8:
                    str2 = C0675a.m1374m(parcel, m);
                    hashSet.add(8);
                    break;
                case 9:
                    str = C0675a.m1374m(parcel, m);
                    hashSet.add(9);
                    break;
                case 10:
                    i = C0675a.m1367g(parcel, m);
                    hashSet.add(10);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new C1407ig.C1415f(hashSet, i2, str7, str6, str5, str4, str3, z, str2, str, i);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: bt */
    public C1407ig.C1415f[] newArray(int i) {
        return new C1407ig.C1415f[i];
    }
}
