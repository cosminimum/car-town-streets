package com.google.android.gms.games.multiplayer.turnbased;

import android.os.Bundle;
import com.google.android.gms.internal.C1102eg;
import java.util.ArrayList;

public final class TurnBasedMatchConfig {

    /* renamed from: wG */
    private final String[] f1868wG;

    /* renamed from: wH */
    private final Bundle f1869wH;

    /* renamed from: wT */
    private final int f1870wT;

    /* renamed from: wo */
    private final int f1871wo;

    public static final class Builder {

        /* renamed from: wH */
        Bundle f1872wH;

        /* renamed from: wK */
        ArrayList<String> f1873wK;

        /* renamed from: wT */
        int f1874wT;

        /* renamed from: wo */
        int f1875wo;

        private Builder() {
            this.f1875wo = -1;
            this.f1873wK = new ArrayList<>();
            this.f1872wH = null;
            this.f1874wT = 2;
        }

        public Builder addInvitedPlayer(String playerId) {
            C1102eg.m2616f(playerId);
            this.f1873wK.add(playerId);
            return this;
        }

        public Builder addInvitedPlayers(ArrayList<String> playerIds) {
            C1102eg.m2616f(playerIds);
            this.f1873wK.addAll(playerIds);
            return this;
        }

        public TurnBasedMatchConfig build() {
            return new TurnBasedMatchConfig(this);
        }

        public Builder setAutoMatchCriteria(Bundle autoMatchCriteria) {
            this.f1872wH = autoMatchCriteria;
            return this;
        }

        public Builder setMinPlayers(int minPlayers) {
            this.f1874wT = minPlayers;
            return this;
        }

        public Builder setVariant(int variant) {
            C1102eg.m2615b(variant == -1 || variant > 0, (Object) "Variant must be a positive integer or TurnBasedMatch.MATCH_VARIANT_ANY");
            this.f1875wo = variant;
            return this;
        }
    }

    private TurnBasedMatchConfig(Builder builder) {
        this.f1871wo = builder.f1875wo;
        this.f1870wT = builder.f1874wT;
        this.f1869wH = builder.f1872wH;
        this.f1868wG = (String[]) builder.f1873wK.toArray(new String[builder.f1873wK.size()]);
    }

    public static Builder builder() {
        return new Builder();
    }

    public static Bundle createAutoMatchCriteria(int minAutoMatchPlayers, int maxAutoMatchPlayers, long exclusiveBitMask) {
        Bundle bundle = new Bundle();
        bundle.putInt("min_automatch_players", minAutoMatchPlayers);
        bundle.putInt("max_automatch_players", maxAutoMatchPlayers);
        bundle.putLong("exclusive_bit_mask", exclusiveBitMask);
        return bundle;
    }

    public Bundle getAutoMatchCriteria() {
        return this.f1869wH;
    }

    public String[] getInvitedPlayerIds() {
        return this.f1868wG;
    }

    public int getMinPlayers() {
        return this.f1870wT;
    }

    public int getVariant() {
        return this.f1871wo;
    }
}
