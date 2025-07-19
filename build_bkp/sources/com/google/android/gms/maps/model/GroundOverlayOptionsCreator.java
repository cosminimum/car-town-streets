package com.google.android.gms.maps.model;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

public class GroundOverlayOptionsCreator implements Parcelable.Creator<GroundOverlayOptions> {
    public static final int CONTENT_DESCRIPTION = 0;

    /* renamed from: a */
    static void m4213a(GroundOverlayOptions groundOverlayOptions, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, groundOverlayOptions.getVersionCode());
        C0677b.m1397a(parcel, 2, groundOverlayOptions.mo9327eF(), false);
        C0677b.m1399a(parcel, 3, (Parcelable) groundOverlayOptions.getLocation(), i, false);
        C0677b.m1394a(parcel, 4, groundOverlayOptions.getWidth());
        C0677b.m1394a(parcel, 5, groundOverlayOptions.getHeight());
        C0677b.m1399a(parcel, 6, (Parcelable) groundOverlayOptions.getBounds(), i, false);
        C0677b.m1394a(parcel, 7, groundOverlayOptions.getBearing());
        C0677b.m1394a(parcel, 8, groundOverlayOptions.getZIndex());
        C0677b.m1404a(parcel, 9, groundOverlayOptions.isVisible());
        C0677b.m1394a(parcel, 10, groundOverlayOptions.getTransparency());
        C0677b.m1394a(parcel, 11, groundOverlayOptions.getAnchorU());
        C0677b.m1394a(parcel, 12, groundOverlayOptions.getAnchorV());
        C0677b.m1391D(parcel, o);
    }

    public GroundOverlayOptions createFromParcel(Parcel parcel) {
        int n = C0675a.m1375n(parcel);
        int i = 0;
        IBinder iBinder = null;
        LatLng latLng = null;
        float f = BitmapDescriptorFactory.HUE_RED;
        float f2 = BitmapDescriptorFactory.HUE_RED;
        LatLngBounds latLngBounds = null;
        float f3 = BitmapDescriptorFactory.HUE_RED;
        float f4 = BitmapDescriptorFactory.HUE_RED;
        boolean z = false;
        float f5 = BitmapDescriptorFactory.HUE_RED;
        float f6 = BitmapDescriptorFactory.HUE_RED;
        float f7 = BitmapDescriptorFactory.HUE_RED;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    iBinder = C0675a.m1376n(parcel, m);
                    break;
                case 3:
                    latLng = (LatLng) C0675a.m1356a(parcel, m, LatLng.CREATOR);
                    break;
                case 4:
                    f = C0675a.m1370j(parcel, m);
                    break;
                case 5:
                    f2 = C0675a.m1370j(parcel, m);
                    break;
                case 6:
                    latLngBounds = (LatLngBounds) C0675a.m1356a(parcel, m, LatLngBounds.CREATOR);
                    break;
                case 7:
                    f3 = C0675a.m1370j(parcel, m);
                    break;
                case 8:
                    f4 = C0675a.m1370j(parcel, m);
                    break;
                case 9:
                    z = C0675a.m1363c(parcel, m);
                    break;
                case 10:
                    f5 = C0675a.m1370j(parcel, m);
                    break;
                case 11:
                    f6 = C0675a.m1370j(parcel, m);
                    break;
                case 12:
                    f7 = C0675a.m1370j(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new GroundOverlayOptions(i, iBinder, latLng, f, f2, latLngBounds, f3, f4, z, f5, f6, f7);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    public GroundOverlayOptions[] newArray(int size) {
        return new GroundOverlayOptions[size];
    }
}
