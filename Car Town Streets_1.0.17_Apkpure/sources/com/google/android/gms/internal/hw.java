package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
/* loaded from: classes.dex */
public class hw implements Parcelable.Creator<hu> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(hu huVar, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 1, huVar.getAccountName(), false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1000, huVar.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, huVar.eR(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, huVar.eS(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, huVar.eT(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, huVar.eU(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 6, huVar.eV(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 7, huVar.eW(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 8, huVar.eX(), false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: ar */
    public hu createFromParcel(Parcel parcel) {
        String str = null;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i = 0;
        String str2 = null;
        String str3 = null;
        String str4 = null;
        String[] strArr = null;
        String[] strArr2 = null;
        String[] strArr3 = null;
        String str5 = null;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    str5 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 2:
                    strArr3 = com.google.android.gms.common.internal.safeparcel.a.x(parcel, m);
                    break;
                case 3:
                    strArr2 = com.google.android.gms.common.internal.safeparcel.a.x(parcel, m);
                    break;
                case 4:
                    strArr = com.google.android.gms.common.internal.safeparcel.a.x(parcel, m);
                    break;
                case 5:
                    str4 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 6:
                    str3 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 7:
                    str2 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 8:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 1000:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new hu(i, str5, strArr3, strArr2, strArr, str4, str3, str2, str);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: bj */
    public hu[] newArray(int i) {
        return new hu[i];
    }
}
