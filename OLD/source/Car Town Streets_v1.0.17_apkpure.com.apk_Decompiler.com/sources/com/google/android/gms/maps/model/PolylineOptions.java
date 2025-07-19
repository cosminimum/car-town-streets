package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.maps.internal.r;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public final class PolylineOptions implements SafeParcelable {
    public static final PolylineOptionsCreator CREATOR = new PolylineOptionsCreator();
    private float CB;
    private final List<LatLng> CV;
    private boolean CX;
    private float Cw;
    private boolean Cx;
    private final int kg;
    private int mP;

    public PolylineOptions() {
        this.CB = 10.0f;
        this.mP = -16777216;
        this.Cw = BitmapDescriptorFactory.HUE_RED;
        this.Cx = true;
        this.CX = false;
        this.kg = 1;
        this.CV = new ArrayList();
    }

    PolylineOptions(int versionCode, List points, float width, int color, float zIndex, boolean visible, boolean geodesic) {
        this.CB = 10.0f;
        this.mP = -16777216;
        this.Cw = BitmapDescriptorFactory.HUE_RED;
        this.Cx = true;
        this.CX = false;
        this.kg = versionCode;
        this.CV = points;
        this.CB = width;
        this.mP = color;
        this.Cw = zIndex;
        this.Cx = visible;
        this.CX = geodesic;
    }

    public PolylineOptions add(LatLng point) {
        this.CV.add(point);
        return this;
    }

    public PolylineOptions add(LatLng... points) {
        this.CV.addAll(Arrays.asList(points));
        return this;
    }

    public PolylineOptions addAll(Iterable<LatLng> points) {
        for (LatLng add : points) {
            this.CV.add(add);
        }
        return this;
    }

    public PolylineOptions color(int color) {
        this.mP = color;
        return this;
    }

    public int describeContents() {
        return 0;
    }

    public PolylineOptions geodesic(boolean geodesic) {
        this.CX = geodesic;
        return this;
    }

    public int getColor() {
        return this.mP;
    }

    public List<LatLng> getPoints() {
        return this.CV;
    }

    /* access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.kg;
    }

    public float getWidth() {
        return this.CB;
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

    public PolylineOptions visible(boolean visible) {
        this.Cx = visible;
        return this;
    }

    public PolylineOptions width(float width) {
        this.CB = width;
        return this;
    }

    public void writeToParcel(Parcel out, int flags) {
        if (r.eD()) {
            h.a(this, out, flags);
        } else {
            PolylineOptionsCreator.a(this, out, flags);
        }
    }

    public PolylineOptions zIndex(float zIndex) {
        this.Cw = zIndex;
        return this;
    }
}
