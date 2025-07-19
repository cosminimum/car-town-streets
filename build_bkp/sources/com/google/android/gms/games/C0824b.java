package com.google.android.gms.games;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcel;
import com.google.android.gms.common.data.C0663b;
import com.google.android.gms.common.data.DataHolder;

/* renamed from: com.google.android.gms.games.b */
public final class C0824b extends C0663b implements Game {
    public C0824b(DataHolder dataHolder, int i) {
        super(dataHolder, i);
    }

    public int describeContents() {
        return 0;
    }

    public boolean equals(Object obj) {
        return GameEntity.m1701a(this, obj);
    }

    public Game freeze() {
        return new GameEntity(this);
    }

    public int getAchievementTotalCount() {
        return getInteger("achievement_total_count");
    }

    public String getApplicationId() {
        return getString("external_game_id");
    }

    public String getDescription() {
        return getString("game_description");
    }

    public void getDescription(CharArrayBuffer dataOut) {
        mo5976a("game_description", dataOut);
    }

    public String getDeveloperName() {
        return getString("developer_name");
    }

    public void getDeveloperName(CharArrayBuffer dataOut) {
        mo5976a("developer_name", dataOut);
    }

    public String getDisplayName() {
        return getString("display_name");
    }

    public void getDisplayName(CharArrayBuffer dataOut) {
        mo5976a("display_name", dataOut);
    }

    public Uri getFeaturedImageUri() {
        return mo5974L("featured_image_uri");
    }

    public int getGameplayAclStatus() {
        return getInteger("gameplay_acl_status");
    }

    public Uri getHiResImageUri() {
        return mo5974L("game_hi_res_image_uri");
    }

    public Uri getIconImageUri() {
        return mo5974L("game_icon_image_uri");
    }

    public String getInstancePackageName() {
        return getString("package_name");
    }

    public int getLeaderboardCount() {
        return getInteger("leaderboard_count");
    }

    public String getPrimaryCategory() {
        return getString("primary_category");
    }

    public String getSecondaryCategory() {
        return getString("secondary_category");
    }

    public int hashCode() {
        return GameEntity.m1700a(this);
    }

    public boolean isInstanceInstalled() {
        return getInteger("installed") > 0;
    }

    public boolean isPlayEnabledGame() {
        return getBoolean("play_enabled_game");
    }

    public boolean isRealTimeMultiplayerEnabled() {
        return getInteger("real_time_support") > 0;
    }

    public boolean isTurnBasedMultiplayerEnabled() {
        return getInteger("turn_based_support") > 0;
    }

    public String toString() {
        return GameEntity.m1703b((Game) this);
    }

    public void writeToParcel(Parcel dest, int flags) {
        ((GameEntity) freeze()).writeToParcel(dest, flags);
    }
}
