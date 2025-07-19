package com.google.android.gms.games.leaderboard;

import com.google.android.gms.internal.C1098ee;
import com.google.android.gms.internal.C1293gc;
import com.google.android.gms.internal.C1295ge;

/* renamed from: com.google.android.gms.games.leaderboard.f */
public final class C0833f implements LeaderboardVariant {

    /* renamed from: vV */
    private final int f1793vV;

    /* renamed from: vW */
    private final int f1794vW;

    /* renamed from: vX */
    private final boolean f1795vX;

    /* renamed from: vY */
    private final long f1796vY;

    /* renamed from: vZ */
    private final String f1797vZ;

    /* renamed from: wa */
    private final long f1798wa;

    /* renamed from: wb */
    private final String f1799wb;

    /* renamed from: wc */
    private final String f1800wc;

    /* renamed from: wd */
    private final long f1801wd;

    /* renamed from: we */
    private final String f1802we;

    /* renamed from: wf */
    private final String f1803wf;

    /* renamed from: wg */
    private final String f1804wg;

    public C0833f(LeaderboardVariant leaderboardVariant) {
        this.f1793vV = leaderboardVariant.getTimeSpan();
        this.f1794vW = leaderboardVariant.getCollection();
        this.f1795vX = leaderboardVariant.hasPlayerInfo();
        this.f1796vY = leaderboardVariant.getRawPlayerScore();
        this.f1797vZ = leaderboardVariant.getDisplayPlayerScore();
        this.f1798wa = leaderboardVariant.getPlayerRank();
        this.f1799wb = leaderboardVariant.getDisplayPlayerRank();
        this.f1800wc = leaderboardVariant.getPlayerScoreTag();
        this.f1801wd = leaderboardVariant.getNumScores();
        this.f1802we = leaderboardVariant.mo6669dt();
        this.f1803wf = leaderboardVariant.mo6670du();
        this.f1804wg = leaderboardVariant.mo6671dv();
    }

    /* renamed from: a */
    static int m1822a(LeaderboardVariant leaderboardVariant) {
        return C1098ee.hashCode(Integer.valueOf(leaderboardVariant.getTimeSpan()), Integer.valueOf(leaderboardVariant.getCollection()), Boolean.valueOf(leaderboardVariant.hasPlayerInfo()), Long.valueOf(leaderboardVariant.getRawPlayerScore()), leaderboardVariant.getDisplayPlayerScore(), Long.valueOf(leaderboardVariant.getPlayerRank()), leaderboardVariant.getDisplayPlayerRank(), Long.valueOf(leaderboardVariant.getNumScores()), leaderboardVariant.mo6669dt(), leaderboardVariant.mo6671dv(), leaderboardVariant.mo6670du());
    }

    /* renamed from: a */
    static boolean m1823a(LeaderboardVariant leaderboardVariant, Object obj) {
        if (!(obj instanceof LeaderboardVariant)) {
            return false;
        }
        if (leaderboardVariant == obj) {
            return true;
        }
        LeaderboardVariant leaderboardVariant2 = (LeaderboardVariant) obj;
        return C1098ee.equal(Integer.valueOf(leaderboardVariant2.getTimeSpan()), Integer.valueOf(leaderboardVariant.getTimeSpan())) && C1098ee.equal(Integer.valueOf(leaderboardVariant2.getCollection()), Integer.valueOf(leaderboardVariant.getCollection())) && C1098ee.equal(Boolean.valueOf(leaderboardVariant2.hasPlayerInfo()), Boolean.valueOf(leaderboardVariant.hasPlayerInfo())) && C1098ee.equal(Long.valueOf(leaderboardVariant2.getRawPlayerScore()), Long.valueOf(leaderboardVariant.getRawPlayerScore())) && C1098ee.equal(leaderboardVariant2.getDisplayPlayerScore(), leaderboardVariant.getDisplayPlayerScore()) && C1098ee.equal(Long.valueOf(leaderboardVariant2.getPlayerRank()), Long.valueOf(leaderboardVariant.getPlayerRank())) && C1098ee.equal(leaderboardVariant2.getDisplayPlayerRank(), leaderboardVariant.getDisplayPlayerRank()) && C1098ee.equal(Long.valueOf(leaderboardVariant2.getNumScores()), Long.valueOf(leaderboardVariant.getNumScores())) && C1098ee.equal(leaderboardVariant2.mo6669dt(), leaderboardVariant.mo6669dt()) && C1098ee.equal(leaderboardVariant2.mo6671dv(), leaderboardVariant.mo6671dv()) && C1098ee.equal(leaderboardVariant2.mo6670du(), leaderboardVariant.mo6670du());
    }

    /* renamed from: b */
    static String m1824b(LeaderboardVariant leaderboardVariant) {
        return C1098ee.m2604e(leaderboardVariant).mo7535a("TimeSpan", C1295ge.m3416aG(leaderboardVariant.getTimeSpan())).mo7535a("Collection", C1293gc.m3415aG(leaderboardVariant.getCollection())).mo7535a("RawPlayerScore", leaderboardVariant.hasPlayerInfo() ? Long.valueOf(leaderboardVariant.getRawPlayerScore()) : "none").mo7535a("DisplayPlayerScore", leaderboardVariant.hasPlayerInfo() ? leaderboardVariant.getDisplayPlayerScore() : "none").mo7535a("PlayerRank", leaderboardVariant.hasPlayerInfo() ? Long.valueOf(leaderboardVariant.getPlayerRank()) : "none").mo7535a("DisplayPlayerRank", leaderboardVariant.hasPlayerInfo() ? leaderboardVariant.getDisplayPlayerRank() : "none").mo7535a("NumScores", Long.valueOf(leaderboardVariant.getNumScores())).mo7535a("TopPageNextToken", leaderboardVariant.mo6669dt()).mo7535a("WindowPageNextToken", leaderboardVariant.mo6671dv()).mo7535a("WindowPagePrevToken", leaderboardVariant.mo6670du()).toString();
    }

    /* renamed from: dt */
    public String mo6669dt() {
        return this.f1802we;
    }

    /* renamed from: du */
    public String mo6670du() {
        return this.f1803wf;
    }

    /* renamed from: dv */
    public String mo6671dv() {
        return this.f1804wg;
    }

    /* renamed from: dw */
    public LeaderboardVariant freeze() {
        return this;
    }

    public boolean equals(Object obj) {
        return m1823a(this, obj);
    }

    public int getCollection() {
        return this.f1794vW;
    }

    public String getDisplayPlayerRank() {
        return this.f1799wb;
    }

    public String getDisplayPlayerScore() {
        return this.f1797vZ;
    }

    public long getNumScores() {
        return this.f1801wd;
    }

    public long getPlayerRank() {
        return this.f1798wa;
    }

    public String getPlayerScoreTag() {
        return this.f1800wc;
    }

    public long getRawPlayerScore() {
        return this.f1796vY;
    }

    public int getTimeSpan() {
        return this.f1793vV;
    }

    public boolean hasPlayerInfo() {
        return this.f1795vX;
    }

    public int hashCode() {
        return m1822a(this);
    }

    public boolean isDataValid() {
        return true;
    }

    public String toString() {
        return m1824b(this);
    }
}
