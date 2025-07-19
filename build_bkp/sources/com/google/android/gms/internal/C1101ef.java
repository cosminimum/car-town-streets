package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.internal.C1067dt;
import java.util.ArrayList;

/* renamed from: com.google.android.gms.internal.ef */
public class C1101ef implements Parcelable.Creator<C1067dt.C1068a> {
    /* renamed from: a */
    static void m2606a(C1067dt.C1068a aVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1401a(parcel, 1, aVar.getAccountName(), false);
        C0677b.m1412c(parcel, 1000, aVar.getVersionCode());
        C0677b.m1402a(parcel, 2, aVar.mo7442bH(), false);
        C0677b.m1412c(parcel, 3, aVar.mo7441bG());
        C0677b.m1401a(parcel, 4, aVar.mo7443bJ(), false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: L */
    public C1067dt.C1068a[] newArray(int i) {
        return new C1067dt.C1068a[i];
    }

    /* renamed from: l */
    public C1067dt.C1068a createFromParcel(Parcel parcel) {
        int i = 0;
        String str = null;
        int n = C0675a.m1375n(parcel);
        ArrayList<String> arrayList = null;
        String str2 = null;
        int i2 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    str2 = C0675a.m1374m(parcel, m);
                    break;
                case 2:
                    arrayList = C0675a.m1387y(parcel, m);
                    break;
                case 3:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 4:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 1000:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new C1067dt.C1068a(i2, str2, arrayList, i, str);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }
}
