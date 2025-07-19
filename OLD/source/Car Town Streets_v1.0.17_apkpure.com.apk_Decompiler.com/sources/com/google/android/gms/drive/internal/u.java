package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.common.internal.safeparcel.b;

public class u implements Parcelable.Creator<OnListEntriesResponse> {
    static void a(OnListEntriesResponse onListEntriesResponse, Parcel parcel, int i) {
        int o = b.o(parcel);
        b.c(parcel, 1, onListEntriesResponse.kg);
        b.a(parcel, 2, (Parcelable) onListEntriesResponse.rz, i, false);
        b.D(parcel, o);
    }

    /* renamed from: J */
    public OnListEntriesResponse createFromParcel(Parcel parcel) {
        int n = a.n(parcel);
        int i = 0;
        DataHolder dataHolder = null;
        while (parcel.dataPosition() < n) {
            int m = a.m(parcel);
            switch (a.M(m)) {
                case 1:
                    i = a.g(parcel, m);
                    break;
                case 2:
                    dataHolder = (DataHolder) a.a(parcel, m, DataHolder.CREATOR);
                    break;
                default:
                    a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new OnListEntriesResponse(i, dataHolder);
        }
        throw new a.C0013a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: aj */
    public OnListEntriesResponse[] newArray(int i) {
        return new OnListEntriesResponse[i];
    }
}
