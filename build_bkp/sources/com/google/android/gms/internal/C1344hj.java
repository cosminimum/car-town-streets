package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.internal.hj */
public class C1344hj implements Parcelable.Creator<C1343hi> {
    /* renamed from: a */
    static void m3584a(C1343hi hiVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1401a(parcel, 1, hiVar.f3185Bn, false);
        C0677b.m1412c(parcel, 1000, hiVar.versionCode);
        C0677b.m1401a(parcel, 2, hiVar.f3186Bo, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: aq */
    public C1343hi createFromParcel(Parcel parcel) {
        String str = null;
        int n = C0675a.m1375n(parcel);
        int i = 0;
        String str2 = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    str2 = C0675a.m1374m(parcel, m);
                    break;
                case 2:
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
            return new C1343hi(i, str2, str);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: bg */
    public C1343hi[] newArray(int i) {
        return new C1343hi[i];
    }
}
