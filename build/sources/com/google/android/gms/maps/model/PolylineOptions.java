package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.maps.internal.C1558r;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public final class PolylineOptions implements SafeParcelable {
    public static final PolylineOptionsCreator CREATOR = new PolylineOptionsCreator();

    /* renamed from: CB */
    private float f3674CB;

    /* renamed from: CV */
    private final List<LatLng> f3675CV;

    /* renamed from: CX */
    private boolean f3676CX;

    /* renamed from: Cw */
    private float f3677Cw;

    /* renamed from: Cx */
    private boolean f3678Cx;

    /* renamed from: kg */
    private final int f3679kg;

    /* renamed from: mP */
    private int f3680mP;

    public PolylineOptions() {
        this.f3674CB = 10.0f;
        this.f3680mP = -16777216;
        this.f3677Cw = BitmapDescriptorFactory.HUE_RED;
        this.f3678Cx = true;
        this.f3676CX = false;
        this.f3679kg = 1;
        this.f3675CV = new ArrayList();
    }

    PolylineOptions(int versionCode, List points, float width, int color, float zIndex, boolean visible, boolean geodesic) {
        this.f3674CB = 10.0f;
        this.f3680mP = -16777216;
        this.f3677Cw = BitmapDescriptorFactory.HUE_RED;
        this.f3678Cx = true;
        this.f3676CX = false;
        this.f3679kg = versionCode;
        this.f3675CV = points;
        this.f3674CB = width;
        this.f3680mP = color;
        this.f3677Cw = zIndex;
        this.f3678Cx = visible;
        this.f3676CX = geodesic;
    }

    public PolylineOptions add(LatLng point) {
        this.f3675CV.add(point);
        return this;
    }

    public PolylineOptions add(LatLng... points) {
        this.f3675CV.addAll(Arrays.asList(points));
        return this;
    }

    public PolylineOptions addAll(Iterable<LatLng> points) {
        for (LatLng add : points) {
            this.f3675CV.add(add);
        }
        return this;
    }

    public PolylineOptions color(int color) {
        this.f3680mP = color;
        return this;
    }

    public int describeContents() {
        return 0;
    }

    public PolylineOptions geodesic(boolean geodesic) {
        this.f3676CX = geodesic;
        return this;
    }

    public int getColor() {
        return this.f3680mP;
    }

    public List<LatLng> getPoints() {
        return this.f3675CV;
    }

    /* access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.f3679kg;
    }

    public float getWidth() {
        return this.f3674CB;
    }

    public float getZIndex() {
        return this.f3677Cw;
    }

    public boolean isGeodesic() {
        return this.f3676CX;
    }

    public boolean isVisible() {
        return this.f3678Cx;
    }

    public PolylineOptions visible(boolean visible) {
        this.f3678Cx = visible;
        return this;
    }

    public PolylineOptions width(float width) {
        this.f3674CB = width;
        return this;
    }

    public void writeToParcel(Parcel out, int flags) {
        if (C1558r.m4205eD()) {
            C1568h.m4242a(this, out, flags);
        } else {
            PolylineOptionsCreator.m4227a(this, out, flags);
        }
    }

    public PolylineOptions zIndex(float zIndex) {
        this.f3677Cw = zIndex;
        return this;
    }
}
