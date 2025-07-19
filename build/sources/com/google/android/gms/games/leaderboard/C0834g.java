package com.google.android.gms.games.leaderboard;

import com.google.android.gms.common.data.C0663b;
import com.google.android.gms.common.data.DataHolder;

/* renamed from: com.google.android.gms.games.leaderboard.g */
public final class C0834g extends C0663b implements LeaderboardVariant {
    C0834g(DataHolder dataHolder, int i) {
        super(dataHolder, i);
    }

    /* renamed from: dt */
    public String mo6669dt() {
        return getString("top_page_token_next");
    }

    /* renamed from: du */
    public String mo6670du() {
        return getString("window_page_token_prev");
    }

    /* renamed from: dv */
    public String mo6671dv() {
        return getString("window_page_token_next");
    }

    /* renamed from: dw */
    public LeaderboardVariant freeze() {
        return new C0833f(this);
    }

    public boolean equals(Object obj) {
        return C0833f.m1823a(this, obj);
    }

    public int getCollection() {
        return getInteger("collection");
    }

    public String getDisplayPlayerRank() {
        return getString("player_display_rank");
    }

    public String getDisplayPlayerScore() {
        return getString("player_display_score");
    }

    public long getNumScores() {
        if (mo5975M("total_scores")) {
            return -1;
        }
        return getLong("total_scores");
    }

    public long getPlayerRank() {
        if (mo5975M("player_rank")) {
            return -1;
        }
        return getLong("player_rank");
    }

    public String getPlayerScoreTag() {
        return getString("player_score_tag");
    }

    public long getRawPlayerScore() {
        if (mo5975M("player_raw_score")) {
            return -1;
        }
        return getLong("player_raw_score");
    }

    public int getTimeSpan() {
        return getInteger("timespan");
    }

    public boolean hasPlayerInfo() {
        return !mo5975M("player_raw_score");
    }

    public int hashCode() {
        return C0833f.m1822a(this);
    }

    public String toString() {
        return C0833f.m1824b(this);
    }
}
