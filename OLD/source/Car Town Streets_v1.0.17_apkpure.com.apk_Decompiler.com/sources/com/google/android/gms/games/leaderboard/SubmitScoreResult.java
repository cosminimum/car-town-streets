package com.google.android.gms.games.leaderboard;

import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.internal.ee;
import com.google.android.gms.internal.eg;
import com.google.android.gms.internal.ge;
import java.util.HashMap;

@Deprecated
public final class SubmitScoreResult {
    private static final String[] wh = {"leaderboardId", "playerId", "timeSpan", "hasResult", "rawScore", "formattedScore", "newBest", "scoreTag"};
    private int mC;
    private String tC;
    private String vD;
    private HashMap<Integer, Result> wi;

    public static final class Result {
        public final String formattedScore;
        public final boolean newBest;
        public final long rawScore;
        public final String scoreTag;

        public Result(long rawScore2, String formattedScore2, String scoreTag2, boolean newBest2) {
            this.rawScore = rawScore2;
            this.formattedScore = formattedScore2;
            this.scoreTag = scoreTag2;
            this.newBest = newBest2;
        }

        public String toString() {
            return ee.e(this).a("RawScore", Long.valueOf(this.rawScore)).a("FormattedScore", this.formattedScore).a("ScoreTag", this.scoreTag).a("NewBest", Boolean.valueOf(this.newBest)).toString();
        }
    }

    public SubmitScoreResult(int statusCode, String leaderboardId, String playerId) {
        this(statusCode, leaderboardId, playerId, new HashMap());
    }

    public SubmitScoreResult(int statusCode, String leaderboardId, String playerId, HashMap<Integer, Result> results) {
        this.mC = statusCode;
        this.vD = leaderboardId;
        this.tC = playerId;
        this.wi = results;
    }

    public SubmitScoreResult(DataHolder dataHolder) {
        this.mC = dataHolder.getStatusCode();
        this.wi = new HashMap<>();
        int count = dataHolder.getCount();
        eg.r(count == 3);
        for (int i = 0; i < count; i++) {
            int C = dataHolder.C(i);
            if (i == 0) {
                this.vD = dataHolder.getString("leaderboardId", i, C);
                this.tC = dataHolder.getString("playerId", i, C);
            }
            if (dataHolder.getBoolean("hasResult", i, C)) {
                a(new Result(dataHolder.getLong("rawScore", i, C), dataHolder.getString("formattedScore", i, C), dataHolder.getString("scoreTag", i, C), dataHolder.getBoolean("newBest", i, C)), dataHolder.getInteger("timeSpan", i, C));
            }
        }
    }

    private void a(Result result, int i) {
        this.wi.put(Integer.valueOf(i), result);
    }

    public String getLeaderboardId() {
        return this.vD;
    }

    public String getPlayerId() {
        return this.tC;
    }

    public Result getScoreResult(int timeSpan) {
        return this.wi.get(Integer.valueOf(timeSpan));
    }

    public int getStatusCode() {
        return this.mC;
    }

    public String toString() {
        ee.a a = ee.e(this).a("PlayerId", this.tC).a("StatusCode", Integer.valueOf(this.mC));
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= 3) {
                return a.toString();
            }
            Result result = this.wi.get(Integer.valueOf(i2));
            a.a("TimesSpan", ge.aG(i2));
            a.a("Result", result == null ? "null" : result.toString());
            i = i2 + 1;
        }
    }
}
