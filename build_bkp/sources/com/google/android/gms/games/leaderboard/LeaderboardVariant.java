package com.google.android.gms.games.leaderboard;

import com.google.android.gms.common.data.Freezable;

public interface LeaderboardVariant extends Freezable<LeaderboardVariant> {
    public static final int COLLECTION_PUBLIC = 0;
    public static final int COLLECTION_SOCIAL = 1;
    public static final int NUM_SCORES_UNKNOWN = -1;
    public static final int NUM_TIME_SPANS = 3;
    public static final int PLAYER_RANK_UNKNOWN = -1;
    public static final int PLAYER_SCORE_UNKNOWN = -1;
    public static final int TIME_SPAN_ALL_TIME = 2;
    public static final int TIME_SPAN_DAILY = 0;
    public static final int TIME_SPAN_WEEKLY = 1;

    /* renamed from: dt */
    String mo6669dt();

    /* renamed from: du */
    String mo6670du();

    /* renamed from: dv */
    String mo6671dv();

    int getCollection();

    String getDisplayPlayerRank();

    String getDisplayPlayerScore();

    long getNumScores();

    long getPlayerRank();

    String getPlayerScoreTag();

    long getRawPlayerScore();

    int getTimeSpan();

    boolean hasPlayerInfo();
}
