package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.maps.model.h */
public class C1568h {
    /* renamed from: a */
    static void m4242a(PolylineOptions polylineOptions, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, polylineOptions.getVersionCode());
        C0677b.m1411b(parcel, 2, polylineOptions.getPoints(), false);
        C0677b.m1394a(parcel, 3, polylineOptions.getWidth());
        C0677b.m1412c(parcel, 4, polylineOptions.getColor());
        C0677b.m1394a(parcel, 5, polylineOptions.getZIndex());
        C0677b.m1404a(parcel, 6, polylineOptions.isVisible());
        C0677b.m1404a(parcel, 7, polylineOptions.isGeodesic());
        C0677b.m1391D(parcel, o);
    }
}
