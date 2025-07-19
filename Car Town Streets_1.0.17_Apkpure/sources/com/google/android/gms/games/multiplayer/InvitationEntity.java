package com.google.android.gms.games.multiplayer;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.games.Game;
import com.google.android.gms.games.GameEntity;
import com.google.android.gms.internal.ee;
import com.google.android.gms.internal.eg;
import com.google.android.gms.internal.fm;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final class InvitationEntity extends fm implements Invitation {
    public static final Parcelable.Creator<InvitationEntity> CREATOR = new a();
    private final int kg;
    private final String uf;
    private final GameEntity wj;
    private final long wk;
    private final int wl;
    private final ParticipantEntity wm;
    private final ArrayList<ParticipantEntity> wn;
    private final int wo;
    private final int wp;

    /* loaded from: classes.dex */
    static final class a extends com.google.android.gms.games.multiplayer.a {
        a() {
        }

        @Override // com.google.android.gms.games.multiplayer.a, android.os.Parcelable.Creator
        /* renamed from: aa */
        public InvitationEntity createFromParcel(Parcel parcel) {
            if (InvitationEntity.c(InvitationEntity.bM()) || InvitationEntity.P(InvitationEntity.class.getCanonicalName())) {
                return super.createFromParcel(parcel);
            }
            GameEntity createFromParcel = GameEntity.CREATOR.createFromParcel(parcel);
            String readString = parcel.readString();
            long readLong = parcel.readLong();
            int readInt = parcel.readInt();
            ParticipantEntity createFromParcel2 = ParticipantEntity.CREATOR.createFromParcel(parcel);
            int readInt2 = parcel.readInt();
            ArrayList arrayList = new ArrayList(readInt2);
            for (int i = 0; i < readInt2; i++) {
                arrayList.add(ParticipantEntity.CREATOR.createFromParcel(parcel));
            }
            return new InvitationEntity(2, createFromParcel, readString, readLong, readInt, createFromParcel2, arrayList, -1, 0);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public InvitationEntity(int versionCode, GameEntity game, String invitationId, long creationTimestamp, int invitationType, ParticipantEntity inviter, ArrayList<ParticipantEntity> participants, int variant, int availableAutoMatchSlots) {
        this.kg = versionCode;
        this.wj = game;
        this.uf = invitationId;
        this.wk = creationTimestamp;
        this.wl = invitationType;
        this.wm = inviter;
        this.wn = participants;
        this.wo = variant;
        this.wp = availableAutoMatchSlots;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public InvitationEntity(Invitation invitation) {
        this.kg = 2;
        this.wj = new GameEntity(invitation.getGame());
        this.uf = invitation.getInvitationId();
        this.wk = invitation.getCreationTimestamp();
        this.wl = invitation.getInvitationType();
        this.wo = invitation.getVariant();
        this.wp = invitation.getAvailableAutoMatchSlots();
        String participantId = invitation.getInviter().getParticipantId();
        Participant participant = null;
        ArrayList<Participant> participants = invitation.getParticipants();
        int size = participants.size();
        this.wn = new ArrayList<>(size);
        for (int i = 0; i < size; i++) {
            Participant participant2 = participants.get(i);
            if (participant2.getParticipantId().equals(participantId)) {
                participant = participant2;
            }
            this.wn.add((ParticipantEntity) participant2.freeze());
        }
        eg.b(participant, "Must have a valid inviter!");
        this.wm = (ParticipantEntity) participant.freeze();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int a(Invitation invitation) {
        return ee.hashCode(invitation.getGame(), invitation.getInvitationId(), Long.valueOf(invitation.getCreationTimestamp()), Integer.valueOf(invitation.getInvitationType()), invitation.getInviter(), invitation.getParticipants(), Integer.valueOf(invitation.getVariant()), Integer.valueOf(invitation.getAvailableAutoMatchSlots()));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean a(Invitation invitation, Object obj) {
        if (!(obj instanceof Invitation)) {
            return false;
        }
        if (invitation == obj) {
            return true;
        }
        Invitation invitation2 = (Invitation) obj;
        return ee.equal(invitation2.getGame(), invitation.getGame()) && ee.equal(invitation2.getInvitationId(), invitation.getInvitationId()) && ee.equal(Long.valueOf(invitation2.getCreationTimestamp()), Long.valueOf(invitation.getCreationTimestamp())) && ee.equal(Integer.valueOf(invitation2.getInvitationType()), Integer.valueOf(invitation.getInvitationType())) && ee.equal(invitation2.getInviter(), invitation.getInviter()) && ee.equal(invitation2.getParticipants(), invitation.getParticipants()) && ee.equal(Integer.valueOf(invitation2.getVariant()), Integer.valueOf(invitation.getVariant())) && ee.equal(Integer.valueOf(invitation2.getAvailableAutoMatchSlots()), Integer.valueOf(invitation.getAvailableAutoMatchSlots()));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String b(Invitation invitation) {
        return ee.e(invitation).a("Game", invitation.getGame()).a("InvitationId", invitation.getInvitationId()).a("CreationTimestamp", Long.valueOf(invitation.getCreationTimestamp())).a("InvitationType", Integer.valueOf(invitation.getInvitationType())).a("Inviter", invitation.getInviter()).a("Participants", invitation.getParticipants()).a("Variant", Integer.valueOf(invitation.getVariant())).a("AvailableAutoMatchSlots", Integer.valueOf(invitation.getAvailableAutoMatchSlots())).toString();
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
    public Invitation mo358freeze() {
        return this;
    }

    @Override // com.google.android.gms.games.multiplayer.Invitation
    public int getAvailableAutoMatchSlots() {
        return this.wp;
    }

    @Override // com.google.android.gms.games.multiplayer.Invitation
    public long getCreationTimestamp() {
        return this.wk;
    }

    @Override // com.google.android.gms.games.multiplayer.Invitation
    public Game getGame() {
        return this.wj;
    }

    @Override // com.google.android.gms.games.multiplayer.Invitation
    public String getInvitationId() {
        return this.uf;
    }

    @Override // com.google.android.gms.games.multiplayer.Invitation
    public int getInvitationType() {
        return this.wl;
    }

    @Override // com.google.android.gms.games.multiplayer.Invitation
    public Participant getInviter() {
        return this.wm;
    }

    @Override // com.google.android.gms.games.multiplayer.Participatable
    public ArrayList<Participant> getParticipants() {
        return new ArrayList<>(this.wn);
    }

    @Override // com.google.android.gms.games.multiplayer.Invitation
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
            com.google.android.gms.games.multiplayer.a.a(this, dest, flags);
            return;
        }
        this.wj.writeToParcel(dest, flags);
        dest.writeString(this.uf);
        dest.writeLong(this.wk);
        dest.writeInt(this.wl);
        this.wm.writeToParcel(dest, flags);
        int size = this.wn.size();
        dest.writeInt(size);
        for (int i = 0; i < size; i++) {
            this.wn.get(i).writeToParcel(dest, flags);
        }
    }
}
