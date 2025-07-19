package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.maps.model.d */
public class C1564d {
    /* renamed from: a */
    static void m4238a(LatLngBounds latLngBounds, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, latLngBounds.getVersionCode());
        C0677b.m1399a(parcel, 2, (Parcelable) latLngBounds.southwest, i, false);
        C0677b.m1399a(parcel, 3, (Parcelable) latLngBounds.northeast, i, false);
        C0677b.m1391D(parcel, o);
    }
}
