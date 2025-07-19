package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
/* loaded from: classes.dex */
public class gp implements Parcelable.Creator<go> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(go goVar, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 1, goVar.getRequestId(), false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1000, goVar.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, goVar.getExpirationTime());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, goVar.dK());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, goVar.getLatitude());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, goVar.getLongitude());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 6, goVar.dL());
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 7, goVar.dM());
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 8, goVar.getNotificationResponsiveness());
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 9, goVar.dN());
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: aX */
    public go[] newArray(int i) {
        return new go[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: ai */
    public go createFromParcel(Parcel parcel) {
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
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
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 2:
                    j = com.google.android.gms.common.internal.safeparcel.a.h(parcel, m);
                    break;
                case 3:
                    s = com.google.android.gms.common.internal.safeparcel.a.f(parcel, m);
                    break;
                case 4:
                    d = com.google.android.gms.common.internal.safeparcel.a.k(parcel, m);
                    break;
                case 5:
                    d2 = com.google.android.gms.common.internal.safeparcel.a.k(parcel, m);
                    break;
                case 6:
                    f = com.google.android.gms.common.internal.safeparcel.a.j(parcel, m);
                    break;
                case 7:
                    i2 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 8:
                    i3 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 9:
                    i4 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
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
        return new go(i, str, i2, s, d, d2, f, j, i3, i4);
    }
}
