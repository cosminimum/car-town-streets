package com.google.android.gms.games.multiplayer;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.games.PlayerEntity;

/* renamed from: com.google.android.gms.games.multiplayer.c */
public class C0839c implements Parcelable.Creator<ParticipantEntity> {
    /* renamed from: a */
    static void m1855a(ParticipantEntity participantEntity, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1401a(parcel, 1, participantEntity.getParticipantId(), false);
        C0677b.m1412c(parcel, 1000, participantEntity.getVersionCode());
        C0677b.m1401a(parcel, 2, participantEntity.getDisplayName(), false);
        C0677b.m1399a(parcel, 3, (Parcelable) participantEntity.getIconImageUri(), i, false);
        C0677b.m1399a(parcel, 4, (Parcelable) participantEntity.getHiResImageUri(), i, false);
        C0677b.m1412c(parcel, 5, participantEntity.getStatus());
        C0677b.m1401a(parcel, 6, participantEntity.mo6760dy(), false);
        C0677b.m1404a(parcel, 7, participantEntity.isConnectedToRoom());
        C0677b.m1399a(parcel, 8, (Parcelable) participantEntity.getPlayer(), i, false);
        C0677b.m1412c(parcel, 9, participantEntity.getCapabilities());
        C0677b.m1399a(parcel, 10, (Parcelable) participantEntity.getResult(), i, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: aJ */
    public ParticipantEntity[] newArray(int i) {
        return new ParticipantEntity[i];
    }

    /* renamed from: ab */
    public ParticipantEntity createFromParcel(Parcel parcel) {
        int i = 0;
        ParticipantResult participantResult = null;
        int n = C0675a.m1375n(parcel);
        PlayerEntity playerEntity = null;
        boolean z = false;
        String str = null;
        int i2 = 0;
        Uri uri = null;
        Uri uri2 = null;
        String str2 = null;
        String str3 = null;
        int i3 = 0;
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
                    uri2 = (Uri) C0675a.m1356a(parcel, m, Uri.CREATOR);
                    break;
                case 4:
                    uri = (Uri) C0675a.m1356a(parcel, m, Uri.CREATOR);
                    break;
                case 5:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                case 6:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 7:
                    z = C0675a.m1363c(parcel, m);
                    break;
                case 8:
                    playerEntity = (PlayerEntity) C0675a.m1356a(parcel, m, PlayerEntity.CREATOR);
                    break;
                case 9:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 10:
                    participantResult = (ParticipantResult) C0675a.m1356a(parcel, m, ParticipantResult.CREATOR);
                    break;
                case 1000:
                    i3 = C0675a.m1367g(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new ParticipantEntity(i3, str3, str2, uri2, uri, i2, str, z, playerEntity, i, participantResult);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }
}
