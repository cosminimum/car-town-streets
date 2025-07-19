package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.maps.model.k */
public class C1594k {
    /* renamed from: a */
    static void m4283a(VisibleRegion visibleRegion, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, visibleRegion.getVersionCode());
        C0677b.m1399a(parcel, 2, (Parcelable) visibleRegion.nearLeft, i, false);
        C0677b.m1399a(parcel, 3, (Parcelable) visibleRegion.nearRight, i, false);
        C0677b.m1399a(parcel, 4, (Parcelable) visibleRegion.farLeft, i, false);
        C0677b.m1399a(parcel, 5, (Parcelable) visibleRegion.farRight, i, false);
        C0677b.m1399a(parcel, 6, (Parcelable) visibleRegion.latLngBounds, i, false);
        C0677b.m1391D(parcel, o);
    }
}
