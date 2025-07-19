package com.google.android.gms.games;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.internal.C1066ds;
import com.google.android.gms.internal.C1098ee;
import com.google.android.gms.internal.C1131fc;
import com.google.android.gms.internal.C1205fm;

public final class PlayerEntity extends C1205fm implements Player {
    public static final Parcelable.Creator<PlayerEntity> CREATOR = new C0821a();

    /* renamed from: kg */
    private final int f1746kg;

    /* renamed from: qa */
    private final String f1747qa;

    /* renamed from: sL */
    private final Uri f1748sL;

    /* renamed from: sM */
    private final Uri f1749sM;

    /* renamed from: tC */
    private final String f1750tC;

    /* renamed from: tD */
    private final long f1751tD;

    /* renamed from: tE */
    private final int f1752tE;

    /* renamed from: tF */
    private final long f1753tF;

    /* renamed from: com.google.android.gms.games.PlayerEntity$a */
    static final class C0821a extends C0825c {
        C0821a() {
        }

        /* renamed from: Z */
        public PlayerEntity createFromParcel(Parcel parcel) {
            Uri uri = null;
            if (PlayerEntity.m2979c(PlayerEntity.m2473bM()) || PlayerEntity.m2470P(PlayerEntity.class.getCanonicalName())) {
                return super.createFromParcel(parcel);
            }
            String readString = parcel.readString();
            String readString2 = parcel.readString();
            String readString3 = parcel.readString();
            String readString4 = parcel.readString();
            Uri parse = readString3 == null ? null : Uri.parse(readString3);
            if (readString4 != null) {
                uri = Uri.parse(readString4);
            }
            return new PlayerEntity(3, readString, readString2, parse, uri, parcel.readLong(), -1, -1);
        }
    }

    PlayerEntity(int versionCode, String playerId, String displayName, Uri iconImageUri, Uri hiResImageUri, long retrievedTimestamp, int isInCircles, long lastPlayedWithTimestamp) {
        this.f1746kg = versionCode;
        this.f1750tC = playerId;
        this.f1747qa = displayName;
        this.f1748sL = iconImageUri;
        this.f1749sM = hiResImageUri;
        this.f1751tD = retrievedTimestamp;
        this.f1752tE = isInCircles;
        this.f1753tF = lastPlayedWithTimestamp;
    }

    public PlayerEntity(Player player) {
        this.f1746kg = 3;
        this.f1750tC = player.getPlayerId();
        this.f1747qa = player.getDisplayName();
        this.f1748sL = player.getIconImageUri();
        this.f1749sM = player.getHiResImageUri();
        this.f1751tD = player.getRetrievedTimestamp();
        this.f1752tE = player.mo6578db();
        this.f1753tF = player.getLastPlayedWithTimestamp();
        C1066ds.m2458d(this.f1750tC);
        C1066ds.m2458d(this.f1747qa);
        C1066ds.m2459p(this.f1751tD > 0);
    }

    /* renamed from: a */
    static int m1787a(Player player) {
        return C1098ee.hashCode(player.getPlayerId(), player.getDisplayName(), player.getIconImageUri(), player.getHiResImageUri(), Long.valueOf(player.getRetrievedTimestamp()));
    }

    /* renamed from: a */
    static boolean m1788a(Player player, Object obj) {
        if (!(obj instanceof Player)) {
            return false;
        }
        if (player == obj) {
            return true;
        }
        Player player2 = (Player) obj;
        return C1098ee.equal(player2.getPlayerId(), player.getPlayerId()) && C1098ee.equal(player2.getDisplayName(), player.getDisplayName()) && C1098ee.equal(player2.getIconImageUri(), player.getIconImageUri()) && C1098ee.equal(player2.getHiResImageUri(), player.getHiResImageUri()) && C1098ee.equal(Long.valueOf(player2.getRetrievedTimestamp()), Long.valueOf(player.getRetrievedTimestamp()));
    }

    /* renamed from: b */
    static String m1790b(Player player) {
        return C1098ee.m2604e(player).mo7535a("PlayerId", player.getPlayerId()).mo7535a("DisplayName", player.getDisplayName()).mo7535a("IconImageUri", player.getIconImageUri()).mo7535a("HiResImageUri", player.getHiResImageUri()).mo7535a("RetrievedTimestamp", Long.valueOf(player.getRetrievedTimestamp())).toString();
    }

    /* renamed from: db */
    public int mo6578db() {
        return this.f1752tE;
    }

    public int describeContents() {
        return 0;
    }

    public boolean equals(Object obj) {
        return m1788a(this, obj);
    }

    public Player freeze() {
        return this;
    }

    public String getDisplayName() {
        return this.f1747qa;
    }

    public void getDisplayName(CharArrayBuffer dataOut) {
        C1131fc.m2759b(this.f1747qa, dataOut);
    }

    public Uri getHiResImageUri() {
        return this.f1749sM;
    }

    public Uri getIconImageUri() {
        return this.f1748sL;
    }

    public long getLastPlayedWithTimestamp() {
        return this.f1753tF;
    }

    public String getPlayerId() {
        return this.f1750tC;
    }

    public long getRetrievedTimestamp() {
        return this.f1751tD;
    }

    public int getVersionCode() {
        return this.f1746kg;
    }

    public boolean hasHiResImage() {
        return getHiResImageUri() != null;
    }

    public boolean hasIconImage() {
        return getIconImageUri() != null;
    }

    public int hashCode() {
        return m1787a(this);
    }

    public boolean isDataValid() {
        return true;
    }

    public String toString() {
        return m1790b((Player) this);
    }

    public void writeToParcel(Parcel dest, int flags) {
        String str = null;
        if (!mo7449bN()) {
            C0825c.m1798a(this, dest, flags);
            return;
        }
        dest.writeString(this.f1750tC);
        dest.writeString(this.f1747qa);
        dest.writeString(this.f1748sL == null ? null : this.f1748sL.toString());
        if (this.f1749sM != null) {
            str = this.f1749sM.toString();
        }
        dest.writeString(str);
        dest.writeLong(this.f1751tD);
    }
}
