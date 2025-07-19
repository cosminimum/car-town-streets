package com.google.android.gms.maps.model;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
/* loaded from: classes.dex */
public class TileOverlayOptionsCreator implements Parcelable.Creator<TileOverlayOptions> {
    public static final int CONTENT_DESCRIPTION = 0;

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(TileOverlayOptions tileOverlayOptions, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, tileOverlayOptions.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, tileOverlayOptions.eI(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, tileOverlayOptions.isVisible());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, tileOverlayOptions.getZIndex());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, tileOverlayOptions.getFadeIn());
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // android.os.Parcelable.Creator
    /* renamed from: createFromParcel */
    public TileOverlayOptions mo386createFromParcel(Parcel parcel) {
        boolean z = false;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        IBinder iBinder = null;
        float f = BitmapDescriptorFactory.HUE_RED;
        boolean z2 = true;
        int i = 0;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 2:
                    iBinder = com.google.android.gms.common.internal.safeparcel.a.n(parcel, m);
                    break;
                case 3:
                    z = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    break;
                case 4:
                    f = com.google.android.gms.common.internal.safeparcel.a.j(parcel, m);
                    break;
                case 5:
                    z2 = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new TileOverlayOptions(i, iBinder, z, f, z2);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // android.os.Parcelable.Creator
    /* renamed from: newArray */
    public TileOverlayOptions[] mo387newArray(int size) {
        return new TileOverlayOptions[size];
    }
}
