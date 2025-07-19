package com.google.android.gms.games;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
/* loaded from: classes.dex */
public class c implements Parcelable.Creator<PlayerEntity> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(PlayerEntity playerEntity, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 1, playerEntity.getPlayerId(), false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1000, playerEntity.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, playerEntity.getDisplayName(), false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, (Parcelable) playerEntity.getIconImageUri(), i, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, (Parcelable) playerEntity.getHiResImageUri(), i, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, playerEntity.getRetrievedTimestamp());
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 6, playerEntity.db());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 7, playerEntity.getLastPlayedWithTimestamp());
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: Z */
    public PlayerEntity createFromParcel(Parcel parcel) {
        long j = 0;
        int i = 0;
        Uri uri = null;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        long j2 = 0;
        Uri uri2 = null;
        String str = null;
        String str2 = null;
        int i2 = 0;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    str2 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 2:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 3:
                    uri2 = (Uri) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, Uri.CREATOR);
                    break;
                case 4:
                    uri = (Uri) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, Uri.CREATOR);
                    break;
                case 5:
                    j2 = com.google.android.gms.common.internal.safeparcel.a.h(parcel, m);
                    break;
                case 6:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 7:
                    j = com.google.android.gms.common.internal.safeparcel.a.h(parcel, m);
                    break;
                case 1000:
                    i2 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new PlayerEntity(i2, str2, str, uri2, uri, j2, i, j);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: aA */
    public PlayerEntity[] newArray(int i) {
        return new PlayerEntity[i];
    }
}
