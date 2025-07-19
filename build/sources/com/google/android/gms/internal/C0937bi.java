package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.internal.bi */
public class C0937bi implements Parcelable.Creator<C0938bj> {
    /* renamed from: a */
    static void m2032a(C0938bj bjVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, bjVar.versionCode);
        C0677b.m1401a(parcel, 2, bjVar.f2234gn, false);
        C0677b.m1401a(parcel, 3, bjVar.f2235go, false);
        C0677b.m1401a(parcel, 4, bjVar.mimeType, false);
        C0677b.m1401a(parcel, 5, bjVar.packageName, false);
        C0677b.m1401a(parcel, 6, bjVar.f2236gp, false);
        C0677b.m1401a(parcel, 7, bjVar.f2237gq, false);
        C0677b.m1401a(parcel, 8, bjVar.f2238gr, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: d */
    public C0938bj createFromParcel(Parcel parcel) {
        String str = null;
        int n = C0675a.m1375n(parcel);
        int i = 0;
        String str2 = null;
        String str3 = null;
        String str4 = null;
        String str5 = null;
        String str6 = null;
        String str7 = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    str7 = C0675a.m1374m(parcel, m);
                    break;
                case 3:
                    str6 = C0675a.m1374m(parcel, m);
                    break;
                case 4:
                    str5 = C0675a.m1374m(parcel, m);
                    break;
                case 5:
                    str4 = C0675a.m1374m(parcel, m);
                    break;
                case 6:
                    str3 = C0675a.m1374m(parcel, m);
                    break;
                case 7:
                    str2 = C0675a.m1374m(parcel, m);
                    break;
                case 8:
                    str = C0675a.m1374m(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new C0938bj(i, str7, str6, str5, str4, str3, str2, str);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: i */
    public C0938bj[] newArray(int i) {
        return new C0938bj[i];
    }
}
