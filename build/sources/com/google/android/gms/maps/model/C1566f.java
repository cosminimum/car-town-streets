package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.maps.model.f */
public class C1566f {
    /* renamed from: a */
    static void m4240a(MarkerOptions markerOptions, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, markerOptions.getVersionCode());
        C0677b.m1399a(parcel, 2, (Parcelable) markerOptions.getPosition(), i, false);
        C0677b.m1401a(parcel, 3, markerOptions.getTitle(), false);
        C0677b.m1401a(parcel, 4, markerOptions.getSnippet(), false);
        C0677b.m1397a(parcel, 5, markerOptions.mo9401eG(), false);
        C0677b.m1394a(parcel, 6, markerOptions.getAnchorU());
        C0677b.m1394a(parcel, 7, markerOptions.getAnchorV());
        C0677b.m1404a(parcel, 8, markerOptions.isDraggable());
        C0677b.m1404a(parcel, 9, markerOptions.isVisible());
        C0677b.m1391D(parcel, o);
    }
}
