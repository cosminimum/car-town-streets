package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.wallet.c */
public class C1632c implements Parcelable.Creator<CountrySpecification> {
    /* renamed from: a */
    static void m4346a(CountrySpecification countrySpecification, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, countrySpecification.getVersionCode());
        C0677b.m1401a(parcel, 2, countrySpecification.f3829id, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: aG */
    public CountrySpecification createFromParcel(Parcel parcel) {
        int n = C0675a.m1375n(parcel);
        int i = 0;
        String str = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    str = C0675a.m1374m(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new CountrySpecification(i, str);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: by */
    public CountrySpecification[] newArray(int i) {
        return new CountrySpecification[i];
    }
}
