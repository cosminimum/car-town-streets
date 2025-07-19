package com.google.android.gms.internal;

import android.location.Location;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import java.util.ArrayList;
/* loaded from: classes.dex */
public class w implements Parcelable.Creator<v> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(v vVar, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, vVar.versionCode);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, vVar.ex);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, vVar.extras, false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 4, vVar.ey);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, vVar.ez, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 6, vVar.eA);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 7, vVar.tagForChildDirectedTreatment);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 8, vVar.eB);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 9, vVar.eC, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 10, (Parcelable) vVar.eD, i, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 11, (Parcelable) vVar.eE, i, false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: a */
    public v createFromParcel(Parcel parcel) {
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i = 0;
        long j = 0;
        Bundle bundle = null;
        int i2 = 0;
        ArrayList<String> arrayList = null;
        boolean z = false;
        int i3 = 0;
        boolean z2 = false;
        String str = null;
        ai aiVar = null;
        Location location = null;
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
                    bundle = com.google.android.gms.common.internal.safeparcel.a.o(parcel, m);
                    break;
                case 4:
                    i2 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 5:
                    arrayList = com.google.android.gms.common.internal.safeparcel.a.y(parcel, m);
                    break;
                case 6:
                    z = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    break;
                case 7:
                    i3 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 8:
                    z2 = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    break;
                case 9:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 10:
                    aiVar = (ai) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, ai.CREATOR);
                    break;
                case 11:
                    location = (Location) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, Location.CREATOR);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new v(i, j, bundle, i2, arrayList, z, i3, z2, str, aiVar, location);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: b */
    public v[] newArray(int i) {
        return new v[i];
    }
}
