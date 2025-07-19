package com.google.android.gms.games.leaderboard;

import android.database.CharArrayBuffer;
import android.net.Uri;
import com.google.android.gms.common.data.C0663b;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.games.C0826d;
import com.google.android.gms.games.Player;

/* renamed from: com.google.android.gms.games.leaderboard.e */
public final class C0832e extends C0663b implements LeaderboardScore {

    /* renamed from: vU */
    private final C0826d f1792vU;

    C0832e(DataHolder dataHolder, int i) {
        super(dataHolder, i);
        this.f1792vU = new C0826d(dataHolder, i);
    }

    /* renamed from: ds */
    public LeaderboardScore freeze() {
        return new C0831d(this);
    }

    public boolean equals(Object obj) {
        return C0831d.m1818a(this, obj);
    }

    public String getDisplayRank() {
        return getString("display_rank");
    }

    public void getDisplayRank(CharArrayBuffer dataOut) {
        mo5976a("display_rank", dataOut);
    }

    public String getDisplayScore() {
        return getString("display_score");
    }

    public void getDisplayScore(CharArrayBuffer dataOut) {
        mo5976a("display_score", dataOut);
    }

    public long getRank() {
        return getLong("rank");
    }

    public long getRawScore() {
        return getLong("raw_score");
    }

    public Player getScoreHolder() {
        if (mo5975M("external_player_id")) {
            return null;
        }
        return this.f1792vU;
    }

    public String getScoreHolderDisplayName() {
        return mo5975M("external_player_id") ? getString("default_display_name") : this.f1792vU.getDisplayName();
    }

    public void getScoreHolderDisplayName(CharArrayBuffer dataOut) {
        if (mo5975M("external_player_id")) {
            mo5976a("default_display_name", dataOut);
        } else {
            this.f1792vU.getDisplayName(dataOut);
        }
    }

    public Uri getScoreHolderHiResImageUri() {
        if (mo5975M("external_player_id")) {
            return null;
        }
        return this.f1792vU.getHiResImageUri();
    }

    public Uri getScoreHolderIconImageUri() {
        return mo5975M("external_player_id") ? mo5974L("default_display_image_uri") : this.f1792vU.getIconImageUri();
    }

    public String getScoreTag() {
        return getString("score_tag");
    }

    public long getTimestampMillis() {
        return getLong("achieved_timestamp");
    }

    public int hashCode() {
        return C0831d.m1817a(this);
    }

    public String toString() {
        return C0831d.m1819b(this);
    }
}
