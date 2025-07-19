package com.google.android.gms.maps.model;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

public class TileOverlayOptionsCreator implements Parcelable.Creator<TileOverlayOptions> {
    public static final int CONTENT_DESCRIPTION = 0;

    /* renamed from: a */
    static void m4231a(TileOverlayOptions tileOverlayOptions, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, tileOverlayOptions.getVersionCode());
        C0677b.m1397a(parcel, 2, tileOverlayOptions.mo9523eI(), false);
        C0677b.m1404a(parcel, 3, tileOverlayOptions.isVisible());
        C0677b.m1394a(parcel, 4, tileOverlayOptions.getZIndex());
        C0677b.m1404a(parcel, 5, tileOverlayOptions.getFadeIn());
        C0677b.m1391D(parcel, o);
    }

    public TileOverlayOptions createFromParcel(Parcel parcel) {
        boolean z = false;
        int n = C0675a.m1375n(parcel);
        IBinder iBinder = null;
        float f = BitmapDescriptorFactory.HUE_RED;
        boolean z2 = true;
        int i = 0;
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
                    z = C0675a.m1363c(parcel, m);
                    break;
                case 4:
                    f = C0675a.m1370j(parcel, m);
                    break;
                case 5:
                    z2 = C0675a.m1363c(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new TileOverlayOptions(i, iBinder, z, f, z2);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    public TileOverlayOptions[] newArray(int size) {
        return new TileOverlayOptions[size];
    }
}
