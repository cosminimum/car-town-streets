package com.google.android.gms.games.leaderboard;

import com.google.android.gms.common.data.DataHolder;
/* loaded from: classes.dex */
public final class g extends com.google.android.gms.common.data.b implements LeaderboardVariant {
    /* JADX INFO: Access modifiers changed from: package-private */
    public g(DataHolder dataHolder, int i) {
        super(dataHolder, i);
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardVariant
    public String dt() {
        return getString("top_page_token_next");
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardVariant
    public String du() {
        return getString("window_page_token_prev");
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardVariant
    public String dv() {
        return getString("window_page_token_next");
    }

    @Override // com.google.android.gms.common.data.Freezable
    /* renamed from: dw */
    public LeaderboardVariant mo358freeze() {
        return new f(this);
    }

    @Override // com.google.android.gms.common.data.b
    public boolean equals(Object obj) {
        return f.a(this, obj);
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardVariant
    public int getCollection() {
        return getInteger("collection");
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardVariant
    public String getDisplayPlayerRank() {
        return getString("player_display_rank");
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardVariant
    public String getDisplayPlayerScore() {
        return getString("player_display_score");
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardVariant
    public long getNumScores() {
        if (M("total_scores")) {
            return -1L;
        }
        return getLong("total_scores");
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardVariant
    public long getPlayerRank() {
        if (M("player_rank")) {
            return -1L;
        }
        return getLong("player_rank");
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardVariant
    public String getPlayerScoreTag() {
        return getString("player_score_tag");
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardVariant
    public long getRawPlayerScore() {
        if (M("player_raw_score")) {
            return -1L;
        }
        return getLong("player_raw_score");
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardVariant
    public int getTimeSpan() {
        return getInteger("timespan");
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardVariant
    public boolean hasPlayerInfo() {
        return !M("player_raw_score");
    }

    @Override // com.google.android.gms.common.data.b
    public int hashCode() {
        return f.a(this);
    }

    public String toString() {
        return f.b(this);
    }
}
