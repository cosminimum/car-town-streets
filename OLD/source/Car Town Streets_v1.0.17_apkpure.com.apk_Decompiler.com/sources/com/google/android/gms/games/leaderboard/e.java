package com.google.android.gms.games.leaderboard;

import android.database.CharArrayBuffer;
import android.net.Uri;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.common.data.b;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.d;

public final class e extends b implements LeaderboardScore {
    private final d vU;

    e(DataHolder dataHolder, int i) {
        super(dataHolder, i);
        this.vU = new d(dataHolder, i);
    }

    /* renamed from: ds */
    public LeaderboardScore freeze() {
        return new d(this);
    }

    public boolean equals(Object obj) {
        return d.a(this, obj);
    }

    public String getDisplayRank() {
        return getString("display_rank");
    }

    public void getDisplayRank(CharArrayBuffer dataOut) {
        a("display_rank", dataOut);
    }

    public String getDisplayScore() {
        return getString("display_score");
    }

    public void getDisplayScore(CharArrayBuffer dataOut) {
        a("display_score", dataOut);
    }

    public long getRank() {
        return getLong("rank");
    }

    public long getRawScore() {
        return getLong("raw_score");
    }

    public Player getScoreHolder() {
        if (M("external_player_id")) {
            return null;
        }
        return this.vU;
    }

    public String getScoreHolderDisplayName() {
        return M("external_player_id") ? getString("default_display_name") : this.vU.getDisplayName();
    }

    public void getScoreHolderDisplayName(CharArrayBuffer dataOut) {
        if (M("external_player_id")) {
            a("default_display_name", dataOut);
        } else {
            this.vU.getDisplayName(dataOut);
        }
    }

    public Uri getScoreHolderHiResImageUri() {
        if (M("external_player_id")) {
            return null;
        }
        return this.vU.getHiResImageUri();
    }

    public Uri getScoreHolderIconImageUri() {
        return M("external_player_id") ? L("default_display_image_uri") : this.vU.getIconImageUri();
    }

    public String getScoreTag() {
        return getString("score_tag");
    }

    public long getTimestampMillis() {
        return getLong("achieved_timestamp");
    }

    public int hashCode() {
        return d.a(this);
    }

    public String toString() {
        return d.b(this);
    }
}
