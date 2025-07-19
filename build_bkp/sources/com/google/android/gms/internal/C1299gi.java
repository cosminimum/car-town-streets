package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import java.util.ArrayList;

/* renamed from: com.google.android.gms.internal.gi */
public class C1299gi implements Parcelable.Creator<C1298gh> {
    /* renamed from: a */
    static void m3422a(C1298gh ghVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1000, ghVar.getVersionCode());
        C0677b.m1404a(parcel, 2, ghVar.isEnabled());
        C0677b.m1404a(parcel, 3, ghVar.mo8011dD());
        C0677b.m1404a(parcel, 4, ghVar.mo8012dE());
        C0677b.m1404a(parcel, 5, ghVar.mo8013dF());
        C0677b.m1411b(parcel, 6, ghVar.mo8014dG(), false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: aU */
    public C1298gh[] newArray(int i) {
        return new C1298gh[i];
    }

    /* renamed from: ah */
    public C1298gh createFromParcel(Parcel parcel) {
        boolean z = false;
        int n = C0675a.m1375n(parcel);
        ArrayList arrayList = null;
        boolean z2 = false;
        boolean z3 = false;
        boolean z4 = false;
        int i = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 2:
                    z4 = C0675a.m1363c(parcel, m);
                    break;
                case 3:
                    z3 = C0675a.m1363c(parcel, m);
                    break;
                case 4:
                    z2 = C0675a.m1363c(parcel, m);
                    break;
                case 5:
                    z = C0675a.m1363c(parcel, m);
                    break;
                case 6:
                    arrayList = C0675a.m1362c(parcel, m, C1107el.CREATOR);
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
            return new C1298gh(i, z4, z3, z2, z, arrayList);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }
}
