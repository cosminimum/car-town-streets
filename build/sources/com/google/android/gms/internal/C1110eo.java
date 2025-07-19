package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.internal.eo */
public class C1110eo implements Parcelable.Creator<C1109en> {
    /* renamed from: a */
    static void m2642a(C1109en enVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, enVar.getVersionCode());
        C0677b.m1399a(parcel, 2, (Parcelable) enVar.mo7569ce(), i, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: O */
    public C1109en[] newArray(int i) {
        return new C1109en[i];
    }

    /* renamed from: q */
    public C1109en createFromParcel(Parcel parcel) {
        int n = C0675a.m1375n(parcel);
        int i = 0;
        C1111ep epVar = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    epVar = (C1111ep) C0675a.m1356a(parcel, m, C1111ep.CREATOR);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new C1109en(i, epVar);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }
}
