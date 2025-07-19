package com.google.android.gms.internal;

import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;
import java.util.ArrayList;

/* renamed from: com.google.android.gms.internal.he */
public class C1339he implements Parcelable.Creator<C1336hd> {
    /* renamed from: a */
    static void m3577a(C1336hd hdVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1401a(parcel, 1, hdVar.getId(), false);
        C0677b.m1396a(parcel, 2, hdVar.mo8189ee(), false);
        C0677b.m1399a(parcel, 3, (Parcelable) hdVar.mo8190ef(), i, false);
        C0677b.m1399a(parcel, 4, (Parcelable) hdVar.mo8181dX(), i, false);
        C0677b.m1394a(parcel, 5, hdVar.mo8182dY());
        C0677b.m1399a(parcel, 6, (Parcelable) hdVar.mo8183dZ(), i, false);
        C0677b.m1401a(parcel, 7, hdVar.mo8191eg(), false);
        C0677b.m1399a(parcel, 8, (Parcelable) hdVar.mo8185ea(), i, false);
        C0677b.m1404a(parcel, 9, hdVar.mo8186eb());
        C0677b.m1394a(parcel, 10, hdVar.getRating());
        C0677b.m1412c(parcel, 11, hdVar.mo8187ec());
        C0677b.m1395a(parcel, 12, hdVar.mo8188ed());
        C0677b.m1411b(parcel, 13, hdVar.mo8180dW(), false);
        C0677b.m1412c(parcel, 1000, hdVar.f3167kg);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: ao */
    public C1336hd createFromParcel(Parcel parcel) {
        int n = C0675a.m1375n(parcel);
        int i = 0;
        String str = null;
        ArrayList arrayList = null;
        Bundle bundle = null;
        C1340hf hfVar = null;
        LatLng latLng = null;
        float f = BitmapDescriptorFactory.HUE_RED;
        LatLngBounds latLngBounds = null;
        String str2 = null;
        Uri uri = null;
        boolean z = false;
        float f2 = BitmapDescriptorFactory.HUE_RED;
        int i2 = 0;
        long j = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 2:
                    bundle = C0675a.m1377o(parcel, m);
                    break;
                case 3:
                    hfVar = (C1340hf) C0675a.m1356a(parcel, m, C1340hf.CREATOR);
                    break;
                case 4:
                    latLng = (LatLng) C0675a.m1356a(parcel, m, LatLng.CREATOR);
                    break;
                case 5:
                    f = C0675a.m1370j(parcel, m);
                    break;
                case 6:
                    latLngBounds = (LatLngBounds) C0675a.m1356a(parcel, m, LatLngBounds.CREATOR);
                    break;
                case 7:
                    str2 = C0675a.m1374m(parcel, m);
                    break;
                case 8:
                    uri = (Uri) C0675a.m1356a(parcel, m, Uri.CREATOR);
                    break;
                case 9:
                    z = C0675a.m1363c(parcel, m);
                    break;
                case 10:
                    f2 = C0675a.m1370j(parcel, m);
                    break;
                case 11:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                case 12:
                    j = C0675a.m1368h(parcel, m);
                    break;
                case 13:
                    arrayList = C0675a.m1362c(parcel, m, C1327gx.CREATOR);
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
            return new C1336hd(i, str, arrayList, bundle, hfVar, latLng, f, latLngBounds, str2, uri, z, f2, i2, j);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: be */
    public C1336hd[] newArray(int i) {
        return new C1336hd[i];
    }
}
