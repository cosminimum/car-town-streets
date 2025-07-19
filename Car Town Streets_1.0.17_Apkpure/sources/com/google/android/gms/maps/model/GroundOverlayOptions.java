package com.google.android.gms.maps.model;

import android.os.IBinder;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.dynamic.b;
import com.google.android.gms.internal.eg;
import com.google.android.gms.maps.internal.r;
/* loaded from: classes.dex */
public final class GroundOverlayOptions implements SafeParcelable {
    public static final GroundOverlayOptionsCreator CREATOR = new GroundOverlayOptionsCreator();
    public static final float NO_DIMENSION = -1.0f;
    private LatLng CA;
    private float CB;
    private float CC;
    private LatLngBounds CD;
    private float CE;
    private float CF;
    private float CG;
    private float Cp;
    private float Cw;
    private boolean Cx;
    private BitmapDescriptor Cz;
    private final int kg;

    public GroundOverlayOptions() {
        this.Cx = true;
        this.CE = BitmapDescriptorFactory.HUE_RED;
        this.CF = 0.5f;
        this.CG = 0.5f;
        this.kg = 1;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public GroundOverlayOptions(int versionCode, IBinder wrappedImage, LatLng location, float width, float height, LatLngBounds bounds, float bearing, float zIndex, boolean visible, float transparency, float anchorU, float anchorV) {
        this.Cx = true;
        this.CE = BitmapDescriptorFactory.HUE_RED;
        this.CF = 0.5f;
        this.CG = 0.5f;
        this.kg = versionCode;
        this.Cz = new BitmapDescriptor(b.a.E(wrappedImage));
        this.CA = location;
        this.CB = width;
        this.CC = height;
        this.CD = bounds;
        this.Cp = bearing;
        this.Cw = zIndex;
        this.Cx = visible;
        this.CE = transparency;
        this.CF = anchorU;
        this.CG = anchorV;
    }

    private GroundOverlayOptions a(LatLng latLng, float f, float f2) {
        this.CA = latLng;
        this.CB = f;
        this.CC = f2;
        return this;
    }

    public GroundOverlayOptions anchor(float u, float v) {
        this.CF = u;
        this.CG = v;
        return this;
    }

    public GroundOverlayOptions bearing(float bearing) {
        this.Cp = ((bearing % 360.0f) + 360.0f) % 360.0f;
        return this;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public IBinder eF() {
        return this.Cz.el().asBinder();
    }

    public float getAnchorU() {
        return this.CF;
    }

    public float getAnchorV() {
        return this.CG;
    }

    public float getBearing() {
        return this.Cp;
    }

    public LatLngBounds getBounds() {
        return this.CD;
    }

    public float getHeight() {
        return this.CC;
    }

    public BitmapDescriptor getImage() {
        return this.Cz;
    }

    public LatLng getLocation() {
        return this.CA;
    }

    public float getTransparency() {
        return this.CE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.kg;
    }

    public float getWidth() {
        return this.CB;
    }

    public float getZIndex() {
        return this.Cw;
    }

    public GroundOverlayOptions image(BitmapDescriptor image) {
        this.Cz = image;
        return this;
    }

    public boolean isVisible() {
        return this.Cx;
    }

    public GroundOverlayOptions position(LatLng location, float width) {
        boolean z = true;
        eg.a(this.CD == null, "Position has already been set using positionFromBounds");
        eg.b(location != null, "Location must be specified");
        if (width < BitmapDescriptorFactory.HUE_RED) {
            z = false;
        }
        eg.b(z, "Width must be non-negative");
        return a(location, width, -1.0f);
    }

    public GroundOverlayOptions position(LatLng location, float width, float height) {
        boolean z = true;
        eg.a(this.CD == null, "Position has already been set using positionFromBounds");
        eg.b(location != null, "Location must be specified");
        eg.b(width >= BitmapDescriptorFactory.HUE_RED, "Width must be non-negative");
        if (height < BitmapDescriptorFactory.HUE_RED) {
            z = false;
        }
        eg.b(z, "Height must be non-negative");
        return a(location, width, height);
    }

    public GroundOverlayOptions positionFromBounds(LatLngBounds bounds) {
        eg.a(this.CA == null, "Position has already been set using position: " + this.CA);
        this.CD = bounds;
        return this;
    }

    public GroundOverlayOptions transparency(float transparency) {
        eg.b(transparency >= BitmapDescriptorFactory.HUE_RED && transparency <= 1.0f, "Transparency must be in the range [0..1]");
        this.CE = transparency;
        return this;
    }

    public GroundOverlayOptions visible(boolean visible) {
        this.Cx = visible;
        return this;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel out, int flags) {
        if (r.eD()) {
            c.a(this, out, flags);
        } else {
            GroundOverlayOptionsCreator.a(this, out, flags);
        }
    }

    public GroundOverlayOptions zIndex(float zIndex) {
        this.Cw = zIndex;
        return this;
    }
}
