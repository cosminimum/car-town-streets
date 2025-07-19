package com.google.android.gms.internal;

import android.content.Context;
import android.location.Location;
import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.ads.mediation.admob.AdMobExtras;
import com.google.android.gms.ads.search.SearchAdRequest;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Set;

/* renamed from: com.google.android.gms.internal.v */
public final class C1464v implements SafeParcelable {
    public static final C1465w CREATOR = new C1465w();

    /* renamed from: eA */
    public final boolean f3477eA;

    /* renamed from: eB */
    public final boolean f3478eB;

    /* renamed from: eC */
    public final String f3479eC;

    /* renamed from: eD */
    public final C0868ai f3480eD;

    /* renamed from: eE */
    public final Location f3481eE;

    /* renamed from: ex */
    public final long f3482ex;
    public final Bundle extras;

    /* renamed from: ey */
    public final int f3483ey;

    /* renamed from: ez */
    public final List<String> f3484ez;
    public final int tagForChildDirectedTreatment;
    public final int versionCode;

    C1464v(int i, long j, Bundle bundle, int i2, List<String> list, boolean z, int i3, boolean z2, String str, C0868ai aiVar, Location location) {
        this.versionCode = i;
        this.f3482ex = j;
        this.extras = bundle;
        this.f3483ey = i2;
        this.f3484ez = list;
        this.f3477eA = z;
        this.tagForChildDirectedTreatment = i3;
        this.f3478eB = z2;
        this.f3479eC = str;
        this.f3480eD = aiVar;
        this.f3481eE = location;
    }

    public C1464v(Context context, C0864af afVar) {
        C0868ai aiVar = null;
        this.versionCode = 2;
        Date birthday = afVar.getBirthday();
        this.f3482ex = birthday != null ? birthday.getTime() : -1;
        this.f3483ey = afVar.getGender();
        Set<String> keywords = afVar.getKeywords();
        this.f3484ez = !keywords.isEmpty() ? Collections.unmodifiableList(new ArrayList(keywords)) : null;
        this.f3477eA = afVar.isTestDevice(context);
        this.tagForChildDirectedTreatment = afVar.mo7020S();
        this.f3481eE = afVar.getLocation();
        AdMobExtras adMobExtras = (AdMobExtras) afVar.getNetworkExtras(AdMobExtras.class);
        this.extras = adMobExtras != null ? adMobExtras.getExtras() : null;
        this.f3478eB = afVar.getManualImpressionsEnabled();
        this.f3479eC = afVar.getPublisherProvidedId();
        SearchAdRequest Q = afVar.mo7018Q();
        this.f3480eD = Q != null ? new C0868ai(Q) : aiVar;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel out, int flags) {
        C1465w.m4073a(this, out, flags);
    }
}
