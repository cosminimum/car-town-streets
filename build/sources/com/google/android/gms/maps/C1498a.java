package com.google.android.gms.maps;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.maps.a */
public class C1498a {
    /* renamed from: a */
    static void m4141a(GoogleMapOptions googleMapOptions, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, googleMapOptions.getVersionCode());
        C0677b.m1392a(parcel, 2, googleMapOptions.mo9021eo());
        C0677b.m1392a(parcel, 3, googleMapOptions.mo9022ep());
        C0677b.m1412c(parcel, 4, googleMapOptions.getMapType());
        C0677b.m1399a(parcel, 5, (Parcelable) googleMapOptions.getCamera(), i, false);
        C0677b.m1392a(parcel, 6, googleMapOptions.mo9023eq());
        C0677b.m1392a(parcel, 7, googleMapOptions.mo9024er());
        C0677b.m1392a(parcel, 8, googleMapOptions.mo9025es());
        C0677b.m1392a(parcel, 9, googleMapOptions.mo9026et());
        C0677b.m1392a(parcel, 10, googleMapOptions.mo9027eu());
        C0677b.m1392a(parcel, 11, googleMapOptions.mo9028ev());
        C0677b.m1391D(parcel, o);
    }
}
