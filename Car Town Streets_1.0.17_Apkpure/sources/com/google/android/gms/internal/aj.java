package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
/* loaded from: classes.dex */
public class aj implements Parcelable.Creator<ai> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(ai aiVar, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, aiVar.versionCode);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 2, aiVar.eZ);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 3, aiVar.backgroundColor);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 4, aiVar.fa);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 5, aiVar.fb);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 6, aiVar.fc);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 7, aiVar.fd);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 8, aiVar.fe);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 9, aiVar.ff);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 10, aiVar.fg, false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 11, aiVar.fh);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 12, aiVar.fi, false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 13, aiVar.fj);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 14, aiVar.fk);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 15, aiVar.fl, false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: c */
    public ai createFromParcel(Parcel parcel) {
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i = 0;
        int i2 = 0;
        int i3 = 0;
        int i4 = 0;
        int i5 = 0;
        int i6 = 0;
        int i7 = 0;
        int i8 = 0;
        int i9 = 0;
        String str = null;
        int i10 = 0;
        String str2 = null;
        int i11 = 0;
        int i12 = 0;
        String str3 = null;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 2:
                    i2 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 3:
                    i3 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 4:
                    i4 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 5:
                    i5 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 6:
                    i6 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 7:
                    i7 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 8:
                    i8 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 9:
                    i9 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 10:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 11:
                    i10 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 12:
                    str2 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 13:
                    i11 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 14:
                    i12 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 15:
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
        return new ai(i, i2, i3, i4, i5, i6, i7, i8, i9, str, i10, str2, i11, i12, str3);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: e */
    public ai[] newArray(int i) {
        return new ai[i];
    }
}
