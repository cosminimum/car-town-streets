package com.google.android.gms.internal;

import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
/* loaded from: classes.dex */
public class ca implements Parcelable.Creator<bz> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(bz bzVar, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, bzVar.versionCode);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, bzVar.hq, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, (Parcelable) bzVar.hr, i, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, (Parcelable) bzVar.em, i, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, bzVar.adUnitId, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 6, (Parcelable) bzVar.applicationInfo, i, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 7, (Parcelable) bzVar.hs, i, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 8, bzVar.ht, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 9, bzVar.hu, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 10, bzVar.hv, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 11, (Parcelable) bzVar.ej, i, false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: f */
    public bz createFromParcel(Parcel parcel) {
        cu cuVar = null;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i = 0;
        String str = null;
        String str2 = null;
        String str3 = null;
        PackageInfo packageInfo = null;
        ApplicationInfo applicationInfo = null;
        String str4 = null;
        x xVar = null;
        v vVar = null;
        Bundle bundle = null;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 2:
                    bundle = com.google.android.gms.common.internal.safeparcel.a.o(parcel, m);
                    break;
                case 3:
                    vVar = (v) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, v.CREATOR);
                    break;
                case 4:
                    xVar = (x) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, x.CREATOR);
                    break;
                case 5:
                    str4 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 6:
                    applicationInfo = (ApplicationInfo) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, ApplicationInfo.CREATOR);
                    break;
                case 7:
                    packageInfo = (PackageInfo) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, PackageInfo.CREATOR);
                    break;
                case 8:
                    str3 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 9:
                    str2 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 10:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 11:
                    cuVar = (cu) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, cu.CREATOR);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new bz(i, bundle, vVar, xVar, str4, applicationInfo, packageInfo, str3, str2, str, cuVar);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: k */
    public bz[] newArray(int i) {
        return new bz[i];
    }
}
