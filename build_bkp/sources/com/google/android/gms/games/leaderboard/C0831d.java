package com.google.android.gms.games.leaderboard;

import android.database.CharArrayBuffer;
import android.net.Uri;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.PlayerEntity;
import com.google.android.gms.internal.C1098ee;
import com.google.android.gms.internal.C1102eg;
import com.google.android.gms.internal.C1131fc;

/* renamed from: com.google.android.gms.games.leaderboard.d */
public final class C0831d implements LeaderboardScore {

    /* renamed from: vK */
    private final long f1782vK;

    /* renamed from: vL */
    private final String f1783vL;

    /* renamed from: vM */
    private final String f1784vM;

    /* renamed from: vN */
    private final long f1785vN;

    /* renamed from: vO */
    private final long f1786vO;

    /* renamed from: vP */
    private final String f1787vP;

    /* renamed from: vQ */
    private final Uri f1788vQ;

    /* renamed from: vR */
    private final Uri f1789vR;

    /* renamed from: vS */
    private final PlayerEntity f1790vS;

    /* renamed from: vT */
    private final String f1791vT;

    public C0831d(LeaderboardScore leaderboardScore) {
        this.f1782vK = leaderboardScore.getRank();
        this.f1783vL = (String) C1102eg.m2616f(leaderboardScore.getDisplayRank());
        this.f1784vM = (String) C1102eg.m2616f(leaderboardScore.getDisplayScore());
        this.f1785vN = leaderboardScore.getRawScore();
        this.f1786vO = leaderboardScore.getTimestampMillis();
        this.f1787vP = leaderboardScore.getScoreHolderDisplayName();
        this.f1788vQ = leaderboardScore.getScoreHolderIconImageUri();
        this.f1789vR = leaderboardScore.getScoreHolderHiResImageUri();
        Player scoreHolder = leaderboardScore.getScoreHolder();
        this.f1790vS = scoreHolder == null ? null : (PlayerEntity) scoreHolder.freeze();
        this.f1791vT = leaderboardScore.getScoreTag();
    }

    /* renamed from: a */
    static int m1817a(LeaderboardScore leaderboardScore) {
        return C1098ee.hashCode(Long.valueOf(leaderboardScore.getRank()), leaderboardScore.getDisplayRank(), Long.valueOf(leaderboardScore.getRawScore()), leaderboardScore.getDisplayScore(), Long.valueOf(leaderboardScore.getTimestampMillis()), leaderboardScore.getScoreHolderDisplayName(), leaderboardScore.getScoreHolderIconImageUri(), leaderboardScore.getScoreHolderHiResImageUri(), leaderboardScore.getScoreHolder());
    }

    /* renamed from: a */
    static boolean m1818a(LeaderboardScore leaderboardScore, Object obj) {
        if (!(obj instanceof LeaderboardScore)) {
            return false;
        }
        if (leaderboardScore == obj) {
            return true;
        }
        LeaderboardScore leaderboardScore2 = (LeaderboardScore) obj;
        return C1098ee.equal(Long.valueOf(leaderboardScore2.getRank()), Long.valueOf(leaderboardScore.getRank())) && C1098ee.equal(leaderboardScore2.getDisplayRank(), leaderboardScore.getDisplayRank()) && C1098ee.equal(Long.valueOf(leaderboardScore2.getRawScore()), Long.valueOf(leaderboardScore.getRawScore())) && C1098ee.equal(leaderboardScore2.getDisplayScore(), leaderboardScore.getDisplayScore()) && C1098ee.equal(Long.valueOf(leaderboardScore2.getTimestampMillis()), Long.valueOf(leaderboardScore.getTimestampMillis())) && C1098ee.equal(leaderboardScore2.getScoreHolderDisplayName(), leaderboardScore.getScoreHolderDisplayName()) && C1098ee.equal(leaderboardScore2.getScoreHolderIconImageUri(), leaderboardScore.getScoreHolderIconImageUri()) && C1098ee.equal(leaderboardScore2.getScoreHolderHiResImageUri(), leaderboardScore.getScoreHolderHiResImageUri()) && C1098ee.equal(leaderboardScore2.getScoreHolder(), leaderboardScore.getScoreHolder()) && C1098ee.equal(leaderboardScore2.getScoreTag(), leaderboardScore.getScoreTag());
    }

    /* renamed from: b */
    static String m1819b(LeaderboardScore leaderboardScore) {
        return C1098ee.m2604e(leaderboardScore).mo7535a("Rank", Long.valueOf(leaderboardScore.getRank())).mo7535a("DisplayRank", leaderboardScore.getDisplayRank()).mo7535a("Score", Long.valueOf(leaderboardScore.getRawScore())).mo7535a("DisplayScore", leaderboardScore.getDisplayScore()).mo7535a("Timestamp", Long.valueOf(leaderboardScore.getTimestampMillis())).mo7535a("DisplayName", leaderboardScore.getScoreHolderDisplayName()).mo7535a("IconImageUri", leaderboardScore.getScoreHolderIconImageUri()).mo7535a("HiResImageUri", leaderboardScore.getScoreHolderHiResImageUri()).mo7535a("Player", leaderboardScore.getScoreHolder() == null ? null : leaderboardScore.getScoreHolder()).mo7535a("ScoreTag", leaderboardScore.getScoreTag()).toString();
    }

    /* renamed from: ds */
    public LeaderboardScore freeze() {
        return this;
    }

    public boolean equals(Object obj) {
        return m1818a(this, obj);
    }

    public String getDisplayRank() {
        return this.f1783vL;
    }

    public void getDisplayRank(CharArrayBuffer dataOut) {
        C1131fc.m2759b(this.f1783vL, dataOut);
    }

    public String getDisplayScore() {
        return this.f1784vM;
    }

    public void getDisplayScore(CharArrayBuffer dataOut) {
        C1131fc.m2759b(this.f1784vM, dataOut);
    }

    public long getRank() {
        return this.f1782vK;
    }

    public long getRawScore() {
        return this.f1785vN;
    }

    public Player getScoreHolder() {
        return this.f1790vS;
    }

    public String getScoreHolderDisplayName() {
        return this.f1790vS == null ? this.f1787vP : this.f1790vS.getDisplayName();
    }

    public void getScoreHolderDisplayName(CharArrayBuffer dataOut) {
        if (this.f1790vS == null) {
            C1131fc.m2759b(this.f1787vP, dataOut);
        } else {
            this.f1790vS.getDisplayName(dataOut);
        }
    }

    public Uri getScoreHolderHiResImageUri() {
        return this.f1790vS == null ? this.f1789vR : this.f1790vS.getHiResImageUri();
    }

    public Uri getScoreHolderIconImageUri() {
        return this.f1790vS == null ? this.f1788vQ : this.f1790vS.getIconImageUri();
    }

    public String getScoreTag() {
        return this.f1791vT;
    }

    public long getTimestampMillis() {
        return this.f1786vO;
    }

    public int hashCode() {
        return m1817a(this);
    }

    public boolean isDataValid() {
        return true;
    }

    public String toString() {
        return m1819b(this);
    }
}
