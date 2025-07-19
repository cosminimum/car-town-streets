package com.google.android.gms.games.leaderboard;

import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.internal.C1098ee;
import com.google.android.gms.internal.C1102eg;
import com.google.android.gms.internal.C1295ge;
import java.util.HashMap;

@Deprecated
public final class SubmitScoreResult {

    /* renamed from: wh */
    private static final String[] f1768wh = {"leaderboardId", "playerId", "timeSpan", "hasResult", "rawScore", "formattedScore", "newBest", "scoreTag"};

    /* renamed from: mC */
    private int f1769mC;

    /* renamed from: tC */
    private String f1770tC;

    /* renamed from: vD */
    private String f1771vD;

    /* renamed from: wi */
    private HashMap<Integer, Result> f1772wi;

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
            return C1098ee.m2604e(this).mo7535a("RawScore", Long.valueOf(this.rawScore)).mo7535a("FormattedScore", this.formattedScore).mo7535a("ScoreTag", this.scoreTag).mo7535a("NewBest", Boolean.valueOf(this.newBest)).toString();
        }
    }

    public SubmitScoreResult(int statusCode, String leaderboardId, String playerId) {
        this(statusCode, leaderboardId, playerId, new HashMap());
    }

    public SubmitScoreResult(int statusCode, String leaderboardId, String playerId, HashMap<Integer, Result> results) {
        this.f1769mC = statusCode;
        this.f1771vD = leaderboardId;
        this.f1770tC = playerId;
        this.f1772wi = results;
    }

    public SubmitScoreResult(DataHolder dataHolder) {
        this.f1769mC = dataHolder.getStatusCode();
        this.f1772wi = new HashMap<>();
        int count = dataHolder.getCount();
        C1102eg.m2618r(count == 3);
        for (int i = 0; i < count; i++) {
            int C = dataHolder.mo5935C(i);
            if (i == 0) {
                this.f1771vD = dataHolder.getString("leaderboardId", i, C);
                this.f1770tC = dataHolder.getString("playerId", i, C);
            }
            if (dataHolder.getBoolean("hasResult", i, C)) {
                m1810a(new Result(dataHolder.getLong("rawScore", i, C), dataHolder.getString("formattedScore", i, C), dataHolder.getString("scoreTag", i, C), dataHolder.getBoolean("newBest", i, C)), dataHolder.getInteger("timeSpan", i, C));
            }
        }
    }

    /* renamed from: a */
    private void m1810a(Result result, int i) {
        this.f1772wi.put(Integer.valueOf(i), result);
    }

    public String getLeaderboardId() {
        return this.f1771vD;
    }

    public String getPlayerId() {
        return this.f1770tC;
    }

    public Result getScoreResult(int timeSpan) {
        return this.f1772wi.get(Integer.valueOf(timeSpan));
    }

    public int getStatusCode() {
        return this.f1769mC;
    }

    public String toString() {
        C1098ee.C1100a a = C1098ee.m2604e(this).mo7535a("PlayerId", this.f1770tC).mo7535a("StatusCode", Integer.valueOf(this.f1769mC));
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= 3) {
                return a.toString();
            }
            Result result = this.f1772wi.get(Integer.valueOf(i2));
            a.mo7535a("TimesSpan", C1295ge.m3416aG(i2));
            a.mo7535a("Result", result == null ? "null" : result.toString());
            i = i2 + 1;
        }
    }
}
