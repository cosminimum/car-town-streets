package com.google.android.gms.games;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.games.c */
public class C0825c implements Parcelable.Creator<PlayerEntity> {
    /* renamed from: a */
    static void m1798a(PlayerEntity playerEntity, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1401a(parcel, 1, playerEntity.getPlayerId(), false);
        C0677b.m1412c(parcel, 1000, playerEntity.getVersionCode());
        C0677b.m1401a(parcel, 2, playerEntity.getDisplayName(), false);
        C0677b.m1399a(parcel, 3, (Parcelable) playerEntity.getIconImageUri(), i, false);
        C0677b.m1399a(parcel, 4, (Parcelable) playerEntity.getHiResImageUri(), i, false);
        C0677b.m1395a(parcel, 5, playerEntity.getRetrievedTimestamp());
        C0677b.m1412c(parcel, 6, playerEntity.mo6578db());
        C0677b.m1395a(parcel, 7, playerEntity.getLastPlayedWithTimestamp());
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: Z */
    public PlayerEntity createFromParcel(Parcel parcel) {
        long j = 0;
        int i = 0;
        Uri uri = null;
        int n = C0675a.m1375n(parcel);
        long j2 = 0;
        Uri uri2 = null;
        String str = null;
        String str2 = null;
        int i2 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    str2 = C0675a.m1374m(parcel, m);
                    break;
                case 2:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 3:
                    uri2 = (Uri) C0675a.m1356a(parcel, m, Uri.CREATOR);
                    break;
                case 4:
                    uri = (Uri) C0675a.m1356a(parcel, m, Uri.CREATOR);
                    break;
                case 5:
                    j2 = C0675a.m1368h(parcel, m);
                    break;
                case 6:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 7:
                    j = C0675a.m1368h(parcel, m);
                    break;
                case 1000:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new PlayerEntity(i2, str2, str, uri2, uri, j2, i, j);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: aA */
    public PlayerEntity[] newArray(int i) {
        return new PlayerEntity[i];
    }
}
