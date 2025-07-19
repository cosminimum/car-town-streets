package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.wallet.a */
public class C1630a implements Parcelable.Creator<Address> {
    /* renamed from: a */
    static void m4340a(Address address, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, address.getVersionCode());
        C0677b.m1401a(parcel, 2, address.name, false);
        C0677b.m1401a(parcel, 3, address.f3813Ga, false);
        C0677b.m1401a(parcel, 4, address.f3814Gb, false);
        C0677b.m1401a(parcel, 5, address.f3815Gc, false);
        C0677b.m1401a(parcel, 6, address.f3822id, false);
        C0677b.m1401a(parcel, 7, address.f3816Gd, false);
        C0677b.m1401a(parcel, 8, address.f3817Ge, false);
        C0677b.m1401a(parcel, 9, address.f3818Gf, false);
        C0677b.m1401a(parcel, 10, address.f3819Gg, false);
        C0677b.m1404a(parcel, 11, address.f3820Gh);
        C0677b.m1401a(parcel, 12, address.f3821Gi, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: aE */
    public Address createFromParcel(Parcel parcel) {
        int n = C0675a.m1375n(parcel);
        int i = 0;
        String str = null;
        String str2 = null;
        String str3 = null;
        String str4 = null;
        String str5 = null;
        String str6 = null;
        String str7 = null;
        String str8 = null;
        String str9 = null;
        boolean z = false;
        String str10 = null;
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
                    str2 = C0675a.m1374m(parcel, m);
                    break;
                case 4:
                    str3 = C0675a.m1374m(parcel, m);
                    break;
                case 5:
                    str4 = C0675a.m1374m(parcel, m);
                    break;
                case 6:
                    str5 = C0675a.m1374m(parcel, m);
                    break;
                case 7:
                    str6 = C0675a.m1374m(parcel, m);
                    break;
                case 8:
                    str7 = C0675a.m1374m(parcel, m);
                    break;
                case 9:
                    str8 = C0675a.m1374m(parcel, m);
                    break;
                case 10:
                    str9 = C0675a.m1374m(parcel, m);
                    break;
                case 11:
                    z = C0675a.m1363c(parcel, m);
                    break;
                case 12:
                    str10 = C0675a.m1374m(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new Address(i, str, str2, str3, str4, str5, str6, str7, str8, str9, z, str10);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: bw */
    public Address[] newArray(int i) {
        return new Address[i];
    }
}
