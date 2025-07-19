package google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;

import com.google.android.gms.common.internal.safeparcel.b;

public class g implements Parcelable.Creator<LoyaltyWalletObject> {
    static void a(LoyaltyWalletObject loyaltyWalletObject, Parcel parcel, int i) {
        int o = b.o(parcel);
        b.c(parcel, 1, loyaltyWalletObject.getVersionCode());
        b.a(parcel, 2, loyaltyWalletObject.GA, false);
        b.a(parcel, 3, loyaltyWalletObject.GB, false);
        b.a(parcel, 4, loyaltyWalletObject.GC, false);
        b.a(parcel, 5, loyaltyWalletObject.GD, false);
        b.a(parcel, 6, loyaltyWalletObject.GE, false);
        b.a(parcel, 7, loyaltyWalletObject.GF, false);
        b.a(parcel, 8, loyaltyWalletObject.GG, false);
        b.a(parcel, 9, loyaltyWalletObject.GH, false);
        b.D(parcel, o);
    }

    /* renamed from: aK */
    public LoyaltyWalletObject createFromParcel(Parcel parcel) {
        String str = null;
        int n = a.n(parcel);
        int i = 0;
        String str2 = null;
        String str3 = null;
        String str4 = null;
        String str5 = null;
        String str6 = null;
        String str7 = null;
        String str8 = null;
        while (parcel.dataPosition() < n) {
            int m = a.m(parcel);
            switch (a.M(m)) {
                case 1:
                    i = a.g(parcel, m);
                    break;
                case 2:
                    str8 = a.m(parcel, m);
                    break;
                case 3:
                    str7 = a.m(parcel, m);
                    break;
                case 4:
                    str6 = a.m(parcel, m);
                    break;
                case 5:
                    str5 = a.m(parcel, m);
                    break;
                case 6:
                    str4 = a.m(parcel, m);
                    break;
                case 7:
                    str3 = a.m(parcel, m);
                    break;
                case 8:
                    str2 = a.m(parcel, m);
                    break;
                case 9:
                    str = a.m(parcel, m);
                    break;
                default:
                    a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new LoyaltyWalletObject(i, str8, str7, str6, str5, str4, str3, str2, str);
        }
        throw new a.C0013a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: bC */
    public LoyaltyWalletObject[] newArray(int i) {
        return new LoyaltyWalletObject[i];
    }
}
