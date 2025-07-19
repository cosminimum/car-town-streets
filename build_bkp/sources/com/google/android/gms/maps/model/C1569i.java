package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.maps.model.i */
public class C1569i {
    /* renamed from: a */
    static void m4243a(Tile tile, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, tile.getVersionCode());
        C0677b.m1412c(parcel, 2, tile.width);
        C0677b.m1412c(parcel, 3, tile.height);
        C0677b.m1405a(parcel, 4, tile.data, false);
        C0677b.m1391D(parcel, o);
    }
}
