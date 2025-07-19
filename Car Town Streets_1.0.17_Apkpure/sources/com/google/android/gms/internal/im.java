package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.internal.ig;
import java.util.HashSet;
import java.util.Set;
/* loaded from: classes.dex */
public class im implements Parcelable.Creator<ig.c> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(ig.c cVar, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        Set<Integer> fa = cVar.fa();
        if (fa.contains(1)) {
            com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, cVar.getVersionCode());
        }
        if (fa.contains(2)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, cVar.getUrl(), true);
        }
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: az */
    public ig.c createFromParcel(Parcel parcel) {
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        HashSet hashSet = new HashSet();
        int i = 0;
        String str = null;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    hashSet.add(1);
                    break;
                case 2:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    hashSet.add(2);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new ig.c(hashSet, i, str);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: br */
    public ig.c[] newArray(int i) {
        return new ig.c[i];
    }
}
