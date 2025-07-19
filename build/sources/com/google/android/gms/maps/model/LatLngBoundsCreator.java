package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

public class LatLngBoundsCreator implements Parcelable.Creator<LatLngBounds> {
    public static final int CONTENT_DESCRIPTION = 0;

    /* renamed from: a */
    static void m4221a(LatLngBounds latLngBounds, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, latLngBounds.getVersionCode());
        C0677b.m1399a(parcel, 2, (Parcelable) latLngBounds.southwest, i, false);
        C0677b.m1399a(parcel, 3, (Parcelable) latLngBounds.northeast, i, false);
        C0677b.m1391D(parcel, o);
    }

    public LatLngBounds createFromParcel(Parcel parcel) {
        LatLng latLng;
        LatLng latLng2;
        int i;
        LatLng latLng3 = null;
        int n = C0675a.m1375n(parcel);
        int i2 = 0;
        LatLng latLng4 = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    LatLng latLng5 = latLng3;
                    latLng2 = latLng4;
                    i = C0675a.m1367g(parcel, m);
                    latLng = latLng5;
                    break;
                case 2:
                    i = i2;
                    LatLng latLng6 = (LatLng) C0675a.m1356a(parcel, m, LatLng.CREATOR);
                    latLng = latLng3;
                    latLng2 = latLng6;
                    break;
                case 3:
                    latLng = (LatLng) C0675a.m1356a(parcel, m, LatLng.CREATOR);
                    latLng2 = latLng4;
                    i = i2;
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    latLng = latLng3;
                    latLng2 = latLng4;
                    i = i2;
                    break;
            }
            i2 = i;
            latLng4 = latLng2;
            latLng3 = latLng;
        }
        if (parcel.dataPosition() == n) {
            return new LatLngBounds(i2, latLng4, latLng3);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    public LatLngBounds[] newArray(int size) {
        return new LatLngBounds[size];
    }
}
