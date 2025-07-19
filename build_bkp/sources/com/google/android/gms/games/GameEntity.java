package com.google.android.gms.games;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.internal.C1098ee;
import com.google.android.gms.internal.C1131fc;
import com.google.android.gms.internal.C1205fm;

public final class GameEntity extends C1205fm implements Game {
    public static final Parcelable.Creator<GameEntity> CREATOR = new C0779a();

    /* renamed from: kg */
    private final int f1633kg;

    /* renamed from: kh */
    private final String f1634kh;

    /* renamed from: qa */
    private final String f1635qa;

    /* renamed from: sH */
    private final String f1636sH;

    /* renamed from: sI */
    private final String f1637sI;

    /* renamed from: sJ */
    private final String f1638sJ;

    /* renamed from: sK */
    private final String f1639sK;

    /* renamed from: sL */
    private final Uri f1640sL;

    /* renamed from: sM */
    private final Uri f1641sM;

    /* renamed from: sN */
    private final Uri f1642sN;

    /* renamed from: sO */
    private final boolean f1643sO;

    /* renamed from: sP */
    private final boolean f1644sP;

    /* renamed from: sQ */
    private final String f1645sQ;

    /* renamed from: sR */
    private final int f1646sR;

    /* renamed from: sS */
    private final int f1647sS;

    /* renamed from: sT */
    private final int f1648sT;

    /* renamed from: sU */
    private final boolean f1649sU;

    /* renamed from: sV */
    private final boolean f1650sV;

    /* renamed from: com.google.android.gms.games.GameEntity$a */
    static final class C0779a extends C0822a {
        C0779a() {
        }

