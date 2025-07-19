package com.google.android.gms.games;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.games.a */
public class C0822a implements Parcelable.Creator<GameEntity> {
    /* renamed from: a */
    static void m1795a(GameEntity gameEntity, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1401a(parcel, 1, gameEntity.getApplicationId(), false);
        C0677b.m1401a(parcel, 2, gameEntity.getDisplayName(), false);
        C0677b.m1401a(parcel, 3, gameEntity.getPrimaryCategory(), false);
        C0677b.m1401a(parcel, 4, gameEntity.getSecondaryCategory(), false);
        C0677b.m1401a(parcel, 5, gameEntity.getDescription(), false);
        C0677b.m1401a(parcel, 6, gameEntity.getDeveloperName(), false);
        C0677b.m1399a(parcel, 7, (Parcelable) gameEntity.getIconImageUri(), i, false);
        C0677b.m1399a(parcel, 8, (Parcelable) gameEntity.getHiResImageUri(), i, false);
        C0677b.m1399a(parcel, 9, (Parcelable) gameEntity.getFeaturedImageUri(), i, false);
        C0677b.m1404a(parcel, 10, gameEntity.isPlayEnabledGame());
        C0677b.m1404a(parcel, 11, gameEntity.isInstanceInstalled());
        C0677b.m1401a(parcel, 12, gameEntity.getInstancePackageName(), false);
        C0677b.m1412c(parcel, 13, gameEntity.getGameplayAclStatus());
        C0677b.m1412c(parcel, 14, gameEntity.getAchievementTotalCount());
        C0677b.m1412c(parcel, 15, gameEntity.getLeaderboardCount());
        C0677b.m1404a(parcel, 17, gameEntity.isTurnBasedMultiplayerEnabled());
        C0677b.m1404a(parcel, 16, gameEntity.isRealTimeMultiplayerEnabled());
        C0677b.m1412c(parcel, 1000, gameEntity.getVersionCode());
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: Y */
    public GameEntity createFromParcel(Parcel parcel) {
        int n = C0675a.m1375n(parcel);
        int i = 0;
        String str = null;
        String str2 = null;
        String str3 = null;
        String str4 = null;
        String str5 = null;
        String str6 = null;
        Uri uri = null;
        Uri uri2 = null;
        Uri uri3 = null;
        boolean z = false;
        boolean z2 = false;
        String str7 = null;
        int i2 = 0;
        int i3 = 0;
        int i4 = 0;
        boolean z3 = false;
        boolean z4 = false;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 2:
                    str2 = C0675a.m1374m(parcel, m);
                    break;
                case 3:
                    str3 = C0675a.m1374m(parcel, m);
                    break;
                case 4:
                    str4 = C0675a.m1374m(parcel, m);
                    break;
                case 5:
                    str5 = C0675a.m1374m(parcel, m);
                    break;
                case 6:
                    str6 = C0675a.m1374m(parcel, m);
                    break;
                case 7:
                    uri = (Uri) C0675a.m1356a(parcel, m, Uri.CREATOR);
                    break;
                case 8:
                    uri2 = (Uri) C0675a.m1356a(parcel, m, Uri.CREATOR);
                    break;
                case 9:
                    uri3 = (Uri) C0675a.m1356a(parcel, m, Uri.CREATOR);
                    break;
                case 10:
                    z = C0675a.m1363c(parcel, m);
                    break;
                case 11:
                    z2 = C0675a.m1363c(parcel, m);
                    break;
                case 12:
                    str7 = C0675a.m1374m(parcel, m);
                    break;
                case 13:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                case 14:
                    i3 = C0675a.m1367g(parcel, m);
                    break;
                case 15:
                    i4 = C0675a.m1367g(parcel, m);
                    break;
                case 16:
                    z3 = C0675a.m1363c(parcel, m);
                    break;
                case 17:
                    z4 = C0675a.m1363c(parcel, m);
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
            return new GameEntity(i, str, str2, str3, str4, str5, str6, uri, uri2, uri3, z, z2, str7, i2, i3, i4, z3, z4);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: az */
    public GameEntity[] newArray(int i) {
        return new GameEntity[i];
    }
}
