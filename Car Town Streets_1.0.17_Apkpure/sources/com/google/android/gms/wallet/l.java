package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
/* loaded from: classes.dex */
public class l implements Parcelable.Creator<ProxyCard> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(ProxyCard proxyCard, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, proxyCard.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, proxyCard.GY, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, proxyCard.GZ, false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 4, proxyCard.Ha);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 5, proxyCard.Hb);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: aP */
    public ProxyCard createFromParcel(Parcel parcel) {
        String str = null;
        int i = 0;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i2 = 0;
        String str2 = null;
        int i3 = 0;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i3 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 2:
                    str2 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 3:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 4:
                    i2 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 5:
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
        return new ProxyCard(i3, str2, str, i2, i);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: bH */
    public ProxyCard[] newArray(int i) {
        return new ProxyCard[i];
    }
}
