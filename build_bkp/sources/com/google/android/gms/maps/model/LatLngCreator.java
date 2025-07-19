package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

public class LatLngCreator implements Parcelable.Creator<LatLng> {
    public static final int CONTENT_DESCRIPTION = 0;

    /* renamed from: a */
    static void m4222a(LatLng latLng, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, latLng.getVersionCode());
        C0677b.m1393a(parcel, 2, latLng.latitude);
        C0677b.m1393a(parcel, 3, latLng.longitude);
        C0677b.m1391D(parcel, o);
    }

    public LatLng createFromParcel(Parcel parcel) {
        double d = 0.0d;
        int n = C0675a.m1375n(parcel);
        int i = 0;
        double d2 = 0.0d;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    d2 = C0675a.m1371k(parcel, m);
                    break;
                case 3:
                    d = C0675a.m1371k(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new LatLng(i, d2, d);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    public LatLng[] newArray(int size) {
        return new LatLng[size];
    }
}
