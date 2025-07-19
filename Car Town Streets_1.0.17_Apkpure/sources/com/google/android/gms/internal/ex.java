package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.internal.ev;
import java.util.ArrayList;
/* loaded from: classes.dex */
public class ex implements Parcelable.Creator<ev.a> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(ev.a aVar, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, aVar.versionCode);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, aVar.className, false);
        com.google.android.gms.common.internal.safeparcel.b.b(parcel, 3, aVar.qv, false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: U */
    public ev.a[] newArray(int i) {
        return new ev.a[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: w */
    public ev.a createFromParcel(Parcel parcel) {
        ArrayList arrayList = null;
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
                    arrayList = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m, ev.b.CREATOR);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new ev.a(i, str, arrayList);
    }
}
