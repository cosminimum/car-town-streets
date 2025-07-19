package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.maps.internal.C1558r;

public final class CircleOptions implements SafeParcelable {
    public static final CircleOptionsCreator CREATOR = new CircleOptionsCreator();

    /* renamed from: Cr */
    private LatLng f3622Cr;

    /* renamed from: Cs */
    private double f3623Cs;

    /* renamed from: Ct */
    private float f3624Ct;

    /* renamed from: Cu */
    private int f3625Cu;

    /* renamed from: Cv */
    private int f3626Cv;

    /* renamed from: Cw */
    private float f3627Cw;

    /* renamed from: Cx */
    private boolean f3628Cx;

    /* renamed from: kg */
    private final int f3629kg;

    public CircleOptions() {
        this.f3622Cr = null;
        this.f3623Cs = 0.0d;
        this.f3624Ct = 10.0f;
        this.f3625Cu = -16777216;
        this.f3626Cv = 0;
        this.f3627Cw = BitmapDescriptorFactory.HUE_RED;
        this.f3628Cx = true;
        this.f3629kg = 1;
    }

    CircleOptions(int versionCode, LatLng center, double radius, float strokeWidth, int strokeColor, int fillColor, float zIndex, boolean visible) {
        this.f3622Cr = null;
        this.f3623Cs = 0.0d;
        this.f3624Ct = 10.0f;
        this.f3625Cu = -16777216;
        this.f3626Cv = 0;
        this.f3627Cw = BitmapDescriptorFactory.HUE_RED;
        this.f3628Cx = true;
        this.f3629kg = versionCode;
        this.f3622Cr = center;
        this.f3623Cs = radius;
        this.f3624Ct = strokeWidth;
        this.f3625Cu = strokeColor;
        this.f3626Cv = fillColor;
        this.f3627Cw = zIndex;
        this.f3628Cx = visible;
    }

    public CircleOptions center(LatLng center) {
        this.f3622Cr = center;
        return this;
    }

    public int describeContents() {
        return 0;
    }

    public CircleOptions fillColor(int color) {
        this.f3626Cv = color;
        return this;
    }

    public LatLng getCenter() {
        return this.f3622Cr;
    }

    public int getFillColor() {
        return this.f3626Cv;
    }

    public double getRadius() {
        return this.f3623Cs;
    }

    public int getStrokeColor() {
        return this.f3625Cu;
    }

    public float getStrokeWidth() {
        return this.f3624Ct;
    }

    /* access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.f3629kg;
    }

    public float getZIndex() {
        return this.f3627Cw;
    }

    public boolean isVisible() {
        return this.f3628Cx;
    }

    public CircleOptions radius(double radius) {
        this.f3623Cs = radius;
        return this;
    }

    public CircleOptions strokeColor(int color) {
        this.f3625Cu = color;
        return this;
    }

    public CircleOptions strokeWidth(float width) {
        this.f3624Ct = width;
        return this;
    }

    public CircleOptions visible(boolean visible) {
        this.f3628Cx = visible;
        return this;
    }

    public void writeToParcel(Parcel out, int flags) {
        if (C1558r.m4205eD()) {
            C1562b.m4236a(this, out, flags);
        } else {
            CircleOptionsCreator.m4210a(this, out, flags);
        }
    }

    public CircleOptions zIndex(float zIndex) {
        this.f3627Cw = zIndex;
        return this;
    }
}
