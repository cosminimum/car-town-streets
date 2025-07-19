package com.google.android.gms.internal;

import android.os.IBinder;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.internal.bl */
public class C0943bl implements Parcelable.Creator<C0944bm> {
    /* renamed from: a */
    static void m2048a(C0944bm bmVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, bmVar.versionCode);
        C0677b.m1399a(parcel, 2, (Parcelable) bmVar.f2254gG, i, false);
        C0677b.m1397a(parcel, 3, bmVar.mo7152aa(), false);
        C0677b.m1397a(parcel, 4, bmVar.mo7153ab(), false);
        C0677b.m1397a(parcel, 5, bmVar.mo7154ac(), false);
        C0677b.m1397a(parcel, 6, bmVar.mo7155ad(), false);
        C0677b.m1401a(parcel, 7, bmVar.f2259gL, false);
        C0677b.m1404a(parcel, 8, bmVar.f2260gM);
        C0677b.m1401a(parcel, 9, bmVar.f2261gN, false);
        C0677b.m1397a(parcel, 10, bmVar.mo7156ae(), false);
        C0677b.m1412c(parcel, 11, bmVar.orientation);
        C0677b.m1412c(parcel, 12, bmVar.f2263gP);
        C0677b.m1401a(parcel, 13, bmVar.f2264go, false);
        C0677b.m1399a(parcel, 14, (Parcelable) bmVar.f2253ej, i, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: e */
    public C0944bm createFromParcel(Parcel parcel) {
        int n = C0675a.m1375n(parcel);
        int i = 0;
        C0938bj bjVar = null;
        IBinder iBinder = null;
        IBinder iBinder2 = null;
        IBinder iBinder3 = null;
        IBinder iBinder4 = null;
        String str = null;
        boolean z = false;
        String str2 = null;
        IBinder iBinder5 = null;
        int i2 = 0;
        int i3 = 0;
        String str3 = null;
        C1005cu cuVar = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    bjVar = (C0938bj) C0675a.m1356a(parcel, m, C0938bj.CREATOR);
                    break;
                case 3:
                    iBinder = C0675a.m1376n(parcel, m);
                    break;
                case 4:
                    iBinder2 = C0675a.m1376n(parcel, m);
                    break;
                case 5:
                    iBinder3 = C0675a.m1376n(parcel, m);
                    break;
                case 6:
                    iBinder4 = C0675a.m1376n(parcel, m);
                    break;
                case 7:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 8:
                    z = C0675a.m1363c(parcel, m);
                    break;
                case 9:
                    str2 = C0675a.m1374m(parcel, m);
                    break;
                case 10:
                    iBinder5 = C0675a.m1376n(parcel, m);
                    break;
                case 11:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                case 12:
                    i3 = C0675a.m1367g(parcel, m);
                    break;
                case 13:
                    str3 = C0675a.m1374m(parcel, m);
                    break;
                case 14:
                    cuVar = (C1005cu) C0675a.m1356a(parcel, m, C1005cu.CREATOR);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new C0944bm(i, bjVar, iBinder, iBinder2, iBinder3, iBinder4, str, z, str2, iBinder5, i2, i3, str3, cuVar);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: j */
    public C0944bm[] newArray(int i) {
        return new C0944bm[i];
    }
}
