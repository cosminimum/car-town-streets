package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.internal.ig;
import java.util.HashSet;
import java.util.Set;
/* loaded from: classes.dex */
public class in implements Parcelable.Creator<ig.d> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(ig.d dVar, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        Set<Integer> fa = dVar.fa();
        if (fa.contains(1)) {
            com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, dVar.getVersionCode());
        }
        if (fa.contains(2)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, dVar.getFamilyName(), true);
        }
        if (fa.contains(3)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, dVar.getFormatted(), true);
        }
        if (fa.contains(4)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, dVar.getGivenName(), true);
        }
        if (fa.contains(5)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, dVar.getHonorificPrefix(), true);
        }
        if (fa.contains(6)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 6, dVar.getHonorificSuffix(), true);
        }
        if (fa.contains(7)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 7, dVar.getMiddleName(), true);
        }
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: aA */
    public ig.d createFromParcel(Parcel parcel) {
        String str = null;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        HashSet hashSet = new HashSet();
        int i = 0;
        String str2 = null;
        String str3 = null;
        String str4 = null;
        String str5 = null;
        String str6 = null;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    hashSet.add(1);
                    break;
                case 2:
                    str6 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    hashSet.add(2);
                    break;
                case 3:
                    str5 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    hashSet.add(3);
                    break;
                case 4:
                    str4 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    hashSet.add(4);
                    break;
                case 5:
                    str3 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    hashSet.add(5);
                    break;
                case 6:
                    str2 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    hashSet.add(6);
                    break;
                case 7:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    hashSet.add(7);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new ig.d(hashSet, i, str6, str5, str4, str3, str2, str);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: bs */
    public ig.d[] newArray(int i) {
        return new ig.d[i];
    }
}
