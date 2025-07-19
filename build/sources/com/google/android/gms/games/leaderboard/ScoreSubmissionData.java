package com.google.android.gms.games.leaderboard;

import android.content.ContentValues;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.internal.C1098ee;
import com.google.android.gms.internal.C1102eg;
import com.google.android.gms.internal.C1295ge;
import java.util.HashMap;

public final class ScoreSubmissionData {

    /* renamed from: wh */
    private static final String[] f1763wh = {"leaderboardId", "playerId", "timeSpan", "hasResult", "rawScore", "formattedScore", "newBest", "scoreTag"};

    /* renamed from: mC */
    private int f1764mC;

    /* renamed from: tC */
    private String f1765tC;

    /* renamed from: vD */
    private String f1766vD;

    /* renamed from: wi */
    private HashMap<Integer, Result> f1767wi = new HashMap<>();

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

    public ScoreSubmissionData(DataHolder dataHolder) {
        this.f1764mC = dataHolder.getStatusCode();
        int count = dataHolder.getCount();
        C1102eg.m2618r(count == 3);
        for (int i = 0; i < count; i++) {
            int C = dataHolder.mo5935C(i);
            if (i == 0) {
                this.f1766vD = dataHolder.getString("leaderboardId", i, C);
                this.f1765tC = dataHolder.getString("playerId", i, C);
            }
            if (dataHolder.getBoolean("hasResult", i, C)) {
                m1807a(new Result(dataHolder.getLong("rawScore", i, C), dataHolder.getString("formattedScore", i, C), dataHolder.getString("scoreTag", i, C), dataHolder.getBoolean("newBest", i, C)), dataHolder.getInteger("timeSpan", i, C));
            }
        }
    }

    /* renamed from: a */
    private void m1807a(Result result, int i) {
        this.f1767wi.put(Integer.valueOf(i), result);
    }

    /* renamed from: aH */
    private ContentValues m1808aH(int i) {
        Result scoreResult = getScoreResult(i);
        ContentValues contentValues = new ContentValues();
        contentValues.put("leaderboardId", this.f1766vD);
        contentValues.put("playerId", this.f1765tC);
        contentValues.put("timeSpan", Integer.valueOf(i));
        if (scoreResult != null) {
            contentValues.put("rawScore", Long.valueOf(scoreResult.rawScore));
            contentValues.put("formattedScore", scoreResult.formattedScore);
            contentValues.put("scoreTag", scoreResult.scoreTag);
            contentValues.put("newBest", Boolean.valueOf(scoreResult.newBest));
            contentValues.put("hasResult", true);
        } else {
            contentValues.put("hasResult", false);
        }
        return contentValues;
    }

    /* renamed from: dx */
    public DataHolder mo6704dx() {
        DataHolder.Builder builder = DataHolder.builder(f1763wh);
        for (int i = 0; i < 3; i++) {
            builder.withRow(m1808aH(i));
        }
        return builder.build(this.f1764mC);
    }

    public String getLeaderboardId() {
        return this.f1766vD;
    }

    public String getPlayerId() {
        return this.f1765tC;
    }

    public Result getScoreResult(int timeSpan) {
        return this.f1767wi.get(Integer.valueOf(timeSpan));
    }

    public String toString() {
        C1098ee.C1100a a = C1098ee.m2604e(this).mo7535a("PlayerId", this.f1765tC).mo7535a("StatusCode", Integer.valueOf(this.f1764mC));
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= 3) {
                return a.toString();
            }
            Result result = this.f1767wi.get(Integer.valueOf(i2));
            a.mo7535a("TimesSpan", C1295ge.m3416aG(i2));
            a.mo7535a("Result", result == null ? "null" : result.toString());
            i = i2 + 1;
        }
    }
}
