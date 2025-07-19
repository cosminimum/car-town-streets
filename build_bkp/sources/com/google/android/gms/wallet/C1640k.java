package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.wallet.k */
public class C1640k implements Parcelable.Creator<OfferWalletObject> {
    /* renamed from: a */
    static void m4370a(OfferWalletObject offerWalletObject, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, offerWalletObject.getVersionCode());
        C0677b.m1401a(parcel, 2, offerWalletObject.f3888GA, false);
        C0677b.m1401a(parcel, 3, offerWalletObject.f3889GX, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: aO */
    public OfferWalletObject createFromParcel(Parcel parcel) {
        String str = null;
        int n = C0675a.m1375n(parcel);
        int i = 0;
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
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new OfferWalletObject(i, str2, str);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: bG */
    public OfferWalletObject[] newArray(int i) {
        return new OfferWalletObject[i];
    }
}
