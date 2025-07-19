package com.google.android.gms.games.multiplayer.realtime;

import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.d;
/* loaded from: classes.dex */
public final class a extends d<Room> {
    public a(DataHolder dataHolder) {
        super(dataHolder);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.common.data.d
    /* renamed from: b */
    public Room a(int i, int i2) {
        return new c(this.nE, i, i2);
    }

    @Override // com.google.android.gms.common.data.d
    protected String getPrimaryDataMarkerColumn() {
        return "external_match_id";
    }
}
