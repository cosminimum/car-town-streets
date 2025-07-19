package com.google.android.gms.internal;

import android.content.Intent;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.dynamic.C0772b;
import com.google.android.gms.dynamic.C0775c;

/* renamed from: com.google.android.gms.internal.bm */
public final class C0944bm implements SafeParcelable {
    public static final C0943bl CREATOR = new C0943bl();

    /* renamed from: ej */
    public final C1005cu f2253ej;

    /* renamed from: gG */
    public final C0938bj f2254gG;

    /* renamed from: gH */
    public final C1457q f2255gH;

    /* renamed from: gI */
    public final C0945bn f2256gI;

    /* renamed from: gJ */
    public final C1007cw f2257gJ;

    /* renamed from: gK */
    public final C0871al f2258gK;

    /* renamed from: gL */
    public final String f2259gL;

    /* renamed from: gM */
    public final boolean f2260gM;

    /* renamed from: gN */
    public final String f2261gN;

    /* renamed from: gO */
    public final C0950bq f2262gO;

    /* renamed from: gP */
    public final int f2263gP;

    /* renamed from: go */
    public final String f2264go;
    public final int orientation;
    public final int versionCode;

    C0944bm(int i, C0938bj bjVar, IBinder iBinder, IBinder iBinder2, IBinder iBinder3, IBinder iBinder4, String str, boolean z, String str2, IBinder iBinder5, int i2, int i3, String str3, C1005cu cuVar) {
        this.versionCode = i;
        this.f2254gG = bjVar;
        this.f2255gH = (C1457q) C0775c.m1695b(C0772b.C0773a.m1694E(iBinder));
        this.f2256gI = (C0945bn) C0775c.m1695b(C0772b.C0773a.m1694E(iBinder2));
        this.f2257gJ = (C1007cw) C0775c.m1695b(C0772b.C0773a.m1694E(iBinder3));
        this.f2258gK = (C0871al) C0775c.m1695b(C0772b.C0773a.m1694E(iBinder4));
        this.f2259gL = str;
        this.f2260gM = z;
        this.f2261gN = str2;
        this.f2262gO = (C0950bq) C0775c.m1695b(C0772b.C0773a.m1694E(iBinder5));
        this.orientation = i2;
        this.f2263gP = i3;
        this.f2264go = str3;
        this.f2253ej = cuVar;
    }

    public C0944bm(C0938bj bjVar, C1457q qVar, C0945bn bnVar, C0950bq bqVar, C1005cu cuVar) {
        this.versionCode = 1;
        this.f2254gG = bjVar;
        this.f2255gH = qVar;
        this.f2256gI = bnVar;
        this.f2257gJ = null;
        this.f2258gK = null;
        this.f2259gL = null;
        this.f2260gM = false;
        this.f2261gN = null;
        this.f2262gO = bqVar;
        this.orientation = -1;
        this.f2263gP = 4;
        this.f2264go = null;
        this.f2253ej = cuVar;
    }

    public C0944bm(C1457q qVar, C0945bn bnVar, C0871al alVar, C0950bq bqVar, C1007cw cwVar, boolean z, int i, String str, C1005cu cuVar) {
        this.versionCode = 1;
        this.f2254gG = null;
        this.f2255gH = qVar;
        this.f2256gI = bnVar;
        this.f2257gJ = cwVar;
        this.f2258gK = alVar;
        this.f2259gL = null;
        this.f2260gM = z;
        this.f2261gN = null;
        this.f2262gO = bqVar;
        this.orientation = i;
        this.f2263gP = 3;
        this.f2264go = str;
        this.f2253ej = cuVar;
    }

    public C0944bm(C1457q qVar, C0945bn bnVar, C0871al alVar, C0950bq bqVar, C1007cw cwVar, boolean z, int i, String str, String str2, C1005cu cuVar) {
        this.versionCode = 1;
        this.f2254gG = null;
        this.f2255gH = qVar;
        this.f2256gI = bnVar;
        this.f2257gJ = cwVar;
        this.f2258gK = alVar;
        this.f2259gL = str2;
        this.f2260gM = z;
        this.f2261gN = str;
        this.f2262gO = bqVar;
        this.orientation = i;
        this.f2263gP = 3;
        this.f2264go = null;
        this.f2253ej = cuVar;
    }

    public C0944bm(C1457q qVar, C0945bn bnVar, C0950bq bqVar, C1007cw cwVar, int i, C1005cu cuVar) {
        this.versionCode = 1;
        this.f2254gG = null;
        this.f2255gH = qVar;
        this.f2256gI = bnVar;
        this.f2257gJ = cwVar;
        this.f2258gK = null;
        this.f2259gL = null;
        this.f2260gM = false;
        this.f2261gN = null;
        this.f2262gO = bqVar;
        this.orientation = i;
        this.f2263gP = 1;
        this.f2264go = null;
        this.f2253ej = cuVar;
    }

    public C0944bm(C1457q qVar, C0945bn bnVar, C0950bq bqVar, C1007cw cwVar, boolean z, int i, C1005cu cuVar) {
        this.versionCode = 1;
        this.f2254gG = null;
        this.f2255gH = qVar;
        this.f2256gI = bnVar;
        this.f2257gJ = cwVar;
        this.f2258gK = null;
        this.f2259gL = null;
        this.f2260gM = z;
        this.f2261gN = null;
        this.f2262gO = bqVar;
        this.orientation = i;
        this.f2263gP = 2;
        this.f2264go = null;
        this.f2253ej = cuVar;
    }

    /* renamed from: a */
    public static C0944bm m2051a(Intent intent) {
        try {
            Bundle bundleExtra = intent.getBundleExtra("com.google.android.gms.ads.inernal.overlay.AdOverlayInfo");
            bundleExtra.setClassLoader(C0944bm.class.getClassLoader());
            return (C0944bm) bundleExtra.getParcelable("com.google.android.gms.ads.inernal.overlay.AdOverlayInfo");
        } catch (Exception e) {
            return null;
        }
    }

    /* renamed from: a */
    public static void m2052a(Intent intent, C0944bm bmVar) {
        Bundle bundle = new Bundle(1);
        bundle.putParcelable("com.google.android.gms.ads.inernal.overlay.AdOverlayInfo", bmVar);
        intent.putExtra("com.google.android.gms.ads.inernal.overlay.AdOverlayInfo", bundle);
    }

    /* access modifiers changed from: package-private */
    /* renamed from: aa */
    public IBinder mo7152aa() {
        return C0775c.m1696h(this.f2255gH).asBinder();
    }

    /* access modifiers changed from: package-private */
    /* renamed from: ab */
    public IBinder mo7153ab() {
        return C0775c.m1696h(this.f2256gI).asBinder();
    }

    /* access modifiers changed from: package-private */
    /* renamed from: ac */
    public IBinder mo7154ac() {
        return C0775c.m1696h(this.f2257gJ).asBinder();
    }

    /* access modifiers changed from: package-private */
    /* renamed from: ad */
    public IBinder mo7155ad() {
        return C0775c.m1696h(this.f2258gK).asBinder();
    }

    /* access modifiers changed from: package-private */
    /* renamed from: ae */
    public IBinder mo7156ae() {
        return C0775c.m1696h(this.f2262gO).asBinder();
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel out, int flags) {
        C0943bl.m2048a(this, out, flags);
    }
}
