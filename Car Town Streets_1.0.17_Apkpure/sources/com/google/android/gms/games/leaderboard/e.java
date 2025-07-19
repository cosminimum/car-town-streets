package com.google.android.gms.games.leaderboard;

import android.database.CharArrayBuffer;
import android.net.Uri;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.games.Player;
/* loaded from: classes.dex */
public final class e extends com.google.android.gms.common.data.b implements LeaderboardScore {
    private final com.google.android.gms.games.d vU;

    /* JADX INFO: Access modifiers changed from: package-private */
    public e(DataHolder dataHolder, int i) {
        super(dataHolder, i);
        this.vU = new com.google.android.gms.games.d(dataHolder, i);
    }

    @Override // com.google.android.gms.common.data.Freezable
    /* renamed from: ds */
    public LeaderboardScore mo358freeze() {
        return new d(this);
    }

    @Override // com.google.android.gms.common.data.b
    public boolean equals(Object obj) {
        return d.a(this, obj);
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardScore
    public String getDisplayRank() {
        return getString("display_rank");
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardScore
    public void getDisplayRank(CharArrayBuffer dataOut) {
        a("display_rank", dataOut);
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardScore
    public String getDisplayScore() {
        return getString("display_score");
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardScore
    public void getDisplayScore(CharArrayBuffer dataOut) {
        a("display_score", dataOut);
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardScore
    public long getRank() {
        return getLong("rank");
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardScore
    public long getRawScore() {
        return getLong("raw_score");
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardScore
    public Player getScoreHolder() {
        if (M("external_player_id")) {
            return null;
        }
        return this.vU;
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardScore
    public String getScoreHolderDisplayName() {
        return M("external_player_id") ? getString("default_display_name") : this.vU.getDisplayName();
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardScore
    public void getScoreHolderDisplayName(CharArrayBuffer dataOut) {
        if (M("external_player_id")) {
            a("default_display_name", dataOut);
        } else {
            this.vU.getDisplayName(dataOut);
        }
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardScore
    public Uri getScoreHolderHiResImageUri() {
        if (M("external_player_id")) {
            return null;
        }
        return this.vU.getHiResImageUri();
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardScore
    public Uri getScoreHolderIconImageUri() {
        return M("external_player_id") ? L("default_display_image_uri") : this.vU.getIconImageUri();
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardScore
    public String getScoreTag() {
        return getString("score_tag");
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardScore
    public long getTimestampMillis() {
        return getLong("achieved_timestamp");
    }

    @Override // com.google.android.gms.common.data.b
    public int hashCode() {
        return d.a(this);
    }

    public String toString() {
        return d.b(this);
    }
}
