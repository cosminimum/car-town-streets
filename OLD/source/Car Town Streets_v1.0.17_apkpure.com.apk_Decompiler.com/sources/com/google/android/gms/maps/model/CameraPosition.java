package com.google.android.gms.maps.model;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Parcel;
import android.util.AttributeSet;
import com.google.android.gms.R;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.ee;
import com.google.android.gms.internal.eg;
import com.google.android.gms.maps.internal.r;

public final class CameraPosition implements SafeParcelable {
    public static final CameraPositionCreator CREATOR = new CameraPositionCreator();
    public final float bearing;
    private final int kg;
    public final LatLng target;
    public final float tilt;
    public final float zoom;

    public static final class Builder {
        private LatLng Cm;
        private float Cn;
        private float Co;
        private float Cp;

        public Builder() {
        }

        public Builder(CameraPosition previous) {
            this.Cm = previous.target;
            this.Cn = previous.zoom;
            this.Co = previous.tilt;
            this.Cp = previous.bearing;
        }

        public Builder bearing(float bearing) {
            this.Cp = bearing;
            return this;
        }

        public CameraPosition build() {
            return new CameraPosition(this.Cm, this.Cn, this.Co, this.Cp);
        }

        public Builder target(LatLng location) {
            this.Cm = location;
            return this;
        }

        public Builder tilt(float tilt) {
            this.Co = tilt;
            return this;
        }

        public Builder zoom(float zoom) {
            this.Cn = zoom;
            return this;
        }
    }

    CameraPosition(int versionCode, LatLng target2, float zoom2, float tilt2, float bearing2) {
        eg.b(target2, (Object) "null camera target");
        eg.b(BitmapDescriptorFactory.HUE_RED <= tilt2 && tilt2 <= 90.0f, (Object) "Tilt needs to be between 0 and 90 inclusive");
        this.kg = versionCode;
        this.target = target2;
        this.zoom = zoom2;
        this.tilt = tilt2 + BitmapDescriptorFactory.HUE_RED;
        this.bearing = (((double) bearing2) <= 0.0d ? (bearing2 % 360.0f) + 360.0f : bearing2) % 360.0f;
    }

    public CameraPosition(LatLng target2, float zoom2, float tilt2, float bearing2) {
        this(1, target2, zoom2, tilt2, bearing2);
    }

    public static Builder builder() {
        return new Builder();
    }

    public static Builder builder(CameraPosition camera) {
        return new Builder(camera);
    }

    public static CameraPosition createFromAttributes(Context context, AttributeSet attrs) {
        if (attrs == null) {
            return null;
        }
        TypedArray obtainAttributes = context.getResources().obtainAttributes(attrs, R.styleable.MapAttrs);
        LatLng latLng = new LatLng((double) (obtainAttributes.hasValue(2) ? obtainAttributes.getFloat(2, BitmapDescriptorFactory.HUE_RED) : 0.0f), (double) (obtainAttributes.hasValue(3) ? obtainAttributes.getFloat(3, BitmapDescriptorFactory.HUE_RED) : 0.0f));
        Builder builder = builder();
        builder.target(latLng);
        if (obtainAttributes.hasValue(5)) {
            builder.zoom(obtainAttributes.getFloat(5, BitmapDescriptorFactory.HUE_RED));
        }
        if (obtainAttributes.hasValue(1)) {
            builder.bearing(obtainAttributes.getFloat(1, BitmapDescriptorFactory.HUE_RED));
        }
        if (obtainAttributes.hasValue(4)) {
            builder.tilt(obtainAttributes.getFloat(4, BitmapDescriptorFactory.HUE_RED));
        }
        return builder.build();
    }

    public static final CameraPosition fromLatLngZoom(LatLng target2, float zoom2) {
        return new CameraPosition(target2, zoom2, BitmapDescriptorFactory.HUE_RED, BitmapDescriptorFactory.HUE_RED);
    }

    public int describeContents() {
        return 0;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof CameraPosition)) {
            return false;
        }
        CameraPosition cameraPosition = (CameraPosition) o;
        return this.target.equals(cameraPosition.target) && Float.floatToIntBits(this.zoom) == Float.floatToIntBits(cameraPosition.zoom) && Float.floatToIntBits(this.tilt) == Float.floatToIntBits(cameraPosition.tilt) && Float.floatToIntBits(this.bearing) == Float.floatToIntBits(cameraPosition.bearing);
    }

    /* access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.kg;
    }

    public int hashCode() {
        return ee.hashCode(this.target, Float.valueOf(this.zoom), Float.valueOf(this.tilt), Float.valueOf(this.bearing));
    }

    public String toString() {
        return ee.e(this).a("target", this.target).a("zoom", Float.valueOf(this.zoom)).a("tilt", Float.valueOf(this.tilt)).a("bearing", Float.valueOf(this.bearing)).toString();
    }

    public void writeToParcel(Parcel out, int flags) {
        if (r.eD()) {
            a.a(this, out, flags);
        } else {
            CameraPositionCreator.a(this, out, flags);
        }
    }
}
