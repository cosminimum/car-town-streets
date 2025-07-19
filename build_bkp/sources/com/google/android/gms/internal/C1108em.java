package com.google.android.gms.internal;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.internal.em */
public class C1108em implements Parcelable.Creator<C1107el> {
    /* renamed from: a */
    static void m2636a(C1107el elVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, elVar.getType());
        C0677b.m1412c(parcel, 1000, elVar.getVersionCode());
        C0677b.m1412c(parcel, 2, elVar.mo7550bY());
        C0677b.m1401a(parcel, 3, elVar.mo7551bZ(), false);
        C0677b.m1401a(parcel, 4, elVar.mo7552ca(), false);
        C0677b.m1401a(parcel, 5, elVar.getDisplayName(), false);
        C0677b.m1401a(parcel, 6, elVar.mo7553cb(), false);
        C0677b.m1396a(parcel, 7, elVar.getMetadata(), false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: N */
    public C1107el[] newArray(int i) {
        return new C1107el[i];
    }

    /* renamed from: p */
    public C1107el createFromParcel(Parcel parcel) {
        int i = 0;
        Bundle bundle = null;
        int n = C0675a.m1375n(parcel);
        String str = null;
        String str2 = null;
        String str3 = null;
        String str4 = null;
        int i2 = 0;
        int i3 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 3:
                    str4 = C0675a.m1374m(parcel, m);
                    break;
                case 4:
                    str3 = C0675a.m1374m(parcel, m);
                    break;
                case 5:
                    str2 = C0675a.m1374m(parcel, m);
                    break;
                case 6:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 7:
                    bundle = C0675a.m1377o(parcel, m);
                    break;
                case 1000:
                    i3 = C0675a.m1367g(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new C1107el(i3, i2, i, str4, str3, str2, str, bundle);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }
}
