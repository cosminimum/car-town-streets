package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.maps.model.a */
public class C1561a {
    /* renamed from: a */
    static void m4235a(CameraPosition cameraPosition, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, cameraPosition.getVersionCode());
        C0677b.m1399a(parcel, 2, (Parcelable) cameraPosition.target, i, false);
        C0677b.m1394a(parcel, 3, cameraPosition.zoom);
        C0677b.m1394a(parcel, 4, cameraPosition.tilt);
        C0677b.m1394a(parcel, 5, cameraPosition.bearing);
        C0677b.m1391D(parcel, o);
    }
}
