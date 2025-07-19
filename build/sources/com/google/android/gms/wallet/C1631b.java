package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import java.util.ArrayList;

/* renamed from: com.google.android.gms.wallet.b */
public class C1631b implements Parcelable.Creator<Cart> {
    /* renamed from: a */
    static void m4343a(Cart cart, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, cart.getVersionCode());
        C0677b.m1401a(parcel, 2, cart.f3824Gj, false);
        C0677b.m1401a(parcel, 3, cart.f3825Gk, false);
        C0677b.m1411b(parcel, 4, cart.f3826Gl, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: aF */
    public Cart createFromParcel(Parcel parcel) {
        String str = null;
        int n = C0675a.m1375n(parcel);
        int i = 0;
        ArrayList<LineItem> arrayList = new ArrayList<>();
        String str2 = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    str2 = C0675a.m1374m(parcel, m);
                    break;
                case 3:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 4:
                    arrayList = C0675a.m1362c(parcel, m, LineItem.CREATOR);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new Cart(i, str2, str, arrayList);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: bx */
    public Cart[] newArray(int i) {
        return new Cart[i];
    }
}
