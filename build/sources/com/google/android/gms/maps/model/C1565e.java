package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.maps.model.e */
public class C1565e {
    /* renamed from: a */
    static void m4239a(LatLng latLng, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, latLng.getVersionCode());
        C0677b.m1393a(parcel, 2, latLng.latitude);
        C0677b.m1393a(parcel, 3, latLng.longitude);
        C0677b.m1391D(parcel, o);
    }
}
