package com.google.android.gms.games.multiplayer.turnbased;

import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.games.Game;
import com.google.android.gms.games.GameEntity;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.multiplayer.Participant;
import com.google.android.gms.games.multiplayer.ParticipantEntity;
import com.google.android.gms.internal.C1098ee;
import java.util.ArrayList;

public final class TurnBasedMatchEntity implements SafeParcelable, TurnBasedMatch {
    public static final TurnBasedMatchEntityCreator CREATOR = new TurnBasedMatchEntityCreator();

    /* renamed from: kg */
    private final int f1876kg;

    /* renamed from: ul */
    private final String f1877ul;

    /* renamed from: wH */
    private final Bundle f1878wH;

    /* renamed from: wL */
    private final String f1879wL;

    /* renamed from: wU */
    private final String f1880wU;

    /* renamed from: wV */
    private final long f1881wV;

    /* renamed from: wW */
    private final String f1882wW;

    /* renamed from: wX */
    private final int f1883wX;

    /* renamed from: wY */
    private final int f1884wY;

    /* renamed from: wZ */
    private final byte[] f1885wZ;

    /* renamed from: wj */
    private final GameEntity f1886wj;

    /* renamed from: wk */
    private final long f1887wk;

    /* renamed from: wn */
    private final ArrayList<ParticipantEntity> f1888wn;

    /* renamed from: wo */
    private final int f1889wo;

    /* renamed from: xa */
    private final String f1890xa;

    /* renamed from: xb */
    private final byte[] f1891xb;

    /* renamed from: xc */
    private final int f1892xc;

    /* renamed from: xd */
    private final int f1893xd;

    /* renamed from: xe */
    private final boolean f1894xe;

    TurnBasedMatchEntity(int versionCode, GameEntity game, String matchId, String creatorId, long creationTimestamp, String lastUpdaterId, long lastUpdatedTimestamp, String pendingParticipantId, int matchStatus, int variant, int version, byte[] data, ArrayList<ParticipantEntity> participants, String rematchId, byte[] previousData, int matchNumber, Bundle autoMatchCriteria, int turnStatus, boolean isLocallyModified) {
        this.f1876kg = versionCode;
        this.f1886wj = game;
        this.f1877ul = matchId;
        this.f1879wL = creatorId;
        this.f1887wk = creationTimestamp;
        this.f1880wU = lastUpdaterId;
        this.f1881wV = lastUpdatedTimestamp;
        this.f1882wW = pendingParticipantId;
        this.f1883wX = matchStatus;
        this.f1893xd = turnStatus;
        this.f1889wo = variant;
        this.f1884wY = version;
        this.f1885wZ = data;
        this.f1888wn = participants;
        this.f1890xa = rematchId;
        this.f1891xb = previousData;
        this.f1892xc = matchNumber;
        this.f1878wH = autoMatchCriteria;
        this.f1894xe = isLocallyModified;
    }

    public TurnBasedMatchEntity(TurnBasedMatch match) {
        this.f1876kg = 2;
        this.f1886wj = new GameEntity(match.getGame());
        this.f1877ul = match.getMatchId();
        this.f1879wL = match.getCreatorId();
        this.f1887wk = match.getCreationTimestamp();
        this.f1880wU = match.getLastUpdaterId();
        this.f1881wV = match.getLastUpdatedTimestamp();
        this.f1882wW = match.getPendingParticipantId();
        this.f1883wX = match.getStatus();
        this.f1893xd = match.getTurnStatus();
        this.f1889wo = match.getVariant();
        this.f1884wY = match.getVersion();
        this.f1890xa = match.getRematchId();
        this.f1892xc = match.getMatchNumber();
        this.f1878wH = match.getAutoMatchCriteria();
        this.f1894xe = match.isLocallyModified();
        byte[] data = match.getData();
        if (data == null) {
            this.f1885wZ = null;
        } else {
            this.f1885wZ = new byte[data.length];
            System.arraycopy(data, 0, this.f1885wZ, 0, data.length);
        }
        byte[] previousMatchData = match.getPreviousMatchData();
        if (previousMatchData == null) {
            this.f1891xb = null;
        } else {
            this.f1891xb = new byte[previousMatchData.length];
            System.arraycopy(previousMatchData, 0, this.f1891xb, 0, previousMatchData.length);
        }
        ArrayList<Participant> participants = match.getParticipants();
        int size = participants.size();
        this.f1888wn = new ArrayList<>(size);
        for (int i = 0; i < size; i++) {
            this.f1888wn.add((ParticipantEntity) participants.get(i).freeze());
        }
    }

