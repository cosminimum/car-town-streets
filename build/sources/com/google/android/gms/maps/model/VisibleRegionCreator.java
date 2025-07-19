package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

public class VisibleRegionCreator implements Parcelable.Creator<VisibleRegion> {
    public static final int CONTENT_DESCRIPTION = 0;

    /* renamed from: a */
    static void m4234a(VisibleRegion visibleRegion, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, visibleRegion.getVersionCode());
        C0677b.m1399a(parcel, 2, (Parcelable) visibleRegion.nearLeft, i, false);
        C0677b.m1399a(parcel, 3, (Parcelable) visibleRegion.nearRight, i, false);
        C0677b.m1399a(parcel, 4, (Parcelable) visibleRegion.farLeft, i, false);
        C0677b.m1399a(parcel, 5, (Parcelable) visibleRegion.farRight, i, false);
        C0677b.m1399a(parcel, 6, (Parcelable) visibleRegion.latLngBounds, i, false);
        C0677b.m1391D(parcel, o);
    }

    public VisibleRegion createFromParcel(Parcel parcel) {
        LatLngBounds latLngBounds = null;
        int n = C0675a.m1375n(parcel);
        int i = 0;
        LatLng latLng = null;
        LatLng latLng2 = null;
        LatLng latLng3 = null;
        LatLng latLng4 = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    latLng4 = (LatLng) C0675a.m1356a(parcel, m, LatLng.CREATOR);
                    break;
                case 3:
                    latLng3 = (LatLng) C0675a.m1356a(parcel, m, LatLng.CREATOR);
                    break;
                case 4:
                    latLng2 = (LatLng) C0675a.m1356a(parcel, m, LatLng.CREATOR);
                    break;
                case 5:
                    latLng = (LatLng) C0675a.m1356a(parcel, m, LatLng.CREATOR);
                    break;
                case 6:
                    latLngBounds = (LatLngBounds) C0675a.m1356a(parcel, m, LatLngBounds.CREATOR);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new VisibleRegion(i, latLng4, latLng3, latLng2, latLng, latLngBounds);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    public VisibleRegion[] newArray(int size) {
        return new VisibleRegion[size];
    }
}
