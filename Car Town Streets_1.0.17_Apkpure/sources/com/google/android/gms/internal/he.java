package com.google.android.gms.internal;

import android.net.Uri;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;
import java.util.ArrayList;
/* loaded from: classes.dex */
public class he implements Parcelable.Creator<hd> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(hd hdVar, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 1, hdVar.getId(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, hdVar.ee(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, (Parcelable) hdVar.ef(), i, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, (Parcelable) hdVar.dX(), i, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, hdVar.dY());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 6, (Parcelable) hdVar.dZ(), i, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 7, hdVar.eg(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 8, (Parcelable) hdVar.ea(), i, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 9, hdVar.eb());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 10, hdVar.getRating());
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 11, hdVar.ec());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 12, hdVar.ed());
        com.google.android.gms.common.internal.safeparcel.b.b(parcel, 13, hdVar.dW(), false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1000, hdVar.kg);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: ao */
    public hd createFromParcel(Parcel parcel) {
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i = 0;
        String str = null;
        ArrayList arrayList = null;
        Bundle bundle = null;
        hf hfVar = null;
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
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 2:
                    bundle = com.google.android.gms.common.internal.safeparcel.a.o(parcel, m);
                    break;
                case 3:
                    hfVar = (hf) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, hf.CREATOR);
                    break;
                case 4:
                    latLng = (LatLng) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, LatLng.CREATOR);
                    break;
                case 5:
                    f = com.google.android.gms.common.internal.safeparcel.a.j(parcel, m);
                    break;
                case 6:
                    latLngBounds = (LatLngBounds) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, LatLngBounds.CREATOR);
                    break;
                case 7:
                    str2 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 8:
                    uri = (Uri) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, Uri.CREATOR);
                    break;
                case 9:
                    z = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    break;
                case 10:
                    f2 = com.google.android.gms.common.internal.safeparcel.a.j(parcel, m);
                    break;
                case 11:
                    i2 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 12:
                    j = com.google.android.gms.common.internal.safeparcel.a.h(parcel, m);
                    break;
                case 13:
                    arrayList = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m, gx.CREATOR);
                    break;
                case 1000:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new hd(i, str, arrayList, bundle, hfVar, latLng, f, latLngBounds, str2, uri, z, f2, i2, j);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: be */
    public hd[] newArray(int i) {
        return new hd[i];
    }
}
