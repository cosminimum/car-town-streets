package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.wallet.g */
public class C1636g implements Parcelable.Creator<LoyaltyWalletObject> {
    /* renamed from: a */
    static void m4358a(LoyaltyWalletObject loyaltyWalletObject, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, loyaltyWalletObject.getVersionCode());
        C0677b.m1401a(parcel, 2, loyaltyWalletObject.f3851GA, false);
        C0677b.m1401a(parcel, 3, loyaltyWalletObject.f3852GB, false);
        C0677b.m1401a(parcel, 4, loyaltyWalletObject.f3853GC, false);
        C0677b.m1401a(parcel, 5, loyaltyWalletObject.f3854GD, false);
        C0677b.m1401a(parcel, 6, loyaltyWalletObject.f3855GE, false);
        C0677b.m1401a(parcel, 7, loyaltyWalletObject.f3856GF, false);
        C0677b.m1401a(parcel, 8, loyaltyWalletObject.f3857GG, false);
        C0677b.m1401a(parcel, 9, loyaltyWalletObject.f3858GH, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: aK */
    public LoyaltyWalletObject createFromParcel(Parcel parcel) {
        String str = null;
        int n = C0675a.m1375n(parcel);
        int i = 0;
        String str2 = null;
        String str3 = null;
        String str4 = null;
        String str5 = null;
        String str6 = null;
        String str7 = null;
        String str8 = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    str8 = C0675a.m1374m(parcel, m);
                    break;
                case 3:
                    str7 = C0675a.m1374m(parcel, m);
                    break;
                case 4:
                    str6 = C0675a.m1374m(parcel, m);
                    break;
                case 5:
                    str5 = C0675a.m1374m(parcel, m);
                    break;
                case 6:
                    str4 = C0675a.m1374m(parcel, m);
                    break;
                case 7:
                    str3 = C0675a.m1374m(parcel, m);
                    break;
                case 8:
                    str2 = C0675a.m1374m(parcel, m);
                    break;
                case 9:
                    str = C0675a.m1374m(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new LoyaltyWalletObject(i, str8, str7, str6, str5, str4, str3, str2, str);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: bC */
    public LoyaltyWalletObject[] newArray(int i) {
        return new LoyaltyWalletObject[i];
    }
}
