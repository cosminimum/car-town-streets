package com.google.android.gms.location;

import android.app.PendingIntent;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
/* loaded from: classes.dex */
public class g implements Parcelable.Creator<f> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(f fVar, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 1, (Parcelable) fVar.dB(), i, false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1000, fVar.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, fVar.dC(), false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: aT */
    public f[] newArray(int i) {
        return new f[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: ag */
    public f createFromParcel(Parcel parcel) {
        String m;
        PendingIntent pendingIntent;
        int i;
        String str = null;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i2 = 0;
        PendingIntent pendingIntent2 = null;
        while (parcel.dataPosition() < n) {
            int m2 = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m2)) {
                case 1:
                    PendingIntent pendingIntent3 = (PendingIntent) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m2, PendingIntent.CREATOR);
                    i = i2;
                    m = str;
                    pendingIntent = pendingIntent3;
                    break;
                case 2:
                    m = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m2);
                    pendingIntent = pendingIntent2;
                    i = i2;
                    break;
                case 1000:
                    String str2 = str;
                    pendingIntent = pendingIntent2;
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m2);
                    m = str2;
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m2);
                    m = str;
                    pendingIntent = pendingIntent2;
                    i = i2;
                    break;
            }
            i2 = i;
            pendingIntent2 = pendingIntent;
            str = m;
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new f(i2, pendingIntent2, str);
    }
}
