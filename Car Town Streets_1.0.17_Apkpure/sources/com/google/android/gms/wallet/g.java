package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
/* loaded from: classes.dex */
public class g implements Parcelable.Creator<LoyaltyWalletObject> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(LoyaltyWalletObject loyaltyWalletObject, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, loyaltyWalletObject.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, loyaltyWalletObject.GA, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, loyaltyWalletObject.GB, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, loyaltyWalletObject.GC, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, loyaltyWalletObject.GD, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 6, loyaltyWalletObject.GE, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 7, loyaltyWalletObject.GF, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 8, loyaltyWalletObject.GG, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 9, loyaltyWalletObject.GH, false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: aK */
    public LoyaltyWalletObject createFromParcel(Parcel parcel) {
        String str = null;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i = 0;
        String str2 = null;
        String str3 = null;
        String str4 = null;
        String str5 = null;
        String str6 = null;
        String str7 = null;
        String str8 = null;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 2:
                    str8 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 3:
                    str7 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 4:
                    str6 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 5:
                    str5 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 6:
                    str4 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 7:
                    str3 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 8:
                    str2 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 9:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new LoyaltyWalletObject(i, str8, str7, str6, str5, str4, str3, str2, str);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: bC */
    public LoyaltyWalletObject[] newArray(int i) {
        return new LoyaltyWalletObject[i];
    }
}
