package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.maps.internal.r;

public final class Tile implements SafeParcelable {
    public static final TileCreator CREATOR = new TileCreator();
    public final byte[] data;
    public final int height;
    private final int kg;
    public final int width;

    Tile(int versionCode, int width2, int height2, byte[] data2) {
        this.kg = versionCode;
        this.width = width2;
        this.height = height2;
        this.data = data2;
    }

    public Tile(int width2, int height2, byte[] data2) {
        this(1, width2, height2, data2);
    }

    public int describeContents() {
        return 0;
    }

    /* access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.kg;
    }

    public void writeToParcel(Parcel out, int flags) {
        if (r.eD()) {
            i.a(this, out, flags);
        } else {
            TileCreator.a(this, out, flags);
        }
    }
}
