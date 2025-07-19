package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import java.util.ArrayList;

/* renamed from: com.google.android.gms.internal.hg */
public class C1341hg implements Parcelable.Creator<C1340hf> {
    /* renamed from: a */
    static void m3580a(C1340hf hfVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1401a(parcel, 1, hfVar.name, false);
        C0677b.m1412c(parcel, 1000, hfVar.versionCode);
        C0677b.m1401a(parcel, 2, hfVar.f3176Bf, false);
        C0677b.m1401a(parcel, 3, hfVar.f3177Bg, false);
        C0677b.m1401a(parcel, 4, hfVar.f3178Bh, false);
        C0677b.m1402a(parcel, 5, hfVar.f3179Bi, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: ap */
    public C1340hf createFromParcel(Parcel parcel) {
        ArrayList<String> arrayList = null;
        int n = C0675a.m1375n(parcel);
        int i = 0;
        String str = null;
        String str2 = null;
        String str3 = null;
        String str4 = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    str4 = C0675a.m1374m(parcel, m);
                    break;
                case 2:
                    str3 = C0675a.m1374m(parcel, m);
                    break;
                case 3:
                    str2 = C0675a.m1374m(parcel, m);
                    break;
                case 4:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 5:
                    arrayList = C0675a.m1387y(parcel, m);
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
            return new C1340hf(i, str4, str3, str2, str, arrayList);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: bf */
    public C1340hf[] newArray(int i) {
        return new C1340hf[i];
    }
}