        /* renamed from: Y */
        public GameEntity createFromParcel(Parcel parcel) {
            if (GameEntity.m2979c(GameEntity.m2473bM()) || GameEntity.m2470P(GameEntity.class.getCanonicalName())) {
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

    GameEntity(int versionCode, String applicationId, String displayName, String primaryCategory, String secondaryCategory, String description, String developerName, Uri iconImageUri, Uri hiResImageUri, Uri featuredImageUri, boolean playEnabledGame, boolean instanceInstalled, String instancePackageName, int gameplayAclStatus, int achievementTotalCount, int leaderboardCount, boolean realTimeEnabled, boolean turnBasedEnabled) {
        this.f1633kg = versionCode;
        this.f1634kh = applicationId;
        this.f1635qa = displayName;
        this.f1636sH = primaryCategory;
        this.f1637sI = secondaryCategory;
        this.f1638sJ = description;
        this.f1639sK = developerName;
        this.f1640sL = iconImageUri;
        this.f1641sM = hiResImageUri;
        this.f1642sN = featuredImageUri;
        this.f1643sO = playEnabledGame;
        this.f1644sP = instanceInstalled;
        this.f1645sQ = instancePackageName;
        this.f1646sR = gameplayAclStatus;
        this.f1647sS = achievementTotalCount;
        this.f1648sT = leaderboardCount;
        this.f1649sU = realTimeEnabled;
        this.f1650sV = turnBasedEnabled;
    }

    public GameEntity(Game game) {
        this.f1633kg = 2;
        this.f1634kh = game.getApplicationId();
        this.f1636sH = game.getPrimaryCategory();
        this.f1637sI = game.getSecondaryCategory();
        this.f1638sJ = game.getDescription();
        this.f1639sK = game.getDeveloperName();
        this.f1635qa = game.getDisplayName();
        this.f1640sL = game.getIconImageUri();
        this.f1641sM = game.getHiResImageUri();
        this.f1642sN = game.getFeaturedImageUri();
        this.f1643sO = game.isPlayEnabledGame();
        this.f1644sP = game.isInstanceInstalled();
        this.f1645sQ = game.getInstancePackageName();
        this.f1646sR = game.getGameplayAclStatus();
        this.f1647sS = game.getAchievementTotalCount();
        this.f1648sT = game.getLeaderboardCount();
        this.f1649sU = game.isRealTimeMultiplayerEnabled();
        this.f1650sV = game.isTurnBasedMultiplayerEnabled();
    }

    /* renamed from: a */
    static int m1700a(Game game) {
        return C1098ee.hashCode(game.getApplicationId(), game.getDisplayName(), game.getPrimaryCategory(), game.getSecondaryCategory(), game.getDescription(), game.getDeveloperName(), game.getIconImageUri(), game.getHiResImageUri(), game.getFeaturedImageUri(), Boolean.valueOf(game.isPlayEnabledGame()), Boolean.valueOf(game.isInstanceInstalled()), game.getInstancePackageName(), Integer.valueOf(game.getGameplayAclStatus()), Integer.valueOf(game.getAchievementTotalCount()), Integer.valueOf(game.getLeaderboardCount()), Boolean.valueOf(game.isRealTimeMultiplayerEnabled()), Boolean.valueOf(game.isTurnBasedMultiplayerEnabled()));
    }

    /* renamed from: a */
    static boolean m1701a(Game game, Object obj) {
        if (!(obj instanceof Game)) {
            return false;
        }
        if (game == obj) {
            return true;
        }
        Game game2 = (Game) obj;
        return C1098ee.equal(game2.getApplicationId(), game.getApplicationId()) && C1098ee.equal(game2.getDisplayName(), game.getDisplayName()) && C1098ee.equal(game2.getPrimaryCategory(), game.getPrimaryCategory()) && C1098ee.equal(game2.getSecondaryCategory(), game.getSecondaryCategory()) && C1098ee.equal(game2.getDescription(), game.getDescription()) && C1098ee.equal(game2.getDeveloperName(), game.getDeveloperName()) && C1098ee.equal(game2.getIconImageUri(), game.getIconImageUri()) && C1098ee.equal(game2.getHiResImageUri(), game.getHiResImageUri()) && C1098ee.equal(game2.getFeaturedImageUri(), game.getFeaturedImageUri()) && C1098ee.equal(Boolean.valueOf(game2.isPlayEnabledGame()), Boolean.valueOf(game.isPlayEnabledGame())) && C1098ee.equal(Boolean.valueOf(game2.isInstanceInstalled()), Boolean.valueOf(game.isInstanceInstalled())) && C1098ee.equal(game2.getInstancePackageName(), game.getInstancePackageName()) && C1098ee.equal(Integer.valueOf(game2.getGameplayAclStatus()), Integer.valueOf(game.getGameplayAclStatus())) && C1098ee.equal(Integer.valueOf(game2.getAchievementTotalCount()), Integer.valueOf(game.getAchievementTotalCount())) && C1098ee.equal(Integer.valueOf(game2.getLeaderboardCount()), Integer.valueOf(game.getLeaderboardCount())) && C1098ee.equal(Boolean.valueOf(game2.isRealTimeMultiplayerEnabled()), Boolean.valueOf(game.isRealTimeMultiplayerEnabled())) && C1098ee.equal(Boolean.valueOf(game2.isTurnBasedMultiplayerEnabled()), Boolean.valueOf(game.isTurnBasedMultiplayerEnabled()));
    }

    /* renamed from: b */
    static String m1703b(Game game) {
        return C1098ee.m2604e(game).mo7535a("ApplicationId", game.getApplicationId()).mo7535a("DisplayName", game.getDisplayName()).mo7535a("PrimaryCategory", game.getPrimaryCategory()).mo7535a("SecondaryCategory", game.getSecondaryCategory()).mo7535a("Description", game.getDescription()).mo7535a("DeveloperName", game.getDeveloperName()).mo7535a("IconImageUri", game.getIconImageUri()).mo7535a("HiResImageUri", game.getHiResImageUri()).mo7535a("FeaturedImageUri", game.getFeaturedImageUri()).mo7535a("PlayEnabledGame", Boolean.valueOf(game.isPlayEnabledGame())).mo7535a("InstanceInstalled", Boolean.valueOf(game.isInstanceInstalled())).mo7535a("InstancePackageName", game.getInstancePackageName()).mo7535a("GameplayAclStatus", Integer.valueOf(game.getGameplayAclStatus())).mo7535a("AchievementTotalCount", Integer.valueOf(game.getAchievementTotalCount())).mo7535a("LeaderboardCount", Integer.valueOf(game.getLeaderboardCount())).mo7535a("RealTimeMultiplayerEnabled", Boolean.valueOf(game.isRealTimeMultiplayerEnabled())).mo7535a("TurnBasedMultiplayerEnabled", Boolean.valueOf(game.isTurnBasedMultiplayerEnabled())).toString();
    }

    public int describeContents() {
        return 0;
    }

    public boolean equals(Object obj) {
        return m1701a(this, obj);
    }

    public Game freeze() {
        return this;
    }

    public int getAchievementTotalCount() {
        return this.f1647sS;
    }

    public String getApplicationId() {
        return this.f1634kh;
    }

    public String getDescription() {
        return this.f1638sJ;
    }

    public void getDescription(CharArrayBuffer dataOut) {
        C1131fc.m2759b(this.f1638sJ, dataOut);
    }

    public String getDeveloperName() {
        return this.f1639sK;
    }

    public void getDeveloperName(CharArrayBuffer dataOut) {
        C1131fc.m2759b(this.f1639sK, dataOut);
    }

    public String getDisplayName() {
        return this.f1635qa;
    }

    public void getDisplayName(CharArrayBuffer dataOut) {
        C1131fc.m2759b(this.f1635qa, dataOut);
    }

    public Uri getFeaturedImageUri() {
        return this.f1642sN;
    }

    public int getGameplayAclStatus() {
        return this.f1646sR;
    }

    public Uri getHiResImageUri() {
        return this.f1641sM;
    }

    public Uri getIconImageUri() {
        return this.f1640sL;
    }

    public String getInstancePackageName() {
        return this.f1645sQ;
    }

    public int getLeaderboardCount() {
        return this.f1648sT;
    }

    public String getPrimaryCategory() {
        return this.f1636sH;
    }

    public String getSecondaryCategory() {
        return this.f1637sI;
    }

    public int getVersionCode() {
        return this.f1633kg;
    }

    public int hashCode() {
        return m1700a(this);
    }

    public boolean isDataValid() {
        return true;
    }

    public boolean isInstanceInstalled() {
        return this.f1644sP;
    }

    public boolean isPlayEnabledGame() {
        return this.f1643sO;
    }

    public boolean isRealTimeMultiplayerEnabled() {
        return this.f1649sU;
    }

    public boolean isTurnBasedMultiplayerEnabled() {
        return this.f1650sV;
    }

    public String toString() {
        return m1703b((Game) this);
    }

    public void writeToParcel(Parcel dest, int flags) {
        int i = 1;
        String str = null;
        if (!mo7449bN()) {
            C0822a.m1795a(this, dest, flags);
            return;
        }
        dest.writeString(this.f1634kh);
        dest.writeString(this.f1635qa);
        dest.writeString(this.f1636sH);
        dest.writeString(this.f1637sI);
        dest.writeString(this.f1638sJ);
        dest.writeString(this.f1639sK);
        dest.writeString(this.f1640sL == null ? null : this.f1640sL.toString());
        dest.writeString(this.f1641sM == null ? null : this.f1641sM.toString());
        if (this.f1642sN != null) {
            str = this.f1642sN.toString();
        }
        dest.writeString(str);
        dest.writeInt(this.f1643sO ? 1 : 0);
        if (!this.f1644sP) {
            i = 0;
        }
        dest.writeInt(i);
        dest.writeString(this.f1645sQ);
        dest.writeInt(this.f1646sR);
        dest.writeInt(this.f1647sS);
        dest.writeInt(this.f1648sT);
    }
}
