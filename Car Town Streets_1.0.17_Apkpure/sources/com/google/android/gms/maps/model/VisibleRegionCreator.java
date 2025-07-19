package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
/* loaded from: classes.dex */
public class VisibleRegionCreator implements Parcelable.Creator<VisibleRegion> {
    public static final int CONTENT_DESCRIPTION = 0;

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(VisibleRegion visibleRegion, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, visibleRegion.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, (Parcelable) visibleRegion.nearLeft, i, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, (Parcelable) visibleRegion.nearRight, i, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, (Parcelable) visibleRegion.farLeft, i, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, (Parcelable) visibleRegion.farRight, i, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 6, (Parcelable) visibleRegion.latLngBounds, i, false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // android.os.Parcelable.Creator
    /* renamed from: createFromParcel */
    public VisibleRegion mo388createFromParcel(Parcel parcel) {
        LatLngBounds latLngBounds = null;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i = 0;
        LatLng latLng = null;
        LatLng latLng2 = null;
        LatLng latLng3 = null;
        LatLng latLng4 = null;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 2:
                    latLng4 = (LatLng) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, LatLng.CREATOR);
                    break;
                case 3:
                    latLng3 = (LatLng) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, LatLng.CREATOR);
                    break;
                case 4:
                    latLng2 = (LatLng) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, LatLng.CREATOR);
                    break;
                case 5:
                    latLng = (LatLng) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, LatLng.CREATOR);
                    break;
                case 6:
                    latLngBounds = (LatLngBounds) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, LatLngBounds.CREATOR);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new VisibleRegion(i, latLng4, latLng3, latLng2, latLng, latLngBounds);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // android.os.Parcelable.Creator
    /* renamed from: newArray */
    public VisibleRegion[] mo389newArray(int size) {
        return new VisibleRegion[size];
    }
}
