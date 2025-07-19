package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.wallet.h */
public class C1637h implements Parcelable.Creator<MaskedWallet> {
    /* renamed from: a */
    static void m4361a(MaskedWallet maskedWallet, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, maskedWallet.getVersionCode());
        C0677b.m1401a(parcel, 2, maskedWallet.f3862Gn, false);
        C0677b.m1401a(parcel, 3, maskedWallet.f3863Go, false);
        C0677b.m1408a(parcel, 4, maskedWallet.f3867Gt, false);
        C0677b.m1401a(parcel, 5, maskedWallet.f3864Gq, false);
        C0677b.m1399a(parcel, 6, (Parcelable) maskedWallet.f3865Gr, i, false);
        C0677b.m1399a(parcel, 7, (Parcelable) maskedWallet.f3866Gs, i, false);
        C0677b.m1407a(parcel, 8, (T[]) maskedWallet.f3860GI, i, false);
        C0677b.m1407a(parcel, 9, (T[]) maskedWallet.f3861GJ, i, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: aL */
    public MaskedWallet createFromParcel(Parcel parcel) {
        OfferWalletObject[] offerWalletObjectArr = null;
        int n = C0675a.m1375n(parcel);
        int i = 0;
        LoyaltyWalletObject[] loyaltyWalletObjectArr = null;
        Address address = null;
        Address address2 = null;
        String str = null;
        String[] strArr = null;
        String str2 = null;
        String str3 = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    str3 = C0675a.m1374m(parcel, m);
                    break;
                case 3:
                    str2 = C0675a.m1374m(parcel, m);
                    break;
                case 4:
                    strArr = C0675a.m1386x(parcel, m);
                    break;
                case 5:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 6:
                    address2 = (Address) C0675a.m1356a(parcel, m, Address.CREATOR);
                    break;
                case 7:
                    address = (Address) C0675a.m1356a(parcel, m, Address.CREATOR);
                    break;
                case 8:
                    loyaltyWalletObjectArr = (LoyaltyWalletObject[]) C0675a.m1361b(parcel, m, LoyaltyWalletObject.CREATOR);
                    break;
                case 9:
                    offerWalletObjectArr = (OfferWalletObject[]) C0675a.m1361b(parcel, m, OfferWalletObject.CREATOR);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new MaskedWallet(i, str3, str2, strArr, str, address2, address, loyaltyWalletObjectArr, offerWalletObjectArr);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: bD */
    public MaskedWallet[] newArray(int i) {
        return new MaskedWallet[i];
    }
}
