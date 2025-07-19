package com.google.android.gms.location;

import android.app.PendingIntent;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.location.g */
public class C1477g implements Parcelable.Creator<C1476f> {
    /* renamed from: a */
    static void m4103a(C1476f fVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1399a(parcel, 1, (Parcelable) fVar.mo8927dB(), i, false);
        C0677b.m1412c(parcel, 1000, fVar.getVersionCode());
        C0677b.m1401a(parcel, 2, fVar.mo8928dC(), false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: aT */
    public C1476f[] newArray(int i) {
        return new C1476f[i];
    }

    /* renamed from: ag */
    public C1476f createFromParcel(Parcel parcel) {
        String m;
        PendingIntent pendingIntent;
        int i;
        String str = null;
        int n = C0675a.m1375n(parcel);
        int i2 = 0;
        PendingIntent pendingIntent2 = null;
        while (parcel.dataPosition() < n) {
            int m2 = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m2)) {
                case 1:
                    i = i2;
                    PendingIntent pendingIntent3 = (PendingIntent) C0675a.m1356a(parcel, m2, PendingIntent.CREATOR);
                    m = str;
                    pendingIntent = pendingIntent3;
                    break;
                case 2:
                    m = C0675a.m1374m(parcel, m2);
                    pendingIntent = pendingIntent2;
                    i = i2;
                    break;
                case 1000:
                    String str2 = str;
                    pendingIntent = pendingIntent2;
                    i = C0675a.m1367g(parcel, m2);
                    m = str2;
                    break;
                default:
                    C0675a.m1360b(parcel, m2);
                    m = str;
                    pendingIntent = pendingIntent2;
                    i = i2;
                    break;
            }
            i2 = i;
            pendingIntent2 = pendingIntent;
            str = m;
        }
        if (parcel.dataPosition() == n) {
            return new C1476f(i2, pendingIntent2, str);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }
}
