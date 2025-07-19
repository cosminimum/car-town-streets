package com.google.android.gms.games.multiplayer;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.PlayerEntity;
import com.google.android.gms.internal.ee;
import com.google.android.gms.internal.fc;
import com.google.android.gms.internal.fm;

public final class ParticipantEntity extends fm implements Participant {
    public static final Parcelable.Creator<ParticipantEntity> CREATOR = new a();
    private final int kg;
    private final String qa;
    private final Uri sL;
    private final Uri sM;
    private final String up;
    private final int wr;
    private final String ws;
    private final boolean wt;
    private final PlayerEntity wu;
    private final int wv;
    private final ParticipantResult ww;

    static final class a extends c {
        a() {
        }

        /* renamed from: ab */
        public ParticipantEntity createFromParcel(Parcel parcel) {
            boolean z = true;
            if (ParticipantEntity.c(ParticipantEntity.bM()) || ParticipantEntity.P(ParticipantEntity.class.getCanonicalName())) {
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
        this.kg = versionCode;
        this.up = participantId;
        this.qa = displayName;
        this.sL = iconImageUri;
        this.sM = hiResImageUri;
        this.wr = status;
        this.ws = clientAddress;
        this.wt = connectedToRoom;
        this.wu = player;
        this.wv = capabilities;
        this.ww = result;
    }

    public ParticipantEntity(Participant participant) {
        this.kg = 2;
        this.up = participant.getParticipantId();
        this.qa = participant.getDisplayName();
        this.sL = participant.getIconImageUri();
        this.sM = participant.getHiResImageUri();
        this.wr = participant.getStatus();
        this.ws = participant.dy();
        this.wt = participant.isConnectedToRoom();
        Player player = participant.getPlayer();
        this.wu = player == null ? null : new PlayerEntity(player);
        this.wv = participant.getCapabilities();
        this.ww = participant.getResult();
    }

    static int a(Participant participant) {
        return ee.hashCode(participant.getPlayer(), Integer.valueOf(participant.getStatus()), participant.dy(), Boolean.valueOf(participant.isConnectedToRoom()), participant.getDisplayName(), participant.getIconImageUri(), participant.getHiResImageUri(), Integer.valueOf(participant.getCapabilities()), participant.getResult());
    }

    static boolean a(Participant participant, Object obj) {
        if (!(obj instanceof Participant)) {
            return false;
        }
        if (participant == obj) {
            return true;
        }
        Participant participant2 = (Participant) obj;
        return ee.equal(participant2.getPlayer(), participant.getPlayer()) && ee.equal(Integer.valueOf(participant2.getStatus()), Integer.valueOf(participant.getStatus())) && ee.equal(participant2.dy(), participant.dy()) && ee.equal(Boolean.valueOf(participant2.isConnectedToRoom()), Boolean.valueOf(participant.isConnectedToRoom())) && ee.equal(participant2.getDisplayName(), participant.getDisplayName()) && ee.equal(participant2.getIconImageUri(), participant.getIconImageUri()) && ee.equal(participant2.getHiResImageUri(), participant.getHiResImageUri()) && ee.equal(Integer.valueOf(participant2.getCapabilities()), Integer.valueOf(participant.getCapabilities())) && ee.equal(participant2.getResult(), participant.getResult());
    }

    static String b(Participant participant) {
        return ee.e(participant).a("Player", participant.getPlayer()).a("Status", Integer.valueOf(participant.getStatus())).a("ClientAddress", participant.dy()).a("ConnectedToRoom", Boolean.valueOf(participant.isConnectedToRoom())).a("DisplayName", participant.getDisplayName()).a("IconImage", participant.getIconImageUri()).a("HiResImage", participant.getHiResImageUri()).a("Capabilities", Integer.valueOf(participant.getCapabilities())).a("Result", participant.getResult()).toString();
    }

    public int describeContents() {
        return 0;
    }

    public String dy() {
        return this.ws;
    }

    public boolean equals(Object obj) {
        return a(this, obj);
    }

    public Participant freeze() {
        return this;
    }

    public int getCapabilities() {
        return this.wv;
    }

    public String getDisplayName() {
        return this.wu == null ? this.qa : this.wu.getDisplayName();
    }

    public void getDisplayName(CharArrayBuffer dataOut) {
        if (this.wu == null) {
            fc.b(this.qa, dataOut);
        } else {
            this.wu.getDisplayName(dataOut);
        }
    }

    public Uri getHiResImageUri() {
        return this.wu == null ? this.sM : this.wu.getHiResImageUri();
    }

    public Uri getIconImageUri() {
        return this.wu == null ? this.sL : this.wu.getIconImageUri();
    }

    public String getParticipantId() {
        return this.up;
    }

    public Player getPlayer() {
        return this.wu;
    }

    public ParticipantResult getResult() {
        return this.ww;
    }

    public int getStatus() {
        return this.wr;
    }

    public int getVersionCode() {
        return this.kg;
    }

    public int hashCode() {
        return a(this);
    }

    public boolean isConnectedToRoom() {
        return this.wt;
    }

    public boolean isDataValid() {
        return true;
    }

    public String toString() {
        return b((Participant) this);
    }

    public void writeToParcel(Parcel dest, int flags) {
        String str = null;
        int i = 0;
        if (!bN()) {
            c.a(this, dest, flags);
            return;
        }
        dest.writeString(this.up);
        dest.writeString(this.qa);
        dest.writeString(this.sL == null ? null : this.sL.toString());
        if (this.sM != null) {
            str = this.sM.toString();
        }
        dest.writeString(str);
        dest.writeInt(this.wr);
        dest.writeString(this.ws);
        dest.writeInt(this.wt ? 1 : 0);
        if (this.wu != null) {
            i = 1;
        }
        dest.writeInt(i);
        if (this.wu != null) {
            this.wu.writeToParcel(dest, flags);
        }
    }
}
