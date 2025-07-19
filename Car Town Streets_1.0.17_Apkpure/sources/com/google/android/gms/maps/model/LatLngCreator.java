package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
/* loaded from: classes.dex */
public class LatLngCreator implements Parcelable.Creator<LatLng> {
    public static final int CONTENT_DESCRIPTION = 0;

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(LatLng latLng, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, latLng.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, latLng.latitude);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, latLng.longitude);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // android.os.Parcelable.Creator
    /* renamed from: createFromParcel */
    public LatLng mo376createFromParcel(Parcel parcel) {
        double d = 0.0d;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i = 0;
        double d2 = 0.0d;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 2:
                    d2 = com.google.android.gms.common.internal.safeparcel.a.k(parcel, m);
                    break;
                case 3:
                    d = com.google.android.gms.common.internal.safeparcel.a.k(parcel, m);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new LatLng(i, d2, d);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // android.os.Parcelable.Creator
    /* renamed from: newArray */
    public LatLng[] mo377newArray(int size) {
        return new LatLng[size];
    }
}