    /* renamed from: a */
    static int m1879a(TurnBasedMatch turnBasedMatch) {
        return C1098ee.hashCode(turnBasedMatch.getGame(), turnBasedMatch.getMatchId(), turnBasedMatch.getCreatorId(), Long.valueOf(turnBasedMatch.getCreationTimestamp()), turnBasedMatch.getLastUpdaterId(), Long.valueOf(turnBasedMatch.getLastUpdatedTimestamp()), turnBasedMatch.getPendingParticipantId(), Integer.valueOf(turnBasedMatch.getStatus()), Integer.valueOf(turnBasedMatch.getTurnStatus()), Integer.valueOf(turnBasedMatch.getVariant()), Integer.valueOf(turnBasedMatch.getVersion()), turnBasedMatch.getParticipants(), turnBasedMatch.getRematchId(), Integer.valueOf(turnBasedMatch.getMatchNumber()), turnBasedMatch.getAutoMatchCriteria(), Integer.valueOf(turnBasedMatch.getAvailableAutoMatchSlots()), Boolean.valueOf(turnBasedMatch.isLocallyModified()));
    }

    /* renamed from: a */
    static int m1880a(TurnBasedMatch turnBasedMatch, String str) {
        ArrayList<Participant> participants = turnBasedMatch.getParticipants();
        int size = participants.size();
        for (int i = 0; i < size; i++) {
            Participant participant = participants.get(i);
            if (participant.getParticipantId().equals(str)) {
                return participant.getStatus();
            }
        }
        throw new IllegalStateException("Participant " + str + " is not in match " + turnBasedMatch.getMatchId());
    }

    /* renamed from: a */
    static boolean m1881a(TurnBasedMatch turnBasedMatch, Object obj) {
        if (!(obj instanceof TurnBasedMatch)) {
            return false;
        }
        if (turnBasedMatch == obj) {
            return true;
        }
        TurnBasedMatch turnBasedMatch2 = (TurnBasedMatch) obj;
        return C1098ee.equal(turnBasedMatch2.getGame(), turnBasedMatch.getGame()) && C1098ee.equal(turnBasedMatch2.getMatchId(), turnBasedMatch.getMatchId()) && C1098ee.equal(turnBasedMatch2.getCreatorId(), turnBasedMatch.getCreatorId()) && C1098ee.equal(Long.valueOf(turnBasedMatch2.getCreationTimestamp()), Long.valueOf(turnBasedMatch.getCreationTimestamp())) && C1098ee.equal(turnBasedMatch2.getLastUpdaterId(), turnBasedMatch.getLastUpdaterId()) && C1098ee.equal(Long.valueOf(turnBasedMatch2.getLastUpdatedTimestamp()), Long.valueOf(turnBasedMatch.getLastUpdatedTimestamp())) && C1098ee.equal(turnBasedMatch2.getPendingParticipantId(), turnBasedMatch.getPendingParticipantId()) && C1098ee.equal(Integer.valueOf(turnBasedMatch2.getStatus()), Integer.valueOf(turnBasedMatch.getStatus())) && C1098ee.equal(Integer.valueOf(turnBasedMatch2.getTurnStatus()), Integer.valueOf(turnBasedMatch.getTurnStatus())) && C1098ee.equal(Integer.valueOf(turnBasedMatch2.getVariant()), Integer.valueOf(turnBasedMatch.getVariant())) && C1098ee.equal(Integer.valueOf(turnBasedMatch2.getVersion()), Integer.valueOf(turnBasedMatch.getVersion())) && C1098ee.equal(turnBasedMatch2.getParticipants(), turnBasedMatch.getParticipants()) && C1098ee.equal(turnBasedMatch2.getRematchId(), turnBasedMatch.getRematchId()) && C1098ee.equal(Integer.valueOf(turnBasedMatch2.getMatchNumber()), Integer.valueOf(turnBasedMatch.getMatchNumber())) && C1098ee.equal(turnBasedMatch2.getAutoMatchCriteria(), turnBasedMatch.getAutoMatchCriteria()) && C1098ee.equal(Integer.valueOf(turnBasedMatch2.getAvailableAutoMatchSlots()), Integer.valueOf(turnBasedMatch.getAvailableAutoMatchSlots())) && C1098ee.equal(Boolean.valueOf(turnBasedMatch2.isLocallyModified()), Boolean.valueOf(turnBasedMatch.isLocallyModified()));
    }

