package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.internal.y */
public class C1467y implements Parcelable.Creator<C1466x> {
    /* renamed from: a */
    static void m4080a(C1466x xVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, xVar.versionCode);
        C0677b.m1401a(parcel, 2, xVar.f3485eF, false);
        C0677b.m1412c(parcel, 3, xVar.height);
        C0677b.m1412c(parcel, 4, xVar.heightPixels);
        C0677b.m1404a(parcel, 5, xVar.f3486eG);
        C0677b.m1412c(parcel, 6, xVar.width);
        C0677b.m1412c(parcel, 7, xVar.widthPixels);
        C0677b.m1407a(parcel, 8, (T[]) xVar.f3487eH, i, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: b */
    public C1466x createFromParcel(Parcel parcel) {
        C1466x[] xVarArr = null;
        int i = 0;
        int n = C0675a.m1375n(parcel);
        int i2 = 0;
        boolean z = false;
        int i3 = 0;
        int i4 = 0;
        String str = null;
        int i5 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i5 = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 3:
                    i4 = C0675a.m1367g(parcel, m);
                    break;
                case 4:
                    i3 = C0675a.m1367g(parcel, m);
                    break;
                case 5:
                    z = C0675a.m1363c(parcel, m);
                    break;
                case 6:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                case 7:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 8:
                    xVarArr = (C1466x[]) C0675a.m1361b(parcel, m, C1466x.CREATOR);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new C1466x(i5, str, i4, i3, z, i2, i, xVarArr);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: c */
    public C1466x[] newArray(int i) {
        return new C1466x[i];
    }
}
