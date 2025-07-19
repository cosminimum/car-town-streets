package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import java.util.ArrayList;
/* loaded from: classes.dex */
public class gi implements Parcelable.Creator<gh> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(gh ghVar, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1000, ghVar.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, ghVar.isEnabled());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, ghVar.dD());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, ghVar.dE());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, ghVar.dF());
        com.google.android.gms.common.internal.safeparcel.b.b(parcel, 6, ghVar.dG(), false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: aU */
    public gh[] newArray(int i) {
        return new gh[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: ah */
    public gh createFromParcel(Parcel parcel) {
        boolean z = false;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        ArrayList arrayList = null;
        boolean z2 = false;
        boolean z3 = false;
        boolean z4 = false;
        int i = 0;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 2:
                    z4 = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    break;
                case 3:
                    z3 = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    break;
                case 4:
                    z2 = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    break;
                case 5:
                    z = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    break;
                case 6:
                    arrayList = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m, el.CREATOR);
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
        return new gh(i, z4, z3, z2, z, arrayList);
    }
}
