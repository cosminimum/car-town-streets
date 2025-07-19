package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.internal.es;
import com.google.android.gms.internal.ev;
/* loaded from: classes.dex */
public class eu implements Parcelable.Creator<ev.b> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(ev.b bVar, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, bVar.versionCode);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, bVar.qw, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, (Parcelable) bVar.qx, i, false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: S */
    public ev.b[] newArray(int i) {
        return new ev.b[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: u */
    public ev.b createFromParcel(Parcel parcel) {
        es.a aVar = null;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i = 0;
        String str = null;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 2:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 3:
                    aVar = (es.a) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, es.a.CREATOR);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new ev.b(i, str, aVar);
    }
}
