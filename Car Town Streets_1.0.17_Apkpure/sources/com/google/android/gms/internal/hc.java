package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
/* loaded from: classes.dex */
public class hc implements Parcelable.Creator<hb> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(hb hbVar, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 1, (Parcelable[]) hbVar.dU(), i, false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1000, hbVar.kg);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, hbVar.dV(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, hbVar.getTimestampMillis());
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: an */
    public hb createFromParcel(Parcel parcel) {
        float[] fArr = null;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i = 0;
        long j = 0;
        hd[] hdVarArr = null;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    hdVarArr = (hd[]) com.google.android.gms.common.internal.safeparcel.a.b(parcel, m, hd.CREATOR);
                    break;
                case 2:
                    fArr = com.google.android.gms.common.internal.safeparcel.a.u(parcel, m);
                    break;
                case 3:
                    j = com.google.android.gms.common.internal.safeparcel.a.h(parcel, m);
                    break;
                case 1000:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new hb(i, hdVarArr, fArr, j);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: bc */
    public hb[] newArray(int i) {
        return new hb[i];
    }
}
