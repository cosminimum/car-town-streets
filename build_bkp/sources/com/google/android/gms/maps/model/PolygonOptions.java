package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.maps.internal.C1558r;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public final class PolygonOptions implements SafeParcelable {
    public static final PolygonOptionsCreator CREATOR = new PolygonOptionsCreator();

    /* renamed from: CV */
    private final List<LatLng> f3664CV;

    /* renamed from: CW */
    private final List<List<LatLng>> f3665CW;

    /* renamed from: CX */
    private boolean f3666CX;

    /* renamed from: Ct */
    private float f3667Ct;

    /* renamed from: Cu */
    private int f3668Cu;

    /* renamed from: Cv */
    private int f3669Cv;

    /* renamed from: Cw */
    private float f3670Cw;

    /* renamed from: Cx */
    private boolean f3671Cx;

    /* renamed from: kg */
    private final int f3672kg;

    public PolygonOptions() {
        this.f3667Ct = 10.0f;
        this.f3668Cu = -16777216;
        this.f3669Cv = 0;
        this.f3670Cw = BitmapDescriptorFactory.HUE_RED;
        this.f3671Cx = true;
        this.f3666CX = false;
        this.f3672kg = 1;
        this.f3664CV = new ArrayList();
        this.f3665CW = new ArrayList();
    }

    PolygonOptions(int versionCode, List<LatLng> points, List holes, float strokeWidth, int strokeColor, int fillColor, float zIndex, boolean visible, boolean geodesic) {
        this.f3667Ct = 10.0f;
        this.f3668Cu = -16777216;
        this.f3669Cv = 0;
        this.f3670Cw = BitmapDescriptorFactory.HUE_RED;
        this.f3671Cx = true;
        this.f3666CX = false;
        this.f3672kg = versionCode;
        this.f3664CV = points;
        this.f3665CW = holes;
        this.f3667Ct = strokeWidth;
        this.f3668Cu = strokeColor;
        this.f3669Cv = fillColor;
        this.f3670Cw = zIndex;
        this.f3671Cx = visible;
        this.f3666CX = geodesic;
    }

    public PolygonOptions add(LatLng point) {
        this.f3664CV.add(point);
        return this;
    }

    public PolygonOptions add(LatLng... points) {
        this.f3664CV.addAll(Arrays.asList(points));
        return this;
    }

    public PolygonOptions addAll(Iterable<LatLng> points) {
        for (LatLng add : points) {
            this.f3664CV.add(add);
        }
        return this;
    }

    public PolygonOptions addHole(Iterable<LatLng> points) {
        ArrayList arrayList = new ArrayList();
        for (LatLng add : points) {
            arrayList.add(add);
        }
        this.f3665CW.add(arrayList);
        return this;
    }

    public int describeContents() {
        return 0;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: eH */
    public List mo9452eH() {
        return this.f3665CW;
    }

    public PolygonOptions fillColor(int color) {
        this.f3669Cv = color;
        return this;
    }

    public PolygonOptions geodesic(boolean geodesic) {
        this.f3666CX = geodesic;
        return this;
    }

    public int getFillColor() {
        return this.f3669Cv;
    }

    public List<List<LatLng>> getHoles() {
        return this.f3665CW;
    }

    public List<LatLng> getPoints() {
        return this.f3664CV;
    }

    public int getStrokeColor() {
        return this.f3668Cu;
    }

    public float getStrokeWidth() {
        return this.f3667Ct;
    }

    /* access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.f3672kg;
    }

    public float getZIndex() {
        return this.f3670Cw;
    }

    public boolean isGeodesic() {
        return this.f3666CX;
    }

    public boolean isVisible() {
        return this.f3671Cx;
    }

    public PolygonOptions strokeColor(int color) {
        this.f3668Cu = color;
        return this;
    }

    public PolygonOptions strokeWidth(float width) {
        this.f3667Ct = width;
        return this;
    }

    public PolygonOptions visible(boolean visible) {
        this.f3671Cx = visible;
        return this;
    }

    public void writeToParcel(Parcel out, int flags) {
        if (C1558r.m4205eD()) {
            C1567g.m4241a(this, out, flags);
        } else {
            PolygonOptionsCreator.m4226a(this, out, flags);
        }
    }

    public PolygonOptions zIndex(float zIndex) {
        this.f3670Cw = zIndex;
        return this;
    }
}
