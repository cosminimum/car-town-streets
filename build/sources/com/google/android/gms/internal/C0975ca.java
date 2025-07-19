package com.google.android.gms.internal;

import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.internal.ca */
public class C0975ca implements Parcelable.Creator<C0972bz> {
    /* renamed from: a */
    static void m2116a(C0972bz bzVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, bzVar.versionCode);
        C0677b.m1396a(parcel, 2, bzVar.f2307hq, false);
        C0677b.m1399a(parcel, 3, (Parcelable) bzVar.f2308hr, i, false);
        C0677b.m1399a(parcel, 4, (Parcelable) bzVar.f2306em, i, false);
        C0677b.m1401a(parcel, 5, bzVar.adUnitId, false);
        C0677b.m1399a(parcel, 6, (Parcelable) bzVar.applicationInfo, i, false);
        C0677b.m1399a(parcel, 7, (Parcelable) bzVar.f2309hs, i, false);
        C0677b.m1401a(parcel, 8, bzVar.f2310ht, false);
        C0677b.m1401a(parcel, 9, bzVar.f2311hu, false);
        C0677b.m1401a(parcel, 10, bzVar.f2312hv, false);
        C0677b.m1399a(parcel, 11, (Parcelable) bzVar.f2305ej, i, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: f */
    public C0972bz createFromParcel(Parcel parcel) {
        C1005cu cuVar = null;
        int n = C0675a.m1375n(parcel);
        int i = 0;
        String str = null;
        String str2 = null;
        String str3 = null;
        PackageInfo packageInfo = null;
        ApplicationInfo applicationInfo = null;
        String str4 = null;
        C1466x xVar = null;
        C1464v vVar = null;
        Bundle bundle = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    bundle = C0675a.m1377o(parcel, m);
                    break;
                case 3:
                    vVar = (C1464v) C0675a.m1356a(parcel, m, C1464v.CREATOR);
                    break;
                case 4:
                    xVar = (C1466x) C0675a.m1356a(parcel, m, C1466x.CREATOR);
                    break;
                case 5:
                    str4 = C0675a.m1374m(parcel, m);
                    break;
                case 6:
                    applicationInfo = (ApplicationInfo) C0675a.m1356a(parcel, m, ApplicationInfo.CREATOR);
                    break;
                case 7:
                    packageInfo = (PackageInfo) C0675a.m1356a(parcel, m, PackageInfo.CREATOR);
                    break;
                case 8:
                    str3 = C0675a.m1374m(parcel, m);
                    break;
                case 9:
                    str2 = C0675a.m1374m(parcel, m);
                    break;
                case 10:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 11:
                    cuVar = (C1005cu) C0675a.m1356a(parcel, m, C1005cu.CREATOR);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new C0972bz(i, bundle, vVar, xVar, str4, applicationInfo, packageInfo, str3, str2, str, cuVar);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: k */
    public C0972bz[] newArray(int i) {
        return new C0972bz[i];
    }
}
