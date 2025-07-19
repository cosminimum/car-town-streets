package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import java.util.ArrayList;

/* renamed from: com.google.android.gms.internal.cc */
public class C0977cc implements Parcelable.Creator<C0976cb> {
    /* renamed from: a */
    static void m2119a(C0976cb cbVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, cbVar.versionCode);
        C0677b.m1401a(parcel, 2, cbVar.f2323gL, false);
        C0677b.m1401a(parcel, 3, cbVar.f2326hw, false);
        C0677b.m1402a(parcel, 4, cbVar.f2320fK, false);
        C0677b.m1412c(parcel, 5, cbVar.errorCode);
        C0677b.m1402a(parcel, 6, cbVar.f2321fL, false);
        C0677b.m1395a(parcel, 7, cbVar.f2327hx);
        C0677b.m1404a(parcel, 8, cbVar.f2328hy);
        C0677b.m1395a(parcel, 9, cbVar.f2329hz);
        C0677b.m1402a(parcel, 10, cbVar.f2324hA, false);
        C0677b.m1395a(parcel, 11, cbVar.f2322fO);
        C0677b.m1412c(parcel, 12, cbVar.orientation);
        C0677b.m1401a(parcel, 13, cbVar.f2325hB, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: g */
    public C0976cb createFromParcel(Parcel parcel) {
        int n = C0675a.m1375n(parcel);
        int i = 0;
        String str = null;
        String str2 = null;
        ArrayList<String> arrayList = null;
        int i2 = 0;
        ArrayList<String> arrayList2 = null;
        long j = 0;
        boolean z = false;
        long j2 = 0;
        ArrayList<String> arrayList3 = null;
        long j3 = 0;
        int i3 = 0;
        String str3 = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 3:
                    str2 = C0675a.m1374m(parcel, m);
                    break;
                case 4:
                    arrayList = C0675a.m1387y(parcel, m);
                    break;
                case 5:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                case 6:
                    arrayList2 = C0675a.m1387y(parcel, m);
                    break;
                case 7:
                    j = C0675a.m1368h(parcel, m);
                    break;
                case 8:
                    z = C0675a.m1363c(parcel, m);
                    break;
                case 9:
                    j2 = C0675a.m1368h(parcel, m);
                    break;
                case 10:
                    arrayList3 = C0675a.m1387y(parcel, m);
                    break;
                case 11:
                    j3 = C0675a.m1368h(parcel, m);
                    break;
                case 12:
                    i3 = C0675a.m1367g(parcel, m);
                    break;
                case 13:
                    str3 = C0675a.m1374m(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new C0976cb(i, str, str2, arrayList, i2, arrayList2, j, z, j2, arrayList3, j3, i3, str3);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: l */
    public C0976cb[] newArray(int i) {
        return new C0976cb[i];
    }
}
