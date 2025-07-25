package com.google.android.gms.games.leaderboard;

import android.database.CharArrayBuffer;
import android.net.Uri;
import com.google.android.gms.common.data.Freezable;
import com.google.android.gms.games.Player;
/* loaded from: classes.dex */
public interface LeaderboardScore extends Freezable<LeaderboardScore> {
    public static final int LEADERBOARD_RANK_UNKNOWN = -1;

    String getDisplayRank();

    void getDisplayRank(CharArrayBuffer charArrayBuffer);

    String getDisplayScore();

    void getDisplayScore(CharArrayBuffer charArrayBuffer);

    long getRank();

    long getRawScore();

    Player getScoreHolder();

    String getScoreHolderDisplayName();

    void getScoreHolderDisplayName(CharArrayBuffer charArrayBuffer);

    Uri getScoreHolderHiResImageUri();

    Uri getScoreHolderIconImageUri();

    String getScoreTag();

    long getTimestampMillis();
}
