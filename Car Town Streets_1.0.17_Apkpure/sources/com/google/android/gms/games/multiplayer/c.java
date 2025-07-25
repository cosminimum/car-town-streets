package com.google.android.gms.games.multiplayer;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.games.PlayerEntity;
/* loaded from: classes.dex */
public class c implements Parcelable.Creator<ParticipantEntity> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(ParticipantEntity participantEntity, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 1, participantEntity.getParticipantId(), false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1000, participantEntity.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, participantEntity.getDisplayName(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, (Parcelable) participantEntity.getIconImageUri(), i, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, (Parcelable) participantEntity.getHiResImageUri(), i, false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 5, participantEntity.getStatus());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 6, participantEntity.dy(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 7, participantEntity.isConnectedToRoom());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 8, (Parcelable) participantEntity.getPlayer(), i, false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 9, participantEntity.getCapabilities());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 10, (Parcelable) participantEntity.getResult(), i, false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: aJ */
    public ParticipantEntity[] newArray(int i) {
        return new ParticipantEntity[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: ab */
    public ParticipantEntity createFromParcel(Parcel parcel) {
        int i = 0;
        ParticipantResult participantResult = null;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
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
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    str3 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 2:
                    str2 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 3:
                    uri2 = (Uri) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, Uri.CREATOR);
                    break;
                case 4:
                    uri = (Uri) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, Uri.CREATOR);
                    break;
                case 5:
                    i2 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 6:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 7:
                    z = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    break;
                case 8:
                    playerEntity = (PlayerEntity) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, PlayerEntity.CREATOR);
                    break;
                case 9:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 10:
                    participantResult = (ParticipantResult) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, ParticipantResult.CREATOR);
                    break;
                case 1000:
                    i3 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new ParticipantEntity(i3, str3, str2, uri2, uri, i2, str, z, playerEntity, i, participantResult);
    }
}
