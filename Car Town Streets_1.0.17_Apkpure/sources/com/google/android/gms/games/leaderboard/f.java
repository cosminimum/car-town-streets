package com.google.android.gms.games.leaderboard;

import com.google.android.gms.internal.ee;
import com.google.android.gms.internal.gc;
import com.google.android.gms.internal.ge;
/* loaded from: classes.dex */
public final class f implements LeaderboardVariant {
    private final int vV;
    private final int vW;
    private final boolean vX;
    private final long vY;
    private final String vZ;
    private final long wa;
    private final String wb;
    private final String wc;
    private final long wd;
    private final String we;
    private final String wf;
    private final String wg;

    public f(LeaderboardVariant leaderboardVariant) {
        this.vV = leaderboardVariant.getTimeSpan();
        this.vW = leaderboardVariant.getCollection();
        this.vX = leaderboardVariant.hasPlayerInfo();
        this.vY = leaderboardVariant.getRawPlayerScore();
        this.vZ = leaderboardVariant.getDisplayPlayerScore();
        this.wa = leaderboardVariant.getPlayerRank();
        this.wb = leaderboardVariant.getDisplayPlayerRank();
        this.wc = leaderboardVariant.getPlayerScoreTag();
        this.wd = leaderboardVariant.getNumScores();
        this.we = leaderboardVariant.dt();
        this.wf = leaderboardVariant.du();
        this.wg = leaderboardVariant.dv();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int a(LeaderboardVariant leaderboardVariant) {
        return ee.hashCode(Integer.valueOf(leaderboardVariant.getTimeSpan()), Integer.valueOf(leaderboardVariant.getCollection()), Boolean.valueOf(leaderboardVariant.hasPlayerInfo()), Long.valueOf(leaderboardVariant.getRawPlayerScore()), leaderboardVariant.getDisplayPlayerScore(), Long.valueOf(leaderboardVariant.getPlayerRank()), leaderboardVariant.getDisplayPlayerRank(), Long.valueOf(leaderboardVariant.getNumScores()), leaderboardVariant.dt(), leaderboardVariant.dv(), leaderboardVariant.du());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean a(LeaderboardVariant leaderboardVariant, Object obj) {
        if (!(obj instanceof LeaderboardVariant)) {
            return false;
        }
        if (leaderboardVariant == obj) {
            return true;
        }
        LeaderboardVariant leaderboardVariant2 = (LeaderboardVariant) obj;
        return ee.equal(Integer.valueOf(leaderboardVariant2.getTimeSpan()), Integer.valueOf(leaderboardVariant.getTimeSpan())) && ee.equal(Integer.valueOf(leaderboardVariant2.getCollection()), Integer.valueOf(leaderboardVariant.getCollection())) && ee.equal(Boolean.valueOf(leaderboardVariant2.hasPlayerInfo()), Boolean.valueOf(leaderboardVariant.hasPlayerInfo())) && ee.equal(Long.valueOf(leaderboardVariant2.getRawPlayerScore()), Long.valueOf(leaderboardVariant.getRawPlayerScore())) && ee.equal(leaderboardVariant2.getDisplayPlayerScore(), leaderboardVariant.getDisplayPlayerScore()) && ee.equal(Long.valueOf(leaderboardVariant2.getPlayerRank()), Long.valueOf(leaderboardVariant.getPlayerRank())) && ee.equal(leaderboardVariant2.getDisplayPlayerRank(), leaderboardVariant.getDisplayPlayerRank()) && ee.equal(Long.valueOf(leaderboardVariant2.getNumScores()), Long.valueOf(leaderboardVariant.getNumScores())) && ee.equal(leaderboardVariant2.dt(), leaderboardVariant.dt()) && ee.equal(leaderboardVariant2.dv(), leaderboardVariant.dv()) && ee.equal(leaderboardVariant2.du(), leaderboardVariant.du());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String b(LeaderboardVariant leaderboardVariant) {
        return ee.e(leaderboardVariant).a("TimeSpan", ge.aG(leaderboardVariant.getTimeSpan())).a("Collection", gc.aG(leaderboardVariant.getCollection())).a("RawPlayerScore", leaderboardVariant.hasPlayerInfo() ? Long.valueOf(leaderboardVariant.getRawPlayerScore()) : "none").a("DisplayPlayerScore", leaderboardVariant.hasPlayerInfo() ? leaderboardVariant.getDisplayPlayerScore() : "none").a("PlayerRank", leaderboardVariant.hasPlayerInfo() ? Long.valueOf(leaderboardVariant.getPlayerRank()) : "none").a("DisplayPlayerRank", leaderboardVariant.hasPlayerInfo() ? leaderboardVariant.getDisplayPlayerRank() : "none").a("NumScores", Long.valueOf(leaderboardVariant.getNumScores())).a("TopPageNextToken", leaderboardVariant.dt()).a("WindowPageNextToken", leaderboardVariant.dv()).a("WindowPagePrevToken", leaderboardVariant.du()).toString();
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardVariant
    public String dt() {
        return this.we;
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardVariant
    public String du() {
        return this.wf;
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardVariant
    public String dv() {
        return this.wg;
    }

    @Override // com.google.android.gms.common.data.Freezable
    /* renamed from: dw */
    public LeaderboardVariant mo358freeze() {
        return this;
    }

    public boolean equals(Object obj) {
        return a(this, obj);
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardVariant
    public int getCollection() {
        return this.vW;
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardVariant
    public String getDisplayPlayerRank() {
        return this.wb;
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardVariant
    public String getDisplayPlayerScore() {
        return this.vZ;
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardVariant
    public long getNumScores() {
        return this.wd;
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardVariant
    public long getPlayerRank() {
        return this.wa;
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardVariant
    public String getPlayerScoreTag() {
        return this.wc;
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardVariant
    public long getRawPlayerScore() {
        return this.vY;
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardVariant
    public int getTimeSpan() {
        return this.vV;
    }

    @Override // com.google.android.gms.games.leaderboard.LeaderboardVariant
    public boolean hasPlayerInfo() {
        return this.vX;
    }

    public int hashCode() {
        return a(this);
    }

    @Override // com.google.android.gms.common.data.Freezable
    public boolean isDataValid() {
        return true;
    }

    public String toString() {
        return b(this);
    }
}
