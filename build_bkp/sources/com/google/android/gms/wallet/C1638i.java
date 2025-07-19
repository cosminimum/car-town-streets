package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.wallet.i */
public class C1638i implements Parcelable.Creator<MaskedWalletRequest> {
    /* renamed from: a */
    static void m4364a(MaskedWalletRequest maskedWalletRequest, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, maskedWalletRequest.getVersionCode());
        C0677b.m1401a(parcel, 2, maskedWalletRequest.f3880Go, false);
        C0677b.m1404a(parcel, 3, maskedWalletRequest.f3869GK);
        C0677b.m1404a(parcel, 4, maskedWalletRequest.f3870GL);
        C0677b.m1404a(parcel, 5, maskedWalletRequest.f3871GM);
        C0677b.m1401a(parcel, 6, maskedWalletRequest.f3872GN, false);
        C0677b.m1401a(parcel, 7, maskedWalletRequest.f3879Gk, false);
        C0677b.m1401a(parcel, 8, maskedWalletRequest.f3873GO, false);
        C0677b.m1399a(parcel, 9, (Parcelable) maskedWalletRequest.f3881Gu, i, false);
        C0677b.m1404a(parcel, 10, maskedWalletRequest.f3874GP);
        C0677b.m1404a(parcel, 11, maskedWalletRequest.f3875GQ);
        C0677b.m1407a(parcel, 12, (T[]) maskedWalletRequest.f3876GR, i, false);
        C0677b.m1404a(parcel, 13, maskedWalletRequest.f3877GS);
        C0677b.m1404a(parcel, 14, maskedWalletRequest.f3878GT);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: aM */
    public MaskedWalletRequest createFromParcel(Parcel parcel) {
        int n = C0675a.m1375n(parcel);
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
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 3:
                    z = C0675a.m1363c(parcel, m);
                    break;
                case 4:
                    z2 = C0675a.m1363c(parcel, m);
                    break;
                case 5:
                    z3 = C0675a.m1363c(parcel, m);
                    break;
                case 6:
                    str2 = C0675a.m1374m(parcel, m);
                    break;
                case 7:
                    str3 = C0675a.m1374m(parcel, m);
                    break;
                case 8:
                    str4 = C0675a.m1374m(parcel, m);
                    break;
                case 9:
                    cart = (Cart) C0675a.m1356a(parcel, m, Cart.CREATOR);
                    break;
                case 10:
                    z4 = C0675a.m1363c(parcel, m);
                    break;
                case 11:
                    z5 = C0675a.m1363c(parcel, m);
                    break;
                case 12:
                    countrySpecificationArr = (CountrySpecification[]) C0675a.m1361b(parcel, m, CountrySpecification.CREATOR);
                    break;
                case 13:
                    z6 = C0675a.m1363c(parcel, m);
                    break;
                case 14:
                    z7 = C0675a.m1363c(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new MaskedWalletRequest(i, str, z, z2, z3, str2, str3, str4, cart, z4, z5, countrySpecificationArr, z6, z7);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: bE */
    public MaskedWalletRequest[] newArray(int i) {
        return new MaskedWalletRequest[i];
    }
}
