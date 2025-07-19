package com.google.android.gms.games.multiplayer.realtime;

import android.os.Bundle;
import com.google.android.gms.internal.C1102eg;
import java.util.ArrayList;
import java.util.Arrays;

public final class RoomConfig {

    /* renamed from: uf */
    private final String f1836uf;

    /* renamed from: wD */
    private final RoomUpdateListener f1837wD;

    /* renamed from: wE */
    private final RoomStatusUpdateListener f1838wE;

    /* renamed from: wF */
    private final RealTimeMessageReceivedListener f1839wF;

    /* renamed from: wG */
    private final String[] f1840wG;

    /* renamed from: wH */
    private final Bundle f1841wH;

    /* renamed from: wI */
    private final boolean f1842wI;

    /* renamed from: wo */
    private final int f1843wo;

    public static final class Builder {

        /* renamed from: wD */
        final RoomUpdateListener f1844wD;

        /* renamed from: wE */
        RoomStatusUpdateListener f1845wE;

        /* renamed from: wF */
        RealTimeMessageReceivedListener f1846wF;

        /* renamed from: wH */
        Bundle f1847wH;

        /* renamed from: wI */
        boolean f1848wI;

        /* renamed from: wJ */
        String f1849wJ;

        /* renamed from: wK */
        ArrayList<String> f1850wK;

        /* renamed from: wo */
        int f1851wo;

        private Builder(RoomUpdateListener updateListener) {
            this.f1849wJ = null;
            this.f1851wo = -1;
            this.f1850wK = new ArrayList<>();
            this.f1848wI = false;
            this.f1844wD = (RoomUpdateListener) C1102eg.m2614b(updateListener, (Object) "Must provide a RoomUpdateListener");
        }

        public Builder addPlayersToInvite(ArrayList<String> playerIds) {
            C1102eg.m2616f(playerIds);
            this.f1850wK.addAll(playerIds);
            return this;
        }

        public Builder addPlayersToInvite(String... playerIds) {
            C1102eg.m2616f(playerIds);
            this.f1850wK.addAll(Arrays.asList(playerIds));
            return this;
        }

        public RoomConfig build() {
            return new RoomConfig(this);
        }

        public Builder setAutoMatchCriteria(Bundle autoMatchCriteria) {
            this.f1847wH = autoMatchCriteria;
            return this;
        }

        public Builder setInvitationIdToAccept(String invitationId) {
            C1102eg.m2616f(invitationId);
            this.f1849wJ = invitationId;
            return this;
        }

        public Builder setMessageReceivedListener(RealTimeMessageReceivedListener listener) {
            this.f1846wF = listener;
            return this;
        }

        public Builder setRoomStatusUpdateListener(RoomStatusUpdateListener listener) {
            this.f1845wE = listener;
            return this;
        }

        public Builder setSocketCommunicationEnabled(boolean enableSockets) {
            this.f1848wI = enableSockets;
            return this;
        }

        public Builder setVariant(int variant) {
            C1102eg.m2615b(variant == -1 || variant > 0, (Object) "Variant must be a positive integer or Room.ROOM_VARIANT_ANY");
            this.f1851wo = variant;
            return this;
        }
    }

    private RoomConfig(Builder builder) {
        this.f1837wD = builder.f1844wD;
        this.f1838wE = builder.f1845wE;
        this.f1839wF = builder.f1846wF;
        this.f1836uf = builder.f1849wJ;
        this.f1843wo = builder.f1851wo;
        this.f1841wH = builder.f1847wH;
        this.f1842wI = builder.f1848wI;
        this.f1840wG = (String[]) builder.f1850wK.toArray(new String[builder.f1850wK.size()]);
        if (this.f1839wF == null) {
            C1102eg.m2612a(this.f1842wI, "Must either enable sockets OR specify a message listener");
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
        return this.f1841wH;
    }

    public String getInvitationId() {
        return this.f1836uf;
    }

    public String[] getInvitedPlayerIds() {
        return this.f1840wG;
    }

    public RealTimeMessageReceivedListener getMessageReceivedListener() {
        return this.f1839wF;
    }

    public RoomStatusUpdateListener getRoomStatusUpdateListener() {
        return this.f1838wE;
    }

    public RoomUpdateListener getRoomUpdateListener() {
        return this.f1837wD;
    }

    public int getVariant() {
        return this.f1843wo;
    }

    public boolean isSocketEnabled() {
        return this.f1842wI;
    }
}
