package com.google.android.gms.games.multiplayer;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.games.GameEntity;
import java.util.ArrayList;

/* renamed from: com.google.android.gms.games.multiplayer.a */
public class C0837a implements Parcelable.Creator<InvitationEntity> {
    /* renamed from: a */
    static void m1852a(InvitationEntity invitationEntity, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1399a(parcel, 1, (Parcelable) invitationEntity.getGame(), i, false);
        C0677b.m1412c(parcel, 1000, invitationEntity.getVersionCode());
        C0677b.m1401a(parcel, 2, invitationEntity.getInvitationId(), false);
        C0677b.m1395a(parcel, 3, invitationEntity.getCreationTimestamp());
        C0677b.m1412c(parcel, 4, invitationEntity.getInvitationType());
        C0677b.m1399a(parcel, 5, (Parcelable) invitationEntity.getInviter(), i, false);
        C0677b.m1411b(parcel, 6, invitationEntity.getParticipants(), false);
        C0677b.m1412c(parcel, 7, invitationEntity.getVariant());
        C0677b.m1412c(parcel, 8, invitationEntity.getAvailableAutoMatchSlots());
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: aI */
    public InvitationEntity[] newArray(int i) {
        return new InvitationEntity[i];
    }

    /* renamed from: aa */
    public InvitationEntity createFromParcel(Parcel parcel) {
        ArrayList<ParticipantEntity> arrayList = null;
        int i = 0;
        int n = C0675a.m1375n(parcel);
        long j = 0;
        int i2 = 0;
        ParticipantEntity participantEntity = null;
        int i3 = 0;
        String str = null;
        GameEntity gameEntity = null;
        int i4 = 0;
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
                    j = C0675a.m1368h(parcel, m);
                    break;
                case 4:
                    i3 = C0675a.m1367g(parcel, m);
                    break;
                case 5:
                    participantEntity = (ParticipantEntity) C0675a.m1356a(parcel, m, ParticipantEntity.CREATOR);
                    break;
                case 6:
                    arrayList = C0675a.m1362c(parcel, m, ParticipantEntity.CREATOR);
                    break;
                case 7:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                case 8:
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
            return new InvitationEntity(i4, gameEntity, str, j, i3, participantEntity, arrayList, i2, i);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }
}
