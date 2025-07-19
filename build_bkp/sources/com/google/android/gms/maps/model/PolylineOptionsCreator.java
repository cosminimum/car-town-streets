package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import java.util.ArrayList;

public class PolylineOptionsCreator implements Parcelable.Creator<PolylineOptions> {
    public static final int CONTENT_DESCRIPTION = 0;

    /* renamed from: a */
    static void m4227a(PolylineOptions polylineOptions, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, polylineOptions.getVersionCode());
        C0677b.m1411b(parcel, 2, polylineOptions.getPoints(), false);
        C0677b.m1394a(parcel, 3, polylineOptions.getWidth());
        C0677b.m1412c(parcel, 4, polylineOptions.getColor());
        C0677b.m1394a(parcel, 5, polylineOptions.getZIndex());
        C0677b.m1404a(parcel, 6, polylineOptions.isVisible());
        C0677b.m1404a(parcel, 7, polylineOptions.isGeodesic());
        C0677b.m1391D(parcel, o);
    }

    public PolylineOptions createFromParcel(Parcel parcel) {
        float f = BitmapDescriptorFactory.HUE_RED;
        boolean z = false;
        int n = C0675a.m1375n(parcel);
        ArrayList arrayList = null;
        boolean z2 = false;
        int i = 0;
        float f2 = 0.0f;
        int i2 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    arrayList = C0675a.m1362c(parcel, m, LatLng.CREATOR);
                    break;
                case 3:
                    f2 = C0675a.m1370j(parcel, m);
                    break;
                case 4:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 5:
                    f = C0675a.m1370j(parcel, m);
                    break;
                case 6:
                    z2 = C0675a.m1363c(parcel, m);
                    break;
                case 7:
                    z = C0675a.m1363c(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new PolylineOptions(i2, arrayList, f2, i, f, z2, z);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    public PolylineOptions[] newArray(int size) {
        return new PolylineOptions[size];
    }
}
