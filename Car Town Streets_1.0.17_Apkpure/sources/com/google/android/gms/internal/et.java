package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.internal.es;
/* loaded from: classes.dex */
public class et implements Parcelable.Creator<es.a> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(es.a aVar, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, aVar.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 2, aVar.ch());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, aVar.cn());
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 4, aVar.ci());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, aVar.co());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 6, aVar.cp(), false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 7, aVar.cq());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 8, aVar.cs(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 9, (Parcelable) aVar.cu(), i, false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: R */
    public es.a[] newArray(int i) {
        return new es.a[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: t */
    public es.a createFromParcel(Parcel parcel) {
        en enVar = null;
        int i = 0;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        String str = null;
        String str2 = null;
        boolean z = false;
        int i2 = 0;
        boolean z2 = false;
        int i3 = 0;
        int i4 = 0;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i4 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 2:
                    i3 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 3:
                    z2 = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    break;
                case 4:
                    i2 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 5:
                    z = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    break;
                case 6:
                    str2 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 7:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 8:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 9:
                    enVar = (en) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, en.CREATOR);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new es.a(i4, i3, z2, i2, z, str2, i, str, enVar);
    }
}
