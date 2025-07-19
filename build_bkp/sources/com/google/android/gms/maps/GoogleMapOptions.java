package com.google.android.gms.maps;

import android.content.Context;
import android.content.res.TypedArray;
import android.os.Parcel;
import android.util.AttributeSet;
import com.google.android.gms.C0585R;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.maps.internal.C1513a;
import com.google.android.gms.maps.internal.C1558r;
import com.google.android.gms.maps.model.CameraPosition;

public final class GoogleMapOptions implements SafeParcelable {
    public static final GoogleMapOptionsCreator CREATOR = new GoogleMapOptionsCreator();

    /* renamed from: BJ */
    private Boolean f3555BJ;

    /* renamed from: BK */
    private Boolean f3556BK;

    /* renamed from: BL */
    private int f3557BL;

    /* renamed from: BM */
    private CameraPosition f3558BM;

    /* renamed from: BN */
    private Boolean f3559BN;

    /* renamed from: BO */
    private Boolean f3560BO;

    /* renamed from: BP */
    private Boolean f3561BP;

    /* renamed from: BQ */
    private Boolean f3562BQ;

    /* renamed from: BR */
    private Boolean f3563BR;

    /* renamed from: BS */
    private Boolean f3564BS;

    /* renamed from: kg */
    private final int f3565kg;

    public GoogleMapOptions() {
        this.f3557BL = -1;
        this.f3565kg = 1;
    }

    GoogleMapOptions(int versionCode, byte zOrderOnTop, byte useViewLifecycleInFragment, int mapType, CameraPosition camera, byte zoomControlsEnabled, byte compassEnabled, byte scrollGesturesEnabled, byte zoomGesturesEnabled, byte tiltGesturesEnabled, byte rotateGesturesEnabled) {
        this.f3557BL = -1;
        this.f3565kg = versionCode;
        this.f3555BJ = C1513a.m4149a(zOrderOnTop);
        this.f3556BK = C1513a.m4149a(useViewLifecycleInFragment);
        this.f3557BL = mapType;
        this.f3558BM = camera;
        this.f3559BN = C1513a.m4149a(zoomControlsEnabled);
        this.f3560BO = C1513a.m4149a(compassEnabled);
        this.f3561BP = C1513a.m4149a(scrollGesturesEnabled);
        this.f3562BQ = C1513a.m4149a(zoomGesturesEnabled);
        this.f3563BR = C1513a.m4149a(tiltGesturesEnabled);
        this.f3564BS = C1513a.m4149a(rotateGesturesEnabled);
    }

    public static GoogleMapOptions createFromAttributes(Context context, AttributeSet attrs) {
        if (attrs == null) {
            return null;
        }
        TypedArray obtainAttributes = context.getResources().obtainAttributes(attrs, C0585R.styleable.MapAttrs);
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
        this.f3558BM = camera;
        return this;
    }

    public GoogleMapOptions compassEnabled(boolean enabled) {
        this.f3560BO = Boolean.valueOf(enabled);
        return this;
    }

    public int describeContents() {
        return 0;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: eo */
    public byte mo9021eo() {
        return C1513a.m4150c(this.f3555BJ);
    }

    /* access modifiers changed from: package-private */
    /* renamed from: ep */
    public byte mo9022ep() {
        return C1513a.m4150c(this.f3556BK);
    }

    /* access modifiers changed from: package-private */
    /* renamed from: eq */
    public byte mo9023eq() {
        return C1513a.m4150c(this.f3559BN);
    }

    /* access modifiers changed from: package-private */
    /* renamed from: er */
    public byte mo9024er() {
        return C1513a.m4150c(this.f3560BO);
    }

    /* access modifiers changed from: package-private */
    /* renamed from: es */
    public byte mo9025es() {
        return C1513a.m4150c(this.f3561BP);
    }

    /* access modifiers changed from: package-private */
    /* renamed from: et */
    public byte mo9026et() {
        return C1513a.m4150c(this.f3562BQ);
    }

    /* access modifiers changed from: package-private */
    /* renamed from: eu */
    public byte mo9027eu() {
        return C1513a.m4150c(this.f3563BR);
    }

    /* access modifiers changed from: package-private */
    /* renamed from: ev */
    public byte mo9028ev() {
        return C1513a.m4150c(this.f3564BS);
    }

    public CameraPosition getCamera() {
        return this.f3558BM;
    }

    public Boolean getCompassEnabled() {
        return this.f3560BO;
    }

    public int getMapType() {
        return this.f3557BL;
    }

    public Boolean getRotateGesturesEnabled() {
        return this.f3564BS;
    }

    public Boolean getScrollGesturesEnabled() {
        return this.f3561BP;
    }

    public Boolean getTiltGesturesEnabled() {
        return this.f3563BR;
    }

    public Boolean getUseViewLifecycleInFragment() {
        return this.f3556BK;
    }

    /* access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.f3565kg;
    }

    public Boolean getZOrderOnTop() {
        return this.f3555BJ;
    }

    public Boolean getZoomControlsEnabled() {
        return this.f3559BN;
    }

    public Boolean getZoomGesturesEnabled() {
        return this.f3562BQ;
    }

    public GoogleMapOptions mapType(int mapType) {
        this.f3557BL = mapType;
        return this;
    }

    public GoogleMapOptions rotateGesturesEnabled(boolean enabled) {
        this.f3564BS = Boolean.valueOf(enabled);
        return this;
    }

    public GoogleMapOptions scrollGesturesEnabled(boolean enabled) {
        this.f3561BP = Boolean.valueOf(enabled);
        return this;
    }

    public GoogleMapOptions tiltGesturesEnabled(boolean enabled) {
        this.f3563BR = Boolean.valueOf(enabled);
        return this;
    }

    public GoogleMapOptions useViewLifecycleInFragment(boolean useViewLifecycleInFragment) {
        this.f3556BK = Boolean.valueOf(useViewLifecycleInFragment);
        return this;
    }

    public void writeToParcel(Parcel out, int flags) {
        if (C1558r.m4205eD()) {
            C1498a.m4141a(this, out, flags);
        } else {
            GoogleMapOptionsCreator.m4127a(this, out, flags);
        }
    }

    public GoogleMapOptions zOrderOnTop(boolean zOrderOnTop) {
        this.f3555BJ = Boolean.valueOf(zOrderOnTop);
        return this;
    }

    public GoogleMapOptions zoomControlsEnabled(boolean enabled) {
        this.f3559BN = Boolean.valueOf(enabled);
        return this;
    }

    public GoogleMapOptions zoomGesturesEnabled(boolean enabled) {
        this.f3562BQ = Boolean.valueOf(enabled);
        return this;
    }
}
