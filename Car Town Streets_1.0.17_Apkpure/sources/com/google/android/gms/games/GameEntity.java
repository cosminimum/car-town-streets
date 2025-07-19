package com.google.android.gms.games;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.internal.ee;
import com.google.android.gms.internal.fc;
import com.google.android.gms.internal.fm;
/* loaded from: classes.dex */
public final class GameEntity extends fm implements Game {
    public static final Parcelable.Creator<GameEntity> CREATOR = new a();
    private final int kg;
    private final String kh;
    private final String qa;
    private final String sH;
    private final String sI;
    private final String sJ;
    private final String sK;
    private final Uri sL;
    private final Uri sM;
    private final Uri sN;
    private final boolean sO;
    private final boolean sP;
    private final String sQ;
    private final int sR;
    private final int sS;
    private final int sT;
    private final boolean sU;
    private final boolean sV;

    /* loaded from: classes.dex */
    static final class a extends com.google.android.gms.games.a {
        a() {
        }

        @Override // com.google.android.gms.games.a, android.os.Parcelable.Creator
        /* renamed from: Y */
        public GameEntity createFromParcel(Parcel parcel) {
            if (GameEntity.c(GameEntity.bM()) || GameEntity.P(GameEntity.class.getCanonicalName())) {
                return super.createFromParcel(parcel);
            }
            String readString = parcel.readString();
            String readString2 = parcel.readString();
            String readString3 = parcel.readString();
            String readString4 = parcel.readString();
            String readString5 = parcel.readString();
            String readString6 = parcel.readString();
            String readString7 = parcel.readString();
            Uri parse = readString7 == null ? null : Uri.parse(readString7);
            String readString8 = parcel.readString();
            Uri parse2 = readString8 == null ? null : Uri.parse(readString8);
            String readString9 = parcel.readString();
            return new GameEntity(2, readString, readString2, readString3, readString4, readString5, readString6, parse, parse2, readString9 == null ? null : Uri.parse(readString9), parcel.readInt() > 0, parcel.readInt() > 0, parcel.readString(), parcel.readInt(), parcel.readInt(), parcel.readInt(), false, false);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public GameEntity(int versionCode, String applicationId, String displayName, String primaryCategory, String secondaryCategory, String description, String developerName, Uri iconImageUri, Uri hiResImageUri, Uri featuredImageUri, boolean playEnabledGame, boolean instanceInstalled, String instancePackageName, int gameplayAclStatus, int achievementTotalCount, int leaderboardCount, boolean realTimeEnabled, boolean turnBasedEnabled) {
        this.kg = versionCode;
        this.kh = applicationId;
        this.qa = displayName;
        this.sH = primaryCategory;
        this.sI = secondaryCategory;
        this.sJ = description;
        this.sK = developerName;
        this.sL = iconImageUri;
        this.sM = hiResImageUri;
        this.sN = featuredImageUri;
        this.sO = playEnabledGame;
        this.sP = instanceInstalled;
        this.sQ = instancePackageName;
        this.sR = gameplayAclStatus;
        this.sS = achievementTotalCount;
        this.sT = leaderboardCount;
        this.sU = realTimeEnabled;
        this.sV = turnBasedEnabled;
    }

    public GameEntity(Game game) {
        this.kg = 2;
        this.kh = game.getApplicationId();
        this.sH = game.getPrimaryCategory();
        this.sI = game.getSecondaryCategory();
        this.sJ = game.getDescription();
        this.sK = game.getDeveloperName();
        this.qa = game.getDisplayName();
        this.sL = game.getIconImageUri();
        this.sM = game.getHiResImageUri();
        this.sN = game.getFeaturedImageUri();
        this.sO = game.isPlayEnabledGame();
        this.sP = game.isInstanceInstalled();
        this.sQ = game.getInstancePackageName();
        this.sR = game.getGameplayAclStatus();
        this.sS = game.getAchievementTotalCount();
        this.sT = game.getLeaderboardCount();
        this.sU = game.isRealTimeMultiplayerEnabled();
        this.sV = game.isTurnBasedMultiplayerEnabled();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int a(Game game) {
        return ee.hashCode(game.getApplicationId(), game.getDisplayName(), game.getPrimaryCategory(), game.getSecondaryCategory(), game.getDescription(), game.getDeveloperName(), game.getIconImageUri(), game.getHiResImageUri(), game.getFeaturedImageUri(), Boolean.valueOf(game.isPlayEnabledGame()), Boolean.valueOf(game.isInstanceInstalled()), game.getInstancePackageName(), Integer.valueOf(game.getGameplayAclStatus()), Integer.valueOf(game.getAchievementTotalCount()), Integer.valueOf(game.getLeaderboardCount()), Boolean.valueOf(game.isRealTimeMultiplayerEnabled()), Boolean.valueOf(game.isTurnBasedMultiplayerEnabled()));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean a(Game game, Object obj) {
        if (!(obj instanceof Game)) {
            return false;
        }
        if (game == obj) {
            return true;
        }
        Game game2 = (Game) obj;
        return ee.equal(game2.getApplicationId(), game.getApplicationId()) && ee.equal(game2.getDisplayName(), game.getDisplayName()) && ee.equal(game2.getPrimaryCategory(), game.getPrimaryCategory()) && ee.equal(game2.getSecondaryCategory(), game.getSecondaryCategory()) && ee.equal(game2.getDescription(), game.getDescription()) && ee.equal(game2.getDeveloperName(), game.getDeveloperName()) && ee.equal(game2.getIconImageUri(), game.getIconImageUri()) && ee.equal(game2.getHiResImageUri(), game.getHiResImageUri()) && ee.equal(game2.getFeaturedImageUri(), game.getFeaturedImageUri()) && ee.equal(Boolean.valueOf(game2.isPlayEnabledGame()), Boolean.valueOf(game.isPlayEnabledGame())) && ee.equal(Boolean.valueOf(game2.isInstanceInstalled()), Boolean.valueOf(game.isInstanceInstalled())) && ee.equal(game2.getInstancePackageName(), game.getInstancePackageName()) && ee.equal(Integer.valueOf(game2.getGameplayAclStatus()), Integer.valueOf(game.getGameplayAclStatus())) && ee.equal(Integer.valueOf(game2.getAchievementTotalCount()), Integer.valueOf(game.getAchievementTotalCount())) && ee.equal(Integer.valueOf(game2.getLeaderboardCount()), Integer.valueOf(game.getLeaderboardCount())) && ee.equal(Boolean.valueOf(game2.isRealTimeMultiplayerEnabled()), Boolean.valueOf(game.isRealTimeMultiplayerEnabled())) && ee.equal(Boolean.valueOf(game2.isTurnBasedMultiplayerEnabled()), Boolean.valueOf(game.isTurnBasedMultiplayerEnabled()));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String b(Game game) {
        return ee.e(game).a("ApplicationId", game.getApplicationId()).a("DisplayName", game.getDisplayName()).a("PrimaryCategory", game.getPrimaryCategory()).a("SecondaryCategory", game.getSecondaryCategory()).a("Description", game.getDescription()).a("DeveloperName", game.getDeveloperName()).a("IconImageUri", game.getIconImageUri()).a("HiResImageUri", game.getHiResImageUri()).a("FeaturedImageUri", game.getFeaturedImageUri()).a("PlayEnabledGame", Boolean.valueOf(game.isPlayEnabledGame())).a("InstanceInstalled", Boolean.valueOf(game.isInstanceInstalled())).a("InstancePackageName", game.getInstancePackageName()).a("GameplayAclStatus", Integer.valueOf(game.getGameplayAclStatus())).a("AchievementTotalCount", Integer.valueOf(game.getAchievementTotalCount())).a("LeaderboardCount", Integer.valueOf(game.getLeaderboardCount())).a("RealTimeMultiplayerEnabled", Boolean.valueOf(game.isRealTimeMultiplayerEnabled())).a("TurnBasedMultiplayerEnabled", Boolean.valueOf(game.isTurnBasedMultiplayerEnabled())).toString();
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public boolean equals(Object obj) {
        return a(this, obj);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.google.android.gms.common.data.Freezable
    /* renamed from: freeze */
    public Game mo358freeze() {
        return this;
    }

    @Override // com.google.android.gms.games.Game
    public int getAchievementTotalCount() {
        return this.sS;
    }

    @Override // com.google.android.gms.games.Game
    public String getApplicationId() {
        return this.kh;
    }

    @Override // com.google.android.gms.games.Game
    public String getDescription() {
        return this.sJ;
    }

    @Override // com.google.android.gms.games.Game
    public void getDescription(CharArrayBuffer dataOut) {
        fc.b(this.sJ, dataOut);
    }

    @Override // com.google.android.gms.games.Game
    public String getDeveloperName() {
        return this.sK;
    }

    @Override // com.google.android.gms.games.Game
    public void getDeveloperName(CharArrayBuffer dataOut) {
        fc.b(this.sK, dataOut);
    }

    @Override // com.google.android.gms.games.Game
    public String getDisplayName() {
        return this.qa;
    }

    @Override // com.google.android.gms.games.Game
    public void getDisplayName(CharArrayBuffer dataOut) {
        fc.b(this.qa, dataOut);
    }

    @Override // com.google.android.gms.games.Game
    public Uri getFeaturedImageUri() {
        return this.sN;
    }

    @Override // com.google.android.gms.games.Game
    public int getGameplayAclStatus() {
        return this.sR;
    }

    @Override // com.google.android.gms.games.Game
    public Uri getHiResImageUri() {
        return this.sM;
    }

    @Override // com.google.android.gms.games.Game
    public Uri getIconImageUri() {
        return this.sL;
    }

    @Override // com.google.android.gms.games.Game
    public String getInstancePackageName() {
        return this.sQ;
    }

    @Override // com.google.android.gms.games.Game
    public int getLeaderboardCount() {
        return this.sT;
    }

    @Override // com.google.android.gms.games.Game
    public String getPrimaryCategory() {
        return this.sH;
    }

    @Override // com.google.android.gms.games.Game
    public String getSecondaryCategory() {
        return this.sI;
    }

    public int getVersionCode() {
        return this.kg;
    }

    public int hashCode() {
        return a(this);
    }

    @Override // com.google.android.gms.common.data.Freezable
    public boolean isDataValid() {
        return true;
    }

    @Override // com.google.android.gms.games.Game
    public boolean isInstanceInstalled() {
        return this.sP;
    }

    @Override // com.google.android.gms.games.Game
    public boolean isPlayEnabledGame() {
        return this.sO;
    }

    @Override // com.google.android.gms.games.Game
    public boolean isRealTimeMultiplayerEnabled() {
        return this.sU;
    }

    @Override // com.google.android.gms.games.Game
    public boolean isTurnBasedMultiplayerEnabled() {
        return this.sV;
    }

    public String toString() {
        return b(this);
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        int i = 1;
        String str = null;
        if (!bN()) {
            com.google.android.gms.games.a.a(this, dest, flags);
            return;
        }
        dest.writeString(this.kh);
        dest.writeString(this.qa);
        dest.writeString(this.sH);
        dest.writeString(this.sI);
        dest.writeString(this.sJ);
        dest.writeString(this.sK);
        dest.writeString(this.sL == null ? null : this.sL.toString());
        dest.writeString(this.sM == null ? null : this.sM.toString());
        if (this.sN != null) {
            str = this.sN.toString();
        }
        dest.writeString(str);
        dest.writeInt(this.sO ? 1 : 0);
        if (!this.sP) {
            i = 0;
        }
        dest.writeInt(i);
        dest.writeString(this.sQ);
        dest.writeInt(this.sR);
        dest.writeInt(this.sS);
        dest.writeInt(this.sT);
    }
}
