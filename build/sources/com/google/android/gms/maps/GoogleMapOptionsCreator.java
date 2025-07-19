package com.google.android.gms.maps;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.maps.model.CameraPosition;

public class GoogleMapOptionsCreator implements Parcelable.Creator<GoogleMapOptions> {
    public static final int CONTENT_DESCRIPTION = 0;

    /* renamed from: a */
    static void m4127a(GoogleMapOptions googleMapOptions, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, googleMapOptions.getVersionCode());
        C0677b.m1392a(parcel, 2, googleMapOptions.mo9021eo());
        C0677b.m1392a(parcel, 3, googleMapOptions.mo9022ep());
        C0677b.m1412c(parcel, 4, googleMapOptions.getMapType());
        C0677b.m1399a(parcel, 5, (Parcelable) googleMapOptions.getCamera(), i, false);
        C0677b.m1392a(parcel, 6, googleMapOptions.mo9023eq());
        C0677b.m1392a(parcel, 7, googleMapOptions.mo9024er());
        C0677b.m1392a(parcel, 8, googleMapOptions.mo9025es());
        C0677b.m1392a(parcel, 9, googleMapOptions.mo9026et());
        C0677b.m1392a(parcel, 10, googleMapOptions.mo9027eu());
        C0677b.m1392a(parcel, 11, googleMapOptions.mo9028ev());
        C0677b.m1391D(parcel, o);
    }

    public GoogleMapOptions createFromParcel(Parcel parcel) {
        byte b = 0;
        int n = C0675a.m1375n(parcel);
        CameraPosition cameraPosition = null;
        byte b2 = 0;
        byte b3 = 0;
        byte b4 = 0;
        byte b5 = 0;
        byte b6 = 0;
        int i = 0;
        byte b7 = 0;
        byte b8 = 0;
        int i2 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    b8 = C0675a.m1365e(parcel, m);
                    break;
                case 3:
                    b7 = C0675a.m1365e(parcel, m);
                    break;
                case 4:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 5:
                    cameraPosition = (CameraPosition) C0675a.m1356a(parcel, m, CameraPosition.CREATOR);
                    break;
                case 6:
                    b6 = C0675a.m1365e(parcel, m);
                    break;
                case 7:
                    b5 = C0675a.m1365e(parcel, m);
                    break;
                case 8:
                    b4 = C0675a.m1365e(parcel, m);
                    break;
                case 9:
                    b3 = C0675a.m1365e(parcel, m);
                    break;
                case 10:
                    b2 = C0675a.m1365e(parcel, m);
                    break;
                case 11:
                    b = C0675a.m1365e(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new GoogleMapOptions(i2, b8, b7, i, cameraPosition, b6, b5, b4, b3, b2, b);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    public GoogleMapOptions[] newArray(int size) {
        return new GoogleMapOptions[size];
    }
}
