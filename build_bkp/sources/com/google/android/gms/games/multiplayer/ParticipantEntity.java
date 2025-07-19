package com.google.android.gms.games.multiplayer;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.PlayerEntity;
import com.google.android.gms.internal.C1098ee;
import com.google.android.gms.internal.C1131fc;
import com.google.android.gms.internal.C1205fm;

public final class ParticipantEntity extends C1205fm implements Participant {
    public static final Parcelable.Creator<ParticipantEntity> CREATOR = new C0836a();

    /* renamed from: kg */
    private final int f1814kg;

    /* renamed from: qa */
    private final String f1815qa;

    /* renamed from: sL */
    private final Uri f1816sL;

    /* renamed from: sM */
    private final Uri f1817sM;

    /* renamed from: up */
    private final String f1818up;

    /* renamed from: wr */
    private final int f1819wr;

    /* renamed from: ws */
    private final String f1820ws;

    /* renamed from: wt */
    private final boolean f1821wt;

    /* renamed from: wu */
    private final PlayerEntity f1822wu;

    /* renamed from: wv */
    private final int f1823wv;

    /* renamed from: ww */
    private final ParticipantResult f1824ww;

    /* renamed from: com.google.android.gms.games.multiplayer.ParticipantEntity$a */
    static final class C0836a extends C0839c {
        C0836a() {
        }

        /* renamed from: ab */
        public ParticipantEntity createFromParcel(Parcel parcel) {
            boolean z = true;
            if (ParticipantEntity.m2979c(ParticipantEntity.m2473bM()) || ParticipantEntity.m2470P(ParticipantEntity.class.getCanonicalName())) {
                return super.createFromParcel(parcel);
            }
            String readString = parcel.readString();
            String readString2 = parcel.readString();
            String readString3 = parcel.readString();
            Uri parse = readString3 == null ? null : Uri.parse(readString3);
            String readString4 = parcel.readString();
            Uri parse2 = readString4 == null ? null : Uri.parse(readString4);
            int readInt = parcel.readInt();
            String readString5 = parcel.readString();
            boolean z2 = parcel.readInt() > 0;
            if (parcel.readInt() <= 0) {
                z = false;
            }
            return new ParticipantEntity(2, readString, readString2, parse, parse2, readInt, readString5, z2, z ? PlayerEntity.CREATOR.createFromParcel(parcel) : null, 7, (ParticipantResult) null);
        }
    }

    ParticipantEntity(int versionCode, String participantId, String displayName, Uri iconImageUri, Uri hiResImageUri, int status, String clientAddress, boolean connectedToRoom, PlayerEntity player, int capabilities, ParticipantResult result) {
        this.f1814kg = versionCode;
        this.f1818up = participantId;
        this.f1815qa = displayName;
        this.f1816sL = iconImageUri;
        this.f1817sM = hiResImageUri;
        this.f1819wr = status;
        this.f1820ws = clientAddress;
        this.f1821wt = connectedToRoom;
        this.f1822wu = player;
        this.f1823wv = capabilities;
        this.f1824ww = result;
    }

    public ParticipantEntity(Participant participant) {
        this.f1814kg = 2;
        this.f1818up = participant.getParticipantId();
        this.f1815qa = participant.getDisplayName();
        this.f1816sL = participant.getIconImageUri();
        this.f1817sM = participant.getHiResImageUri();
        this.f1819wr = participant.getStatus();
        this.f1820ws = participant.mo6760dy();
        this.f1821wt = participant.isConnectedToRoom();
        Player player = participant.getPlayer();
        this.f1822wu = player == null ? null : new PlayerEntity(player);
        this.f1823wv = participant.getCapabilities();
        this.f1824ww = participant.getResult();
    }

    /* renamed from: a */
    static int m1842a(Participant participant) {
        return C1098ee.hashCode(participant.getPlayer(), Integer.valueOf(participant.getStatus()), participant.mo6760dy(), Boolean.valueOf(participant.isConnectedToRoom()), participant.getDisplayName(), participant.getIconImageUri(), participant.getHiResImageUri(), Integer.valueOf(participant.getCapabilities()), participant.getResult());
    }

