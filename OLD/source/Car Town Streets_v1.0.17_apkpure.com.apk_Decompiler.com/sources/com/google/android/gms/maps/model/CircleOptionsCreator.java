package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.common.internal.safeparcel.b;

public class CircleOptionsCreator implements Parcelable.Creator<CircleOptions> {
    public static final int CONTENT_DESCRIPTION = 0;

    static void a(CircleOptions circleOptions, Parcel parcel, int i) {
        int o = b.o(parcel);
        b.c(parcel, 1, circleOptions.getVersionCode());
        b.a(parcel, 2, (Parcelable) circleOptions.getCenter(), i, false);
        b.a(parcel, 3, circleOptions.getRadius());
        b.a(parcel, 4, circleOptions.getStrokeWidth());
        b.c(parcel, 5, circleOptions.getStrokeColor());
        b.c(parcel, 6, circleOptions.getFillColor());
        b.a(parcel, 7, circleOptions.getZIndex());
        b.a(parcel, 8, circleOptions.isVisible());
        b.D(parcel, o);
    }

    public CircleOptions createFromParcel(Parcel parcel) {
        float f = BitmapDescriptorFactory.HUE_RED;
        boolean z = false;
        int n = a.n(parcel);
        LatLng latLng = null;
        double d = 0.0d;
        int i = 0;
        int i2 = 0;
        float f2 = 0.0f;
        int i3 = 0;
        while (parcel.dataPosition() < n) {
            int m = a.m(parcel);
            switch (a.M(m)) {
                case 1:
                    i3 = a.g(parcel, m);
                    break;
                case 2:
                    latLng = (LatLng) a.a(parcel, m, LatLng.CREATOR);
                    break;
                case 3:
                    d = a.k(parcel, m);
                    break;
                case 4:
                    f2 = a.j(parcel, m);
                    break;
                case 5:
                    i2 = a.g(parcel, m);
                    break;
                case 6:
                    i = a.g(parcel, m);
                    break;
                case 7:
                    f = a.j(parcel, m);
                    break;
                case 8:
                    z = a.c(parcel, m);
                    break;
                default:
                    a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new CircleOptions(i3, latLng, d, f2, i2, i, f, z);
        }
        throw new a.C0013a("Overread allowed size end=" + n, parcel);
    }

    public CircleOptions[] newArray(int size) {
        return new CircleOptions[size];
    }
}
