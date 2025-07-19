package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import java.util.ArrayList;
import java.util.List;

public class PolygonOptionsCreator implements Parcelable.Creator<PolygonOptions> {
    public static final int CONTENT_DESCRIPTION = 0;

    /* renamed from: a */
    static void m4226a(PolygonOptions polygonOptions, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, polygonOptions.getVersionCode());
        C0677b.m1411b(parcel, 2, polygonOptions.getPoints(), false);
        C0677b.m1413c(parcel, 3, polygonOptions.mo9452eH(), false);
        C0677b.m1394a(parcel, 4, polygonOptions.getStrokeWidth());
        C0677b.m1412c(parcel, 5, polygonOptions.getStrokeColor());
        C0677b.m1412c(parcel, 6, polygonOptions.getFillColor());
        C0677b.m1394a(parcel, 7, polygonOptions.getZIndex());
        C0677b.m1404a(parcel, 8, polygonOptions.isVisible());
        C0677b.m1404a(parcel, 9, polygonOptions.isGeodesic());
        C0677b.m1391D(parcel, o);
    }

    public PolygonOptions createFromParcel(Parcel parcel) {
        float f = BitmapDescriptorFactory.HUE_RED;
        boolean z = false;
        int n = C0675a.m1375n(parcel);
        ArrayList arrayList = null;
        ArrayList arrayList2 = new ArrayList();
        boolean z2 = false;
        int i = 0;
        int i2 = 0;
        float f2 = 0.0f;
        int i3 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i3 = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    arrayList = C0675a.m1362c(parcel, m, LatLng.CREATOR);
                    break;
                case 3:
                    C0675a.m1359a(parcel, m, (List) arrayList2, getClass().getClassLoader());
                    break;
                case 4:
                    f2 = C0675a.m1370j(parcel, m);
                    break;
                case 5:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                case 6:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 7:
                    f = C0675a.m1370j(parcel, m);
                    break;
                case 8:
                    z2 = C0675a.m1363c(parcel, m);
                    break;
                case 9:
                    z = C0675a.m1363c(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new PolygonOptions(i3, arrayList, arrayList2, f2, i2, i, f, z2, z);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    public PolygonOptions[] newArray(int size) {
        return new PolygonOptions[size];
    }
}
