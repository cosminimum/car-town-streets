package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.internal.aj */
public class C0869aj implements Parcelable.Creator<C0868ai> {
    /* renamed from: a */
    static void m1944a(C0868ai aiVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, aiVar.versionCode);
        C0677b.m1412c(parcel, 2, aiVar.f1941eZ);
        C0677b.m1412c(parcel, 3, aiVar.backgroundColor);
        C0677b.m1412c(parcel, 4, aiVar.f1942fa);
        C0677b.m1412c(parcel, 5, aiVar.f1943fb);
        C0677b.m1412c(parcel, 6, aiVar.f1944fc);
        C0677b.m1412c(parcel, 7, aiVar.f1945fd);
        C0677b.m1412c(parcel, 8, aiVar.f1946fe);
        C0677b.m1412c(parcel, 9, aiVar.f1947ff);
        C0677b.m1401a(parcel, 10, aiVar.f1948fg, false);
        C0677b.m1412c(parcel, 11, aiVar.f1949fh);
        C0677b.m1401a(parcel, 12, aiVar.f1950fi, false);
        C0677b.m1412c(parcel, 13, aiVar.f1951fj);
        C0677b.m1412c(parcel, 14, aiVar.f1952fk);
        C0677b.m1401a(parcel, 15, aiVar.f1953fl, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: c */
    public C0868ai createFromParcel(Parcel parcel) {
        int n = C0675a.m1375n(parcel);
        int i = 0;
        int i2 = 0;
        int i3 = 0;
        int i4 = 0;
        int i5 = 0;
        int i6 = 0;
        int i7 = 0;
        int i8 = 0;
        int i9 = 0;
        String str = null;
        int i10 = 0;
        String str2 = null;
        int i11 = 0;
        int i12 = 0;
        String str3 = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                case 3:
                    i3 = C0675a.m1367g(parcel, m);
                    break;
                case 4:
                    i4 = C0675a.m1367g(parcel, m);
                    break;
                case 5:
                    i5 = C0675a.m1367g(parcel, m);
                    break;
                case 6:
                    i6 = C0675a.m1367g(parcel, m);
                    break;
                case 7:
                    i7 = C0675a.m1367g(parcel, m);
                    break;
                case 8:
                    i8 = C0675a.m1367g(parcel, m);
                    break;
                case 9:
                    i9 = C0675a.m1367g(parcel, m);
                    break;
                case 10:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 11:
                    i10 = C0675a.m1367g(parcel, m);
                    break;
                case 12:
                    str2 = C0675a.m1374m(parcel, m);
                    break;
                case 13:
                    i11 = C0675a.m1367g(parcel, m);
                    break;
                case 14:
                    i12 = C0675a.m1367g(parcel, m);
                    break;
                case 15:
                    str3 = C0675a.m1374m(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new C0868ai(i, i2, i3, i4, i5, i6, i7, i8, i9, str, i10, str2, i11, i12, str3);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: e */
    public C0868ai[] newArray(int i) {
        return new C0868ai[i];
    }
}
