package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.location.LocationRequest;
/* loaded from: classes.dex */
public final class gv implements SafeParcelable {
    public static final gw CREATOR = new gw();
    final int kg;
    private final LocationRequest yl;
    private final gt ym;

    public gv(int i, LocationRequest locationRequest, gt gtVar) {
        this.kg = i;
        this.yl = locationRequest;
        this.ym = gtVar;
    }

    public LocationRequest dS() {
        return this.yl;
    }

    public gt dT() {
        return this.ym;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        gw gwVar = CREATOR;
        return 0;
    }

    public boolean equals(Object object) {
        if (this == object) {
            return true;
        }
        if (!(object instanceof gv)) {
            return false;
        }
        gv gvVar = (gv) object;
        return this.yl.equals(gvVar.yl) && this.ym.equals(gvVar.ym);
    }

    public int hashCode() {
        return ee.hashCode(this.yl, this.ym);
    }

    public String toString() {
        return ee.e(this).a("locationRequest", this.yl).a("filter", this.ym).toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int flags) {
        gw gwVar = CREATOR;
        gw.a(this, parcel, flags);
    }
}
