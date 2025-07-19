package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

/* renamed from: com.google.android.gms.internal.ic */
public class C1403ic implements Parcelable.Creator<C1402ib> {
    /* renamed from: a */
    static void m3770a(C1402ib ibVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        Set<Integer> fa = ibVar.mo8364fa();
        if (fa.contains(1)) {
            C0677b.m1412c(parcel, 1, ibVar.getVersionCode());
        }
        if (fa.contains(2)) {
            C0677b.m1399a(parcel, 2, (Parcelable) ibVar.mo8365fb(), i, true);
        }
        if (fa.contains(3)) {
            C0677b.m1402a(parcel, 3, ibVar.getAdditionalName(), true);
        }
        if (fa.contains(4)) {
            C0677b.m1399a(parcel, 4, (Parcelable) ibVar.mo8366fc(), i, true);
        }
        if (fa.contains(5)) {
            C0677b.m1401a(parcel, 5, ibVar.getAddressCountry(), true);
        }
        if (fa.contains(6)) {
            C0677b.m1401a(parcel, 6, ibVar.getAddressLocality(), true);
        }
        if (fa.contains(7)) {
            C0677b.m1401a(parcel, 7, ibVar.getAddressRegion(), true);
        }
        if (fa.contains(8)) {
            C0677b.m1411b(parcel, 8, ibVar.mo8367fd(), true);
        }
        if (fa.contains(9)) {
            C0677b.m1412c(parcel, 9, ibVar.getAttendeeCount());
        }
        if (fa.contains(10)) {
            C0677b.m1411b(parcel, 10, ibVar.mo8368fe(), true);
        }
        if (fa.contains(11)) {
            C0677b.m1399a(parcel, 11, (Parcelable) ibVar.mo8369ff(), i, true);
        }
        if (fa.contains(12)) {
            C0677b.m1411b(parcel, 12, ibVar.mo8370fg(), true);
        }
        if (fa.contains(13)) {
            C0677b.m1401a(parcel, 13, ibVar.getBestRating(), true);
        }
        if (fa.contains(14)) {
            C0677b.m1401a(parcel, 14, ibVar.getBirthDate(), true);
        }
        if (fa.contains(15)) {
            C0677b.m1399a(parcel, 15, (Parcelable) ibVar.mo8371fh(), i, true);
        }
        if (fa.contains(17)) {
            C0677b.m1401a(parcel, 17, ibVar.getContentSize(), true);
        }
        if (fa.contains(16)) {
            C0677b.m1401a(parcel, 16, ibVar.getCaption(), true);
        }
        if (fa.contains(19)) {
            C0677b.m1411b(parcel, 19, ibVar.mo8372fi(), true);
        }
        if (fa.contains(18)) {
            C0677b.m1401a(parcel, 18, ibVar.getContentUrl(), true);
        }
        if (fa.contains(21)) {
            C0677b.m1401a(parcel, 21, ibVar.getDateModified(), true);
        }
        if (fa.contains(20)) {
            C0677b.m1401a(parcel, 20, ibVar.getDateCreated(), true);
        }
        if (fa.contains(23)) {
            C0677b.m1401a(parcel, 23, ibVar.getDescription(), true);
        }
        if (fa.contains(22)) {
            C0677b.m1401a(parcel, 22, ibVar.getDatePublished(), true);
        }
        if (fa.contains(25)) {
            C0677b.m1401a(parcel, 25, ibVar.getEmbedUrl(), true);
        }
        if (fa.contains(24)) {
            C0677b.m1401a(parcel, 24, ibVar.getDuration(), true);
        }
        if (fa.contains(27)) {
            C0677b.m1401a(parcel, 27, ibVar.getFamilyName(), true);
        }
        if (fa.contains(26)) {
            C0677b.m1401a(parcel, 26, ibVar.getEndDate(), true);
        }
        if (fa.contains(29)) {
            C0677b.m1399a(parcel, 29, (Parcelable) ibVar.mo8373fj(), i, true);
        }
        if (fa.contains(28)) {
            C0677b.m1401a(parcel, 28, ibVar.getGender(), true);
        }
        if (fa.contains(31)) {
            C0677b.m1401a(parcel, 31, ibVar.getHeight(), true);
        }
        if (fa.contains(30)) {
            C0677b.m1401a(parcel, 30, ibVar.getGivenName(), true);
        }
        if (fa.contains(34)) {
            C0677b.m1399a(parcel, 34, (Parcelable) ibVar.mo8374fk(), i, true);
        }
        if (fa.contains(32)) {
            C0677b.m1401a(parcel, 32, ibVar.getId(), true);
        }
        if (fa.contains(33)) {
            C0677b.m1401a(parcel, 33, ibVar.getImage(), true);
        }
        if (fa.contains(38)) {
            C0677b.m1393a(parcel, 38, ibVar.getLongitude());
        }
        if (fa.contains(39)) {
            C0677b.m1401a(parcel, 39, ibVar.getName(), true);
        }
        if (fa.contains(36)) {
            C0677b.m1393a(parcel, 36, ibVar.getLatitude());
        }
        if (fa.contains(37)) {
            C0677b.m1399a(parcel, 37, (Parcelable) ibVar.mo8375fl(), i, true);
        }
        if (fa.contains(42)) {
            C0677b.m1401a(parcel, 42, ibVar.getPlayerType(), true);
        }
        if (fa.contains(43)) {
            C0677b.m1401a(parcel, 43, ibVar.getPostOfficeBoxNumber(), true);
        }
        if (fa.contains(40)) {
            C0677b.m1399a(parcel, 40, (Parcelable) ibVar.mo8376fm(), i, true);
        }
        if (fa.contains(41)) {
            C0677b.m1411b(parcel, 41, ibVar.mo8377fn(), true);
        }
        if (fa.contains(46)) {
            C0677b.m1399a(parcel, 46, (Parcelable) ibVar.mo8378fo(), i, true);
        }
        if (fa.contains(47)) {
            C0677b.m1401a(parcel, 47, ibVar.getStartDate(), true);
        }
        if (fa.contains(44)) {
            C0677b.m1401a(parcel, 44, ibVar.getPostalCode(), true);
        }
        if (fa.contains(45)) {
            C0677b.m1401a(parcel, 45, ibVar.getRatingValue(), true);
        }
        if (fa.contains(51)) {
            C0677b.m1401a(parcel, 51, ibVar.getThumbnailUrl(), true);
        }
        if (fa.contains(50)) {
            C0677b.m1399a(parcel, 50, (Parcelable) ibVar.mo8379fp(), i, true);
        }
        if (fa.contains(49)) {
            C0677b.m1401a(parcel, 49, ibVar.getText(), true);
        }
        if (fa.contains(48)) {
            C0677b.m1401a(parcel, 48, ibVar.getStreetAddress(), true);
        }
        if (fa.contains(55)) {
            C0677b.m1401a(parcel, 55, ibVar.getWidth(), true);
        }
        if (fa.contains(54)) {
            C0677b.m1401a(parcel, 54, ibVar.getUrl(), true);
        }
        if (fa.contains(53)) {
            C0677b.m1401a(parcel, 53, ibVar.getType(), true);
        }
        if (fa.contains(52)) {
            C0677b.m1401a(parcel, 52, ibVar.getTickerSymbol(), true);
        }
        if (fa.contains(56)) {
            C0677b.m1401a(parcel, 56, ibVar.getWorstRating(), true);
        }
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: as */
    public C1402ib createFromParcel(Parcel parcel) {
        int n = C0675a.m1375n(parcel);
        HashSet hashSet = new HashSet();
        int i = 0;
        C1402ib ibVar = null;
        ArrayList<String> arrayList = null;
        C1402ib ibVar2 = null;
        String str = null;
        String str2 = null;
        String str3 = null;
        ArrayList arrayList2 = null;
        int i2 = 0;
        ArrayList arrayList3 = null;
        C1402ib ibVar3 = null;
        ArrayList arrayList4 = null;
        String str4 = null;
        String str5 = null;
        C1402ib ibVar4 = null;
        String str6 = null;
        String str7 = null;
        String str8 = null;
        ArrayList arrayList5 = null;
        String str9 = null;
        String str10 = null;
        String str11 = null;
        String str12 = null;
        String str13 = null;
        String str14 = null;
        String str15 = null;
        String str16 = null;
        String str17 = null;
        C1402ib ibVar5 = null;
        String str18 = null;
        String str19 = null;
        String str20 = null;
        String str21 = null;
        C1402ib ibVar6 = null;
        double d = 0.0d;
        C1402ib ibVar7 = null;
        double d2 = 0.0d;
        String str22 = null;
        C1402ib ibVar8 = null;
        ArrayList arrayList6 = null;
        String str23 = null;
        String str24 = null;
        String str25 = null;
        String str26 = null;
        C1402ib ibVar9 = null;
        String str27 = null;
        String str28 = null;
        String str29 = null;
        C1402ib ibVar10 = null;
        String str30 = null;
        String str31 = null;
        String str32 = null;
        String str33 = null;
        String str34 = null;
        String str35 = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    hashSet.add(1);
                    break;
                case 2:
                    hashSet.add(2);
                    ibVar = (C1402ib) C0675a.m1356a(parcel, m, C1402ib.CREATOR);
                    break;
                case 3:
                    arrayList = C0675a.m1387y(parcel, m);
                    hashSet.add(3);
                    break;
                case 4:
                    hashSet.add(4);
                    ibVar2 = (C1402ib) C0675a.m1356a(parcel, m, C1402ib.CREATOR);
                    break;
                case 5:
                    str = C0675a.m1374m(parcel, m);
                    hashSet.add(5);
                    break;
                case 6:
                    str2 = C0675a.m1374m(parcel, m);
                    hashSet.add(6);
                    break;
                case 7:
                    str3 = C0675a.m1374m(parcel, m);
                    hashSet.add(7);
                    break;
                case 8:
                    arrayList2 = C0675a.m1362c(parcel, m, C1402ib.CREATOR);
                    hashSet.add(8);
                    break;
                case 9:
                    i2 = C0675a.m1367g(parcel, m);
                    hashSet.add(9);
                    break;
                case 10:
                    arrayList3 = C0675a.m1362c(parcel, m, C1402ib.CREATOR);
                    hashSet.add(10);
                    break;
                case 11:
                    hashSet.add(11);
                    ibVar3 = (C1402ib) C0675a.m1356a(parcel, m, C1402ib.CREATOR);
                    break;
                case 12:
                    arrayList4 = C0675a.m1362c(parcel, m, C1402ib.CREATOR);
                    hashSet.add(12);
                    break;
                case 13:
                    str4 = C0675a.m1374m(parcel, m);
                    hashSet.add(13);
                    break;
                case 14:
                    str5 = C0675a.m1374m(parcel, m);
                    hashSet.add(14);
                    break;
                case 15:
                    hashSet.add(15);
                    ibVar4 = (C1402ib) C0675a.m1356a(parcel, m, C1402ib.CREATOR);
                    break;
                case 16:
                    str6 = C0675a.m1374m(parcel, m);
                    hashSet.add(16);
                    break;
                case 17:
                    str7 = C0675a.m1374m(parcel, m);
                    hashSet.add(17);
                    break;
                case 18:
                    str8 = C0675a.m1374m(parcel, m);
                    hashSet.add(18);
                    break;
                case 19:
                    arrayList5 = C0675a.m1362c(parcel, m, C1402ib.CREATOR);
                    hashSet.add(19);
                    break;
                case MMError.DISPLAY_AD_NOT_READY /*20*/:
                    str9 = C0675a.m1374m(parcel, m);
                    hashSet.add(20);
                    break;
                case MMError.DISPLAY_AD_EXPIRED /*21*/:
                    str10 = C0675a.m1374m(parcel, m);
                    hashSet.add(21);
                    break;
                case MMError.DISPLAY_AD_NOT_FOUND /*22*/:
                    str11 = C0675a.m1374m(parcel, m);
                    hashSet.add(22);
                    break;
                case MMError.DISPLAY_AD_ALREADY_DISPLAYED /*23*/:
                    str12 = C0675a.m1374m(parcel, m);
                    hashSet.add(23);
                    break;
                case MMError.DISPLAY_AD_NOT_PERMITTED /*24*/:
                    str13 = C0675a.m1374m(parcel, m);
                    hashSet.add(24);
                    break;
                case 25:
                    str14 = C0675a.m1374m(parcel, m);
                    hashSet.add(25);
                    break;
                case 26:
                    str15 = C0675a.m1374m(parcel, m);
                    hashSet.add(26);
                    break;
                case 27:
                    str16 = C0675a.m1374m(parcel, m);
                    hashSet.add(27);
                    break;
                case 28:
                    str17 = C0675a.m1374m(parcel, m);
                    hashSet.add(28);
                    break;
                case 29:
                    hashSet.add(29);
                    ibVar5 = (C1402ib) C0675a.m1356a(parcel, m, C1402ib.CREATOR);
                    break;
                case 30:
                    str18 = C0675a.m1374m(parcel, m);
                    hashSet.add(30);
                    break;
                case 31:
                    str19 = C0675a.m1374m(parcel, m);
                    hashSet.add(31);
                    break;
                case 32:
                    str20 = C0675a.m1374m(parcel, m);
                    hashSet.add(32);
                    break;
                case 33:
                    str21 = C0675a.m1374m(parcel, m);
                    hashSet.add(33);
                    break;
                case 34:
                    hashSet.add(34);
                    ibVar6 = (C1402ib) C0675a.m1356a(parcel, m, C1402ib.CREATOR);
                    break;
                case 36:
                    d = C0675a.m1371k(parcel, m);
                    hashSet.add(36);
                    break;
                case 37:
                    hashSet.add(37);
                    ibVar7 = (C1402ib) C0675a.m1356a(parcel, m, C1402ib.CREATOR);
                    break;
                case 38:
                    d2 = C0675a.m1371k(parcel, m);
                    hashSet.add(38);
                    break;
                case 39:
                    str22 = C0675a.m1374m(parcel, m);
                    hashSet.add(39);
                    break;
                case 40:
                    hashSet.add(40);
                    ibVar8 = (C1402ib) C0675a.m1356a(parcel, m, C1402ib.CREATOR);
                    break;
                case 41:
                    arrayList6 = C0675a.m1362c(parcel, m, C1402ib.CREATOR);
                    hashSet.add(41);
                    break;
                case 42:
                    str23 = C0675a.m1374m(parcel, m);
                    hashSet.add(42);
                    break;
                case 43:
                    str24 = C0675a.m1374m(parcel, m);
                    hashSet.add(43);
                    break;
                case 44:
                    str25 = C0675a.m1374m(parcel, m);
                    hashSet.add(44);
                    break;
                case 45:
                    str26 = C0675a.m1374m(parcel, m);
                    hashSet.add(45);
                    break;
                case 46:
                    hashSet.add(46);
                    ibVar9 = (C1402ib) C0675a.m1356a(parcel, m, C1402ib.CREATOR);
                    break;
                case 47:
                    str27 = C0675a.m1374m(parcel, m);
                    hashSet.add(47);
                    break;
                case 48:
                    str28 = C0675a.m1374m(parcel, m);
                    hashSet.add(48);
                    break;
                case 49:
                    str29 = C0675a.m1374m(parcel, m);
                    hashSet.add(49);
                    break;
                case 50:
                    hashSet.add(50);
                    ibVar10 = (C1402ib) C0675a.m1356a(parcel, m, C1402ib.CREATOR);
                    break;
                case 51:
                    str30 = C0675a.m1374m(parcel, m);
                    hashSet.add(51);
                    break;
                case 52:
                    str31 = C0675a.m1374m(parcel, m);
                    hashSet.add(52);
                    break;
                case 53:
                    str32 = C0675a.m1374m(parcel, m);
                    hashSet.add(53);
                    break;
                case 54:
                    str33 = C0675a.m1374m(parcel, m);
                    hashSet.add(54);
                    break;
                case 55:
                    str34 = C0675a.m1374m(parcel, m);
                    hashSet.add(55);
                    break;
                case 56:
                    str35 = C0675a.m1374m(parcel, m);
                    hashSet.add(56);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new C1402ib(hashSet, i, ibVar, arrayList, ibVar2, str, str2, str3, arrayList2, i2, arrayList3, ibVar3, arrayList4, str4, str5, ibVar4, str6, str7, str8, arrayList5, str9, str10, str11, str12, str13, str14, str15, str16, str17, ibVar5, str18, str19, str20, str21, ibVar6, d, ibVar7, d2, str22, ibVar8, arrayList6, str23, str24, str25, str26, ibVar9, str27, str28, str29, ibVar10, str30, str31, str32, str33, str34, str35);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: bk */
    public C1402ib[] newArray(int i) {
        return new C1402ib[i];
    }
}
