package com.google.android.gms.games.multiplayer.realtime;

import com.google.android.gms.common.data.C0665d;
import com.google.android.gms.common.data.DataHolder;

/* renamed from: com.google.android.gms.games.multiplayer.realtime.a */
public final class C0844a extends C0665d<Room> {
    public C0844a(DataHolder dataHolder) {
        super(dataHolder);
    }

    /* access modifiers changed from: protected */
    /* renamed from: b */
    public Room mo5986a(int i, int i2) {
        return new C0846c(this.f1366nE, i, i2);
    }

    /* access modifiers changed from: protected */
    public String getPrimaryDataMarkerColumn() {
        return "external_match_id";
    }
}
