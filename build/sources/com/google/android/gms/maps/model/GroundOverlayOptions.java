package com.google.android.gms.maps.model;

import android.os.IBinder;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.dynamic.C0772b;
import com.google.android.gms.internal.C1102eg;
import com.google.android.gms.maps.internal.C1558r;

public final class GroundOverlayOptions implements SafeParcelable {
    public static final GroundOverlayOptionsCreator CREATOR = new GroundOverlayOptionsCreator();
    public static final float NO_DIMENSION = -1.0f;

    /* renamed from: CA */
    private LatLng f3631CA;

    /* renamed from: CB */
    private float f3632CB;

    /* renamed from: CC */
    private float f3633CC;

    /* renamed from: CD */
    private LatLngBounds f3634CD;

    /* renamed from: CE */
    private float f3635CE;

    /* renamed from: CF */
    private float f3636CF;

    /* renamed from: CG */
    private float f3637CG;

    /* renamed from: Cp */
    private float f3638Cp;

    /* renamed from: Cw */
    private float f3639Cw;

    /* renamed from: Cx */
    private boolean f3640Cx;

    /* renamed from: Cz */
    private BitmapDescriptor f3641Cz;

    /* renamed from: kg */
    private final int f3642kg;

    public GroundOverlayOptions() {
        this.f3640Cx = true;
        this.f3635CE = BitmapDescriptorFactory.HUE_RED;
        this.f3636CF = 0.5f;
        this.f3637CG = 0.5f;
        this.f3642kg = 1;
    }

    GroundOverlayOptions(int versionCode, IBinder wrappedImage, LatLng location, float width, float height, LatLngBounds bounds, float bearing, float zIndex, boolean visible, float transparency, float anchorU, float anchorV) {
        this.f3640Cx = true;
        this.f3635CE = BitmapDescriptorFactory.HUE_RED;
        this.f3636CF = 0.5f;
        this.f3637CG = 0.5f;
        this.f3642kg = versionCode;
        this.f3641Cz = new BitmapDescriptor(C0772b.C0773a.m1694E(wrappedImage));
        this.f3631CA = location;
        this.f3632CB = width;
        this.f3633CC = height;
        this.f3634CD = bounds;
        this.f3638Cp = bearing;
        this.f3639Cw = zIndex;
        this.f3640Cx = visible;
        this.f3635CE = transparency;
        this.f3636CF = anchorU;
        this.f3637CG = anchorV;
    }

    /* renamed from: a */
    private GroundOverlayOptions m4211a(LatLng latLng, float f, float f2) {
        this.f3631CA = latLng;
        this.f3632CB = f;
        this.f3633CC = f2;
        return this;
    }

    public GroundOverlayOptions anchor(float u, float v) {
        this.f3636CF = u;
        this.f3637CG = v;
        return this;
    }

    public GroundOverlayOptions bearing(float bearing) {
        this.f3638Cp = ((bearing % 360.0f) + 360.0f) % 360.0f;
        return this;
    }

    public int describeContents() {
        return 0;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: eF */
    public IBinder mo9327eF() {
        return this.f3641Cz.mo9252el().asBinder();
    }

    public float getAnchorU() {
        return this.f3636CF;
    }

    public float getAnchorV() {
        return this.f3637CG;
    }

    public float getBearing() {
        return this.f3638Cp;
    }

    public LatLngBounds getBounds() {
        return this.f3634CD;
    }

    public float getHeight() {
        return this.f3633CC;
    }

    public BitmapDescriptor getImage() {
        return this.f3641Cz;
    }

    public LatLng getLocation() {
        return this.f3631CA;
    }

    public float getTransparency() {
        return this.f3635CE;
    }

    /* access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.f3642kg;
    }

    public float getWidth() {
        return this.f3632CB;
    }

    public float getZIndex() {
        return this.f3639Cw;
    }

    public GroundOverlayOptions image(BitmapDescriptor image) {
        this.f3641Cz = image;
        return this;
    }

    public boolean isVisible() {
        return this.f3640Cx;
    }

    public GroundOverlayOptions position(LatLng location, float width) {
        boolean z = true;
        C1102eg.m2612a(this.f3634CD == null, "Position has already been set using positionFromBounds");
        C1102eg.m2615b(location != null, (Object) "Location must be specified");
        if (width < BitmapDescriptorFactory.HUE_RED) {
            z = false;
        }
        C1102eg.m2615b(z, (Object) "Width must be non-negative");
        return m4211a(location, width, -1.0f);
    }

    public GroundOverlayOptions position(LatLng location, float width, float height) {
        boolean z = true;
        C1102eg.m2612a(this.f3634CD == null, "Position has already been set using positionFromBounds");
        C1102eg.m2615b(location != null, (Object) "Location must be specified");
        C1102eg.m2615b(width >= BitmapDescriptorFactory.HUE_RED, (Object) "Width must be non-negative");
        if (height < BitmapDescriptorFactory.HUE_RED) {
            z = false;
        }
        C1102eg.m2615b(z, (Object) "Height must be non-negative");
        return m4211a(location, width, height);
    }

    public GroundOverlayOptions positionFromBounds(LatLngBounds bounds) {
        C1102eg.m2612a(this.f3631CA == null, "Position has already been set using position: " + this.f3631CA);
        this.f3634CD = bounds;
        return this;
    }

    public GroundOverlayOptions transparency(float transparency) {
        C1102eg.m2615b(transparency >= BitmapDescriptorFactory.HUE_RED && transparency <= 1.0f, (Object) "Transparency must be in the range [0..1]");
        this.f3635CE = transparency;
        return this;
    }

    public GroundOverlayOptions visible(boolean visible) {
        this.f3640Cx = visible;
        return this;
    }

    public void writeToParcel(Parcel out, int flags) {
        if (C1558r.m4205eD()) {
            C1563c.m4237a(this, out, flags);
        } else {
            GroundOverlayOptionsCreator.m4213a(this, out, flags);
        }
    }

    public GroundOverlayOptions zIndex(float zIndex) {
        this.f3639Cw = zIndex;
        return this;
    }
}
