package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

public class CircleOptionsCreator implements Parcelable.Creator<CircleOptions> {
    public static final int CONTENT_DESCRIPTION = 0;

    /* renamed from: a */
    static void m4210a(CircleOptions circleOptions, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, circleOptions.getVersionCode());
        C0677b.m1399a(parcel, 2, (Parcelable) circleOptions.getCenter(), i, false);
        C0677b.m1393a(parcel, 3, circleOptions.getRadius());
        C0677b.m1394a(parcel, 4, circleOptions.getStrokeWidth());
        C0677b.m1412c(parcel, 5, circleOptions.getStrokeColor());
        C0677b.m1412c(parcel, 6, circleOptions.getFillColor());
        C0677b.m1394a(parcel, 7, circleOptions.getZIndex());
        C0677b.m1404a(parcel, 8, circleOptions.isVisible());
        C0677b.m1391D(parcel, o);
    }

    public CircleOptions createFromParcel(Parcel parcel) {
        float f = BitmapDescriptorFactory.HUE_RED;
        boolean z = false;
        int n = C0675a.m1375n(parcel);
        LatLng latLng = null;
        double d = 0.0d;
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
                    latLng = (LatLng) C0675a.m1356a(parcel, m, LatLng.CREATOR);
                    break;
                case 3:
                    d = C0675a.m1371k(parcel, m);
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
                    z = C0675a.m1363c(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new CircleOptions(i3, latLng, d, f2, i2, i, f, z);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    public CircleOptions[] newArray(int size) {
        return new CircleOptions[size];
    }
}
