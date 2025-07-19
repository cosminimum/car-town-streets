package com.google.android.gms.common.data;

import android.database.CursorWindow;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

public class DataHolderCreator implements Parcelable.Creator<DataHolder> {
    public static final int CONTENT_DESCRIPTION = 0;

    /* renamed from: a */
    static void m1304a(DataHolder dataHolder, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1408a(parcel, 1, dataHolder.mo5936bv(), false);
        C0677b.m1412c(parcel, 1000, dataHolder.getVersionCode());
        C0677b.m1407a(parcel, 2, (T[]) dataHolder.mo5937bw(), i, false);
        C0677b.m1412c(parcel, 3, dataHolder.getStatusCode());
        C0677b.m1396a(parcel, 4, dataHolder.getMetadata(), false);
        C0677b.m1391D(parcel, o);
    }

    public DataHolder createFromParcel(Parcel parcel) {
        int i = 0;
        Bundle bundle = null;
        int n = C0675a.m1375n(parcel);
        CursorWindow[] cursorWindowArr = null;
        String[] strArr = null;
        int i2 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    strArr = C0675a.m1386x(parcel, m);
                    break;
                case 2:
                    cursorWindowArr = (CursorWindow[]) C0675a.m1361b(parcel, m, CursorWindow.CREATOR);
                    break;
                case 3:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 4:
                    bundle = C0675a.m1377o(parcel, m);
                    break;
                case 1000:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
        }
        DataHolder dataHolder = new DataHolder(i2, strArr, cursorWindowArr, i, bundle);
        dataHolder.validateContents();
        return dataHolder;
    }

    public DataHolder[] newArray(int size) {
        return new DataHolder[size];
    }
}
