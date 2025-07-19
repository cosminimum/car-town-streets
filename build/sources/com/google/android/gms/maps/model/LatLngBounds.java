package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.C1098ee;
import com.google.android.gms.internal.C1102eg;
import com.google.android.gms.maps.internal.C1558r;

public final class LatLngBounds implements SafeParcelable {
    public static final LatLngBoundsCreator CREATOR = new LatLngBoundsCreator();

    /* renamed from: kg */
    private final int f3644kg;
    public final LatLng northeast;
    public final LatLng southwest;

    public static final class Builder {

        /* renamed from: CH */
        private double f3645CH = Double.POSITIVE_INFINITY;

        /* renamed from: CI */
        private double f3646CI = Double.NEGATIVE_INFINITY;

        /* renamed from: CJ */
        private double f3647CJ = Double.NaN;

        /* renamed from: CK */
        private double f3648CK = Double.NaN;

        /* renamed from: d */
        private boolean m4220d(double d) {
            boolean z = false;
            if (this.f3647CJ <= this.f3648CK) {
                return this.f3647CJ <= d && d <= this.f3648CK;
            }
            if (this.f3647CJ <= d || d <= this.f3648CK) {
                z = true;
            }
            return z;
        }

        public LatLngBounds build() {
            C1102eg.m2612a(!Double.isNaN(this.f3647CJ), "no included points");
            return new LatLngBounds(new LatLng(this.f3645CH, this.f3647CJ), new LatLng(this.f3646CI, this.f3648CK));
        }

        public Builder include(LatLng point) {
            this.f3645CH = Math.min(this.f3645CH, point.latitude);
            this.f3646CI = Math.max(this.f3646CI, point.latitude);
            double d = point.longitude;
            if (Double.isNaN(this.f3647CJ)) {
                this.f3647CJ = d;
                this.f3648CK = d;
            } else if (!m4220d(d)) {
                if (LatLngBounds.m4214b(this.f3647CJ, d) < LatLngBounds.m4215c(this.f3648CK, d)) {
                    this.f3647CJ = d;
                } else {
                    this.f3648CK = d;
                }
            }
            return this;
        }
    }

    LatLngBounds(int versionCode, LatLng southwest2, LatLng northeast2) {
        C1102eg.m2614b(southwest2, (Object) "null southwest");
        C1102eg.m2614b(northeast2, (Object) "null northeast");
        C1102eg.m2613a(northeast2.latitude >= southwest2.latitude, "southern latitude exceeds northern latitude (%s > %s)", Double.valueOf(southwest2.latitude), Double.valueOf(northeast2.latitude));
        this.f3644kg = versionCode;
        this.southwest = southwest2;
        this.northeast = northeast2;
    }

    public LatLngBounds(LatLng southwest2, LatLng northeast2) {
        this(1, southwest2, northeast2);
    }

    /* access modifiers changed from: private */
    /* renamed from: b */
    public static double m4214b(double d, double d2) {
        return ((d - d2) + 360.0d) % 360.0d;
    }

    public static Builder builder() {
        return new Builder();
    }

    /* access modifiers changed from: private */
    /* renamed from: c */
    public static double m4215c(double d, double d2) {
        return ((d2 - d) + 360.0d) % 360.0d;
    }

    /* renamed from: c */
    private boolean m4216c(double d) {
        return this.southwest.latitude <= d && d <= this.northeast.latitude;
    }

    /* renamed from: d */
    private boolean m4218d(double d) {
        boolean z = false;
        if (this.southwest.longitude <= this.northeast.longitude) {
            return this.southwest.longitude <= d && d <= this.northeast.longitude;
        }
        if (this.southwest.longitude <= d || d <= this.northeast.longitude) {
            z = true;
        }
        return z;
    }

    public boolean contains(LatLng point) {
        return m4216c(point.latitude) && m4218d(point.longitude);
    }

    public int describeContents() {
        return 0;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof LatLngBounds)) {
            return false;
        }
        LatLngBounds latLngBounds = (LatLngBounds) o;
        return this.southwest.equals(latLngBounds.southwest) && this.northeast.equals(latLngBounds.northeast);
    }

    public LatLng getCenter() {
        double d = (this.southwest.latitude + this.northeast.latitude) / 2.0d;
        double d2 = this.northeast.longitude;
        double d3 = this.southwest.longitude;
        return new LatLng(d, d3 <= d2 ? (d2 + d3) / 2.0d : ((d2 + 360.0d) + d3) / 2.0d);
    }

    /* access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.f3644kg;
    }

    public int hashCode() {
        return C1098ee.hashCode(this.southwest, this.northeast);
    }

    public LatLngBounds including(LatLng point) {
        double d;
        double min = Math.min(this.southwest.latitude, point.latitude);
        double max = Math.max(this.northeast.latitude, point.latitude);
        double d2 = this.northeast.longitude;
        double d3 = this.southwest.longitude;
        double d4 = point.longitude;
        if (m4218d(d4)) {
            d4 = d3;
            d = d2;
        } else if (m4214b(d3, d4) < m4215c(d2, d4)) {
            d = d2;
        } else {
            double d5 = d3;
            d = d4;
            d4 = d5;
        }
        return new LatLngBounds(new LatLng(min, d4), new LatLng(max, d));
    }

    public String toString() {
        return C1098ee.m2604e(this).mo7535a("southwest", this.southwest).mo7535a("northeast", this.northeast).toString();
    }

    public void writeToParcel(Parcel out, int flags) {
        if (C1558r.m4205eD()) {
            C1564d.m4238a(this, out, flags);
        } else {
            LatLngBoundsCreator.m4221a(this, out, flags);
        }
    }
}