    /* renamed from: b */
    static String m1882b(TurnBasedMatch turnBasedMatch) {
        return C1098ee.m2604e(turnBasedMatch).mo7535a("Game", turnBasedMatch.getGame()).mo7535a("MatchId", turnBasedMatch.getMatchId()).mo7535a("CreatorId", turnBasedMatch.getCreatorId()).mo7535a("CreationTimestamp", Long.valueOf(turnBasedMatch.getCreationTimestamp())).mo7535a("LastUpdaterId", turnBasedMatch.getLastUpdaterId()).mo7535a("LastUpdatedTimestamp", Long.valueOf(turnBasedMatch.getLastUpdatedTimestamp())).mo7535a("PendingParticipantId", turnBasedMatch.getPendingParticipantId()).mo7535a("MatchStatus", Integer.valueOf(turnBasedMatch.getStatus())).mo7535a("TurnStatus", Integer.valueOf(turnBasedMatch.getTurnStatus())).mo7535a("Variant", Integer.valueOf(turnBasedMatch.getVariant())).mo7535a("Data", turnBasedMatch.getData()).mo7535a("Version", Integer.valueOf(turnBasedMatch.getVersion())).mo7535a("Participants", turnBasedMatch.getParticipants()).mo7535a("RematchId", turnBasedMatch.getRematchId()).mo7535a("PreviousData", turnBasedMatch.getPreviousMatchData()).mo7535a("MatchNumber", Integer.valueOf(turnBasedMatch.getMatchNumber())).mo7535a("AutoMatchCriteria", turnBasedMatch.getAutoMatchCriteria()).mo7535a("AvailableAutoMatchSlots", Integer.valueOf(turnBasedMatch.getAvailableAutoMatchSlots())).mo7535a("LocallyModified", Boolean.valueOf(turnBasedMatch.isLocallyModified())).toString();
    }

    /* renamed from: b */
    static String m1883b(TurnBasedMatch turnBasedMatch, String str) {
        ArrayList<Participant> participants = turnBasedMatch.getParticipants();
        int size = participants.size();
        for (int i = 0; i < size; i++) {
            Participant participant = participants.get(i);
            Player player = participant.getPlayer();
            if (player != null && player.getPlayerId().equals(str)) {
                return participant.getParticipantId();
            }
        }
        return null;
    }

    /* renamed from: c */
    static Participant m1884c(TurnBasedMatch turnBasedMatch, String str) {
        ArrayList<Participant> participants = turnBasedMatch.getParticipants();
        int size = participants.size();
        for (int i = 0; i < size; i++) {
            Participant participant = participants.get(i);
            if (participant.getParticipantId().equals(str)) {
                return participant;
            }
        }
        throw new IllegalStateException("Participant " + str + " is not in match " + turnBasedMatch.getMatchId());
    }

    /* renamed from: c */
    static ArrayList<String> m1885c(TurnBasedMatch turnBasedMatch) {
        ArrayList<Participant> participants = turnBasedMatch.getParticipants();
        int size = participants.size();
        ArrayList<String> arrayList = new ArrayList<>(size);
        for (int i = 0; i < size; i++) {
            arrayList.add(participants.get(i).getParticipantId());
        }
        return arrayList;
    }

    public boolean canRematch() {
        return this.f1883wX == 2 && this.f1890xa == null;
    }

    public int describeContents() {
        return 0;
    }

    public boolean equals(Object obj) {
        return m1881a((TurnBasedMatch) this, obj);
    }

    public TurnBasedMatch freeze() {
        return this;
    }

    public Bundle getAutoMatchCriteria() {
        return this.f1878wH;
    }

    public int getAvailableAutoMatchSlots() {
        if (this.f1878wH == null) {
            return 0;
        }
        return this.f1878wH.getInt("max_automatch_players");
    }

    public long getCreationTimestamp() {
        return this.f1887wk;
    }

    public String getCreatorId() {
        return this.f1879wL;
    }

    public byte[] getData() {
        return this.f1885wZ;
    }

    public Game getGame() {
        return this.f1886wj;
    }

    public long getLastUpdatedTimestamp() {
        return this.f1881wV;
    }

    public String getLastUpdaterId() {
        return this.f1880wU;
    }

    public String getMatchId() {
        return this.f1877ul;
    }

    public int getMatchNumber() {
        return this.f1892xc;
    }

    public Participant getParticipant(String participantId) {
        return m1884c(this, participantId);
    }

    public String getParticipantId(String playerId) {
        return m1883b(this, playerId);
    }

    public ArrayList<String> getParticipantIds() {
        return m1885c(this);
    }

    public int getParticipantStatus(String participantId) {
        return m1880a((TurnBasedMatch) this, participantId);
    }

    public ArrayList<Participant> getParticipants() {
        return new ArrayList<>(this.f1888wn);
    }

    public String getPendingParticipantId() {
        return this.f1882wW;
    }

    public byte[] getPreviousMatchData() {
        return this.f1891xb;
    }

    public String getRematchId() {
        return this.f1890xa;
    }

    public int getStatus() {
        return this.f1883wX;
    }

    public int getTurnStatus() {
        return this.f1893xd;
    }

    public int getVariant() {
        return this.f1889wo;
    }

    public int getVersion() {
        return this.f1884wY;
    }

    public int getVersionCode() {
        return this.f1876kg;
    }

    public int hashCode() {
        return m1879a(this);
    }

    public boolean isDataValid() {
        return true;
    }

    public boolean isLocallyModified() {
        return this.f1894xe;
    }

    public String toString() {
        return m1882b(this);
    }

    public void writeToParcel(Parcel out, int flags) {
        TurnBasedMatchEntityCreator.m1886a(this, out, flags);
    }
}
