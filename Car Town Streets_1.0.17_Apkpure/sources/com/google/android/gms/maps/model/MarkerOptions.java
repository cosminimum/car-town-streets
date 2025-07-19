package com.google.android.gms.maps.model;

import android.os.IBinder;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.dynamic.b;
import com.google.android.gms.maps.internal.r;
/* loaded from: classes.dex */
public final class MarkerOptions implements SafeParcelable {
    public static final MarkerOptionsCreator CREATOR = new MarkerOptionsCreator();
    private float CF;
    private float CG;
    private LatLng CM;
    private String CN;
    private BitmapDescriptor CO;
    private boolean CP;
    private boolean CQ;
    private float CR;
    private float CS;
    private float CT;
    private boolean Cx;
    private final int kg;
    private float mAlpha;
    private String qL;

    public MarkerOptions() {
        this.CF = 0.5f;
        this.CG = 1.0f;
        this.Cx = true;
        this.CQ = false;
        this.CR = BitmapDescriptorFactory.HUE_RED;
        this.CS = 0.5f;
        this.CT = BitmapDescriptorFactory.HUE_RED;
        this.mAlpha = 1.0f;
        this.kg = 1;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public MarkerOptions(int versionCode, LatLng position, String title, String snippet, IBinder wrappedIcon, float anchorU, float anchorV, boolean draggable, boolean visible, boolean flat, float rotation, float infoWindowAnchorU, float infoWindowAnchorV, float alpha) {
        this.CF = 0.5f;
        this.CG = 1.0f;
        this.Cx = true;
        this.CQ = false;
        this.CR = BitmapDescriptorFactory.HUE_RED;
        this.CS = 0.5f;
        this.CT = BitmapDescriptorFactory.HUE_RED;
        this.mAlpha = 1.0f;
        this.kg = versionCode;
        this.CM = position;
        this.qL = title;
        this.CN = snippet;
        this.CO = wrappedIcon == null ? null : new BitmapDescriptor(b.a.E(wrappedIcon));
        this.CF = anchorU;
        this.CG = anchorV;
        this.CP = draggable;
        this.Cx = visible;
        this.CQ = flat;
        this.CR = rotation;
        this.CS = infoWindowAnchorU;
        this.CT = infoWindowAnchorV;
        this.mAlpha = alpha;
    }

    public MarkerOptions alpha(float alpha) {
        this.mAlpha = alpha;
        return this;
    }

    public MarkerOptions anchor(float u, float v) {
        this.CF = u;
        this.CG = v;
        return this;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public MarkerOptions draggable(boolean draggable) {
        this.CP = draggable;
        return this;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public IBinder eG() {
        if (this.CO == null) {
            return null;
        }
        return this.CO.el().asBinder();
    }

    public MarkerOptions flat(boolean flat) {
        this.CQ = flat;
        return this;
    }

    public float getAlpha() {
        return this.mAlpha;
    }

    public float getAnchorU() {
        return this.CF;
    }

    public float getAnchorV() {
        return this.CG;
    }

    public BitmapDescriptor getIcon() {
        return this.CO;
    }

    public float getInfoWindowAnchorU() {
        return this.CS;
    }

    public float getInfoWindowAnchorV() {
        return this.CT;
    }

    public LatLng getPosition() {
        return this.CM;
    }

    public float getRotation() {
        return this.CR;
    }

    public String getSnippet() {
        return this.CN;
    }

    public String getTitle() {
        return this.qL;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.kg;
    }

    public MarkerOptions icon(BitmapDescriptor icon) {
        this.CO = icon;
        return this;
    }

    public MarkerOptions infoWindowAnchor(float u, float v) {
        this.CS = u;
        this.CT = v;
        return this;
    }

    public boolean isDraggable() {
        return this.CP;
    }

    public boolean isFlat() {
        return this.CQ;
    }

    public boolean isVisible() {
        return this.Cx;
    }

    public MarkerOptions position(LatLng position) {
        this.CM = position;
        return this;
    }

    public MarkerOptions rotation(float rotation) {
        this.CR = rotation;
        return this;
    }

    public MarkerOptions snippet(String snippet) {
        this.CN = snippet;
        return this;
    }

    public MarkerOptions title(String title) {
        this.qL = title;
        return this;
    }

    public MarkerOptions visible(boolean visible) {
        this.Cx = visible;
        return this;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel out, int flags) {
        if (r.eD()) {
            f.a(this, out, flags);
        } else {
            MarkerOptionsCreator.a(this, out, flags);
        }
    }
}
