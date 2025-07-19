package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.internal.C1120ev;
import java.util.ArrayList;

/* renamed from: com.google.android.gms.internal.ew */
public class C1123ew implements Parcelable.Creator<C1120ev> {
    /* renamed from: a */
    static void m2712a(C1120ev evVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, evVar.getVersionCode());
        C0677b.m1411b(parcel, 2, evVar.mo7639cy(), false);
        C0677b.m1401a(parcel, 3, evVar.mo7640cz(), false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: T */
    public C1120ev[] newArray(int i) {
        return new C1120ev[i];
    }

    /* renamed from: v */
    public C1120ev createFromParcel(Parcel parcel) {
        String str = null;
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
                    arrayList = C0675a.m1362c(parcel, m, C1120ev.C1121a.CREATOR);
                    break;
                case 3:
                    str = C0675a.m1374m(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new C1120ev(i, arrayList, str);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }
}
