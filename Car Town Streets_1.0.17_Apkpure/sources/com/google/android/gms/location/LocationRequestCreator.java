package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
/* loaded from: classes.dex */
public class LocationRequestCreator implements Parcelable.Creator<LocationRequest> {
    public static final int CONTENT_DESCRIPTION = 0;

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(LocationRequest locationRequest, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, locationRequest.mPriority);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1000, locationRequest.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, locationRequest.xB);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, locationRequest.xC);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, locationRequest.xD);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, locationRequest.xu);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 6, locationRequest.xE);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 7, locationRequest.xF);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // android.os.Parcelable.Creator
    /* renamed from: createFromParcel */
    public LocationRequest mo364createFromParcel(Parcel parcel) {
        boolean z = false;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i = 102;
        long j = 3600000;
        long j2 = 600000;
        long j3 = Long.MAX_VALUE;
        int i2 = Integer.MAX_VALUE;
        float f = BitmapDescriptorFactory.HUE_RED;
        int i3 = 0;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 2:
                    j = com.google.android.gms.common.internal.safeparcel.a.h(parcel, m);
                    break;
                case 3:
                    j2 = com.google.android.gms.common.internal.safeparcel.a.h(parcel, m);
                    break;
                case 4:
                    z = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    break;
                case 5:
                    j3 = com.google.android.gms.common.internal.safeparcel.a.h(parcel, m);
                    break;
                case 6:
                    i2 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 7:
                    f = com.google.android.gms.common.internal.safeparcel.a.j(parcel, m);
                    break;
                case 1000:
                    i3 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new LocationRequest(i3, i, j, j2, z, j3, i2, f);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // android.os.Parcelable.Creator
    /* renamed from: newArray */
    public LocationRequest[] mo365newArray(int size) {
        return new LocationRequest[size];
    }
}
