package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.maps.internal.r;

public final class CircleOptions implements SafeParcelable {
    public static final CircleOptionsCreator CREATOR = new CircleOptionsCreator();
    private LatLng Cr;
    private double Cs;
    private float Ct;
    private int Cu;
    private int Cv;
    private float Cw;
    private boolean Cx;
    private final int kg;

    public CircleOptions() {
        this.Cr = null;
        this.Cs = 0.0d;
        this.Ct = 10.0f;
        this.Cu = -16777216;
        this.Cv = 0;
        this.Cw = BitmapDescriptorFactory.HUE_RED;
        this.Cx = true;
        this.kg = 1;
    }

    CircleOptions(int versionCode, LatLng center, double radius, float strokeWidth, int strokeColor, int fillColor, float zIndex, boolean visible) {
        this.Cr = null;
        this.Cs = 0.0d;
        this.Ct = 10.0f;
        this.Cu = -16777216;
        this.Cv = 0;
        this.Cw = BitmapDescriptorFactory.HUE_RED;
        this.Cx = true;
        this.kg = versionCode;
        this.Cr = center;
        this.Cs = radius;
        this.Ct = strokeWidth;
        this.Cu = strokeColor;
        this.Cv = fillColor;
        this.Cw = zIndex;
        this.Cx = visible;
    }

    public CircleOptions center(LatLng center) {
        this.Cr = center;
        return this;
    }

    public int describeContents() {
        return 0;
    }

    public CircleOptions fillColor(int color) {
        this.Cv = color;
        return this;
    }

    public LatLng getCenter() {
        return this.Cr;
    }

    public int getFillColor() {
        return this.Cv;
    }

    public double getRadius() {
        return this.Cs;
    }

    public int getStrokeColor() {
        return this.Cu;
    }

    public float getStrokeWidth() {
        return this.Ct;
    }

    /* access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.kg;
    }

    public float getZIndex() {
        return this.Cw;
    }

    public boolean isVisible() {
        return this.Cx;
    }

    public CircleOptions radius(double radius) {
        this.Cs = radius;
        return this;
    }

    public CircleOptions strokeColor(int color) {
        this.Cu = color;
        return this;
    }

    public CircleOptions strokeWidth(float width) {
        this.Ct = width;
        return this;
    }

    public CircleOptions visible(boolean visible) {
        this.Cx = visible;
        return this;
    }

    public void writeToParcel(Parcel out, int flags) {
        if (r.eD()) {
            b.a(this, out, flags);
        } else {
            CircleOptionsCreator.a(this, out, flags);
        }
    }

    public CircleOptions zIndex(float zIndex) {
        this.Cw = zIndex;
        return this;
    }
}
