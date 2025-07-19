package com.google.android.gms.games.leaderboard;

import com.google.android.gms.common.data.DataBuffer;
import com.google.android.gms.common.data.DataHolder;

public final class LeaderboardScoreBuffer extends DataBuffer<LeaderboardScore> {

    /* renamed from: vI */
    private final C0830c f1762vI;

    public LeaderboardScoreBuffer(DataHolder dataHolder) {
        super(dataHolder);
        this.f1762vI = new C0830c(dataHolder.getMetadata());
    }

    /* renamed from: dq */
    public C0830c mo6668dq() {
        return this.f1762vI;
    }

    public LeaderboardScore get(int position) {
        return new C0832e(this.f1366nE, position);
    }
}
