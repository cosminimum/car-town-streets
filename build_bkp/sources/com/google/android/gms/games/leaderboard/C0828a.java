package com.google.android.gms.games.leaderboard;

import android.database.CharArrayBuffer;
import android.net.Uri;
import com.google.android.gms.games.Game;
import com.google.android.gms.games.GameEntity;
import com.google.android.gms.internal.C1098ee;
import com.google.android.gms.internal.C1131fc;
import java.util.ArrayList;

/* renamed from: com.google.android.gms.games.leaderboard.a */
public final class C0828a implements Leaderboard {

    /* renamed from: qa */
    private final String f1773qa;

    /* renamed from: sL */
    private final Uri f1774sL;

    /* renamed from: vD */
    private final String f1775vD;

    /* renamed from: vE */
    private final int f1776vE;

    /* renamed from: vF */
    private final ArrayList<C0833f> f1777vF;

    /* renamed from: vG */
    private final Game f1778vG;

    public C0828a(Leaderboard leaderboard) {
        this.f1775vD = leaderboard.getLeaderboardId();
        this.f1773qa = leaderboard.getDisplayName();
        this.f1774sL = leaderboard.getIconImageUri();
        this.f1776vE = leaderboard.getScoreOrder();
        Game game = leaderboard.getGame();
        this.f1778vG = game == null ? null : new GameEntity(game);
        ArrayList<LeaderboardVariant> variants = leaderboard.getVariants();
        int size = variants.size();
        this.f1777vF = new ArrayList<>(size);
        for (int i = 0; i < size; i++) {
            this.f1777vF.add((C0833f) variants.get(i).freeze());
        }
    }

    /* renamed from: a */
    static int m1811a(Leaderboard leaderboard) {
        return C1098ee.hashCode(leaderboard.getLeaderboardId(), leaderboard.getDisplayName(), leaderboard.getIconImageUri(), Integer.valueOf(leaderboard.getScoreOrder()), leaderboard.getVariants());
    }

    /* renamed from: a */
    static boolean m1812a(Leaderboard leaderboard, Object obj) {
        if (!(obj instanceof Leaderboard)) {
            return false;
        }
        if (leaderboard == obj) {
            return true;
        }
        Leaderboard leaderboard2 = (Leaderboard) obj;
        return C1098ee.equal(leaderboard2.getLeaderboardId(), leaderboard.getLeaderboardId()) && C1098ee.equal(leaderboard2.getDisplayName(), leaderboard.getDisplayName()) && C1098ee.equal(leaderboard2.getIconImageUri(), leaderboard.getIconImageUri()) && C1098ee.equal(Integer.valueOf(leaderboard2.getScoreOrder()), Integer.valueOf(leaderboard.getScoreOrder())) && C1098ee.equal(leaderboard2.getVariants(), leaderboard.getVariants());
    }

    /* renamed from: b */
    static String m1813b(Leaderboard leaderboard) {
        return C1098ee.m2604e(leaderboard).mo7535a("LeaderboardId", leaderboard.getLeaderboardId()).mo7535a("DisplayName", leaderboard.getDisplayName()).mo7535a("IconImageUri", leaderboard.getIconImageUri()).mo7535a("ScoreOrder", Integer.valueOf(leaderboard.getScoreOrder())).mo7535a("Variants", leaderboard.getVariants()).toString();
    }

    /* renamed from: dp */
    public Leaderboard freeze() {
        return this;
    }

    public boolean equals(Object obj) {
        return m1812a(this, obj);
    }

    public String getDisplayName() {
        return this.f1773qa;
    }

    public void getDisplayName(CharArrayBuffer dataOut) {
        C1131fc.m2759b(this.f1773qa, dataOut);
    }

    public Game getGame() {
        return this.f1778vG;
    }

    public Uri getIconImageUri() {
        return this.f1774sL;
    }

    public String getLeaderboardId() {
        return this.f1775vD;
    }

    public int getScoreOrder() {
        return this.f1776vE;
    }

    public ArrayList<LeaderboardVariant> getVariants() {
        return new ArrayList<>(this.f1777vF);
    }

    public int hashCode() {
        return m1811a(this);
    }

    public boolean isDataValid() {
        return true;
    }

    public String toString() {
        return m1813b(this);
    }
}
