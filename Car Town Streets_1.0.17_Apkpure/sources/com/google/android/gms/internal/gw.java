package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.location.LocationRequest;
/* loaded from: classes.dex */
public class gw implements Parcelable.Creator<gv> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(gv gvVar, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 1, (Parcelable) gvVar.dS(), i, false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1000, gvVar.kg);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, (Parcelable) gvVar.dT(), i, false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: aZ */
    public gv[] newArray(int i) {
        return new gv[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: ak */
    public gv createFromParcel(Parcel parcel) {
        gt gtVar;
        LocationRequest locationRequest;
        int i;
        gt gtVar2 = null;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i2 = 0;
        LocationRequest locationRequest2 = null;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    LocationRequest locationRequest3 = (LocationRequest) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, LocationRequest.CREATOR);
                    i = i2;
                    gtVar = gtVar2;
                    locationRequest = locationRequest3;
                    break;
                case 2:
                    gtVar = (gt) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, gt.CREATOR);
                    locationRequest = locationRequest2;
                    i = i2;
                    break;
                case 1000:
                    gt gtVar3 = gtVar2;
                    locationRequest = locationRequest2;
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    gtVar = gtVar3;
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    gtVar = gtVar2;
                    locationRequest = locationRequest2;
                    i = i2;
                    break;
            }
            i2 = i;
            locationRequest2 = locationRequest;
            gtVar2 = gtVar;
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new gv(i2, locationRequest2, gtVar2);
    }
}
