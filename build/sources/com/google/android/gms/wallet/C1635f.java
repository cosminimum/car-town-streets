package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.wallet.f */
public class C1635f implements Parcelable.Creator<LineItem> {
    /* renamed from: a */
    static void m4355a(LineItem lineItem, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, lineItem.getVersionCode());
        C0677b.m1401a(parcel, 2, lineItem.description, false);
        C0677b.m1401a(parcel, 3, lineItem.f3846Gw, false);
        C0677b.m1401a(parcel, 4, lineItem.f3847Gx, false);
        C0677b.m1401a(parcel, 5, lineItem.f3844Gj, false);
        C0677b.m1412c(parcel, 6, lineItem.f3848Gy);
        C0677b.m1401a(parcel, 7, lineItem.f3845Gk, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: aJ */
    public LineItem createFromParcel(Parcel parcel) {
        int i = 0;
        String str = null;
        int n = C0675a.m1375n(parcel);
        String str2 = null;
        String str3 = null;
        String str4 = null;
        String str5 = null;
        int i2 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    str5 = C0675a.m1374m(parcel, m);
                    break;
                case 3:
                    str4 = C0675a.m1374m(parcel, m);
                    break;
                case 4:
                    str3 = C0675a.m1374m(parcel, m);
                    break;
                case 5:
                    str2 = C0675a.m1374m(parcel, m);
                    break;
                case 6:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 7:
                    str = C0675a.m1374m(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new LineItem(i2, str5, str4, str3, str2, i, str);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: bB */
    public LineItem[] newArray(int i) {
        return new LineItem[i];
    }
}