    /* renamed from: a */
    static boolean m1843a(Participant participant, Object obj) {
        if (!(obj instanceof Participant)) {
            return false;
        }
        if (participant == obj) {
            return true;
        }
        Participant participant2 = (Participant) obj;
        return C1098ee.equal(participant2.getPlayer(), participant.getPlayer()) && C1098ee.equal(Integer.valueOf(participant2.getStatus()), Integer.valueOf(participant.getStatus())) && C1098ee.equal(participant2.mo6760dy(), participant.mo6760dy()) && C1098ee.equal(Boolean.valueOf(participant2.isConnectedToRoom()), Boolean.valueOf(participant.isConnectedToRoom())) && C1098ee.equal(participant2.getDisplayName(), participant.getDisplayName()) && C1098ee.equal(participant2.getIconImageUri(), participant.getIconImageUri()) && C1098ee.equal(participant2.getHiResImageUri(), participant.getHiResImageUri()) && C1098ee.equal(Integer.valueOf(participant2.getCapabilities()), Integer.valueOf(participant.getCapabilities())) && C1098ee.equal(participant2.getResult(), participant.getResult());
    }

    /* renamed from: b */
    static String m1845b(Participant participant) {
        return C1098ee.m2604e(participant).mo7535a("Player", participant.getPlayer()).mo7535a("Status", Integer.valueOf(participant.getStatus())).mo7535a("ClientAddress", participant.mo6760dy()).mo7535a("ConnectedToRoom", Boolean.valueOf(participant.isConnectedToRoom())).mo7535a("DisplayName", participant.getDisplayName()).mo7535a("IconImage", participant.getIconImageUri()).mo7535a("HiResImage", participant.getHiResImageUri()).mo7535a("Capabilities", Integer.valueOf(participant.getCapabilities())).mo7535a("Result", participant.getResult()).toString();
    }

    public int describeContents() {
        return 0;
    }

    /* renamed from: dy */
    public String mo6760dy() {
        return this.f1820ws;
    }

    public boolean equals(Object obj) {
        return m1843a(this, obj);
    }

    public Participant freeze() {
        return this;
    }

    public int getCapabilities() {
        return this.f1823wv;
    }

    public String getDisplayName() {
        return this.f1822wu == null ? this.f1815qa : this.f1822wu.getDisplayName();
    }

    public void getDisplayName(CharArrayBuffer dataOut) {
        if (this.f1822wu == null) {
            C1131fc.m2759b(this.f1815qa, dataOut);
        } else {
            this.f1822wu.getDisplayName(dataOut);
        }
    }

    public Uri getHiResImageUri() {
        return this.f1822wu == null ? this.f1817sM : this.f1822wu.getHiResImageUri();
    }

    public Uri getIconImageUri() {
        return this.f1822wu == null ? this.f1816sL : this.f1822wu.getIconImageUri();
    }

    public String getParticipantId() {
        return this.f1818up;
    }

    public Player getPlayer() {
        return this.f1822wu;
    }

    public ParticipantResult getResult() {
        return this.f1824ww;
    }

    public int getStatus() {
        return this.f1819wr;
    }

    public int getVersionCode() {
        return this.f1814kg;
    }

    public int hashCode() {
        return m1842a(this);
    }

    public boolean isConnectedToRoom() {
        return this.f1821wt;
    }

    public boolean isDataValid() {
        return true;
    }

    public String toString() {
        return m1845b((Participant) this);
    }

    public void writeToParcel(Parcel dest, int flags) {
        String str = null;
        int i = 0;
        if (!mo7449bN()) {
            C0839c.m1855a(this, dest, flags);
            return;
        }
        dest.writeString(this.f1818up);
        dest.writeString(this.f1815qa);
        dest.writeString(this.f1816sL == null ? null : this.f1816sL.toString());
        if (this.f1817sM != null) {
            str = this.f1817sM.toString();
        }
        dest.writeString(str);
        dest.writeInt(this.f1819wr);
        dest.writeString(this.f1820ws);
        dest.writeInt(this.f1821wt ? 1 : 0);
        if (this.f1822wu != null) {
            i = 1;
        }
        dest.writeInt(i);
        if (this.f1822wu != null) {
            this.f1822wu.writeToParcel(dest, flags);
        }
    }
}
