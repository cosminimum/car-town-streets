package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/* renamed from: com.google.android.gms.internal.gt */
public final class C1323gt implements SafeParcelable {
    public static final C1324gu CREATOR = new C1324gu();

    /* renamed from: kg */
    final int f3003kg;

    /* renamed from: yf */
    private final int f3004yf;

    /* renamed from: yg */
    final List<C1327gx> f3005yg;

    /* renamed from: yh */
    private final String f3006yh;

    /* renamed from: yi */
    private final String f3007yi;

    /* renamed from: yj */
    private final boolean f3008yj;

    /* renamed from: yk */
    private final Set<C1327gx> f3009yk;

    C1323gt(int i, int i2, List<C1327gx> list, String str, String str2, boolean z) {
        this.f3003kg = i;
        this.f3004yf = i2;
        this.f3005yg = list == null ? Collections.emptyList() : Collections.unmodifiableList(list);
        this.f3006yh = str == null ? "" : str;
        this.f3007yi = str2 == null ? "" : str2;
        this.f3008yj = z;
        if (this.f3005yg.isEmpty()) {
            this.f3009yk = Collections.emptySet();
        } else {
            this.f3009yk = Collections.unmodifiableSet(new HashSet(this.f3005yg));
        }
    }

    /* renamed from: dO */
    public int mo8123dO() {
        return this.f3004yf;
    }

    /* renamed from: dP */
    public String mo8124dP() {
        return this.f3006yh;
    }

    /* renamed from: dQ */
    public String mo8125dQ() {
        return this.f3007yi;
    }

    /* renamed from: dR */
    public boolean mo8126dR() {
        return this.f3008yj;
    }

    public int describeContents() {
        C1324gu guVar = CREATOR;
        return 0;
    }

    public boolean equals(Object object) {
        if (this == object) {
            return true;
        }
        if (!(object instanceof C1323gt)) {
            return false;
        }
        C1323gt gtVar = (C1323gt) object;
        return this.f3004yf == gtVar.f3004yf && this.f3009yk.equals(gtVar.f3009yk) && this.f3006yh == gtVar.f3006yh && this.f3007yi == gtVar.f3007yi && this.f3008yj == gtVar.f3008yj;
    }

    public int hashCode() {
        return C1098ee.hashCode(Integer.valueOf(this.f3004yf), this.f3009yk, this.f3006yh, this.f3007yi, Boolean.valueOf(this.f3008yj));
    }

    public String toString() {
        return C1098ee.m2604e(this).mo7535a("maxResults", Integer.valueOf(this.f3004yf)).mo7535a("types", this.f3009yk).mo7535a("nameQuery", this.f3006yh).mo7535a("textQuery", this.f3007yi).mo7535a("isOpenNowRequired", Boolean.valueOf(this.f3008yj)).toString();
    }

    public void writeToParcel(Parcel parcel, int flags) {
        C1324gu guVar = CREATOR;
        C1324gu.m3530a(this, parcel, flags);
    }
}
