package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import java.util.ArrayList;
/* loaded from: classes.dex */
public class gu implements Parcelable.Creator<gt> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(gt gtVar, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, gtVar.dO());
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1000, gtVar.kg);
        com.google.android.gms.common.internal.safeparcel.b.b(parcel, 2, gtVar.yg, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, gtVar.dP(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, gtVar.dQ(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, gtVar.dR());
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: aY */
    public gt[] newArray(int i) {
        return new gt[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: aj */
    public gt createFromParcel(Parcel parcel) {
        String str = null;
        boolean z = false;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        String str2 = null;
        ArrayList arrayList = null;
        int i = 0;
        int i2 = 0;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 2:
                    arrayList = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m, gx.CREATOR);
                    break;
                case 3:
                    str2 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 4:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 5:
                    z = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
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
        return new gt(i2, i, arrayList, str2, str, z);
    }
}
