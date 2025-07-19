package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import java.util.ArrayList;
/* loaded from: classes.dex */
public class hg implements Parcelable.Creator<hf> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(hf hfVar, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 1, hfVar.name, false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1000, hfVar.versionCode);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, hfVar.Bf, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, hfVar.Bg, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, hfVar.Bh, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, hfVar.Bi, false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: ap */
    public hf createFromParcel(Parcel parcel) {
        ArrayList<String> arrayList = null;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i = 0;
        String str = null;
        String str2 = null;
        String str3 = null;
        String str4 = null;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    str4 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 2:
                    str3 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 3:
                    str2 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 4:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 5:
                    arrayList = com.google.android.gms.common.internal.safeparcel.a.y(parcel, m);
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
        return new hf(i, str4, str3, str2, str, arrayList);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: bf */
    public hf[] newArray(int i) {
        return new hf[i];
    }
}
