package com.google.android.gms.games.leaderboard;

import android.database.CharArrayBuffer;
import android.net.Uri;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.games.Game;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final class b extends com.google.android.gms.common.data.b implements Leaderboard {
    private final Game vG;
    private final int vH;

    /* JADX INFO: Access modifiers changed from: package-private */
    public b(DataHolder dataHolder, int i, int i2) {
        super(dataHolder, i);
        this.vH = i2;
        this.vG = new com.google.android.gms.games.b(dataHolder, i);
    }

    @Override // com.google.android.gms.common.data.Freezable
    /* renamed from: dp */
    public Leaderboard mo358freeze() {
        return new a(this);
    }

    @Override // com.google.android.gms.common.data.b
    public boolean equals(Object obj) {
        return a.a(this, obj);
    }

    @Override // com.google.android.gms.games.leaderboard.Leaderboard
    public String getDisplayName() {
        return getString("name");
    }

    @Override // com.google.android.gms.games.leaderboard.Leaderboard
    public void getDisplayName(CharArrayBuffer dataOut) {
        a("name", dataOut);
    }

    @Override // com.google.android.gms.games.leaderboard.Leaderboard
    public Game getGame() {
        return this.vG;
    }

    @Override // com.google.android.gms.games.leaderboard.Leaderboard
    public Uri getIconImageUri() {
        return L("board_icon_image_uri");
    }

    @Override // com.google.android.gms.games.leaderboard.Leaderboard
    public String getLeaderboardId() {
        return getString("external_leaderboard_id");
    }

    @Override // com.google.android.gms.games.leaderboard.Leaderboard
    public int getScoreOrder() {
        return getInteger("score_order");
    }

    @Override // com.google.android.gms.games.leaderboard.Leaderboard
    public ArrayList<LeaderboardVariant> getVariants() {
        ArrayList<LeaderboardVariant> arrayList = new ArrayList<>(this.vH);
        for (int i = 0; i < this.vH; i++) {
            arrayList.add(new g(this.nE, this.nG + i));
        }
        return arrayList;
    }

    @Override // com.google.android.gms.common.data.b
    public int hashCode() {
        return a.a(this);
    }

    public String toString() {
        return a.b(this);
    }
}
