package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;

public class LocationRequestCreator implements Parcelable.Creator<LocationRequest> {
    public static final int CONTENT_DESCRIPTION = 0;

    /* renamed from: a */
    static void m4090a(LocationRequest locationRequest, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, locationRequest.mPriority);
        C0677b.m1412c(parcel, 1000, locationRequest.getVersionCode());
        C0677b.m1395a(parcel, 2, locationRequest.f3508xB);
        C0677b.m1395a(parcel, 3, locationRequest.f3509xC);
        C0677b.m1404a(parcel, 4, locationRequest.f3510xD);
        C0677b.m1395a(parcel, 5, locationRequest.f3513xu);
        C0677b.m1412c(parcel, 6, locationRequest.f3511xE);
        C0677b.m1394a(parcel, 7, locationRequest.f3512xF);
        C0677b.m1391D(parcel, o);
    }

    public LocationRequest createFromParcel(Parcel parcel) {
        boolean z = false;
        int n = C0675a.m1375n(parcel);
        int i = 102;
        long j = 3600000;
        long j2 = 600000;
        long j3 = Long.MAX_VALUE;
        int i2 = Integer.MAX_VALUE;
        float f = BitmapDescriptorFactory.HUE_RED;
        int i3 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    j = C0675a.m1368h(parcel, m);
                    break;
                case 3:
                    j2 = C0675a.m1368h(parcel, m);
                    break;
                case 4:
                    z = C0675a.m1363c(parcel, m);
                    break;
                case 5:
                    j3 = C0675a.m1368h(parcel, m);
                    break;
                case 6:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                case 7:
                    f = C0675a.m1370j(parcel, m);
                    break;
                case 1000:
                    i3 = C0675a.m1367g(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new LocationRequest(i3, i, j, j2, z, j3, i2, f);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    public LocationRequest[] newArray(int size) {
        return new LocationRequest[size];
    }
}
