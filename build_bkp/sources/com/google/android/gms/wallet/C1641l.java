package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.wallet.l */
public class C1641l implements Parcelable.Creator<ProxyCard> {
    /* renamed from: a */
    static void m4373a(ProxyCard proxyCard, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, proxyCard.getVersionCode());
        C0677b.m1401a(parcel, 2, proxyCard.f3891GY, false);
        C0677b.m1401a(parcel, 3, proxyCard.f3892GZ, false);
        C0677b.m1412c(parcel, 4, proxyCard.f3893Ha);
        C0677b.m1412c(parcel, 5, proxyCard.f3894Hb);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: aP */
    public ProxyCard createFromParcel(Parcel parcel) {
        String str = null;
        int i = 0;
        int n = C0675a.m1375n(parcel);
        int i2 = 0;
        String str2 = null;
        int i3 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i3 = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    str2 = C0675a.m1374m(parcel, m);
                    break;
                case 3:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 4:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                case 5:
                    i = C0675a.m1367g(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new ProxyCard(i3, str2, str, i2, i);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: bH */
    public ProxyCard[] newArray(int i) {
        return new ProxyCard[i];
    }
}
