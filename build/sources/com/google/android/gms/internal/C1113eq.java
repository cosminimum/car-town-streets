package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.internal.C1111ep;
import java.util.ArrayList;

/* renamed from: com.google.android.gms.internal.eq */
public class C1113eq implements Parcelable.Creator<C1111ep> {
    /* renamed from: a */
    static void m2652a(C1111ep epVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, epVar.getVersionCode());
        C0677b.m1411b(parcel, 2, epVar.mo7580cg(), false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: P */
    public C1111ep[] newArray(int i) {
        return new C1111ep[i];
    }

    /* renamed from: r */
    public C1111ep createFromParcel(Parcel parcel) {
        int n = C0675a.m1375n(parcel);
        int i = 0;
        ArrayList arrayList = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    arrayList = C0675a.m1362c(parcel, m, C1111ep.C1112a.CREATOR);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new C1111ep(i, arrayList);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }
}
