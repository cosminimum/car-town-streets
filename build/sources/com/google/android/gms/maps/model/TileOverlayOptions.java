package com.google.android.gms.maps.model;

import android.os.IBinder;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.maps.internal.C1558r;
import com.google.android.gms.maps.model.internal.C1590g;

public final class TileOverlayOptions implements SafeParcelable {
    public static final TileOverlayOptionsCreator CREATOR = new TileOverlayOptionsCreator();

    /* renamed from: Cw */
    private float f3683Cw;

    /* renamed from: Cx */
    private boolean f3684Cx;
    /* access modifiers changed from: private */

    /* renamed from: Da */
    public C1590g f3685Da;

    /* renamed from: Db */
    private TileProvider f3686Db;

    /* renamed from: Dc */
    private boolean f3687Dc;

    /* renamed from: kg */
    private final int f3688kg;

    public TileOverlayOptions() {
        this.f3684Cx = true;
        this.f3687Dc = true;
        this.f3688kg = 1;
    }

    TileOverlayOptions(int versionCode, IBinder delegate, boolean visible, float zIndex, boolean fadeIn) {
        this.f3684Cx = true;
        this.f3687Dc = true;
        this.f3688kg = versionCode;
        this.f3685Da = C1590g.C1591a.m4281aq(delegate);
        this.f3686Db = this.f3685Da == null ? null : new TileProvider() {

            /* renamed from: Dd */
            private final C1590g f3689Dd = TileOverlayOptions.this.f3685Da;

            public Tile getTile(int x, int y, int zoom) {
                try {
                    return this.f3689Dd.getTile(x, y, zoom);
                } catch (RemoteException e) {
                    return null;
                }
            }
        };
        this.f3684Cx = visible;
        this.f3683Cw = zIndex;
        this.f3687Dc = fadeIn;
    }

    public int describeContents() {
        return 0;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: eI */
    public IBinder mo9523eI() {
        return this.f3685Da.asBinder();
    }

    public TileOverlayOptions fadeIn(boolean fadeIn) {
        this.f3687Dc = fadeIn;
        return this;
    }

    public boolean getFadeIn() {
        return this.f3687Dc;
    }

    public TileProvider getTileProvider() {
        return this.f3686Db;
    }

    /* access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.f3688kg;
    }

    public float getZIndex() {
        return this.f3683Cw;
    }

    public boolean isVisible() {
        return this.f3684Cx;
    }

    public TileOverlayOptions tileProvider(final TileProvider tileProvider) {
        this.f3686Db = tileProvider;
        this.f3685Da = this.f3686Db == null ? null : new C1590g.C1591a() {
            public Tile getTile(int x, int y, int zoom) {
                return tileProvider.getTile(x, y, zoom);
            }
        };
        return this;
    }

    public TileOverlayOptions visible(boolean visible) {
        this.f3684Cx = visible;
        return this;
    }

    public void writeToParcel(Parcel out, int flags) {
        if (C1558r.m4205eD()) {
            C1593j.m4282a(this, out, flags);
        } else {
            TileOverlayOptionsCreator.m4231a(this, out, flags);
        }
    }

    public TileOverlayOptions zIndex(float zIndex) {
        this.f3683Cw = zIndex;
        return this;
    }
}
