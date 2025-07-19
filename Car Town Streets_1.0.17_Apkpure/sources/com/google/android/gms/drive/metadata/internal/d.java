package com.google.android.gms.drive.metadata.internal;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
/* loaded from: classes.dex */
public class d implements Parcelable.Creator<MetadataBundle> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(MetadataBundle metadataBundle, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, metadataBundle.kg);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, metadataBundle.rF, false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: P */
    public MetadataBundle createFromParcel(Parcel parcel) {
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i = 0;
        Bundle bundle = null;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 2:
                    bundle = com.google.android.gms.common.internal.safeparcel.a.o(parcel, m);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new MetadataBundle(i, bundle);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: ap */
    public MetadataBundle[] newArray(int i) {
        return new MetadataBundle[i];
    }
}
