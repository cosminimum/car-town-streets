package com.google.android.gms.maps.model;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

public class TileCreator implements Parcelable.Creator<Tile> {
    public static final int CONTENT_DESCRIPTION = 0;

    /* renamed from: a */
    static void m4228a(Tile tile, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, tile.getVersionCode());
        C0677b.m1412c(parcel, 2, tile.width);
        C0677b.m1412c(parcel, 3, tile.height);
        C0677b.m1405a(parcel, 4, tile.data, false);
        C0677b.m1391D(parcel, o);
    }

    public Tile createFromParcel(Parcel parcel) {
        int i = 0;
        int n = C0675a.m1375n(parcel);
        byte[] bArr = null;
        int i2 = 0;
        int i3 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i3 = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                case 3:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 4:
                    bArr = C0675a.m1378p(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new Tile(i3, i2, i, bArr);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    public Tile[] newArray(int size) {
        return new Tile[size];
    }
}
