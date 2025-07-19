package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
/* loaded from: classes.dex */
public class cv implements Parcelable.Creator<cu> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(cu cuVar, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, cuVar.versionCode);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, cuVar.iJ, false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 3, cuVar.iK);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 4, cuVar.iL);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, cuVar.iM);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: h */
    public cu createFromParcel(Parcel parcel) {
        boolean z = false;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        String str = null;
        int i = 0;
        int i2 = 0;
        int i3 = 0;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i3 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 2:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 3:
                    i2 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 4:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 5:
                    z = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new cu(i3, str, i2, i, z);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: o */
    public cu[] newArray(int i) {
        return new cu[i];
    }
}
