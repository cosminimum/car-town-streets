package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.maps.model.c */
public class C1563c {
    /* renamed from: a */
    static void m4237a(GroundOverlayOptions groundOverlayOptions, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, groundOverlayOptions.getVersionCode());
        C0677b.m1397a(parcel, 2, groundOverlayOptions.mo9327eF(), false);
        C0677b.m1399a(parcel, 3, (Parcelable) groundOverlayOptions.getLocation(), i, false);
        C0677b.m1394a(parcel, 4, groundOverlayOptions.getWidth());
        C0677b.m1394a(parcel, 5, groundOverlayOptions.getHeight());
        C0677b.m1399a(parcel, 6, (Parcelable) groundOverlayOptions.getBounds(), i, false);
        C0677b.m1394a(parcel, 7, groundOverlayOptions.getBearing());
        C0677b.m1394a(parcel, 8, groundOverlayOptions.getZIndex());
        C0677b.m1404a(parcel, 9, groundOverlayOptions.isVisible());
        C0677b.m1394a(parcel, 10, groundOverlayOptions.getTransparency());
        C0677b.m1394a(parcel, 11, groundOverlayOptions.getAnchorU());
        C0677b.m1394a(parcel, 12, groundOverlayOptions.getAnchorV());
        C0677b.m1391D(parcel, o);
    }
}
