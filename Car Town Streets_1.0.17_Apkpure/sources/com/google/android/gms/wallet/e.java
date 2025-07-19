package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
/* loaded from: classes.dex */
public class e implements Parcelable.Creator<FullWalletRequest> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(FullWalletRequest fullWalletRequest, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, fullWalletRequest.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, fullWalletRequest.Gn, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, fullWalletRequest.Go, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, (Parcelable) fullWalletRequest.Gu, i, false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: aI */
    public FullWalletRequest createFromParcel(Parcel parcel) {
        Cart cart = null;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i = 0;
        String str = null;
        String str2 = null;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 2:
                    str2 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 3:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 4:
                    cart = (Cart) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, Cart.CREATOR);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new FullWalletRequest(i, str2, str, cart);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: bA */
    public FullWalletRequest[] newArray(int i) {
        return new FullWalletRequest[i];
    }
}
