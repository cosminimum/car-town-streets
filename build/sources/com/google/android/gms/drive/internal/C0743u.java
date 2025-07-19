package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.drive.internal.u */
public class C0743u implements Parcelable.Creator<OnListEntriesResponse> {
    /* renamed from: a */
    static void m1585a(OnListEntriesResponse onListEntriesResponse, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, onListEntriesResponse.f1480kg);
        C0677b.m1399a(parcel, 2, (Parcelable) onListEntriesResponse.f1481rz, i, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: J */
    public OnListEntriesResponse createFromParcel(Parcel parcel) {
        int n = C0675a.m1375n(parcel);
        int i = 0;
        DataHolder dataHolder = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    dataHolder = (DataHolder) C0675a.m1356a(parcel, m, DataHolder.CREATOR);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new OnListEntriesResponse(i, dataHolder);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: aj */
    public OnListEntriesResponse[] newArray(int i) {
        return new OnListEntriesResponse[i];
    }
}
