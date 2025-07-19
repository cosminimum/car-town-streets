package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.wallet.e */
public class C1634e implements Parcelable.Creator<FullWalletRequest> {
    /* renamed from: a */
    static void m4352a(FullWalletRequest fullWalletRequest, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, fullWalletRequest.getVersionCode());
        C0677b.m1401a(parcel, 2, fullWalletRequest.f3839Gn, false);
        C0677b.m1401a(parcel, 3, fullWalletRequest.f3840Go, false);
        C0677b.m1399a(parcel, 4, (Parcelable) fullWalletRequest.f3841Gu, i, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: aI */
    public FullWalletRequest createFromParcel(Parcel parcel) {
        Cart cart = null;
        int n = C0675a.m1375n(parcel);
        int i = 0;
        String str = null;
        String str2 = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    str2 = C0675a.m1374m(parcel, m);
                    break;
                case 3:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 4:
                    cart = (Cart) C0675a.m1356a(parcel, m, Cart.CREATOR);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new FullWalletRequest(i, str2, str, cart);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: bA */
    public FullWalletRequest[] newArray(int i) {
        return new FullWalletRequest[i];
    }
}
