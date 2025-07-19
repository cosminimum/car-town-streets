package com.google.android.gms.maps.model;

import android.os.IBinder;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.maps.internal.r;
import com.google.android.gms.maps.model.internal.g;

public final class TileOverlayOptions implements SafeParcelable {
    public static final TileOverlayOptionsCreator CREATOR = new TileOverlayOptionsCreator();
    private float Cw;
    private boolean Cx;
    /* access modifiers changed from: private */
    public g Da;
    private TileProvider Db;
    private boolean Dc;
    private final int kg;

    public TileOverlayOptions() {
        this.Cx = true;
        this.Dc = true;
        this.kg = 1;
    }

    TileOverlayOptions(int versionCode, IBinder delegate, boolean visible, float zIndex, boolean fadeIn) {
        this.Cx = true;
        this.Dc = true;
        this.kg = versionCode;
        this.Da = g.a.aq(delegate);
        this.Db = this.Da == null ? null : new TileProvider() {
            private final g Dd = TileOverlayOptions.this.Da;

            public Tile getTile(int x, int y, int zoom) {
                try {
                    return this.Dd.getTile(x, y, zoom);
                } catch (RemoteException e) {
                    return null;
                }
            }
        };
        this.Cx = visible;
        this.Cw = zIndex;
        this.Dc = fadeIn;
    }

    public int describeContents() {
        return 0;
    }

    /* access modifiers changed from: package-private */
    public IBinder eI() {
        return this.Da.asBinder();
    }

    public TileOverlayOptions fadeIn(boolean fadeIn) {
        this.Dc = fadeIn;
        return this;
    }

    public boolean getFadeIn() {
        return this.Dc;
    }

    public TileProvider getTileProvider() {
        return this.Db;
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

    public TileOverlayOptions tileProvider(final TileProvider tileProvider) {
        this.Db = tileProvider;
        this.Da = this.Db == null ? null : new g.a() {
            public Tile getTile(int x, int y, int zoom) {
                return tileProvider.getTile(x, y, zoom);
            }
        };
        return this;
    }

    public TileOverlayOptions visible(boolean visible) {
        this.Cx = visible;
        return this;
    }

    public void writeToParcel(Parcel out, int flags) {
        if (r.eD()) {
            j.a(this, out, flags);
        } else {
            TileOverlayOptionsCreator.a(this, out, flags);
        }
    }

    public TileOverlayOptions zIndex(float zIndex) {
        this.Cw = zIndex;
        return this;
    }
}
