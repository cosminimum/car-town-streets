package com.google.android.gms.games.multiplayer.realtime;

import android.database.CharArrayBuffer;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.multiplayer.Participant;
import com.google.android.gms.games.multiplayer.ParticipantEntity;
import com.google.android.gms.internal.ee;
import com.google.android.gms.internal.fc;
import com.google.android.gms.internal.fm;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final class RoomEntity extends fm implements Room {
    public static final Parcelable.Creator<RoomEntity> CREATOR = new a();
    private final int kg;
    private final String sJ;
    private final String uk;
    private final Bundle wH;
    private final String wL;
    private final int wM;
    private final int wN;
    private final long wk;
    private final ArrayList<ParticipantEntity> wn;
    private final int wo;

    /* loaded from: classes.dex */
    static final class a extends b {
        a() {
        }

        @Override // com.google.android.gms.games.multiplayer.realtime.b, android.os.Parcelable.Creator
        /* renamed from: ad */
        public RoomEntity createFromParcel(Parcel parcel) {
            if (RoomEntity.c(RoomEntity.bM()) || RoomEntity.P(RoomEntity.class.getCanonicalName())) {
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

    /* JADX INFO: Access modifiers changed from: package-private */
    public RoomEntity(int versionCode, String roomId, String creatorId, long creationTimestamp, int roomStatus, String description, int variant, Bundle autoMatchCriteria, ArrayList<ParticipantEntity> participants, int autoMatchWaitEstimateSeconds) {
        this.kg = versionCode;
        this.uk = roomId;
        this.wL = creatorId;
        this.wk = creationTimestamp;
        this.wM = roomStatus;
        this.sJ = description;
        this.wo = variant;
        this.wH = autoMatchCriteria;
        this.wn = participants;
        this.wN = autoMatchWaitEstimateSeconds;
    }

    public RoomEntity(Room room) {
        this.kg = 2;
        this.uk = room.getRoomId();
        this.wL = room.getCreatorId();
        this.wk = room.getCreationTimestamp();
        this.wM = room.getStatus();
        this.sJ = room.getDescription();
        this.wo = room.getVariant();
        this.wH = room.getAutoMatchCriteria();
        ArrayList<Participant> participants = room.getParticipants();
        int size = participants.size();
        this.wn = new ArrayList<>(size);
        for (int i = 0; i < size; i++) {
            this.wn.add((ParticipantEntity) participants.get(i).freeze());
        }
        this.wN = room.getAutoMatchWaitEstimateSeconds();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int a(Room room) {
        return ee.hashCode(room.getRoomId(), room.getCreatorId(), Long.valueOf(room.getCreationTimestamp()), Integer.valueOf(room.getStatus()), room.getDescription(), Integer.valueOf(room.getVariant()), room.getAutoMatchCriteria(), room.getParticipants(), Integer.valueOf(room.getAutoMatchWaitEstimateSeconds()));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int a(Room room, String str) {
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

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean a(Room room, Object obj) {
        if (!(obj instanceof Room)) {
            return false;
        }
        if (room == obj) {
            return true;
        }
        Room room2 = (Room) obj;
        return ee.equal(room2.getRoomId(), room.getRoomId()) && ee.equal(room2.getCreatorId(), room.getCreatorId()) && ee.equal(Long.valueOf(room2.getCreationTimestamp()), Long.valueOf(room.getCreationTimestamp())) && ee.equal(Integer.valueOf(room2.getStatus()), Integer.valueOf(room.getStatus())) && ee.equal(room2.getDescription(), room.getDescription()) && ee.equal(Integer.valueOf(room2.getVariant()), Integer.valueOf(room.getVariant())) && ee.equal(room2.getAutoMatchCriteria(), room.getAutoMatchCriteria()) && ee.equal(room2.getParticipants(), room.getParticipants()) && ee.equal(Integer.valueOf(room2.getAutoMatchWaitEstimateSeconds()), Integer.valueOf(room.getAutoMatchWaitEstimateSeconds()));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String b(Room room) {
        return ee.e(room).a("RoomId", room.getRoomId()).a("CreatorId", room.getCreatorId()).a("CreationTimestamp", Long.valueOf(room.getCreationTimestamp())).a("RoomStatus", Integer.valueOf(room.getStatus())).a("Description", room.getDescription()).a("Variant", Integer.valueOf(room.getVariant())).a("AutoMatchCriteria", room.getAutoMatchCriteria()).a("Participants", room.getParticipants()).a("AutoMatchWaitEstimateSeconds", Integer.valueOf(room.getAutoMatchWaitEstimateSeconds())).toString();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String b(Room room, String str) {
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

    /* JADX INFO: Access modifiers changed from: package-private */
    public static Participant c(Room room, String str) {
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

    /* JADX INFO: Access modifiers changed from: package-private */
    public static ArrayList<String> c(Room room) {
        ArrayList<Participant> participants = room.getParticipants();
        int size = participants.size();
        ArrayList<String> arrayList = new ArrayList<>(size);
        for (int i = 0; i < size; i++) {
            arrayList.add(participants.get(i).getParticipantId());
        }
        return arrayList;
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
    public Room mo358freeze() {
        return this;
    }

    @Override // com.google.android.gms.games.multiplayer.realtime.Room
    public Bundle getAutoMatchCriteria() {
        return this.wH;
    }

    @Override // com.google.android.gms.games.multiplayer.realtime.Room
    public int getAutoMatchWaitEstimateSeconds() {
        return this.wN;
    }

    @Override // com.google.android.gms.games.multiplayer.realtime.Room
    public long getCreationTimestamp() {
        return this.wk;
    }

    @Override // com.google.android.gms.games.multiplayer.realtime.Room
    public String getCreatorId() {
        return this.wL;
    }

    @Override // com.google.android.gms.games.multiplayer.realtime.Room
    public String getDescription() {
        return this.sJ;
    }

    @Override // com.google.android.gms.games.multiplayer.realtime.Room
    public void getDescription(CharArrayBuffer dataOut) {
        fc.b(this.sJ, dataOut);
    }

    @Override // com.google.android.gms.games.multiplayer.realtime.Room
    public Participant getParticipant(String participantId) {
        return c(this, participantId);
    }

    @Override // com.google.android.gms.games.multiplayer.realtime.Room
    public String getParticipantId(String playerId) {
        return b(this, playerId);
    }

    @Override // com.google.android.gms.games.multiplayer.realtime.Room
    public ArrayList<String> getParticipantIds() {
        return c(this);
    }

    @Override // com.google.android.gms.games.multiplayer.realtime.Room
    public int getParticipantStatus(String participantId) {
        return a((Room) this, participantId);
    }

    @Override // com.google.android.gms.games.multiplayer.Participatable
    public ArrayList<Participant> getParticipants() {
        return new ArrayList<>(this.wn);
    }

    @Override // com.google.android.gms.games.multiplayer.realtime.Room
    public String getRoomId() {
        return this.uk;
    }

    @Override // com.google.android.gms.games.multiplayer.realtime.Room
    public int getStatus() {
        return this.wM;
    }

    @Override // com.google.android.gms.games.multiplayer.realtime.Room
    public int getVariant() {
        return this.wo;
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

    public String toString() {
        return b(this);
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        if (!bN()) {
            b.a(this, dest, flags);
            return;
        }
        dest.writeString(this.uk);
        dest.writeString(this.wL);
        dest.writeLong(this.wk);
        dest.writeInt(this.wM);
        dest.writeString(this.sJ);
        dest.writeInt(this.wo);
        dest.writeBundle(this.wH);
        int size = this.wn.size();
        dest.writeInt(size);
        for (int i = 0; i < size; i++) {
            this.wn.get(i).writeToParcel(dest, flags);
        }
    }
}
