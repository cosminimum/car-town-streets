package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;
/* loaded from: classes.dex */
public class e implements Parcelable.Creator<InFilter> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(InFilter inFilter, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1000, inFilter.kg);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 1, (Parcelable) inFilter.rS, i, false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: U */
    public InFilter createFromParcel(Parcel parcel) {
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i = 0;
        MetadataBundle metadataBundle = null;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    metadataBundle = (MetadataBundle) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, MetadataBundle.CREATOR);
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
        return new InFilter(i, metadataBundle);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: au */
    public InFilter[] newArray(int i) {
        return new InFilter[i];
    }
}
