package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.C1098ee;
import com.google.android.gms.maps.internal.C1558r;

public final class VisibleRegion implements SafeParcelable {
    public static final VisibleRegionCreator CREATOR = new VisibleRegionCreator();
    public final LatLng farLeft;
    public final LatLng farRight;

    /* renamed from: kg */
    private final int f3695kg;
    public final LatLngBounds latLngBounds;
    public final LatLng nearLeft;
    public final LatLng nearRight;

    VisibleRegion(int versionCode, LatLng nearLeft2, LatLng nearRight2, LatLng farLeft2, LatLng farRight2, LatLngBounds latLngBounds2) {
        this.f3695kg = versionCode;
        this.nearLeft = nearLeft2;
        this.nearRight = nearRight2;
        this.farLeft = farLeft2;
        this.farRight = farRight2;
        this.latLngBounds = latLngBounds2;
    }

    public VisibleRegion(LatLng nearLeft2, LatLng nearRight2, LatLng farLeft2, LatLng farRight2, LatLngBounds latLngBounds2) {
        this(1, nearLeft2, nearRight2, farLeft2, farRight2, latLngBounds2);
    }

    public int describeContents() {
        return 0;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof VisibleRegion)) {
            return false;
        }
        VisibleRegion visibleRegion = (VisibleRegion) o;
        return this.nearLeft.equals(visibleRegion.nearLeft) && this.nearRight.equals(visibleRegion.nearRight) && this.farLeft.equals(visibleRegion.farLeft) && this.farRight.equals(visibleRegion.farRight) && this.latLngBounds.equals(visibleRegion.latLngBounds);
    }

    /* access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.f3695kg;
    }

    public int hashCode() {
        return C1098ee.hashCode(this.nearLeft, this.nearRight, this.farLeft, this.farRight, this.latLngBounds);
    }

    public String toString() {
        return C1098ee.m2604e(this).mo7535a("nearLeft", this.nearLeft).mo7535a("nearRight", this.nearRight).mo7535a("farLeft", this.farLeft).mo7535a("farRight", this.farRight).mo7535a("latLngBounds", this.latLngBounds).toString();
    }

    public void writeToParcel(Parcel out, int flags) {
        if (C1558r.m4205eD()) {
            C1594k.m4283a(this, out, flags);
        } else {
            VisibleRegionCreator.m4234a(this, out, flags);
        }
    }
}
