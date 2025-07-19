package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
/* loaded from: classes.dex */
public class a implements Parcelable.Creator<Address> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(Address address, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, address.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, address.name, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, address.Ga, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, address.Gb, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, address.Gc, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 6, address.id, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 7, address.Gd, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 8, address.Ge, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 9, address.Gf, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 10, address.Gg, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 11, address.Gh);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 12, address.Gi, false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: aE */
    public Address createFromParcel(Parcel parcel) {
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
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
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 2:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 3:
                    str2 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 4:
                    str3 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 5:
                    str4 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 6:
                    str5 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 7:
                    str6 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 8:
                    str7 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 9:
                    str8 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 10:
                    str9 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 11:
                    z = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    break;
                case 12:
                    str10 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new Address(i, str, str2, str3, str4, str5, str6, str7, str8, str9, z, str10);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: bw */
    public Address[] newArray(int i) {
        return new Address[i];
    }
}
