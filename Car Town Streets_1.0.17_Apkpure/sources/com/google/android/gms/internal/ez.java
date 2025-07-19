package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
/* loaded from: classes.dex */
public class ez implements Parcelable.Creator<ey> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(ey eyVar, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, eyVar.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, eyVar.cB(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, (Parcelable) eyVar.cC(), i, false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: V */
    public ey[] newArray(int i) {
        return new ey[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: x */
    public ey createFromParcel(Parcel parcel) {
        ev evVar = null;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i = 0;
        Parcel parcel2 = null;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 2:
                    parcel2 = com.google.android.gms.common.internal.safeparcel.a.z(parcel, m);
                    break;
                case 3:
                    evVar = (ev) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, ev.CREATOR);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new ey(i, parcel2, evVar);
    }
}
