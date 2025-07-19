package com.google.android.gms.games.multiplayer;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcel;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.games.Player;
/* loaded from: classes.dex */
public final class d extends com.google.android.gms.common.data.b implements Participant {
    private final com.google.android.gms.games.d wx;

    public d(DataHolder dataHolder, int i) {
        super(dataHolder, i);
        this.wx = new com.google.android.gms.games.d(dataHolder, i);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // com.google.android.gms.games.multiplayer.Participant
    public String dy() {
        return getString("client_address");
    }

    @Override // com.google.android.gms.common.data.b
    public boolean equals(Object obj) {
        return ParticipantEntity.a(this, obj);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.google.android.gms.common.data.Freezable
    /* renamed from: freeze */
    public Participant mo358freeze() {
        return new ParticipantEntity(this);
    }

    @Override // com.google.android.gms.games.multiplayer.Participant
    public int getCapabilities() {
        return getInteger("capabilities");
    }

    @Override // com.google.android.gms.games.multiplayer.Participant
    public String getDisplayName() {
        return M("external_player_id") ? getString("default_display_name") : this.wx.getDisplayName();
    }

    @Override // com.google.android.gms.games.multiplayer.Participant
    public void getDisplayName(CharArrayBuffer dataOut) {
        if (M("external_player_id")) {
            a("default_display_name", dataOut);
        } else {
            this.wx.getDisplayName(dataOut);
        }
    }

    @Override // com.google.android.gms.games.multiplayer.Participant
    public Uri getHiResImageUri() {
        return M("external_player_id") ? L("default_display_hi_res_image_uri") : this.wx.getHiResImageUri();
    }

    @Override // com.google.android.gms.games.multiplayer.Participant
    public Uri getIconImageUri() {
        return M("external_player_id") ? L("default_display_image_uri") : this.wx.getIconImageUri();
    }

    @Override // com.google.android.gms.games.multiplayer.Participant
    public String getParticipantId() {
        return getString("external_participant_id");
    }

    @Override // com.google.android.gms.games.multiplayer.Participant
    public Player getPlayer() {
        if (M("external_player_id")) {
            return null;
        }
        return this.wx;
    }

    @Override // com.google.android.gms.games.multiplayer.Participant
    public ParticipantResult getResult() {
        if (M("result_type")) {
            return null;
        }
        return new ParticipantResult(getParticipantId(), getInteger("result_type"), getInteger("placing"));
    }

    @Override // com.google.android.gms.games.multiplayer.Participant
    public int getStatus() {
        return getInteger("player_status");
    }

    @Override // com.google.android.gms.common.data.b
    public int hashCode() {
        return ParticipantEntity.a(this);
    }

    @Override // com.google.android.gms.games.multiplayer.Participant
    public boolean isConnectedToRoom() {
        return getInteger("connected") > 0;
    }

    public String toString() {
        return ParticipantEntity.b(this);
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        ((ParticipantEntity) mo358freeze()).writeToParcel(dest, flags);
    }
}
