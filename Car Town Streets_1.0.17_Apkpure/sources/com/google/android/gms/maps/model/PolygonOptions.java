package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.maps.internal.r;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
/* loaded from: classes.dex */
public final class PolygonOptions implements SafeParcelable {
    public static final PolygonOptionsCreator CREATOR = new PolygonOptionsCreator();
    private final List<LatLng> CV;
    private final List<List<LatLng>> CW;
    private boolean CX;
    private float Ct;
    private int Cu;
    private int Cv;
    private float Cw;
    private boolean Cx;
    private final int kg;

    public PolygonOptions() {
        this.Ct = 10.0f;
        this.Cu = -16777216;
        this.Cv = 0;
        this.Cw = BitmapDescriptorFactory.HUE_RED;
        this.Cx = true;
        this.CX = false;
        this.kg = 1;
        this.CV = new ArrayList();
        this.CW = new ArrayList();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public PolygonOptions(int versionCode, List<LatLng> points, List holes, float strokeWidth, int strokeColor, int fillColor, float zIndex, boolean visible, boolean geodesic) {
        this.Ct = 10.0f;
        this.Cu = -16777216;
        this.Cv = 0;
        this.Cw = BitmapDescriptorFactory.HUE_RED;
        this.Cx = true;
        this.CX = false;
        this.kg = versionCode;
        this.CV = points;
        this.CW = holes;
        this.Ct = strokeWidth;
        this.Cu = strokeColor;
        this.Cv = fillColor;
        this.Cw = zIndex;
        this.Cx = visible;
        this.CX = geodesic;
    }

    public PolygonOptions add(LatLng point) {
        this.CV.add(point);
        return this;
    }

    public PolygonOptions add(LatLng... points) {
        this.CV.addAll(Arrays.asList(points));
        return this;
    }

    public PolygonOptions addAll(Iterable<LatLng> points) {
        for (LatLng latLng : points) {
            this.CV.add(latLng);
        }
        return this;
    }

    public PolygonOptions addHole(Iterable<LatLng> points) {
        ArrayList arrayList = new ArrayList();
        for (LatLng latLng : points) {
            arrayList.add(latLng);
        }
        this.CW.add(arrayList);
        return this;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public List eH() {
        return this.CW;
    }

    public PolygonOptions fillColor(int color) {
        this.Cv = color;
        return this;
    }

    public PolygonOptions geodesic(boolean geodesic) {
        this.CX = geodesic;
        return this;
    }

    public int getFillColor() {
        return this.Cv;
    }

    public List<List<LatLng>> getHoles() {
        return this.CW;
    }

    public List<LatLng> getPoints() {
        return this.CV;
    }

    public int getStrokeColor() {
        return this.Cu;
    }

    public float getStrokeWidth() {
        return this.Ct;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.kg;
    }

    public float getZIndex() {
        return this.Cw;
    }

    public boolean isGeodesic() {
        return this.CX;
    }

    public boolean isVisible() {
        return this.Cx;
    }

    public PolygonOptions strokeColor(int color) {
        this.Cu = color;
        return this;
    }

    public PolygonOptions strokeWidth(float width) {
        this.Ct = width;
        return this;
    }

    public PolygonOptions visible(boolean visible) {
        this.Cx = visible;
        return this;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel out, int flags) {
        if (r.eD()) {
            g.a(this, out, flags);
        } else {
            PolygonOptionsCreator.a(this, out, flags);
        }
    }

    public PolygonOptions zIndex(float zIndex) {
        this.Cw = zIndex;
        return this;
    }
}
