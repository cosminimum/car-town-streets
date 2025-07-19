package com.google.android.gms.games.multiplayer.realtime;

import android.database.CharArrayBuffer;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.multiplayer.Participant;
import com.google.android.gms.games.multiplayer.ParticipantEntity;
import com.google.android.gms.internal.C1098ee;
import com.google.android.gms.internal.C1131fc;
import com.google.android.gms.internal.C1205fm;
import java.util.ArrayList;

public final class RoomEntity extends C1205fm implements Room {
    public static final Parcelable.Creator<RoomEntity> CREATOR = new C0843a();

    /* renamed from: kg */
    private final int f1852kg;

    /* renamed from: sJ */
    private final String f1853sJ;

    /* renamed from: uk */
    private final String f1854uk;

    /* renamed from: wH */
    private final Bundle f1855wH;

    /* renamed from: wL */
    private final String f1856wL;

    /* renamed from: wM */
    private final int f1857wM;

    /* renamed from: wN */
    private final int f1858wN;

    /* renamed from: wk */
    private final long f1859wk;

    /* renamed from: wn */
    private final ArrayList<ParticipantEntity> f1860wn;

    /* renamed from: wo */
    private final int f1861wo;

    /* renamed from: com.google.android.gms.games.multiplayer.realtime.RoomEntity$a */
    static final class C0843a extends C0845b {
        C0843a() {
        }

        /* renamed from: ad */
        public RoomEntity createFromParcel(Parcel parcel) {
            if (RoomEntity.m2979c(RoomEntity.m2473bM()) || RoomEntity.m2470P(RoomEntity.class.getCanonicalName())) {
                return super.createFromParcel(parcel);
            }
            String readString = parcel.readString();
            String readString2 = parcel.readString();
            long readLong = parcel.readLong();
            int readInt = parcel.readInt();
            String readString3 = parcel.readString();
            int readInt2 = parcel.readInt();
            Bundle readBundle = parcel.readBundle();
            int readInt3 = parcel.readInt();
            ArrayList arrayList = new ArrayList(readInt3);
            for (int i = 0; i < readInt3; i++) {
                arrayList.add(ParticipantEntity.CREATOR.createFromParcel(parcel));
            }
            return new RoomEntity(2, readString, readString2, readLong, readInt, readString3, readInt2, readBundle, arrayList, -1);
        }
    }

    RoomEntity(int versionCode, String roomId, String creatorId, long creationTimestamp, int roomStatus, String description, int variant, Bundle autoMatchCriteria, ArrayList<ParticipantEntity> participants, int autoMatchWaitEstimateSeconds) {
        this.f1852kg = versionCode;
        this.f1854uk = roomId;
        this.f1856wL = creatorId;
        this.f1859wk = creationTimestamp;
        this.f1857wM = roomStatus;
        this.f1853sJ = description;
        this.f1861wo = variant;
        this.f1855wH = autoMatchCriteria;
        this.f1860wn = participants;
        this.f1858wN = autoMatchWaitEstimateSeconds;
    }

    public RoomEntity(Room room) {
        this.f1852kg = 2;
        this.f1854uk = room.getRoomId();
        this.f1856wL = room.getCreatorId();
        this.f1859wk = room.getCreationTimestamp();
        this.f1857wM = room.getStatus();
        this.f1853sJ = room.getDescription();
        this.f1861wo = room.getVariant();
        this.f1855wH = room.getAutoMatchCriteria();
        ArrayList<Participant> participants = room.getParticipants();
        int size = participants.size();
        this.f1860wn = new ArrayList<>(size);
        for (int i = 0; i < size; i++) {
            this.f1860wn.add((ParticipantEntity) participants.get(i).freeze());
        }
        this.f1858wN = room.getAutoMatchWaitEstimateSeconds();
    }

    /* renamed from: a */
    static int m1861a(Room room) {
        return C1098ee.hashCode(room.getRoomId(), room.getCreatorId(), Long.valueOf(room.getCreationTimestamp()), Integer.valueOf(room.getStatus()), room.getDescription(), Integer.valueOf(room.getVariant()), room.getAutoMatchCriteria(), room.getParticipants(), Integer.valueOf(room.getAutoMatchWaitEstimateSeconds()));
    }

    /* renamed from: a */
    static int m1862a(Room room, String str) {
        ArrayList<Participant> participants = room.getParticipants();
        int size = participants.size();
        for (int i = 0; i < size; i++) {
            Participant participant = participants.get(i);
            if (participant.getParticipantId().equals(str)) {
                return participant.getStatus();
            }
        }
        throw new IllegalStateException("Participant " + str + " is not in room " + room.getRoomId());
    }

