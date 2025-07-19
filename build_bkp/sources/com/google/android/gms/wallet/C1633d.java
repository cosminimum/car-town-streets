package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.wallet.d */
public class C1633d implements Parcelable.Creator<FullWallet> {
    /* renamed from: a */
    static void m4349a(FullWallet fullWallet, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, fullWallet.getVersionCode());
        C0677b.m1401a(parcel, 2, fullWallet.f3831Gn, false);
        C0677b.m1401a(parcel, 3, fullWallet.f3832Go, false);
        C0677b.m1399a(parcel, 4, (Parcelable) fullWallet.f3833Gp, i, false);
        C0677b.m1401a(parcel, 5, fullWallet.f3834Gq, false);
        C0677b.m1399a(parcel, 6, (Parcelable) fullWallet.f3835Gr, i, false);
        C0677b.m1399a(parcel, 7, (Parcelable) fullWallet.f3836Gs, i, false);
        C0677b.m1408a(parcel, 8, fullWallet.f3837Gt, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: aH */
    public FullWallet createFromParcel(Parcel parcel) {
        String[] strArr = null;
        int n = C0675a.m1375n(parcel);
        int i = 0;
        Address address = null;
        Address address2 = null;
        String str = null;
        ProxyCard proxyCard = null;
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
                    proxyCard = (ProxyCard) C0675a.m1356a(parcel, m, ProxyCard.CREATOR);
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
                    strArr = C0675a.m1386x(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new FullWallet(i, str3, str2, proxyCard, str, address2, address, strArr);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: bz */
    public FullWallet[] newArray(int i) {
        return new FullWallet[i];
    }
}
