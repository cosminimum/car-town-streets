package com.google.android.gms.games.leaderboard;

import com.google.android.gms.common.data.C0665d;
import com.google.android.gms.common.data.DataHolder;

public final class LeaderboardBuffer extends C0665d<Leaderboard> {
    public LeaderboardBuffer(DataHolder dataHolder) {
        super(dataHolder);
    }

    /* access modifiers changed from: protected */
    /* renamed from: getEntry */
    public Leaderboard mo5986a(int rowIndex, int numChildren) {
        return new C0829b(this.f1366nE, rowIndex, numChildren);
    }

    /* access modifiers changed from: protected */
    public String getPrimaryDataMarkerColumn() {
        return "external_leaderboard_id";
    }
}
