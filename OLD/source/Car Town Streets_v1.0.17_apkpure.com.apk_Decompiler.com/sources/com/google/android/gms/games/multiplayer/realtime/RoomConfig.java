package com.google.android.gms.games.multiplayer.realtime;

import android.os.Bundle;
import com.google.android.gms.internal.eg;
import java.util.ArrayList;
import java.util.Arrays;

public final class RoomConfig {
    private final String uf;
    private final RoomUpdateListener wD;
    private final RoomStatusUpdateListener wE;
    private final RealTimeMessageReceivedListener wF;
    private final String[] wG;
    private final Bundle wH;
    private final boolean wI;
    private final int wo;

    public static final class Builder {
        final RoomUpdateListener wD;
        RoomStatusUpdateListener wE;
        RealTimeMessageReceivedListener wF;
        Bundle wH;
        boolean wI;
        String wJ;
        ArrayList<String> wK;
        int wo;

        private Builder(RoomUpdateListener updateListener) {
            this.wJ = null;
            this.wo = -1;
            this.wK = new ArrayList<>();
            this.wI = false;
            this.wD = (RoomUpdateListener) eg.b(updateListener, (Object) "Must provide a RoomUpdateListener");
        }

        public Builder addPlayersToInvite(ArrayList<String> playerIds) {
            eg.f(playerIds);
            this.wK.addAll(playerIds);
            return this;
        }

        public Builder addPlayersToInvite(String... playerIds) {
            eg.f(playerIds);
            this.wK.addAll(Arrays.asList(playerIds));
            return this;
        }

        public RoomConfig build() {
            return new RoomConfig(this);
        }

        public Builder setAutoMatchCriteria(Bundle autoMatchCriteria) {
            this.wH = autoMatchCriteria;
            return this;
        }

        public Builder setInvitationIdToAccept(String invitationId) {
            eg.f(invitationId);
            this.wJ = invitationId;
            return this;
        }

        public Builder setMessageReceivedListener(RealTimeMessageReceivedListener listener) {
            this.wF = listener;
            return this;
        }

        public Builder setRoomStatusUpdateListener(RoomStatusUpdateListener listener) {
            this.wE = listener;
            return this;
        }

        public Builder setSocketCommunicationEnabled(boolean enableSockets) {
            this.wI = enableSockets;
            return this;
        }

        public Builder setVariant(int variant) {
            eg.b(variant == -1 || variant > 0, (Object) "Variant must be a positive integer or Room.ROOM_VARIANT_ANY");
            this.wo = variant;
            return this;
        }
    }

    private RoomConfig(Builder builder) {
        this.wD = builder.wD;
        this.wE = builder.wE;
        this.wF = builder.wF;
        this.uf = builder.wJ;
        this.wo = builder.wo;
        this.wH = builder.wH;
        this.wI = builder.wI;
        this.wG = (String[]) builder.wK.toArray(new String[builder.wK.size()]);
        if (this.wF == null) {
            eg.a(this.wI, "Must either enable sockets OR specify a message listener");
        }
    }

    public static Builder builder(RoomUpdateListener listener) {
        return new Builder(listener);
    }

    public static Bundle createAutoMatchCriteria(int minAutoMatchPlayers, int maxAutoMatchPlayers, long exclusiveBitMask) {
        Bundle bundle = new Bundle();
        bundle.putInt("min_automatch_players", minAutoMatchPlayers);
        bundle.putInt("max_automatch_players", maxAutoMatchPlayers);
        bundle.putLong("exclusive_bit_mask", exclusiveBitMask);
        return bundle;
    }

    public Bundle getAutoMatchCriteria() {
        return this.wH;
    }

    public String getInvitationId() {
        return this.uf;
    }

    public String[] getInvitedPlayerIds() {
        return this.wG;
    }

    public RealTimeMessageReceivedListener getMessageReceivedListener() {
        return this.wF;
    }

    public RoomStatusUpdateListener getRoomStatusUpdateListener() {
        return this.wE;
    }

    public RoomUpdateListener getRoomUpdateListener() {
        return this.wD;
    }

    public int getVariant() {
        return this.wo;
    }

    public boolean isSocketEnabled() {
        return this.wI;
    }
}
