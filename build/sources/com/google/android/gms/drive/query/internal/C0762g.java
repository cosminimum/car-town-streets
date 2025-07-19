package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.drive.query.internal.g */
public class C0762g implements Parcelable.Creator<NotFilter> {
    /* renamed from: a */
    static void m1672a(NotFilter notFilter, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1000, notFilter.f1591kg);
        C0677b.m1399a(parcel, 1, (Parcelable) notFilter.f1592sc, i, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: W */
    public NotFilter createFromParcel(Parcel parcel) {
        int n = C0675a.m1375n(parcel);
        int i = 0;
        FilterHolder filterHolder = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    filterHolder = (FilterHolder) C0675a.m1356a(parcel, m, FilterHolder.CREATOR);
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
            return new NotFilter(i, filterHolder);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: aw */
    public NotFilter[] newArray(int i) {
        return new NotFilter[i];
    }
}
