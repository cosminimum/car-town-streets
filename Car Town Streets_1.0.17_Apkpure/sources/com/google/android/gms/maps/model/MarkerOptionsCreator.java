package com.google.android.gms.maps.model;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
/* loaded from: classes.dex */
public class MarkerOptionsCreator implements Parcelable.Creator<MarkerOptions> {
    public static final int CONTENT_DESCRIPTION = 0;

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(MarkerOptions markerOptions, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, markerOptions.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, (Parcelable) markerOptions.getPosition(), i, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, markerOptions.getTitle(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, markerOptions.getSnippet(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, markerOptions.eG(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 6, markerOptions.getAnchorU());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 7, markerOptions.getAnchorV());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 8, markerOptions.isDraggable());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 9, markerOptions.isVisible());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 10, markerOptions.isFlat());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 11, markerOptions.getRotation());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 12, markerOptions.getInfoWindowAnchorU());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 13, markerOptions.getInfoWindowAnchorV());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 14, markerOptions.getAlpha());
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // android.os.Parcelable.Creator
    /* renamed from: createFromParcel */
    public MarkerOptions mo378createFromParcel(Parcel parcel) {
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i = 0;
        LatLng latLng = null;
        String str = null;
        String str2 = null;
        IBinder iBinder = null;
        float f = BitmapDescriptorFactory.HUE_RED;
        float f2 = BitmapDescriptorFactory.HUE_RED;
        boolean z = false;
        boolean z2 = false;
        boolean z3 = false;
        float f3 = BitmapDescriptorFactory.HUE_RED;
        float f4 = 0.5f;
        float f5 = BitmapDescriptorFactory.HUE_RED;
        float f6 = 1.0f;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 2:
                    latLng = (LatLng) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, LatLng.CREATOR);
                    break;
                case 3:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 4:
                    str2 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 5:
                    iBinder = com.google.android.gms.common.internal.safeparcel.a.n(parcel, m);
                    break;
                case 6:
                    f = com.google.android.gms.common.internal.safeparcel.a.j(parcel, m);
                    break;
                case 7:
                    f2 = com.google.android.gms.common.internal.safeparcel.a.j(parcel, m);
                    break;
                case 8:
                    z = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    break;
                case 9:
                    z2 = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    break;
                case 10:
                    z3 = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    break;
                case 11:
                    f3 = com.google.android.gms.common.internal.safeparcel.a.j(parcel, m);
                    break;
                case 12:
                    f4 = com.google.android.gms.common.internal.safeparcel.a.j(parcel, m);
                    break;
                case 13:
                    f5 = com.google.android.gms.common.internal.safeparcel.a.j(parcel, m);
                    break;
                case 14:
                    f6 = com.google.android.gms.common.internal.safeparcel.a.j(parcel, m);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new MarkerOptions(i, latLng, str, str2, iBinder, f, f2, z, z2, z3, f3, f4, f5, f6);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // android.os.Parcelable.Creator
    /* renamed from: newArray */
    public MarkerOptions[] mo379newArray(int size) {
        return new MarkerOptions[size];
    }
}
