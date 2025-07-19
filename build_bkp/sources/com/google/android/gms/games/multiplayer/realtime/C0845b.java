package com.google.android.gms.games.multiplayer.realtime;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.games.multiplayer.ParticipantEntity;
import java.util.ArrayList;

/* renamed from: com.google.android.gms.games.multiplayer.realtime.b */
public class C0845b implements Parcelable.Creator<RoomEntity> {
    /* renamed from: a */
    static void m1874a(RoomEntity roomEntity, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1401a(parcel, 1, roomEntity.getRoomId(), false);
        C0677b.m1412c(parcel, 1000, roomEntity.getVersionCode());
        C0677b.m1401a(parcel, 2, roomEntity.getCreatorId(), false);
        C0677b.m1395a(parcel, 3, roomEntity.getCreationTimestamp());
        C0677b.m1412c(parcel, 4, roomEntity.getStatus());
        C0677b.m1401a(parcel, 5, roomEntity.getDescription(), false);
        C0677b.m1412c(parcel, 6, roomEntity.getVariant());
        C0677b.m1396a(parcel, 7, roomEntity.getAutoMatchCriteria(), false);
        C0677b.m1411b(parcel, 8, roomEntity.getParticipants(), false);
        C0677b.m1412c(parcel, 9, roomEntity.getAutoMatchWaitEstimateSeconds());
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: aL */
    public RoomEntity[] newArray(int i) {
        return new RoomEntity[i];
    }

    /* renamed from: ad */
    public RoomEntity createFromParcel(Parcel parcel) {
        int i = 0;
        ArrayList<ParticipantEntity> arrayList = null;
        int n = C0675a.m1375n(parcel);
        long j = 0;
        Bundle bundle = null;
        int i2 = 0;
        String str = null;
        int i3 = 0;
        String str2 = null;
        String str3 = null;
        int i4 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    str3 = C0675a.m1374m(parcel, m);
                    break;
                case 2:
                    str2 = C0675a.m1374m(parcel, m);
                    break;
                case 3:
                    j = C0675a.m1368h(parcel, m);
                    break;
                case 4:
                    i3 = C0675a.m1367g(parcel, m);
                    break;
                case 5:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 6:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                case 7:
                    bundle = C0675a.m1377o(parcel, m);
                    break;
                case 8:
                    arrayList = C0675a.m1362c(parcel, m, ParticipantEntity.CREATOR);
                    break;
                case 9:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 1000:
                    i4 = C0675a.m1367g(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new RoomEntity(i4, str3, str2, j, i3, str, i2, bundle, arrayList, i);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }
}
