package com.google.android.gms.internal;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
/* loaded from: classes.dex */
public class bl implements Parcelable.Creator<bm> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(bm bmVar, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, bmVar.versionCode);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, (Parcelable) bmVar.gG, i, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, bmVar.aa(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, bmVar.ab(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, bmVar.ac(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 6, bmVar.ad(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 7, bmVar.gL, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 8, bmVar.gM);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 9, bmVar.gN, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 10, bmVar.ae(), false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 11, bmVar.orientation);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 12, bmVar.gP);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 13, bmVar.go, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 14, (Parcelable) bmVar.ej, i, false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: e */
    public bm createFromParcel(Parcel parcel) {
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i = 0;
        bj bjVar = null;
        IBinder iBinder = null;
        IBinder iBinder2 = null;
        IBinder iBinder3 = null;
        IBinder iBinder4 = null;
        String str = null;
        boolean z = false;
        String str2 = null;
        IBinder iBinder5 = null;
        int i2 = 0;
        int i3 = 0;
        String str3 = null;
        cu cuVar = null;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 2:
                    bjVar = (bj) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, bj.CREATOR);
                    break;
                case 3:
                    iBinder = com.google.android.gms.common.internal.safeparcel.a.n(parcel, m);
                    break;
                case 4:
                    iBinder2 = com.google.android.gms.common.internal.safeparcel.a.n(parcel, m);
                    break;
                case 5:
                    iBinder3 = com.google.android.gms.common.internal.safeparcel.a.n(parcel, m);
                    break;
                case 6:
                    iBinder4 = com.google.android.gms.common.internal.safeparcel.a.n(parcel, m);
                    break;
                case 7:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 8:
                    z = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    break;
                case 9:
                    str2 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 10:
                    iBinder5 = com.google.android.gms.common.internal.safeparcel.a.n(parcel, m);
                    break;
                case 11:
                    i2 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 12:
                    i3 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 13:
                    str3 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 14:
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
        return new bm(i, bjVar, iBinder, iBinder2, iBinder3, iBinder4, str, z, str2, iBinder5, i2, i3, str3, cuVar);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: j */
    public bm[] newArray(int i) {
        return new bm[i];
    }
}
