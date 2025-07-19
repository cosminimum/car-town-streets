package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.internal.ig;
import java.util.HashSet;
import java.util.Set;
/* loaded from: classes.dex */
public class ip implements Parcelable.Creator<ig.g> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(ig.g gVar, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        Set<Integer> fa = gVar.fa();
        if (fa.contains(1)) {
            com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, gVar.getVersionCode());
        }
        if (fa.contains(2)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, gVar.isPrimary());
        }
        if (fa.contains(3)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, gVar.getValue(), true);
        }
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: aC */
    public ig.g createFromParcel(Parcel parcel) {
        boolean z = false;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        HashSet hashSet = new HashSet();
        String str = null;
        int i = 0;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    hashSet.add(1);
                    break;
                case 2:
                    z = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    hashSet.add(2);
                    break;
                case 3:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    hashSet.add(3);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new ig.g(hashSet, i, z, str);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: bu */
    public ig.g[] newArray(int i) {
        return new ig.g[i];
    }
}
