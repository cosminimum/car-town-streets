package google.android.gms.games;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcel;

import com.google.android.gms.internal.ds;
import com.google.android.gms.internal.ee;
import com.google.android.gms.internal.fc;
import com.google.android.gms.internal.fm;

public final class PlayerEntity extends fm implements Player {
    public static final Creator<PlayerEntity> CREATOR = new a();
    private final int kg;
    private final String qa;
    private final Uri sL;
    private final Uri sM;
    private final String tC;
    private final long tD;
    private final int tE;
    private final long tF;

    static final class a extends c {
        a() {
        }

        /* renamed from: Z */
        public PlayerEntity createFromParcel(Parcel parcel) {
            Uri uri = null;
            if (PlayerEntity.c(PlayerEntity.bM()) || PlayerEntity.P(PlayerEntity.class.getCanonicalName())) {
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
        this.kg = versionCode;
        this.tC = playerId;
        this.qa = displayName;
        this.sL = iconImageUri;
        this.sM = hiResImageUri;
        this.tD = retrievedTimestamp;
        this.tE = isInCircles;
        this.tF = lastPlayedWithTimestamp;
    }

    public PlayerEntity(Player player) {
        this.kg = 3;
        this.tC = player.getPlayerId();
        this.qa = player.getDisplayName();
        this.sL = player.getIconImageUri();
        this.sM = player.getHiResImageUri();
        this.tD = player.getRetrievedTimestamp();
        this.tE = player.db();
        this.tF = player.getLastPlayedWithTimestamp();
        ds.d(this.tC);
        ds.d(this.qa);
        ds.p(this.tD > 0);
    }

    static int a(Player player) {
        return ee.hashCode(player.getPlayerId(), player.getDisplayName(), player.getIconImageUri(), player.getHiResImageUri(), Long.valueOf(player.getRetrievedTimestamp()));
    }

    static boolean a(Player player, Object obj) {
        if (!(obj instanceof Player)) {
            return false;
        }
        if (player == obj) {
            return true;
        }
        Player player2 = (Player) obj;
        return ee.equal(player2.getPlayerId(), player.getPlayerId()) && ee.equal(player2.getDisplayName(), player.getDisplayName()) && ee.equal(player2.getIconImageUri(), player.getIconImageUri()) && ee.equal(player2.getHiResImageUri(), player.getHiResImageUri()) && ee.equal(Long.valueOf(player2.getRetrievedTimestamp()), Long.valueOf(player.getRetrievedTimestamp()));
    }

    static String b(Player player) {
        return ee.e(player).a("PlayerId", player.getPlayerId()).a("DisplayName", player.getDisplayName()).a("IconImageUri", player.getIconImageUri()).a("HiResImageUri", player.getHiResImageUri()).a("RetrievedTimestamp", Long.valueOf(player.getRetrievedTimestamp())).toString();
    }

    public int db() {
        return this.tE;
    }

    public int describeContents() {
        return 0;
    }

    public boolean equals(Object obj) {
        return a(this, obj);
    }

    public Player freeze() {
        return this;
    }

    public String getDisplayName() {
        return this.qa;
    }

    public void getDisplayName(CharArrayBuffer dataOut) {
        fc.b(this.qa, dataOut);
    }

    public Uri getHiResImageUri() {
        return this.sM;
    }

    public Uri getIconImageUri() {
        return this.sL;
    }

    public long getLastPlayedWithTimestamp() {
        return this.tF;
    }

    public String getPlayerId() {
        return this.tC;
    }

    public long getRetrievedTimestamp() {
        return this.tD;
    }

    public int getVersionCode() {
        return this.kg;
    }

    public boolean hasHiResImage() {
        return getHiResImageUri() != null;
    }

    public boolean hasIconImage() {
        return getIconImageUri() != null;
    }

    public int hashCode() {
        return a(this);
    }

    public boolean isDataValid() {
        return true;
    }

    public String toString() {
        return b((Player) this);
    }

    public void writeToParcel(Parcel dest, int flags) {
        String str = null;
        if (!bN()) {
            c.a(this, dest, flags);
            return;
        }
        dest.writeString(this.tC);
        dest.writeString(this.qa);
        dest.writeString(this.sL == null ? null : this.sL.toString());
        if (this.sM != null) {
            str = this.sM.toString();
        }
        dest.writeString(str);
        dest.writeLong(this.tD);
    }
}
