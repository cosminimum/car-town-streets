package com.google.android.gms.internal;

import android.content.Intent;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.a;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.games.Games;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.PlayerBuffer;
import com.google.android.gms.games.Players;
/* loaded from: classes.dex */
public final class fz implements Players {

    /* loaded from: classes.dex */
    private static abstract class a extends Games.a<Players.LoadPlayersResult> {
        private a() {
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: B */
        public Players.LoadPlayersResult e(final Status status) {
            return new Players.LoadPlayersResult() { // from class: com.google.android.gms.internal.fz.a.1
                @Override // com.google.android.gms.games.Players.LoadPlayersResult
                public PlayerBuffer getPlayers() {
                    return new PlayerBuffer(DataHolder.empty(14));
                }

                @Override // com.google.android.gms.common.api.Result
                public Status getStatus() {
                    return status;
                }

                @Override // com.google.android.gms.common.api.Releasable
                public void release() {
                }
            };
        }
    }

    @Override // com.google.android.gms.games.Players
    public Player getCurrentPlayer(GoogleApiClient apiClient) {
        return Games.j(apiClient).getCurrentPlayer();
    }

    @Override // com.google.android.gms.games.Players
    public String getCurrentPlayerId(GoogleApiClient apiClient) {
        return Games.j(apiClient).getCurrentPlayerId();
    }

    @Override // com.google.android.gms.games.Players
    public Intent getPlayerSearchIntent(GoogleApiClient apiClient) {
        return Games.j(apiClient).getPlayerSearchIntent();
    }

    @Override // com.google.android.gms.games.Players
    public PendingResult<Players.LoadPlayersResult> loadInvitablePlayers(GoogleApiClient apiClient, final int pageSize, final boolean forceReload) {
        return apiClient.a((GoogleApiClient) new a() { // from class: com.google.android.gms.internal.fz.2
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.a((a.c<Players.LoadPlayersResult>) this, pageSize, false, forceReload);
            }
        });
    }

    @Override // com.google.android.gms.games.Players
    public PendingResult<Players.LoadPlayersResult> loadMoreInvitablePlayers(GoogleApiClient apiClient, final int pageSize) {
        return apiClient.a((GoogleApiClient) new a() { // from class: com.google.android.gms.internal.fz.3
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.a((a.c<Players.LoadPlayersResult>) this, pageSize, true, false);
            }
        });
    }

    @Override // com.google.android.gms.games.Players
    public PendingResult<Players.LoadPlayersResult> loadMoreRecentlyPlayedWithPlayers(GoogleApiClient apiClient, final int pageSize) {
        return apiClient.a((GoogleApiClient) new a() { // from class: com.google.android.gms.internal.fz.5
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.a((a.c<Players.LoadPlayersResult>) this, "playedWith", pageSize, true, false);
            }
        });
    }

    @Override // com.google.android.gms.games.Players
    public PendingResult<Players.LoadPlayersResult> loadPlayer(GoogleApiClient apiClient, final String playerId) {
        return apiClient.a((GoogleApiClient) new a() { // from class: com.google.android.gms.internal.fz.1
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.a(this, playerId);
            }
        });
    }

    @Override // com.google.android.gms.games.Players
    public PendingResult<Players.LoadPlayersResult> loadRecentlyPlayedWithPlayers(GoogleApiClient apiClient, final int pageSize, final boolean forceReload) {
        return apiClient.a((GoogleApiClient) new a() { // from class: com.google.android.gms.internal.fz.4
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.a((a.c<Players.LoadPlayersResult>) this, "playedWith", pageSize, false, forceReload);
            }
        });
    }
}
