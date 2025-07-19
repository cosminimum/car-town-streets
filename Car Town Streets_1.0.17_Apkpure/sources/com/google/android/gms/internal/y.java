package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
/* loaded from: classes.dex */
public class y implements Parcelable.Creator<x> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(x xVar, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, xVar.versionCode);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, xVar.eF, false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 3, xVar.height);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 4, xVar.heightPixels);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, xVar.eG);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 6, xVar.width);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 7, xVar.widthPixels);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 8, (Parcelable[]) xVar.eH, i, false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: b */
    public x createFromParcel(Parcel parcel) {
        x[] xVarArr = null;
        int i = 0;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i2 = 0;
        boolean z = false;
        int i3 = 0;
        int i4 = 0;
        String str = null;
        int i5 = 0;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i5 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 2:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 3:
                    i4 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 4:
                    i3 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 5:
                    z = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    break;
                case 6:
                    i2 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 7:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 8:
                    xVarArr = (x[]) com.google.android.gms.common.internal.safeparcel.a.b(parcel, m, x.CREATOR);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new x(i5, str, i4, i3, z, i2, i, xVarArr);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: c */
    public x[] newArray(int i) {
        return new x[i];
    }
}
