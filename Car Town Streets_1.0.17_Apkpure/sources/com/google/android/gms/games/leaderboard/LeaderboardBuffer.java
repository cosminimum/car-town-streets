package com.google.android.gms.games.leaderboard;

import com.google.android.gms.common.data.DataHolder;
/* loaded from: classes.dex */
public final class LeaderboardBuffer extends com.google.android.gms.common.data.d<Leaderboard> {
    public LeaderboardBuffer(DataHolder dataHolder) {
        super(dataHolder);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.common.data.d
    /* renamed from: getEntry */
    public Leaderboard a(int rowIndex, int numChildren) {
        return new b(this.nE, rowIndex, numChildren);
    }

    @Override // com.google.android.gms.common.data.d
    protected String getPrimaryDataMarkerColumn() {
        return "external_leaderboard_id";
    }
}
