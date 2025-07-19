package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
/* loaded from: classes.dex */
public class i implements Parcelable.Creator<MaskedWalletRequest> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(MaskedWalletRequest maskedWalletRequest, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, maskedWalletRequest.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, maskedWalletRequest.Go, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, maskedWalletRequest.GK);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, maskedWalletRequest.GL);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, maskedWalletRequest.GM);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 6, maskedWalletRequest.GN, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 7, maskedWalletRequest.Gk, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 8, maskedWalletRequest.GO, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 9, (Parcelable) maskedWalletRequest.Gu, i, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 10, maskedWalletRequest.GP);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 11, maskedWalletRequest.GQ);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 12, (Parcelable[]) maskedWalletRequest.GR, i, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 13, maskedWalletRequest.GS);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 14, maskedWalletRequest.GT);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: aM */
    public MaskedWalletRequest createFromParcel(Parcel parcel) {
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i = 0;
        String str = null;
        boolean z = false;
        boolean z2 = false;
        boolean z3 = false;
        String str2 = null;
        String str3 = null;
        String str4 = null;
        Cart cart = null;
        boolean z4 = false;
        boolean z5 = false;
        CountrySpecification[] countrySpecificationArr = null;
        boolean z6 = true;
        boolean z7 = true;
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
                    z = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    break;
                case 4:
                    z2 = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    break;
                case 5:
                    z3 = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    break;
                case 6:
                    str2 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 7:
                    str3 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 8:
                    str4 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 9:
                    cart = (Cart) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, Cart.CREATOR);
                    break;
                case 10:
                    z4 = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    break;
                case 11:
                    z5 = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    break;
                case 12:
                    countrySpecificationArr = (CountrySpecification[]) com.google.android.gms.common.internal.safeparcel.a.b(parcel, m, CountrySpecification.CREATOR);
                    break;
                case 13:
                    z6 = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    break;
                case 14:
                    z7 = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new MaskedWalletRequest(i, str, z, z2, z3, str2, str3, str4, cart, z4, z5, countrySpecificationArr, z6, z7);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: bE */
    public MaskedWalletRequest[] newArray(int i) {
        return new MaskedWalletRequest[i];
    }
}
