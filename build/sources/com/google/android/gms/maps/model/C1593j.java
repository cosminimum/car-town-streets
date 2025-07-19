package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.maps.model.j */
public class C1593j {
    /* renamed from: a */
    static void m4282a(TileOverlayOptions tileOverlayOptions, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, tileOverlayOptions.getVersionCode());
        C0677b.m1397a(parcel, 2, tileOverlayOptions.mo9523eI(), false);
        C0677b.m1404a(parcel, 3, tileOverlayOptions.isVisible());
        C0677b.m1394a(parcel, 4, tileOverlayOptions.getZIndex());
        C0677b.m1391D(parcel, o);
    }
}
