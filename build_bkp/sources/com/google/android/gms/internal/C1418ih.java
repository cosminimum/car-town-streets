package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.internal.C1407ig;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

/* renamed from: com.google.android.gms.internal.ih */
public class C1418ih implements Parcelable.Creator<C1407ig> {
    /* renamed from: a */
    static void m3869a(C1407ig igVar, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        Set<Integer> fa = igVar.mo8525fa();
        if (fa.contains(1)) {
            C0677b.m1412c(parcel, 1, igVar.getVersionCode());
        }
        if (fa.contains(2)) {
            C0677b.m1401a(parcel, 2, igVar.getAboutMe(), true);
        }
        if (fa.contains(3)) {
            C0677b.m1399a(parcel, 3, (Parcelable) igVar.mo8526fv(), i, true);
        }
        if (fa.contains(4)) {
            C0677b.m1401a(parcel, 4, igVar.getBirthday(), true);
        }
        if (fa.contains(5)) {
            C0677b.m1401a(parcel, 5, igVar.getBraggingRights(), true);
        }
        if (fa.contains(6)) {
            C0677b.m1412c(parcel, 6, igVar.getCircledByCount());
        }
        if (fa.contains(7)) {
            C0677b.m1399a(parcel, 7, (Parcelable) igVar.mo8527fw(), i, true);
        }
        if (fa.contains(8)) {
            C0677b.m1401a(parcel, 8, igVar.getCurrentLocation(), true);
        }
        if (fa.contains(9)) {
            C0677b.m1401a(parcel, 9, igVar.getDisplayName(), true);
        }
        if (fa.contains(12)) {
            C0677b.m1412c(parcel, 12, igVar.getGender());
        }
        if (fa.contains(14)) {
            C0677b.m1401a(parcel, 14, igVar.getId(), true);
        }
        if (fa.contains(15)) {
            C0677b.m1399a(parcel, 15, (Parcelable) igVar.mo8528fx(), i, true);
        }
        if (fa.contains(16)) {
            C0677b.m1404a(parcel, 16, igVar.isPlusUser());
        }
        if (fa.contains(19)) {
            C0677b.m1399a(parcel, 19, (Parcelable) igVar.mo8529fy(), i, true);
        }
        if (fa.contains(18)) {
            C0677b.m1401a(parcel, 18, igVar.getLanguage(), true);
        }
        if (fa.contains(21)) {
            C0677b.m1412c(parcel, 21, igVar.getObjectType());
        }
        if (fa.contains(20)) {
            C0677b.m1401a(parcel, 20, igVar.getNickname(), true);
        }
        if (fa.contains(23)) {
            C0677b.m1411b(parcel, 23, igVar.mo8522fA(), true);
        }
        if (fa.contains(22)) {
            C0677b.m1411b(parcel, 22, igVar.mo8530fz(), true);
        }
        if (fa.contains(25)) {
            C0677b.m1412c(parcel, 25, igVar.getRelationshipStatus());
        }
        if (fa.contains(24)) {
            C0677b.m1412c(parcel, 24, igVar.getPlusOneCount());
        }
        if (fa.contains(27)) {
            C0677b.m1401a(parcel, 27, igVar.getUrl(), true);
        }
        if (fa.contains(26)) {
            C0677b.m1401a(parcel, 26, igVar.getTagline(), true);
        }
        if (fa.contains(29)) {
            C0677b.m1404a(parcel, 29, igVar.isVerified());
        }
        if (fa.contains(28)) {
            C0677b.m1411b(parcel, 28, igVar.mo8523fB(), true);
        }
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: au */
    public C1407ig createFromParcel(Parcel parcel) {
        int n = C0675a.m1375n(parcel);
        HashSet hashSet = new HashSet();
        int i = 0;
        String str = null;
        C1407ig.C1408a aVar = null;
        String str2 = null;
        String str3 = null;
        int i2 = 0;
        C1407ig.C1409b bVar = null;
        String str4 = null;
        String str5 = null;
        int i3 = 0;
        String str6 = null;
        C1407ig.C1412c cVar = null;
        boolean z = false;
        String str7 = null;
        C1407ig.C1413d dVar = null;
        String str8 = null;
        int i4 = 0;
        ArrayList arrayList = null;
        ArrayList arrayList2 = null;
        int i5 = 0;
        int i6 = 0;
        String str9 = null;
        String str10 = null;
        ArrayList arrayList3 = null;
        boolean z2 = false;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    hashSet.add(1);
                    break;
                case 2:
                    str = C0675a.m1374m(parcel, m);
                    hashSet.add(2);
                    break;
                case 3:
                    hashSet.add(3);
                    aVar = (C1407ig.C1408a) C0675a.m1356a(parcel, m, C1407ig.C1408a.CREATOR);
                    break;
                case 4:
                    str2 = C0675a.m1374m(parcel, m);
                    hashSet.add(4);
                    break;
                case 5:
                    str3 = C0675a.m1374m(parcel, m);
                    hashSet.add(5);
                    break;
                case 6:
                    i2 = C0675a.m1367g(parcel, m);
                    hashSet.add(6);
                    break;
                case 7:
                    hashSet.add(7);
                    bVar = (C1407ig.C1409b) C0675a.m1356a(parcel, m, C1407ig.C1409b.CREATOR);
                    break;
                case 8:
                    str4 = C0675a.m1374m(parcel, m);
                    hashSet.add(8);
                    break;
                case 9:
                    str5 = C0675a.m1374m(parcel, m);
                    hashSet.add(9);
                    break;
                case 12:
                    i3 = C0675a.m1367g(parcel, m);
                    hashSet.add(12);
                    break;
                case 14:
                    str6 = C0675a.m1374m(parcel, m);
                    hashSet.add(14);
                    break;
                case 15:
                    hashSet.add(15);
                    cVar = (C1407ig.C1412c) C0675a.m1356a(parcel, m, C1407ig.C1412c.CREATOR);
                    break;
                case 16:
                    z = C0675a.m1363c(parcel, m);
                    hashSet.add(16);
                    break;
                case 18:
                    str7 = C0675a.m1374m(parcel, m);
                    hashSet.add(18);
                    break;
                case 19:
                    hashSet.add(19);
                    dVar = (C1407ig.C1413d) C0675a.m1356a(parcel, m, C1407ig.C1413d.CREATOR);
                    break;
                case MMError.DISPLAY_AD_NOT_READY /*20*/:
                    str8 = C0675a.m1374m(parcel, m);
                    hashSet.add(20);
                    break;
                case MMError.DISPLAY_AD_EXPIRED /*21*/:
                    i4 = C0675a.m1367g(parcel, m);
                    hashSet.add(21);
                    break;
                case MMError.DISPLAY_AD_NOT_FOUND /*22*/:
                    arrayList = C0675a.m1362c(parcel, m, C1407ig.C1415f.CREATOR);
                    hashSet.add(22);
                    break;
                case MMError.DISPLAY_AD_ALREADY_DISPLAYED /*23*/:
                    arrayList2 = C0675a.m1362c(parcel, m, C1407ig.C1416g.CREATOR);
                    hashSet.add(23);
                    break;
                case MMError.DISPLAY_AD_NOT_PERMITTED /*24*/:
                    i5 = C0675a.m1367g(parcel, m);
                    hashSet.add(24);
                    break;
                case 25:
                    i6 = C0675a.m1367g(parcel, m);
                    hashSet.add(25);
                    break;
                case 26:
                    str9 = C0675a.m1374m(parcel, m);
                    hashSet.add(26);
                    break;
                case 27:
                    str10 = C0675a.m1374m(parcel, m);
                    hashSet.add(27);
                    break;
                case 28:
                    arrayList3 = C0675a.m1362c(parcel, m, C1407ig.C1417h.CREATOR);
                    hashSet.add(28);
                    break;
                case 29:
                    z2 = C0675a.m1363c(parcel, m);
                    hashSet.add(29);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new C1407ig(hashSet, i, str, aVar, str2, str3, i2, bVar, str4, str5, i3, str6, cVar, z, str7, dVar, str8, i4, arrayList, arrayList2, i5, i6, str9, str10, arrayList3, z2);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: bm */
    public C1407ig[] newArray(int i) {
        return new C1407ig[i];
    }
}
