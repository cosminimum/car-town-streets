package com.google.android.gms.maps.model;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

public class MarkerOptionsCreator implements Parcelable.Creator<MarkerOptions> {
    public static final int CONTENT_DESCRIPTION = 0;

    /* renamed from: a */
    static void m4224a(MarkerOptions markerOptions, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, markerOptions.getVersionCode());
        C0677b.m1399a(parcel, 2, (Parcelable) markerOptions.getPosition(), i, false);
        C0677b.m1401a(parcel, 3, markerOptions.getTitle(), false);
        C0677b.m1401a(parcel, 4, markerOptions.getSnippet(), false);
        C0677b.m1397a(parcel, 5, markerOptions.mo9401eG(), false);
        C0677b.m1394a(parcel, 6, markerOptions.getAnchorU());
        C0677b.m1394a(parcel, 7, markerOptions.getAnchorV());
        C0677b.m1404a(parcel, 8, markerOptions.isDraggable());
        C0677b.m1404a(parcel, 9, markerOptions.isVisible());
        C0677b.m1404a(parcel, 10, markerOptions.isFlat());
        C0677b.m1394a(parcel, 11, markerOptions.getRotation());
        C0677b.m1394a(parcel, 12, markerOptions.getInfoWindowAnchorU());
        C0677b.m1394a(parcel, 13, markerOptions.getInfoWindowAnchorV());
        C0677b.m1394a(parcel, 14, markerOptions.getAlpha());
        C0677b.m1391D(parcel, o);
    }

    public MarkerOptions createFromParcel(Parcel parcel) {
        int n = C0675a.m1375n(parcel);
        int i = 0;
        LatLng latLng = null;
        String str = null;
        String str2 = null;
        IBinder iBinder = null;
        float f = BitmapDescriptorFactory.HUE_RED;
        float f2 = BitmapDescriptorFactory.HUE_RED;
        boolean z = false;
        boolean z2 = false;
        boolean z3 = false;
        float f3 = BitmapDescriptorFactory.HUE_RED;
        float f4 = 0.5f;
        float f5 = BitmapDescriptorFactory.HUE_RED;
        float f6 = 1.0f;
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
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 4:
                    str2 = C0675a.m1374m(parcel, m);
                    break;
                case 5:
                    iBinder = C0675a.m1376n(parcel, m);
                    break;
                case 6:
                    f = C0675a.m1370j(parcel, m);
                    break;
                case 7:
                    f2 = C0675a.m1370j(parcel, m);
                    break;
                case 8:
                    z = C0675a.m1363c(parcel, m);
                    break;
                case 9:
                    z2 = C0675a.m1363c(parcel, m);
                    break;
                case 10:
                    z3 = C0675a.m1363c(parcel, m);
                    break;
                case 11:
                    f3 = C0675a.m1370j(parcel, m);
                    break;
                case 12:
                    f4 = C0675a.m1370j(parcel, m);
                    break;
                case 13:
                    f5 = C0675a.m1370j(parcel, m);
                    break;
                case 14:
                    f6 = C0675a.m1370j(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new MarkerOptions(i, latLng, str, str2, iBinder, f, f2, z, z2, z3, f3, f4, f5, f6);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    public MarkerOptions[] newArray(int size) {
        return new MarkerOptions[size];
    }
}
