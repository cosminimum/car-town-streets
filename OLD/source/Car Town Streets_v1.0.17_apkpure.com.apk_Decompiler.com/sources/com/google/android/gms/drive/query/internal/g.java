package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.common.internal.safeparcel.b;

public class g implements Parcelable.Creator<NotFilter> {
    static void a(NotFilter notFilter, Parcel parcel, int i) {
        int o = b.o(parcel);
        b.c(parcel, 1000, notFilter.kg);
        b.a(parcel, 1, (Parcelable) notFilter.sc, i, false);
        b.D(parcel, o);
    }

    /* renamed from: W */
    public NotFilter createFromParcel(Parcel parcel) {
        int n = a.n(parcel);
        int i = 0;
        FilterHolder filterHolder = null;
        while (parcel.dataPosition() < n) {
            int m = a.m(parcel);
            switch (a.M(m)) {
                case 1:
                    filterHolder = (FilterHolder) a.a(parcel, m, FilterHolder.CREATOR);
                    break;
                case 1000:
                    i = a.g(parcel, m);
                    break;
                default:
                    a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new NotFilter(i, filterHolder);
        }
        throw new a.C0013a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: aw */
    public NotFilter[] newArray(int i) {
        return new NotFilter[i];
    }
}
