package com.google.android.gms.games.leaderboard;

import android.database.CharArrayBuffer;
import android.net.Uri;
import com.google.android.gms.common.data.C0663b;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.games.C0824b;
import com.google.android.gms.games.Game;
import java.util.ArrayList;

/* renamed from: com.google.android.gms.games.leaderboard.b */
public final class C0829b extends C0663b implements Leaderboard {

    /* renamed from: vG */
    private final Game f1779vG;

    /* renamed from: vH */
    private final int f1780vH;

    C0829b(DataHolder dataHolder, int i, int i2) {
        super(dataHolder, i);
        this.f1780vH = i2;
        this.f1779vG = new C0824b(dataHolder, i);
    }

    /* renamed from: dp */
    public Leaderboard freeze() {
        return new C0828a(this);
    }

    public boolean equals(Object obj) {
        return C0828a.m1812a(this, obj);
    }

    public String getDisplayName() {
        return getString("name");
    }

    public void getDisplayName(CharArrayBuffer dataOut) {
        mo5976a("name", dataOut);
    }

    public Game getGame() {
        return this.f1779vG;
    }

    public Uri getIconImageUri() {
        return mo5974L("board_icon_image_uri");
    }

    public String getLeaderboardId() {
        return getString("external_leaderboard_id");
    }

    public int getScoreOrder() {
        return getInteger("score_order");
    }

    public ArrayList<LeaderboardVariant> getVariants() {
        ArrayList<LeaderboardVariant> arrayList = new ArrayList<>(this.f1780vH);
        for (int i = 0; i < this.f1780vH; i++) {
            arrayList.add(new C0834g(this.f1386nE, this.f1387nG + i));
        }
        return arrayList;
    }

    public int hashCode() {
        return C0828a.m1811a(this);
    }

    public String toString() {
        return C0828a.m1813b(this);
    }
}
