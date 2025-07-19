package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

public class CameraPositionCreator implements Parcelable.Creator<CameraPosition> {
    public static final int CONTENT_DESCRIPTION = 0;

    /* renamed from: a */
    static void m4209a(CameraPosition cameraPosition, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, cameraPosition.getVersionCode());
        C0677b.m1399a(parcel, 2, (Parcelable) cameraPosition.target, i, false);
        C0677b.m1394a(parcel, 3, cameraPosition.zoom);
        C0677b.m1394a(parcel, 4, cameraPosition.tilt);
        C0677b.m1394a(parcel, 5, cameraPosition.bearing);
        C0677b.m1391D(parcel, o);
    }

    public CameraPosition createFromParcel(Parcel parcel) {
        float f = BitmapDescriptorFactory.HUE_RED;
        int n = C0675a.m1375n(parcel);
        int i = 0;
        LatLng latLng = null;
        float f2 = 0.0f;
        float f3 = 0.0f;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    latLng = (LatLng) C0675a.m1356a(parcel, m, LatLng.CREATOR);
                    break;
                case 3:
                    f3 = C0675a.m1370j(parcel, m);
                    break;
                case 4:
                    f2 = C0675a.m1370j(parcel, m);
                    break;
                case 5:
                    f = C0675a.m1370j(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new CameraPosition(i, latLng, f3, f2, f);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    public CameraPosition[] newArray(int size) {
        return new CameraPosition[size];
    }
}
