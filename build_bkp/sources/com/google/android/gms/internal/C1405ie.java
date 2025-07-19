package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import java.util.HashSet;
import java.util.Set;

/* renamed from: com.google.android.gms.internal.ie */
public class C1405ie implements Parcelable.Creator<C1404id> {
    /* renamed from: a */
    static void m3782a(C1404id idVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        Set<Integer> fa = idVar.mo8498fa();
        if (fa.contains(1)) {
            C0677b.m1412c(parcel, 1, idVar.getVersionCode());
        }
        if (fa.contains(2)) {
            C0677b.m1401a(parcel, 2, idVar.getId(), true);
        }
        if (fa.contains(4)) {
            C0677b.m1399a(parcel, 4, (Parcelable) idVar.mo8499fr(), i, true);
        }
        if (fa.contains(5)) {
            C0677b.m1401a(parcel, 5, idVar.getStartDate(), true);
        }
        if (fa.contains(6)) {
            C0677b.m1399a(parcel, 6, (Parcelable) idVar.mo8500fs(), i, true);
        }
        if (fa.contains(7)) {
            C0677b.m1401a(parcel, 7, idVar.getType(), true);
        }
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: at */
    public C1404id createFromParcel(Parcel parcel) {
        String str = null;
        int n = C0675a.m1375n(parcel);
        HashSet hashSet = new HashSet();
        int i = 0;
        C1402ib ibVar = null;
        String str2 = null;
        C1402ib ibVar2 = null;
        String str3 = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    hashSet.add(1);
                    break;
                case 2:
                    str3 = C0675a.m1374m(parcel, m);
                    hashSet.add(2);
                    break;
                case 4:
                    hashSet.add(4);
                    ibVar2 = (C1402ib) C0675a.m1356a(parcel, m, C1402ib.CREATOR);
                    break;
                case 5:
                    str2 = C0675a.m1374m(parcel, m);
                    hashSet.add(5);
                    break;
                case 6:
                    hashSet.add(6);
                    ibVar = (C1402ib) C0675a.m1356a(parcel, m, C1402ib.CREATOR);
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
            return new C1404id(hashSet, i, str3, ibVar2, str2, ibVar, str);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: bl */
    public C1404id[] newArray(int i) {
        return new C1404id[i];
    }
}
