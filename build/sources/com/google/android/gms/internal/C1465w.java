package com.google.android.gms.internal;

import android.location.Location;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import java.util.ArrayList;

/* renamed from: com.google.android.gms.internal.w */
public class C1465w implements Parcelable.Creator<C1464v> {
    /* renamed from: a */
    static void m4073a(C1464v vVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, vVar.versionCode);
        C0677b.m1395a(parcel, 2, vVar.f3482ex);
        C0677b.m1396a(parcel, 3, vVar.extras, false);
        C0677b.m1412c(parcel, 4, vVar.f3483ey);
        C0677b.m1402a(parcel, 5, vVar.f3484ez, false);
        C0677b.m1404a(parcel, 6, vVar.f3477eA);
        C0677b.m1412c(parcel, 7, vVar.tagForChildDirectedTreatment);
        C0677b.m1404a(parcel, 8, vVar.f3478eB);
        C0677b.m1401a(parcel, 9, vVar.f3479eC, false);
        C0677b.m1399a(parcel, 10, (Parcelable) vVar.f3480eD, i, false);
        C0677b.m1399a(parcel, 11, (Parcelable) vVar.f3481eE, i, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: a */
    public C1464v createFromParcel(Parcel parcel) {
        int n = C0675a.m1375n(parcel);
        int i = 0;
        long j = 0;
        Bundle bundle = null;
        int i2 = 0;
        ArrayList<String> arrayList = null;
        boolean z = false;
        int i3 = 0;
        boolean z2 = false;
        String str = null;
        C0868ai aiVar = null;
        Location location = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    j = C0675a.m1368h(parcel, m);
                    break;
                case 3:
                    bundle = C0675a.m1377o(parcel, m);
                    break;
                case 4:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                case 5:
                    arrayList = C0675a.m1387y(parcel, m);
                    break;
                case 6:
                    z = C0675a.m1363c(parcel, m);
                    break;
                case 7:
                    i3 = C0675a.m1367g(parcel, m);
                    break;
                case 8:
                    z2 = C0675a.m1363c(parcel, m);
                    break;
                case 9:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 10:
                    aiVar = (C0868ai) C0675a.m1356a(parcel, m, C0868ai.CREATOR);
                    break;
                case 11:
                    location = (Location) C0675a.m1356a(parcel, m, Location.CREATOR);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new C1464v(i, j, bundle, i2, arrayList, z, i3, z2, str, aiVar, location);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: b */
    public C1464v[] newArray(int i) {
        return new C1464v[i];
    }
}
