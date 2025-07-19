package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.maps.model.g */
public class C1567g {
    /* renamed from: a */
    static void m4241a(PolygonOptions polygonOptions, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, polygonOptions.getVersionCode());
        C0677b.m1411b(parcel, 2, polygonOptions.getPoints(), false);
        C0677b.m1413c(parcel, 3, polygonOptions.mo9452eH(), false);
        C0677b.m1394a(parcel, 4, polygonOptions.getStrokeWidth());
        C0677b.m1412c(parcel, 5, polygonOptions.getStrokeColor());
        C0677b.m1412c(parcel, 6, polygonOptions.getFillColor());
        C0677b.m1394a(parcel, 7, polygonOptions.getZIndex());
        C0677b.m1404a(parcel, 8, polygonOptions.isVisible());
        C0677b.m1404a(parcel, 9, polygonOptions.isGeodesic());
        C0677b.m1391D(parcel, o);
    }
}
