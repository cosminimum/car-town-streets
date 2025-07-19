package com.google.android.gms.games.multiplayer;

import android.os.Parcel;
import com.facebook.internal.ServerProtocol;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.games.Game;
import com.google.android.gms.internal.eg;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final class b extends com.google.android.gms.common.data.b implements Invitation {
    private final Game vG;
    private final ArrayList<Participant> wn;
    private final d wq;

    /* JADX INFO: Access modifiers changed from: package-private */
    public b(DataHolder dataHolder, int i, int i2) {
        super(dataHolder, i);
        this.vG = new com.google.android.gms.games.b(dataHolder, i);
        this.wn = new ArrayList<>(i2);
        String string = getString("external_inviter_id");
        d dVar = null;
        for (int i3 = 0; i3 < i2; i3++) {
            d dVar2 = new d(this.nE, this.nG + i3);
            if (dVar2.getParticipantId().equals(string)) {
                dVar = dVar2;
            }
            this.wn.add(dVar2);
        }
        this.wq = (d) eg.b(dVar, "Must have a valid inviter!");
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // com.google.android.gms.common.data.b
    public boolean equals(Object obj) {
        return InvitationEntity.a(this, obj);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.google.android.gms.common.data.Freezable
    /* renamed from: freeze */
    public Invitation mo358freeze() {
        return new InvitationEntity(this);
    }

    @Override // com.google.android.gms.games.multiplayer.Invitation
    public int getAvailableAutoMatchSlots() {
        if (!getBoolean("has_automatch_criteria")) {
            return 0;
        }
        return getInteger("automatch_max_players");
    }

    @Override // com.google.android.gms.games.multiplayer.Invitation
    public long getCreationTimestamp() {
        return Math.max(getLong("creation_timestamp"), getLong("last_modified_timestamp"));
    }

    @Override // com.google.android.gms.games.multiplayer.Invitation
    public Game getGame() {
        return this.vG;
    }

    @Override // com.google.android.gms.games.multiplayer.Invitation
    public String getInvitationId() {
        return getString("external_invitation_id");
    }

    @Override // com.google.android.gms.games.multiplayer.Invitation
    public int getInvitationType() {
        return getInteger(ServerProtocol.DIALOG_PARAM_TYPE);
    }

    @Override // com.google.android.gms.games.multiplayer.Invitation
    public Participant getInviter() {
        return this.wq;
    }

    @Override // com.google.android.gms.games.multiplayer.Participatable
    public ArrayList<Participant> getParticipants() {
        return this.wn;
    }

    @Override // com.google.android.gms.games.multiplayer.Invitation
    public int getVariant() {
        return getInteger("variant");
    }

    @Override // com.google.android.gms.common.data.b
    public int hashCode() {
        return InvitationEntity.a(this);
    }

    public String toString() {
        return InvitationEntity.b(this);
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        ((InvitationEntity) mo358freeze()).writeToParcel(dest, flags);
    }
}
