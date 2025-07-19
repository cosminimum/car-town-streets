package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import java.util.ArrayList;
/* loaded from: classes.dex */
public class cc implements Parcelable.Creator<cb> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(cb cbVar, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, cbVar.versionCode);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, cbVar.gL, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, cbVar.hw, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, cbVar.fK, false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 5, cbVar.errorCode);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 6, cbVar.fL, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 7, cbVar.hx);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 8, cbVar.hy);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 9, cbVar.hz);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 10, cbVar.hA, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 11, cbVar.fO);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 12, cbVar.orientation);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 13, cbVar.hB, false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: g */
    public cb createFromParcel(Parcel parcel) {
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
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
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 2:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 3:
                    str2 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 4:
                    arrayList = com.google.android.gms.common.internal.safeparcel.a.y(parcel, m);
                    break;
                case 5:
                    i2 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 6:
                    arrayList2 = com.google.android.gms.common.internal.safeparcel.a.y(parcel, m);
                    break;
                case 7:
                    j = com.google.android.gms.common.internal.safeparcel.a.h(parcel, m);
                    break;
                case 8:
                    z = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    break;
                case 9:
                    j2 = com.google.android.gms.common.internal.safeparcel.a.h(parcel, m);
                    break;
                case 10:
                    arrayList3 = com.google.android.gms.common.internal.safeparcel.a.y(parcel, m);
                    break;
                case 11:
                    j3 = com.google.android.gms.common.internal.safeparcel.a.h(parcel, m);
                    break;
                case 12:
                    i3 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 13:
                    str3 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new cb(i, str, str2, arrayList, i2, arrayList2, j, z, j2, arrayList3, j3, i3, str3);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: l */
    public cb[] newArray(int i) {
        return new cb[i];
    }
}
