package com.google.android.gms.games.multiplayer;

import android.os.Parcel;
import com.facebook.internal.ServerProtocol;
import com.google.android.gms.common.data.C0663b;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.games.C0824b;
import com.google.android.gms.games.Game;
import com.google.android.gms.internal.C1102eg;
import java.util.ArrayList;

/* renamed from: com.google.android.gms.games.multiplayer.b */
public final class C0838b extends C0663b implements Invitation {

    /* renamed from: vG */
    private final Game f1829vG;

    /* renamed from: wn */
    private final ArrayList<Participant> f1830wn;

    /* renamed from: wq */
    private final C0840d f1831wq;

    C0838b(DataHolder dataHolder, int i, int i2) {
        super(dataHolder, i);
        this.f1829vG = new C0824b(dataHolder, i);
        this.f1830wn = new ArrayList<>(i2);
        String string = getString("external_inviter_id");
        C0840d dVar = null;
        for (int i3 = 0; i3 < i2; i3++) {
            C0840d dVar2 = new C0840d(this.f1386nE, this.f1387nG + i3);
            if (dVar2.getParticipantId().equals(string)) {
                dVar = dVar2;
            }
            this.f1830wn.add(dVar2);
        }
        this.f1831wq = (C0840d) C1102eg.m2614b(dVar, (Object) "Must have a valid inviter!");
    }

    public int describeContents() {
        return 0;
    }

    public boolean equals(Object obj) {
        return InvitationEntity.m1835a(this, obj);
    }

    public Invitation freeze() {
        return new InvitationEntity(this);
    }

    public int getAvailableAutoMatchSlots() {
        if (!getBoolean("has_automatch_criteria")) {
            return 0;
        }
        return getInteger("automatch_max_players");
    }

    public long getCreationTimestamp() {
        return Math.max(getLong("creation_timestamp"), getLong("last_modified_timestamp"));
    }

    public Game getGame() {
        return this.f1829vG;
    }

    public String getInvitationId() {
        return getString("external_invitation_id");
    }

    public int getInvitationType() {
        return getInteger(ServerProtocol.DIALOG_PARAM_TYPE);
    }

    public Participant getInviter() {
        return this.f1831wq;
    }

    public ArrayList<Participant> getParticipants() {
        return this.f1830wn;
    }

    public int getVariant() {
        return getInteger("variant");
    }

    public int hashCode() {
        return InvitationEntity.m1834a(this);
    }

    public String toString() {
        return InvitationEntity.m1837b((Invitation) this);
    }

    public void writeToParcel(Parcel dest, int flags) {
        ((InvitationEntity) freeze()).writeToParcel(dest, flags);
    }
}
