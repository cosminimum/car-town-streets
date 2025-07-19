package com.google.android.gms.games.multiplayer.turnbased;

import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.d;
/* loaded from: classes.dex */
public final class TurnBasedMatchBuffer extends d<TurnBasedMatch> {
    public TurnBasedMatchBuffer(DataHolder dataHolder) {
        super(dataHolder);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.common.data.d
    /* renamed from: getEntry */
    public TurnBasedMatch a(int rowIndex, int numChildren) {
        return new a(this.nE, rowIndex, numChildren);
    }

    @Override // com.google.android.gms.common.data.d
    protected String getPrimaryDataMarkerColumn() {
        return "external_match_id";
    }
}