    /* renamed from: a */
    static boolean m1863a(Room room, Object obj) {
        if (!(obj instanceof Room)) {
            return false;
        }
        if (room == obj) {
            return true;
        }
        Room room2 = (Room) obj;
        return C1098ee.equal(room2.getRoomId(), room.getRoomId()) && C1098ee.equal(room2.getCreatorId(), room.getCreatorId()) && C1098ee.equal(Long.valueOf(room2.getCreationTimestamp()), Long.valueOf(room.getCreationTimestamp())) && C1098ee.equal(Integer.valueOf(room2.getStatus()), Integer.valueOf(room.getStatus())) && C1098ee.equal(room2.getDescription(), room.getDescription()) && C1098ee.equal(Integer.valueOf(room2.getVariant()), Integer.valueOf(room.getVariant())) && C1098ee.equal(room2.getAutoMatchCriteria(), room.getAutoMatchCriteria()) && C1098ee.equal(room2.getParticipants(), room.getParticipants()) && C1098ee.equal(Integer.valueOf(room2.getAutoMatchWaitEstimateSeconds()), Integer.valueOf(room.getAutoMatchWaitEstimateSeconds()));
    }

    /* renamed from: b */
    static String m1865b(Room room) {
        return C1098ee.m2604e(room).mo7535a("RoomId", room.getRoomId()).mo7535a("CreatorId", room.getCreatorId()).mo7535a("CreationTimestamp", Long.valueOf(room.getCreationTimestamp())).mo7535a("RoomStatus", Integer.valueOf(room.getStatus())).mo7535a("Description", room.getDescription()).mo7535a("Variant", Integer.valueOf(room.getVariant())).mo7535a("AutoMatchCriteria", room.getAutoMatchCriteria()).mo7535a("Participants", room.getParticipants()).mo7535a("AutoMatchWaitEstimateSeconds", Integer.valueOf(room.getAutoMatchWaitEstimateSeconds())).toString();
    }

    /* renamed from: b */
    static String m1866b(Room room, String str) {
        ArrayList<Participant> participants = room.getParticipants();
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
    static Participant m1868c(Room room, String str) {
        ArrayList<Participant> participants = room.getParticipants();
        int size = participants.size();
        for (int i = 0; i < size; i++) {
            Participant participant = participants.get(i);
            if (participant.getParticipantId().equals(str)) {
                return participant;
            }
        }
        throw new IllegalStateException("Participant " + str + " is not in match " + room.getRoomId());
    }

    /* renamed from: c */
    static ArrayList<String> m1869c(Room room) {
        ArrayList<Participant> participants = room.getParticipants();
        int size = participants.size();
        ArrayList<String> arrayList = new ArrayList<>(size);
        for (int i = 0; i < size; i++) {
            arrayList.add(participants.get(i).getParticipantId());
        }
        return arrayList;
    }

    public int describeContents() {
        return 0;
    }

    public boolean equals(Object obj) {
        return m1863a((Room) this, obj);
    }

    public Room freeze() {
        return this;
    }

    public Bundle getAutoMatchCriteria() {
        return this.f1855wH;
    }

    public int getAutoMatchWaitEstimateSeconds() {
        return this.f1858wN;
    }

    public long getCreationTimestamp() {
        return this.f1859wk;
    }

    public String getCreatorId() {
        return this.f1856wL;
    }

    public String getDescription() {
        return this.f1853sJ;
    }

    public void getDescription(CharArrayBuffer dataOut) {
        C1131fc.m2759b(this.f1853sJ, dataOut);
    }

    public Participant getParticipant(String participantId) {
        return m1868c(this, participantId);
    }

    public String getParticipantId(String playerId) {
        return m1866b(this, playerId);
    }

    public ArrayList<String> getParticipantIds() {
        return m1869c(this);
    }

    public int getParticipantStatus(String participantId) {
        return m1862a((Room) this, participantId);
    }

    public ArrayList<Participant> getParticipants() {
        return new ArrayList<>(this.f1860wn);
    }

    public String getRoomId() {
        return this.f1854uk;
    }

    public int getStatus() {
        return this.f1857wM;
    }

    public int getVariant() {
        return this.f1861wo;
    }

    public int getVersionCode() {
        return this.f1852kg;
    }

    public int hashCode() {
        return m1861a(this);
    }

    public boolean isDataValid() {
        return true;
    }

    public String toString() {
        return m1865b((Room) this);
    }

    public void writeToParcel(Parcel dest, int flags) {
        if (!mo7449bN()) {
            C0845b.m1874a(this, dest, flags);
            return;
        }
        dest.writeString(this.f1854uk);
        dest.writeString(this.f1856wL);
        dest.writeLong(this.f1859wk);
        dest.writeInt(this.f1857wM);
        dest.writeString(this.f1853sJ);
        dest.writeInt(this.f1861wo);
        dest.writeBundle(this.f1855wH);
        int size = this.f1860wn.size();
        dest.writeInt(size);
        for (int i = 0; i < size; i++) {
            this.f1860wn.get(i).writeToParcel(dest, flags);
        }
    }
}
