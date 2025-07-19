package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.internal.dt;
import java.util.ArrayList;
/* loaded from: classes.dex */
public class ef implements Parcelable.Creator<dt.a> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(dt.a aVar, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 1, aVar.getAccountName(), false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1000, aVar.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, aVar.bH(), false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 3, aVar.bG());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, aVar.bJ(), false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: L */
    public dt.a[] newArray(int i) {
        return new dt.a[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: l */
    public dt.a createFromParcel(Parcel parcel) {
        int i = 0;
        String str = null;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        ArrayList<String> arrayList = null;
        String str2 = null;
        int i2 = 0;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    str2 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 2:
                    arrayList = com.google.android.gms.common.internal.safeparcel.a.y(parcel, m);
                    break;
                case 3:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 4:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
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
        return new dt.a(i2, str2, arrayList, i, str);
    }
}
