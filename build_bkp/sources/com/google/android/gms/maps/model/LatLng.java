package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.maps.internal.C1558r;

public final class LatLng implements SafeParcelable {
    public static final LatLngCreator CREATOR = new LatLngCreator();

    /* renamed from: kg */
    private final int f3643kg;
    public final double latitude;
    public final double longitude;

    public LatLng(double latitude2, double longitude2) {
        this(1, latitude2, longitude2);
    }

    LatLng(int versionCode, double latitude2, double longitude2) {
        this.f3643kg = versionCode;
        if (-180.0d > longitude2 || longitude2 >= 180.0d) {
            this.longitude = ((((longitude2 - 180.0d) % 360.0d) + 360.0d) % 360.0d) - 180.0d;
        } else {
            this.longitude = longitude2;
        }
        this.latitude = Math.max(-90.0d, Math.min(90.0d, latitude2));
    }

    public int describeContents() {
        return 0;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof LatLng)) {
            return false;
        }
        LatLng latLng = (LatLng) o;
        return Double.doubleToLongBits(this.latitude) == Double.doubleToLongBits(latLng.latitude) && Double.doubleToLongBits(this.longitude) == Double.doubleToLongBits(latLng.longitude);
    }

    /* access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.f3643kg;
    }

    public int hashCode() {
        long doubleToLongBits = Double.doubleToLongBits(this.latitude);
        long doubleToLongBits2 = Double.doubleToLongBits(this.longitude);
        return ((((int) (doubleToLongBits ^ (doubleToLongBits >>> 32))) + 31) * 31) + ((int) (doubleToLongBits2 ^ (doubleToLongBits2 >>> 32)));
    }

    public String toString() {
        return "lat/lng: (" + this.latitude + "," + this.longitude + ")";
    }

    public void writeToParcel(Parcel out, int flags) {
        if (C1558r.m4205eD()) {
            C1565e.m4239a(this, out, flags);
        } else {
            LatLngCreator.m4222a(this, out, flags);
        }
    }
}
