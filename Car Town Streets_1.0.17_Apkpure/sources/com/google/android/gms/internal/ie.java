package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import java.util.HashSet;
import java.util.Set;
/* loaded from: classes.dex */
public class ie implements Parcelable.Creator<id> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(id idVar, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        Set<Integer> fa = idVar.fa();
        if (fa.contains(1)) {
            com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, idVar.getVersionCode());
        }
        if (fa.contains(2)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, idVar.getId(), true);
        }
        if (fa.contains(4)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, (Parcelable) idVar.fr(), i, true);
        }
        if (fa.contains(5)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, idVar.getStartDate(), true);
        }
        if (fa.contains(6)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 6, (Parcelable) idVar.fs(), i, true);
        }
        if (fa.contains(7)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 7, idVar.getType(), true);
        }
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: at */
    public id createFromParcel(Parcel parcel) {
        String str = null;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        HashSet hashSet = new HashSet();
        int i = 0;
        ib ibVar = null;
        String str2 = null;
        ib ibVar2 = null;
        String str3 = null;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    hashSet.add(1);
                    break;
                case 2:
                    str3 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    hashSet.add(2);
                    break;
                case 3:
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
                case 4:
                    hashSet.add(4);
                    ibVar2 = (ib) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, ib.CREATOR);
                    break;
                case 5:
                    str2 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    hashSet.add(5);
                    break;
                case 6:
                    hashSet.add(6);
                    ibVar = (ib) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, ib.CREATOR);
                    break;
                case 7:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    hashSet.add(7);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new id(hashSet, i, str3, ibVar2, str2, ibVar, str);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: bl */
    public id[] newArray(int i) {
        return new id[i];
    }
}
