package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.internal.hd;
/* loaded from: classes.dex */
public class ha implements Parcelable.Creator<hd.a> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(hd.a aVar, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 1, aVar.eh(), false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1000, aVar.kg);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, aVar.getTag(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, aVar.ei(), false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 4, aVar.ej());
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: am */
    public hd.a createFromParcel(Parcel parcel) {
        int i = 0;
        String str = null;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        String str2 = null;
        String str3 = null;
        int i2 = 0;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    str3 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 2:
                    str2 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 3:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 4:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
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
        return new hd.a(i2, str3, str2, str, i);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: bb */
    public hd.a[] newArray(int i) {
        return new hd.a[i];
    }
}
