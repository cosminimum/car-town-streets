package com.google.android.gms.maps;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Parcel;
import android.util.AttributeSet;
import com.google.android.gms.R;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.maps.internal.r;
import com.google.android.gms.maps.model.CameraPosition;
/* loaded from: classes.dex */
public final class GoogleMapOptions implements SafeParcelable {
    public static final GoogleMapOptionsCreator CREATOR = new GoogleMapOptionsCreator();
    private Boolean BJ;
    private Boolean BK;
    private int BL;
    private CameraPosition BM;
    private Boolean BN;
    private Boolean BO;
    private Boolean BP;
    private Boolean BQ;
    private Boolean BR;
    private Boolean BS;
    private final int kg;

    public GoogleMapOptions() {
        this.BL = -1;
        this.kg = 1;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public GoogleMapOptions(int versionCode, byte zOrderOnTop, byte useViewLifecycleInFragment, int mapType, CameraPosition camera, byte zoomControlsEnabled, byte compassEnabled, byte scrollGesturesEnabled, byte zoomGesturesEnabled, byte tiltGesturesEnabled, byte rotateGesturesEnabled) {
        this.BL = -1;
        this.kg = versionCode;
        this.BJ = com.google.android.gms.maps.internal.a.a(zOrderOnTop);
        this.BK = com.google.android.gms.maps.internal.a.a(useViewLifecycleInFragment);
        this.BL = mapType;
        this.BM = camera;
        this.BN = com.google.android.gms.maps.internal.a.a(zoomControlsEnabled);
        this.BO = com.google.android.gms.maps.internal.a.a(compassEnabled);
        this.BP = com.google.android.gms.maps.internal.a.a(scrollGesturesEnabled);
        this.BQ = com.google.android.gms.maps.internal.a.a(zoomGesturesEnabled);
        this.BR = com.google.android.gms.maps.internal.a.a(tiltGesturesEnabled);
        this.BS = com.google.android.gms.maps.internal.a.a(rotateGesturesEnabled);
    }

    public static GoogleMapOptions createFromAttributes(Context context, AttributeSet attrs) {
        if (attrs == null) {
            return null;
        }
        TypedArray obtainAttributes = context.getResources().obtainAttributes(attrs, R.styleable.MapAttrs);
        GoogleMapOptions googleMapOptions = new GoogleMapOptions();
        if (obtainAttributes.hasValue(0)) {
            googleMapOptions.mapType(obtainAttributes.getInt(0, -1));
        }
        if (obtainAttributes.hasValue(13)) {
            googleMapOptions.zOrderOnTop(obtainAttributes.getBoolean(13, false));
        }
        if (obtainAttributes.hasValue(12)) {
            googleMapOptions.useViewLifecycleInFragment(obtainAttributes.getBoolean(12, false));
        }
        if (obtainAttributes.hasValue(6)) {
            googleMapOptions.compassEnabled(obtainAttributes.getBoolean(6, true));
        }
        if (obtainAttributes.hasValue(7)) {
            googleMapOptions.rotateGesturesEnabled(obtainAttributes.getBoolean(7, true));
        }
        if (obtainAttributes.hasValue(8)) {
            googleMapOptions.scrollGesturesEnabled(obtainAttributes.getBoolean(8, true));
        }
        if (obtainAttributes.hasValue(9)) {
            googleMapOptions.tiltGesturesEnabled(obtainAttributes.getBoolean(9, true));
        }
        if (obtainAttributes.hasValue(11)) {
            googleMapOptions.zoomGesturesEnabled(obtainAttributes.getBoolean(11, true));
        }
        if (obtainAttributes.hasValue(10)) {
            googleMapOptions.zoomControlsEnabled(obtainAttributes.getBoolean(10, true));
        }
        googleMapOptions.camera(CameraPosition.createFromAttributes(context, attrs));
        obtainAttributes.recycle();
        return googleMapOptions;
    }

    public GoogleMapOptions camera(CameraPosition camera) {
        this.BM = camera;
        return this;
    }

    public GoogleMapOptions compassEnabled(boolean enabled) {
        this.BO = Boolean.valueOf(enabled);
        return this;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public byte eo() {
        return com.google.android.gms.maps.internal.a.c(this.BJ);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public byte ep() {
        return com.google.android.gms.maps.internal.a.c(this.BK);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public byte eq() {
        return com.google.android.gms.maps.internal.a.c(this.BN);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public byte er() {
        return com.google.android.gms.maps.internal.a.c(this.BO);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public byte es() {
        return com.google.android.gms.maps.internal.a.c(this.BP);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public byte et() {
        return com.google.android.gms.maps.internal.a.c(this.BQ);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public byte eu() {
        return com.google.android.gms.maps.internal.a.c(this.BR);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public byte ev() {
        return com.google.android.gms.maps.internal.a.c(this.BS);
    }

    public CameraPosition getCamera() {
        return this.BM;
    }

    public Boolean getCompassEnabled() {
        return this.BO;
    }

    public int getMapType() {
        return this.BL;
    }

    public Boolean getRotateGesturesEnabled() {
        return this.BS;
    }

    public Boolean getScrollGesturesEnabled() {
        return this.BP;
    }

    public Boolean getTiltGesturesEnabled() {
        return this.BR;
    }

    public Boolean getUseViewLifecycleInFragment() {
        return this.BK;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.kg;
    }

    public Boolean getZOrderOnTop() {
        return this.BJ;
    }

    public Boolean getZoomControlsEnabled() {
        return this.BN;
    }

    public Boolean getZoomGesturesEnabled() {
        return this.BQ;
    }

    public GoogleMapOptions mapType(int mapType) {
        this.BL = mapType;
        return this;
    }

    public GoogleMapOptions rotateGesturesEnabled(boolean enabled) {
        this.BS = Boolean.valueOf(enabled);
        return this;
    }

    public GoogleMapOptions scrollGesturesEnabled(boolean enabled) {
        this.BP = Boolean.valueOf(enabled);
        return this;
    }

    public GoogleMapOptions tiltGesturesEnabled(boolean enabled) {
        this.BR = Boolean.valueOf(enabled);
        return this;
    }

    public GoogleMapOptions useViewLifecycleInFragment(boolean useViewLifecycleInFragment) {
        this.BK = Boolean.valueOf(useViewLifecycleInFragment);
        return this;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel out, int flags) {
        if (r.eD()) {
            a.a(this, out, flags);
        } else {
            GoogleMapOptionsCreator.a(this, out, flags);
        }
    }

    public GoogleMapOptions zOrderOnTop(boolean zOrderOnTop) {
        this.BJ = Boolean.valueOf(zOrderOnTop);
        return this;
    }

    public GoogleMapOptions zoomControlsEnabled(boolean enabled) {
        this.BN = Boolean.valueOf(enabled);
        return this;
    }

    public GoogleMapOptions zoomGesturesEnabled(boolean enabled) {
        this.BQ = Boolean.valueOf(enabled);
        return this;
    }
}
