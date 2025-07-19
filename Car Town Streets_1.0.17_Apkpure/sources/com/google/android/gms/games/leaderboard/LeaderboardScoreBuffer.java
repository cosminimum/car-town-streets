package com.google.android.gms.games.leaderboard;

import com.google.android.gms.common.data.DataBuffer;
import com.google.android.gms.common.data.DataHolder;
/* loaded from: classes.dex */
public final class LeaderboardScoreBuffer extends DataBuffer<LeaderboardScore> {
    private final c vI;

    public LeaderboardScoreBuffer(DataHolder dataHolder) {
        super(dataHolder);
        this.vI = new c(dataHolder.getMetadata());
    }

    public c dq() {
        return this.vI;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.google.android.gms.common.data.DataBuffer
    /* renamed from: get */
    public LeaderboardScore mo391get(int position) {
        return new e(this.nE, position);
    }
}
