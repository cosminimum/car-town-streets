package com.google.android.gms.games.multiplayer.turnbased;

import com.google.android.gms.common.data.C0665d;
import com.google.android.gms.common.data.DataHolder;

public final class TurnBasedMatchBuffer extends C0665d<TurnBasedMatch> {
    public TurnBasedMatchBuffer(DataHolder dataHolder) {
        super(dataHolder);
    }

    /* access modifiers changed from: protected */
    /* renamed from: getEntry */
    public TurnBasedMatch mo5986a(int rowIndex, int numChildren) {
        return new C0848a(this.f1366nE, rowIndex, numChildren);
    }

    /* access modifiers changed from: protected */
    public String getPrimaryDataMarkerColumn() {
        return "external_match_id";
    }
}
