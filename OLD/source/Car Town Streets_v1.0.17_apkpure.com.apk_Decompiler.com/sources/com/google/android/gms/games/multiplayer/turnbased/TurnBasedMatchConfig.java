package com.google.android.gms.games.multiplayer.turnbased;

import android.os.Bundle;
import com.google.android.gms.internal.eg;
import java.util.ArrayList;

public final class TurnBasedMatchConfig {
    private final String[] wG;
    private final Bundle wH;
    private final int wT;
    private final int wo;

    public static final class Builder {
        Bundle wH;
        ArrayList<String> wK;
        int wT;
        int wo;

        private Builder() {
            this.wo = -1;
            this.wK = new ArrayList<>();
            this.wH = null;
            this.wT = 2;
        }

        public Builder addInvitedPlayer(String playerId) {
            eg.f(playerId);
            this.wK.add(playerId);
            return this;
        }

        public Builder addInvitedPlayers(ArrayList<String> playerIds) {
            eg.f(playerIds);
            this.wK.addAll(playerIds);
            return this;
        }

        public TurnBasedMatchConfig build() {
            return new TurnBasedMatchConfig(this);
        }

        public Builder setAutoMatchCriteria(Bundle autoMatchCriteria) {
            this.wH = autoMatchCriteria;
            return this;
        }

        public Builder setMinPlayers(int minPlayers) {
            this.wT = minPlayers;
            return this;
        }

        public Builder setVariant(int variant) {
            eg.b(variant == -1 || variant > 0, (Object) "Variant must be a positive integer or TurnBasedMatch.MATCH_VARIANT_ANY");
            this.wo = variant;
            return this;
        }
    }

    private TurnBasedMatchConfig(Builder builder) {
        this.wo = builder.wo;
        this.wT = builder.wT;
        this.wH = builder.wH;
        this.wG = (String[]) builder.wK.toArray(new String[builder.wK.size()]);
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
        return this.wH;
    }

    public String[] getInvitedPlayerIds() {
        return this.wG;
    }

    public int getMinPlayers() {
        return this.wT;
    }

    public int getVariant() {
        return this.wo;
    }
}
