package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.internal.gy */
public class C1328gy implements Parcelable.Creator<C1327gx> {
    /* renamed from: a */
    static void m3539a(C1327gx gxVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1401a(parcel, 1, gxVar.f3138AI, false);
        C0677b.m1412c(parcel, 1000, gxVar.f3139kg);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: al */
    public C1327gx createFromParcel(Parcel parcel) {
        int n = C0675a.m1375n(parcel);
        int i = 0;
        String str = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    str = C0675a.m1374m(parcel, m);
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
            return new C1327gx(i, str);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: ba */
    public C1327gx[] newArray(int i) {
        return new C1327gx[i];
    }
}
