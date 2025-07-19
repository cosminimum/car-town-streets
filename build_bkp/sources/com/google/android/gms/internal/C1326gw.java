package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.location.LocationRequest;

/* renamed from: com.google.android.gms.internal.gw */
public class C1326gw implements Parcelable.Creator<C1325gv> {
    /* renamed from: a */
    static void m3535a(C1325gv gvVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1399a(parcel, 1, (Parcelable) gvVar.mo8136dS(), i, false);
        C0677b.m1412c(parcel, 1000, gvVar.f3010kg);
        C0677b.m1399a(parcel, 2, (Parcelable) gvVar.mo8137dT(), i, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: aZ */
    public C1325gv[] newArray(int i) {
        return new C1325gv[i];
    }

    /* renamed from: ak */
    public C1325gv createFromParcel(Parcel parcel) {
        C1323gt gtVar;
        LocationRequest locationRequest;
        int i;
        C1323gt gtVar2 = null;
        int n = C0675a.m1375n(parcel);
        int i2 = 0;
        LocationRequest locationRequest2 = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = i2;
                    LocationRequest locationRequest3 = (LocationRequest) C0675a.m1356a(parcel, m, LocationRequest.CREATOR);
                    gtVar = gtVar2;
                    locationRequest = locationRequest3;
                    break;
                case 2:
                    gtVar = (C1323gt) C0675a.m1356a(parcel, m, C1323gt.CREATOR);
                    locationRequest = locationRequest2;
                    i = i2;
                    break;
                case 1000:
                    C1323gt gtVar3 = gtVar2;
                    locationRequest = locationRequest2;
                    i = C0675a.m1367g(parcel, m);
                    gtVar = gtVar3;
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    gtVar = gtVar2;
                    locationRequest = locationRequest2;
                    i = i2;
                    break;
            }
            i2 = i;
            locationRequest2 = locationRequest;
            gtVar2 = gtVar;
        }
        if (parcel.dataPosition() == n) {
            return new C1325gv(i2, locationRequest2, gtVar2);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }
}
