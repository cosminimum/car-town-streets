package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;

/* renamed from: com.google.android.gms.internal.gp */
public class C1319gp implements Parcelable.Creator<C1318go> {
    /* renamed from: a */
    static void m3521a(C1318go goVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1401a(parcel, 1, goVar.getRequestId(), false);
        C0677b.m1412c(parcel, 1000, goVar.getVersionCode());
        C0677b.m1395a(parcel, 2, goVar.getExpirationTime());
        C0677b.m1403a(parcel, 3, goVar.mo8104dK());
        C0677b.m1393a(parcel, 4, goVar.getLatitude());
        C0677b.m1393a(parcel, 5, goVar.getLongitude());
        C0677b.m1394a(parcel, 6, goVar.mo8105dL());
        C0677b.m1412c(parcel, 7, goVar.mo8106dM());
        C0677b.m1412c(parcel, 8, goVar.getNotificationResponsiveness());
        C0677b.m1412c(parcel, 9, goVar.mo8107dN());
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: aX */
    public C1318go[] newArray(int i) {
        return new C1318go[i];
    }

    /* renamed from: ai */
    public C1318go createFromParcel(Parcel parcel) {
        int n = C0675a.m1375n(parcel);
        int i = 0;
        String str = null;
        int i2 = 0;
        short s = 0;
        double d = 0.0d;
        double d2 = 0.0d;
        float f = BitmapDescriptorFactory.HUE_RED;
        long j = 0;
        int i3 = 0;
        int i4 = -1;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 2:
                    j = C0675a.m1368h(parcel, m);
                    break;
                case 3:
                    s = C0675a.m1366f(parcel, m);
                    break;
                case 4:
                    d = C0675a.m1371k(parcel, m);
                    break;
                case 5:
                    d2 = C0675a.m1371k(parcel, m);
                    break;
                case 6:
                    f = C0675a.m1370j(parcel, m);
                    break;
                case 7:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                case 8:
                    i3 = C0675a.m1367g(parcel, m);
                    break;
                case 9:
                    i4 = C0675a.m1367g(parcel, m);
                    break;
                case 1000:
                    i = C0675a.m1367g(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new C1318go(i, str, i2, s, d, d2, f, j, i3, i4);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }
}
