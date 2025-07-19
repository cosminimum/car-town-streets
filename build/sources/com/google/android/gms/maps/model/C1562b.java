package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.maps.model.b */
public class C1562b {
    /* renamed from: a */
    static void m4236a(CircleOptions circleOptions, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, circleOptions.getVersionCode());
        C0677b.m1399a(parcel, 2, (Parcelable) circleOptions.getCenter(), i, false);
        C0677b.m1393a(parcel, 3, circleOptions.getRadius());
        C0677b.m1394a(parcel, 4, circleOptions.getStrokeWidth());
        C0677b.m1412c(parcel, 5, circleOptions.getStrokeColor());
        C0677b.m1412c(parcel, 6, circleOptions.getFillColor());
        C0677b.m1394a(parcel, 7, circleOptions.getZIndex());
        C0677b.m1404a(parcel, 8, circleOptions.isVisible());
        C0677b.m1391D(parcel, o);
    }
}
