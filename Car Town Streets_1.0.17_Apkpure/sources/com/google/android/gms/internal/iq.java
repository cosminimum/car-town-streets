package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.internal.ig;
import java.util.HashSet;
import java.util.Set;
/* loaded from: classes.dex */
public class iq implements Parcelable.Creator<ig.h> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(ig.h hVar, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        Set<Integer> fa = hVar.fa();
        if (fa.contains(1)) {
            com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, hVar.getVersionCode());
        }
        if (fa.contains(3)) {
            com.google.android.gms.common.internal.safeparcel.b.c(parcel, 3, hVar.fN());
        }
        if (fa.contains(4)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, hVar.getValue(), true);
        }
        if (fa.contains(5)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, hVar.getLabel(), true);
        }
        if (fa.contains(6)) {
            com.google.android.gms.common.internal.safeparcel.b.c(parcel, 6, hVar.getType());
        }
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: aD */
    public ig.h createFromParcel(Parcel parcel) {
        String str = null;
        int i = 0;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        HashSet hashSet = new HashSet();
        int i2 = 0;
        String str2 = null;
        int i3 = 0;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i3 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    hashSet.add(1);
                    break;
                case 2:
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
                case 3:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    hashSet.add(3);
                    break;
                case 4:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    hashSet.add(4);
                    break;
                case 5:
                    str2 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    hashSet.add(5);
                    break;
                case 6:
                    i2 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    hashSet.add(6);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new ig.h(hashSet, i3, str2, i2, str, i);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: bv */
    public ig.h[] newArray(int i) {
        return new ig.h[i];
    }
}
