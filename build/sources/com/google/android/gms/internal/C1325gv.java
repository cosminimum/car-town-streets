package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.location.LocationRequest;

/* renamed from: com.google.android.gms.internal.gv */
public final class C1325gv implements SafeParcelable {
    public static final C1326gw CREATOR = new C1326gw();

    /* renamed from: kg */
    final int f3010kg;

    /* renamed from: yl */
    private final LocationRequest f3011yl;

    /* renamed from: ym */
    private final C1323gt f3012ym;

    public C1325gv(int i, LocationRequest locationRequest, C1323gt gtVar) {
        this.f3010kg = i;
        this.f3011yl = locationRequest;
        this.f3012ym = gtVar;
    }

    /* renamed from: dS */
    public LocationRequest mo8136dS() {
        return this.f3011yl;
    }

    /* renamed from: dT */
    public C1323gt mo8137dT() {
        return this.f3012ym;
    }

    public int describeContents() {
        C1326gw gwVar = CREATOR;
        return 0;
    }

    public boolean equals(Object object) {
        if (this == object) {
            return true;
        }
        if (!(object instanceof C1325gv)) {
            return false;
        }
        C1325gv gvVar = (C1325gv) object;
        return this.f3011yl.equals(gvVar.f3011yl) && this.f3012ym.equals(gvVar.f3012ym);
    }

    public int hashCode() {
        return C1098ee.hashCode(this.f3011yl, this.f3012ym);
    }

    public String toString() {
        return C1098ee.m2604e(this).mo7535a("locationRequest", this.f3011yl).mo7535a("filter", this.f3012ym).toString();
    }

    public void writeToParcel(Parcel parcel, int flags) {
        C1326gw gwVar = CREATOR;
        C1326gw.m3535a(this, parcel, flags);
    }
}
