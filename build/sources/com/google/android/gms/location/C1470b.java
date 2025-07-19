package com.google.android.gms.location;

import android.app.PendingIntent;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.location.b */
public class C1470b implements Parcelable.Creator<C1469a> {
    /* renamed from: a */
    static void m4093a(C1469a aVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1399a(parcel, 1, (Parcelable) aVar.mo8906dB(), i, false);
        C0677b.m1412c(parcel, 1000, aVar.getVersionCode());
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: aN */
    public C1469a[] newArray(int i) {
        return new C1469a[i];
    }

    /* renamed from: ae */
    public C1469a createFromParcel(Parcel parcel) {
        int n = C0675a.m1375n(parcel);
        int i = 0;
        PendingIntent pendingIntent = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    pendingIntent = (PendingIntent) C0675a.m1356a(parcel, m, PendingIntent.CREATOR);
                    break;
                case 1000:
                    i = C0675a.m1367g(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new C1469a(i, pendingIntent);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }
}
