package com.google.android.gms.internal;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
/* loaded from: classes.dex */
public class em implements Parcelable.Creator<el> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(el elVar, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, elVar.getType());
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1000, elVar.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 2, elVar.bY());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, elVar.bZ(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, elVar.ca(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, elVar.getDisplayName(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 6, elVar.cb(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 7, elVar.getMetadata(), false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: N */
    public el[] newArray(int i) {
        return new el[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: p */
    public el createFromParcel(Parcel parcel) {
        int i = 0;
        Bundle bundle = null;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        String str = null;
        String str2 = null;
        String str3 = null;
        String str4 = null;
        int i2 = 0;
        int i3 = 0;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i2 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 2:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 3:
                    str4 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 4:
                    str3 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 5:
                    str2 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 6:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 7:
                    bundle = com.google.android.gms.common.internal.safeparcel.a.o(parcel, m);
                    break;
                case 1000:
                    i3 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new el(i3, i2, i, str4, str3, str2, str, bundle);
    }
}
