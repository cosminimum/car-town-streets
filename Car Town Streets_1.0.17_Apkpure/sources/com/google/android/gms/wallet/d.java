package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
/* loaded from: classes.dex */
public class d implements Parcelable.Creator<FullWallet> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(FullWallet fullWallet, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, fullWallet.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, fullWallet.Gn, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, fullWallet.Go, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, (Parcelable) fullWallet.Gp, i, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, fullWallet.Gq, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 6, (Parcelable) fullWallet.Gr, i, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 7, (Parcelable) fullWallet.Gs, i, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 8, fullWallet.Gt, false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: aH */
    public FullWallet createFromParcel(Parcel parcel) {
        String[] strArr = null;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i = 0;
        Address address = null;
        Address address2 = null;
        String str = null;
        ProxyCard proxyCard = null;
        String str2 = null;
        String str3 = null;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 2:
                    str3 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 3:
                    str2 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 4:
                    proxyCard = (ProxyCard) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, ProxyCard.CREATOR);
                    break;
                case 5:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 6:
                    address2 = (Address) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, Address.CREATOR);
                    break;
                case 7:
                    address = (Address) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, Address.CREATOR);
                    break;
                case 8:
                    strArr = com.google.android.gms.common.internal.safeparcel.a.x(parcel, m);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new FullWallet(i, str3, str2, proxyCard, str, address2, address, strArr);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: bz */
    public FullWallet[] newArray(int i) {
        return new FullWallet[i];
    }
}
