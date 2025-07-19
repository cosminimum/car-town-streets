package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.internal.ez */
public class C1126ez implements Parcelable.Creator<C1125ey> {
    /* renamed from: a */
    static void m2735a(C1125ey eyVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, eyVar.getVersionCode());
        C0677b.m1398a(parcel, 2, eyVar.mo7658cB(), false);
        C0677b.m1399a(parcel, 3, (Parcelable) eyVar.mo7659cC(), i, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: V */
    public C1125ey[] newArray(int i) {
        return new C1125ey[i];
    }

    /* renamed from: x */
    public C1125ey createFromParcel(Parcel parcel) {
        C1120ev evVar = null;
        int n = C0675a.m1375n(parcel);
        int i = 0;
        Parcel parcel2 = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    parcel2 = C0675a.m1388z(parcel, m);
                    break;
                case 3:
                    evVar = (C1120ev) C0675a.m1356a(parcel, m, C1120ev.CREATOR);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new C1125ey(i, parcel2, evVar);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }
}
