package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
/* loaded from: classes.dex */
public class f implements Parcelable.Creator<LineItem> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(LineItem lineItem, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, lineItem.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, lineItem.description, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, lineItem.Gw, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, lineItem.Gx, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, lineItem.Gj, false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 6, lineItem.Gy);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 7, lineItem.Gk, false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: aJ */
    public LineItem createFromParcel(Parcel parcel) {
        int i = 0;
        String str = null;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        String str2 = null;
        String str3 = null;
        String str4 = null;
        String str5 = null;
        int i2 = 0;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i2 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 2:
                    str5 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 3:
                    str4 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 4:
                    str3 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 5:
                    str2 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 6:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 7:
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
        return new LineItem(i2, str5, str4, str3, str2, i, str);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: bB */
    public LineItem[] newArray(int i) {
        return new LineItem[i];
    }
}
