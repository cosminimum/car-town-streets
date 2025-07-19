package com.google.android.gms.maps.model;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.maps.internal.C1558r;

public final class Tile implements SafeParcelable {
    public static final TileCreator CREATOR = new TileCreator();
    public final byte[] data;
    public final int height;

    /* renamed from: kg */
    private final int f3681kg;
    public final int width;

    Tile(int versionCode, int width2, int height2, byte[] data2) {
        this.f3681kg = versionCode;
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
        return this.f3681kg;
    }

    public void writeToParcel(Parcel out, int flags) {
        if (C1558r.m4205eD()) {
            C1569i.m4243a(this, out, flags);
        } else {
            TileCreator.m4228a(this, out, flags);
        }
    }
}
