package com.google.android.gms.internal;

import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

/* renamed from: com.google.android.gms.internal.bz */
public final class C0972bz implements SafeParcelable {
    public static final C0975ca CREATOR = new C0975ca();
    public final String adUnitId;
    public final ApplicationInfo applicationInfo;

    /* renamed from: ej */
    public final C1005cu f2305ej;

    /* renamed from: em */
    public final C1466x f2306em;

    /* renamed from: hq */
    public final Bundle f2307hq;

    /* renamed from: hr */
    public final C1464v f2308hr;

    /* renamed from: hs */
    public final PackageInfo f2309hs;

    /* renamed from: ht */
    public final String f2310ht;

    /* renamed from: hu */
    public final String f2311hu;

    /* renamed from: hv */
    public final String f2312hv;
    public final int versionCode;

    /* renamed from: com.google.android.gms.internal.bz$a */
    public static final class C0973a {
        public final String adUnitId;
        public final ApplicationInfo applicationInfo;

        /* renamed from: ej */
        public final C1005cu f2313ej;

        /* renamed from: em */
        public final C1466x f2314em;

        /* renamed from: hq */
        public final Bundle f2315hq;

        /* renamed from: hr */
        public final C1464v f2316hr;

        /* renamed from: hs */
        public final PackageInfo f2317hs;

        /* renamed from: hu */
        public final String f2318hu;

        /* renamed from: hv */
        public final String f2319hv;

        public C0973a(Bundle bundle, C1464v vVar, C1466x xVar, String str, ApplicationInfo applicationInfo2, PackageInfo packageInfo, String str2, String str3, C1005cu cuVar) {
            this.f2315hq = bundle;
            this.f2316hr = vVar;
            this.f2314em = xVar;
            this.adUnitId = str;
            this.applicationInfo = applicationInfo2;
            this.f2317hs = packageInfo;
            this.f2318hu = str2;
            this.f2319hv = str3;
            this.f2313ej = cuVar;
        }
    }

    C0972bz(int i, Bundle bundle, C1464v vVar, C1466x xVar, String str, ApplicationInfo applicationInfo2, PackageInfo packageInfo, String str2, String str3, String str4, C1005cu cuVar) {
        this.versionCode = i;
        this.f2307hq = bundle;
        this.f2308hr = vVar;
        this.f2306em = xVar;
        this.adUnitId = str;
        this.applicationInfo = applicationInfo2;
        this.f2309hs = packageInfo;
        this.f2310ht = str2;
        this.f2311hu = str3;
        this.f2312hv = str4;
        this.f2305ej = cuVar;
    }

    public C0972bz(Bundle bundle, C1464v vVar, C1466x xVar, String str, ApplicationInfo applicationInfo2, PackageInfo packageInfo, String str2, String str3, String str4, C1005cu cuVar) {
        this(1, bundle, vVar, xVar, str, applicationInfo2, packageInfo, str2, str3, str4, cuVar);
    }

    public C0972bz(C0973a aVar, String str) {
        this(aVar.f2315hq, aVar.f2316hr, aVar.f2314em, aVar.adUnitId, aVar.applicationInfo, aVar.f2317hs, str, aVar.f2318hu, aVar.f2319hv, aVar.f2313ej);
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel out, int flags) {
        C0975ca.m2116a(this, out, flags);
    }
}
