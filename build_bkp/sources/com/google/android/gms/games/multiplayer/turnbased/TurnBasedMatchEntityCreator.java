package com.google.android.gms.games.multiplayer.turnbased;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.games.GameEntity;
import com.google.android.gms.games.multiplayer.ParticipantEntity;
import java.util.ArrayList;

public class TurnBasedMatchEntityCreator implements Parcelable.Creator<TurnBasedMatchEntity> {
    public static final int CONTENT_DESCRIPTION = 0;

    /* renamed from: a */
    static void m1886a(TurnBasedMatchEntity turnBasedMatchEntity, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1399a(parcel, 1, (Parcelable) turnBasedMatchEntity.getGame(), i, false);
        C0677b.m1401a(parcel, 2, turnBasedMatchEntity.getMatchId(), false);
        C0677b.m1401a(parcel, 3, turnBasedMatchEntity.getCreatorId(), false);
        C0677b.m1395a(parcel, 4, turnBasedMatchEntity.getCreationTimestamp());
        C0677b.m1401a(parcel, 5, turnBasedMatchEntity.getLastUpdaterId(), false);
        C0677b.m1395a(parcel, 6, turnBasedMatchEntity.getLastUpdatedTimestamp());
        C0677b.m1401a(parcel, 7, turnBasedMatchEntity.getPendingParticipantId(), false);
        C0677b.m1412c(parcel, 8, turnBasedMatchEntity.getStatus());
        C0677b.m1412c(parcel, 10, turnBasedMatchEntity.getVariant());
        C0677b.m1412c(parcel, 11, turnBasedMatchEntity.getVersion());
        C0677b.m1405a(parcel, 12, turnBasedMatchEntity.getData(), false);
        C0677b.m1411b(parcel, 13, turnBasedMatchEntity.getParticipants(), false);
        C0677b.m1401a(parcel, 14, turnBasedMatchEntity.getRematchId(), false);
        C0677b.m1405a(parcel, 15, turnBasedMatchEntity.getPreviousMatchData(), false);
        C0677b.m1396a(parcel, 17, turnBasedMatchEntity.getAutoMatchCriteria(), false);
        C0677b.m1412c(parcel, 16, turnBasedMatchEntity.getMatchNumber());
        C0677b.m1412c(parcel, 1000, turnBasedMatchEntity.getVersionCode());
        C0677b.m1404a(parcel, 19, turnBasedMatchEntity.isLocallyModified());
        C0677b.m1412c(parcel, 18, turnBasedMatchEntity.getTurnStatus());
        C0677b.m1391D(parcel, o);
    }

    public TurnBasedMatchEntity createFromParcel(Parcel parcel) {
        int n = C0675a.m1375n(parcel);
        int i = 0;
        GameEntity gameEntity = null;
        String str = null;
        String str2 = null;
        long j = 0;
        String str3 = null;
        long j2 = 0;
        String str4 = null;
        int i2 = 0;
        int i3 = 0;
        int i4 = 0;
        byte[] bArr = null;
        ArrayList<ParticipantEntity> arrayList = null;
        String str5 = null;
        byte[] bArr2 = null;
        int i5 = 0;
        Bundle bundle = null;
        int i6 = 0;
        boolean z = false;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    gameEntity = (GameEntity) C0675a.m1356a(parcel, m, GameEntity.CREATOR);
                    break;
                case 2:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 3:
                    str2 = C0675a.m1374m(parcel, m);
                    break;
                case 4:
                    j = C0675a.m1368h(parcel, m);
                    break;
                case 5:
                    str3 = C0675a.m1374m(parcel, m);
                    break;
                case 6:
                    j2 = C0675a.m1368h(parcel, m);
                    break;
                case 7:
                    str4 = C0675a.m1374m(parcel, m);
                    break;
                case 8:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                case 10:
                    i3 = C0675a.m1367g(parcel, m);
                    break;
                case 11:
                    i4 = C0675a.m1367g(parcel, m);
                    break;
                case 12:
                    bArr = C0675a.m1378p(parcel, m);
                    break;
                case 13:
                    arrayList = C0675a.m1362c(parcel, m, ParticipantEntity.CREATOR);
                    break;
                case 14:
                    str5 = C0675a.m1374m(parcel, m);
                    break;
                case 15:
                    bArr2 = C0675a.m1378p(parcel, m);
                    break;
                case 16:
                    i5 = C0675a.m1367g(parcel, m);
                    break;
                case 17:
                    bundle = C0675a.m1377o(parcel, m);
                    break;
                case 18:
                    i6 = C0675a.m1367g(parcel, m);
                    break;
                case 19:
                    z = C0675a.m1363c(parcel, m);
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
            return new TurnBasedMatchEntity(i, gameEntity, str, str2, j, str3, j2, str4, i2, i3, i4, bArr, arrayList, str5, bArr2, i5, bundle, i6, z);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    public TurnBasedMatchEntity[] newArray(int size) {
        return new TurnBasedMatchEntity[size];
    }
}
