package com.google.android.gms.games.multiplayer;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.games.Game;
import com.google.android.gms.games.GameEntity;
import com.google.android.gms.internal.C1098ee;
import com.google.android.gms.internal.C1102eg;
import com.google.android.gms.internal.C1205fm;
import java.util.ArrayList;

public final class InvitationEntity extends C1205fm implements Invitation {
    public static final Parcelable.Creator<InvitationEntity> CREATOR = new C0835a();

    /* renamed from: kg */
    private final int f1805kg;

    /* renamed from: uf */
    private final String f1806uf;

    /* renamed from: wj */
    private final GameEntity f1807wj;

    /* renamed from: wk */
    private final long f1808wk;

    /* renamed from: wl */
    private final int f1809wl;

    /* renamed from: wm */
    private final ParticipantEntity f1810wm;

    /* renamed from: wn */
    private final ArrayList<ParticipantEntity> f1811wn;

    /* renamed from: wo */
    private final int f1812wo;

    /* renamed from: wp */
    private final int f1813wp;

    /* renamed from: com.google.android.gms.games.multiplayer.InvitationEntity$a */
    static final class C0835a extends C0837a {
        C0835a() {
        }

        /* renamed from: aa */
        public InvitationEntity createFromParcel(Parcel parcel) {
            if (InvitationEntity.m2979c(InvitationEntity.m2473bM()) || InvitationEntity.m2470P(InvitationEntity.class.getCanonicalName())) {
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

    InvitationEntity(int versionCode, GameEntity game, String invitationId, long creationTimestamp, int invitationType, ParticipantEntity inviter, ArrayList<ParticipantEntity> participants, int variant, int availableAutoMatchSlots) {
        this.f1805kg = versionCode;
        this.f1807wj = game;
        this.f1806uf = invitationId;
        this.f1808wk = creationTimestamp;
        this.f1809wl = invitationType;
        this.f1810wm = inviter;
        this.f1811wn = participants;
        this.f1812wo = variant;
        this.f1813wp = availableAutoMatchSlots;
    }

    InvitationEntity(Invitation invitation) {
        this.f1805kg = 2;
        this.f1807wj = new GameEntity(invitation.getGame());
        this.f1806uf = invitation.getInvitationId();
        this.f1808wk = invitation.getCreationTimestamp();
        this.f1809wl = invitation.getInvitationType();
        this.f1812wo = invitation.getVariant();
        this.f1813wp = invitation.getAvailableAutoMatchSlots();
        String participantId = invitation.getInviter().getParticipantId();
        Participant participant = null;
        ArrayList<Participant> participants = invitation.getParticipants();
        int size = participants.size();
        this.f1811wn = new ArrayList<>(size);
        for (int i = 0; i < size; i++) {
            Participant participant2 = participants.get(i);
            if (participant2.getParticipantId().equals(participantId)) {
                participant = participant2;
            }
            this.f1811wn.add((ParticipantEntity) participant2.freeze());
        }
        C1102eg.m2614b(participant, (Object) "Must have a valid inviter!");
        this.f1810wm = (ParticipantEntity) participant.freeze();
    }

    /* renamed from: a */
    static int m1834a(Invitation invitation) {
        return C1098ee.hashCode(invitation.getGame(), invitation.getInvitationId(), Long.valueOf(invitation.getCreationTimestamp()), Integer.valueOf(invitation.getInvitationType()), invitation.getInviter(), invitation.getParticipants(), Integer.valueOf(invitation.getVariant()), Integer.valueOf(invitation.getAvailableAutoMatchSlots()));
    }

    /* renamed from: a */
    static boolean m1835a(Invitation invitation, Object obj) {
        if (!(obj instanceof Invitation)) {
            return false;
        }
        if (invitation == obj) {
            return true;
        }
        Invitation invitation2 = (Invitation) obj;
        return C1098ee.equal(invitation2.getGame(), invitation.getGame()) && C1098ee.equal(invitation2.getInvitationId(), invitation.getInvitationId()) && C1098ee.equal(Long.valueOf(invitation2.getCreationTimestamp()), Long.valueOf(invitation.getCreationTimestamp())) && C1098ee.equal(Integer.valueOf(invitation2.getInvitationType()), Integer.valueOf(invitation.getInvitationType())) && C1098ee.equal(invitation2.getInviter(), invitation.getInviter()) && C1098ee.equal(invitation2.getParticipants(), invitation.getParticipants()) && C1098ee.equal(Integer.valueOf(invitation2.getVariant()), Integer.valueOf(invitation.getVariant())) && C1098ee.equal(Integer.valueOf(invitation2.getAvailableAutoMatchSlots()), Integer.valueOf(invitation.getAvailableAutoMatchSlots()));
    }

    /* renamed from: b */
    static String m1837b(Invitation invitation) {
        return C1098ee.m2604e(invitation).mo7535a("Game", invitation.getGame()).mo7535a("InvitationId", invitation.getInvitationId()).mo7535a("CreationTimestamp", Long.valueOf(invitation.getCreationTimestamp())).mo7535a("InvitationType", Integer.valueOf(invitation.getInvitationType())).mo7535a("Inviter", invitation.getInviter()).mo7535a("Participants", invitation.getParticipants()).mo7535a("Variant", Integer.valueOf(invitation.getVariant())).mo7535a("AvailableAutoMatchSlots", Integer.valueOf(invitation.getAvailableAutoMatchSlots())).toString();
    }

    public int describeContents() {
        return 0;
    }

    public boolean equals(Object obj) {
        return m1835a(this, obj);
    }

    public Invitation freeze() {
        return this;
    }

    public int getAvailableAutoMatchSlots() {
        return this.f1813wp;
    }

    public long getCreationTimestamp() {
        return this.f1808wk;
    }

    public Game getGame() {
        return this.f1807wj;
    }

    public String getInvitationId() {
        return this.f1806uf;
    }

    public int getInvitationType() {
        return this.f1809wl;
    }

    public Participant getInviter() {
        return this.f1810wm;
    }

    public ArrayList<Participant> getParticipants() {
        return new ArrayList<>(this.f1811wn);
    }

    public int getVariant() {
        return this.f1812wo;
    }

    public int getVersionCode() {
        return this.f1805kg;
    }

    public int hashCode() {
        return m1834a(this);
    }

    public boolean isDataValid() {
        return true;
    }

    public String toString() {
        return m1837b((Invitation) this);
    }

    public void writeToParcel(Parcel dest, int flags) {
        if (!mo7449bN()) {
            C0837a.m1852a(this, dest, flags);
            return;
        }
        this.f1807wj.writeToParcel(dest, flags);
        dest.writeString(this.f1806uf);
        dest.writeLong(this.f1808wk);
        dest.writeInt(this.f1809wl);
        this.f1810wm.writeToParcel(dest, flags);
        int size = this.f1811wn.size();
        dest.writeInt(size);
        for (int i = 0; i < size; i++) {
            this.f1811wn.get(i).writeToParcel(dest, flags);
        }
    }
}
