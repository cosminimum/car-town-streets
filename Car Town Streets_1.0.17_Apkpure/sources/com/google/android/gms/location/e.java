package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
/* loaded from: classes.dex */
public class e implements Parcelable.Creator<d> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(d dVar, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, dVar.xG);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1000, dVar.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 2, dVar.xH);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, dVar.xI);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: aS */
    public d[] newArray(int i) {
        return new d[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: af */
    public d createFromParcel(Parcel parcel) {
        int i = 1;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i2 = 0;
        long j = 0;
        int i3 = 1;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i3 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 2:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 3:
                    j = com.google.android.gms.common.internal.safeparcel.a.h(parcel, m);
                    break;
                case 1000:
                    i2 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new d(i2, i3, i, j);
    }
}
