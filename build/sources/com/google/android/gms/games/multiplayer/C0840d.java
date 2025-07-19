package com.google.android.gms.games.multiplayer;

import android.database.CharArrayBuffer;
import android.net.Uri;
import android.os.Parcel;
import com.google.android.gms.common.data.C0663b;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.games.C0826d;
import com.google.android.gms.games.Player;

/* renamed from: com.google.android.gms.games.multiplayer.d */
public final class C0840d extends C0663b implements Participant {

    /* renamed from: wx */
    private final C0826d f1832wx;

    public C0840d(DataHolder dataHolder, int i) {
        super(dataHolder, i);
        this.f1832wx = new C0826d(dataHolder, i);
    }

    public int describeContents() {
        return 0;
    }

    /* renamed from: dy */
    public String mo6760dy() {
        return getString("client_address");
    }

    public boolean equals(Object obj) {
        return ParticipantEntity.m1843a(this, obj);
    }

    public Participant freeze() {
        return new ParticipantEntity(this);
    }

    public int getCapabilities() {
        return getInteger("capabilities");
    }

    public String getDisplayName() {
        return mo5975M("external_player_id") ? getString("default_display_name") : this.f1832wx.getDisplayName();
    }

    public void getDisplayName(CharArrayBuffer dataOut) {
        if (mo5975M("external_player_id")) {
            mo5976a("default_display_name", dataOut);
        } else {
            this.f1832wx.getDisplayName(dataOut);
        }
    }

    public Uri getHiResImageUri() {
        return mo5975M("external_player_id") ? mo5974L("default_display_hi_res_image_uri") : this.f1832wx.getHiResImageUri();
    }

    public Uri getIconImageUri() {
        return mo5975M("external_player_id") ? mo5974L("default_display_image_uri") : this.f1832wx.getIconImageUri();
    }

    public String getParticipantId() {
        return getString("external_participant_id");
    }

    public Player getPlayer() {
        if (mo5975M("external_player_id")) {
            return null;
        }
        return this.f1832wx;
    }

    public ParticipantResult getResult() {
        if (mo5975M("result_type")) {
            return null;
        }
        return new ParticipantResult(getParticipantId(), getInteger("result_type"), getInteger("placing"));
    }

    public int getStatus() {
        return getInteger("player_status");
    }

    public int hashCode() {
        return ParticipantEntity.m1842a(this);
    }

    public boolean isConnectedToRoom() {
        return getInteger("connected") > 0;
    }

    public String toString() {
        return ParticipantEntity.m1845b((Participant) this);
    }

    public void writeToParcel(Parcel dest, int flags) {
        ((ParticipantEntity) freeze()).writeToParcel(dest, flags);
    }
}
