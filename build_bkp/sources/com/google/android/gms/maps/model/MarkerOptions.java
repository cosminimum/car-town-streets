package com.google.android.gms.maps.model;

import android.os.IBinder;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.dynamic.C0772b;
import com.google.android.gms.maps.internal.C1558r;

public final class MarkerOptions implements SafeParcelable {
    public static final MarkerOptionsCreator CREATOR = new MarkerOptionsCreator();

    /* renamed from: CF */
    private float f3650CF;

    /* renamed from: CG */
    private float f3651CG;

    /* renamed from: CM */
    private LatLng f3652CM;

    /* renamed from: CN */
    private String f3653CN;

    /* renamed from: CO */
    private BitmapDescriptor f3654CO;

    /* renamed from: CP */
    private boolean f3655CP;

    /* renamed from: CQ */
    private boolean f3656CQ;

    /* renamed from: CR */
    private float f3657CR;

    /* renamed from: CS */
    private float f3658CS;

    /* renamed from: CT */
    private float f3659CT;

    /* renamed from: Cx */
    private boolean f3660Cx;

    /* renamed from: kg */
    private final int f3661kg;
    private float mAlpha;

    /* renamed from: qL */
    private String f3662qL;

    public MarkerOptions() {
        this.f3650CF = 0.5f;
        this.f3651CG = 1.0f;
        this.f3660Cx = true;
        this.f3656CQ = false;
        this.f3657CR = BitmapDescriptorFactory.HUE_RED;
        this.f3658CS = 0.5f;
        this.f3659CT = BitmapDescriptorFactory.HUE_RED;
        this.mAlpha = 1.0f;
        this.f3661kg = 1;
    }

    MarkerOptions(int versionCode, LatLng position, String title, String snippet, IBinder wrappedIcon, float anchorU, float anchorV, boolean draggable, boolean visible, boolean flat, float rotation, float infoWindowAnchorU, float infoWindowAnchorV, float alpha) {
        this.f3650CF = 0.5f;
        this.f3651CG = 1.0f;
        this.f3660Cx = true;
        this.f3656CQ = false;
        this.f3657CR = BitmapDescriptorFactory.HUE_RED;
        this.f3658CS = 0.5f;
        this.f3659CT = BitmapDescriptorFactory.HUE_RED;
        this.mAlpha = 1.0f;
        this.f3661kg = versionCode;
        this.f3652CM = position;
        this.f3662qL = title;
        this.f3653CN = snippet;
        this.f3654CO = wrappedIcon == null ? null : new BitmapDescriptor(C0772b.C0773a.m1694E(wrappedIcon));
        this.f3650CF = anchorU;
        this.f3651CG = anchorV;
        this.f3655CP = draggable;
        this.f3660Cx = visible;
        this.f3656CQ = flat;
        this.f3657CR = rotation;
        this.f3658CS = infoWindowAnchorU;
        this.f3659CT = infoWindowAnchorV;
        this.mAlpha = alpha;
    }

    public MarkerOptions alpha(float alpha) {
        this.mAlpha = alpha;
        return this;
    }

    public MarkerOptions anchor(float u, float v) {
        this.f3650CF = u;
        this.f3651CG = v;
        return this;
    }

    public int describeContents() {
        return 0;
    }

    public MarkerOptions draggable(boolean draggable) {
        this.f3655CP = draggable;
        return this;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: eG */
    public IBinder mo9401eG() {
        if (this.f3654CO == null) {
            return null;
        }
        return this.f3654CO.mo9252el().asBinder();
    }

    public MarkerOptions flat(boolean flat) {
        this.f3656CQ = flat;
        return this;
    }

    public float getAlpha() {
        return this.mAlpha;
    }

    public float getAnchorU() {
        return this.f3650CF;
    }

    public float getAnchorV() {
        return this.f3651CG;
    }

    public BitmapDescriptor getIcon() {
        return this.f3654CO;
    }

    public float getInfoWindowAnchorU() {
        return this.f3658CS;
    }

    public float getInfoWindowAnchorV() {
        return this.f3659CT;
    }

    public LatLng getPosition() {
        return this.f3652CM;
    }

    public float getRotation() {
        return this.f3657CR;
    }

    public String getSnippet() {
        return this.f3653CN;
    }

    public String getTitle() {
        return this.f3662qL;
    }

    /* access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.f3661kg;
    }

    public MarkerOptions icon(BitmapDescriptor icon) {
        this.f3654CO = icon;
        return this;
    }

    public MarkerOptions infoWindowAnchor(float u, float v) {
        this.f3658CS = u;
        this.f3659CT = v;
        return this;
    }

    public boolean isDraggable() {
        return this.f3655CP;
    }

    public boolean isFlat() {
        return this.f3656CQ;
    }

    public boolean isVisible() {
        return this.f3660Cx;
    }

    public MarkerOptions position(LatLng position) {
        this.f3652CM = position;
        return this;
    }

    public MarkerOptions rotation(float rotation) {
        this.f3657CR = rotation;
        return this;
    }

    public MarkerOptions snippet(String snippet) {
        this.f3653CN = snippet;
        return this;
    }

    public MarkerOptions title(String title) {
        this.f3662qL = title;
        return this;
    }

    public MarkerOptions visible(boolean visible) {
        this.f3660Cx = visible;
        return this;
    }

    public void writeToParcel(Parcel out, int flags) {
        if (C1558r.m4205eD()) {
            C1566f.m4240a(this, out, flags);
        } else {
            MarkerOptionsCreator.m4224a(this, out, flags);
        }
    }
}
