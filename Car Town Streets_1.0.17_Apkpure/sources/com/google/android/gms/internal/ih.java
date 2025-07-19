package com.google.android.gms.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.internal.ig;
import com.millennialmedia.android.MMError;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
/* loaded from: classes.dex */
public class ih implements Parcelable.Creator<ig> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(ig igVar, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        Set<Integer> fa = igVar.fa();
        if (fa.contains(1)) {
            com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, igVar.getVersionCode());
        }
        if (fa.contains(2)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, igVar.getAboutMe(), true);
        }
        if (fa.contains(3)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, (Parcelable) igVar.fv(), i, true);
        }
        if (fa.contains(4)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, igVar.getBirthday(), true);
        }
        if (fa.contains(5)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, igVar.getBraggingRights(), true);
        }
        if (fa.contains(6)) {
            com.google.android.gms.common.internal.safeparcel.b.c(parcel, 6, igVar.getCircledByCount());
        }
        if (fa.contains(7)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 7, (Parcelable) igVar.fw(), i, true);
        }
        if (fa.contains(8)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 8, igVar.getCurrentLocation(), true);
        }
        if (fa.contains(9)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 9, igVar.getDisplayName(), true);
        }
        if (fa.contains(12)) {
            com.google.android.gms.common.internal.safeparcel.b.c(parcel, 12, igVar.getGender());
        }
        if (fa.contains(14)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 14, igVar.getId(), true);
        }
        if (fa.contains(15)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 15, (Parcelable) igVar.fx(), i, true);
        }
        if (fa.contains(16)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 16, igVar.isPlusUser());
        }
        if (fa.contains(19)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 19, (Parcelable) igVar.fy(), i, true);
        }
        if (fa.contains(18)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 18, igVar.getLanguage(), true);
        }
        if (fa.contains(21)) {
            com.google.android.gms.common.internal.safeparcel.b.c(parcel, 21, igVar.getObjectType());
        }
        if (fa.contains(20)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 20, igVar.getNickname(), true);
        }
        if (fa.contains(23)) {
            com.google.android.gms.common.internal.safeparcel.b.b(parcel, 23, igVar.fA(), true);
        }
        if (fa.contains(22)) {
            com.google.android.gms.common.internal.safeparcel.b.b(parcel, 22, igVar.fz(), true);
        }
        if (fa.contains(25)) {
            com.google.android.gms.common.internal.safeparcel.b.c(parcel, 25, igVar.getRelationshipStatus());
        }
        if (fa.contains(24)) {
            com.google.android.gms.common.internal.safeparcel.b.c(parcel, 24, igVar.getPlusOneCount());
        }
        if (fa.contains(27)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 27, igVar.getUrl(), true);
        }
        if (fa.contains(26)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 26, igVar.getTagline(), true);
        }
        if (fa.contains(29)) {
            com.google.android.gms.common.internal.safeparcel.b.a(parcel, 29, igVar.isVerified());
        }
        if (fa.contains(28)) {
            com.google.android.gms.common.internal.safeparcel.b.b(parcel, 28, igVar.fB(), true);
        }
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: au */
    public ig createFromParcel(Parcel parcel) {
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        HashSet hashSet = new HashSet();
        int i = 0;
        String str = null;
        ig.a aVar = null;
        String str2 = null;
        String str3 = null;
        int i2 = 0;
        ig.b bVar = null;
        String str4 = null;
        String str5 = null;
        int i3 = 0;
        String str6 = null;
        ig.c cVar = null;
        boolean z = false;
        String str7 = null;
        ig.d dVar = null;
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
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    hashSet.add(1);
                    break;
                case 2:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    hashSet.add(2);
                    break;
                case 3:
                    hashSet.add(3);
                    aVar = (ig.a) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, ig.a.CREATOR);
                    break;
                case 4:
                    str2 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    hashSet.add(4);
                    break;
                case 5:
                    str3 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    hashSet.add(5);
                    break;
                case 6:
                    i2 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    hashSet.add(6);
                    break;
                case 7:
                    hashSet.add(7);
                    bVar = (ig.b) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, ig.b.CREATOR);
                    break;
                case 8:
                    str4 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    hashSet.add(8);
                    break;
                case 9:
                    str5 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    hashSet.add(9);
                    break;
                case 10:
                case 11:
                case 13:
                case 17:
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
                case 12:
                    i3 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    hashSet.add(12);
                    break;
                case 14:
                    str6 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    hashSet.add(14);
                    break;
                case 15:
                    hashSet.add(15);
                    cVar = (ig.c) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, ig.c.CREATOR);
                    break;
                case 16:
                    z = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    hashSet.add(16);
                    break;
                case 18:
                    str7 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    hashSet.add(18);
                    break;
                case 19:
                    hashSet.add(19);
                    dVar = (ig.d) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, ig.d.CREATOR);
                    break;
                case MMError.DISPLAY_AD_NOT_READY /* 20 */:
                    str8 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    hashSet.add(20);
                    break;
                case MMError.DISPLAY_AD_EXPIRED /* 21 */:
                    i4 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    hashSet.add(21);
                    break;
                case MMError.DISPLAY_AD_NOT_FOUND /* 22 */:
                    arrayList = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m, ig.f.CREATOR);
                    hashSet.add(22);
                    break;
                case MMError.DISPLAY_AD_ALREADY_DISPLAYED /* 23 */:
                    arrayList2 = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m, ig.g.CREATOR);
                    hashSet.add(23);
                    break;
                case MMError.DISPLAY_AD_NOT_PERMITTED /* 24 */:
                    i5 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    hashSet.add(24);
                    break;
                case 25:
                    i6 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    hashSet.add(25);
                    break;
                case 26:
                    str9 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    hashSet.add(26);
                    break;
                case 27:
                    str10 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    hashSet.add(27);
                    break;
                case 28:
                    arrayList3 = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m, ig.h.CREATOR);
                    hashSet.add(28);
                    break;
                case 29:
                    z2 = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m);
                    hashSet.add(29);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new ig(hashSet, i, str, aVar, str2, str3, i2, bVar, str4, str5, i3, str6, cVar, z, str7, dVar, str8, i4, arrayList, arrayList2, i5, i6, str9, str10, arrayList3, z2);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: bm */
    public ig[] newArray(int i) {
        return new ig[i];
    }
}
