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

public final class fz implements Players {

    private static abstract class a extends Games.a<Players.LoadPlayersResult> {
        private a() {
        }

        /* renamed from: B */
        public Players.LoadPlayersResult e(final Status status) {
            return new Players.LoadPlayersResult() {
                public PlayerBuffer getPlayers() {
                    return new PlayerBuffer(DataHolder.empty(14));
                }

                public Status getStatus() {
                    return status;
                }

                public void release() {
                }
            };
        }
    }

    public Player getCurrentPlayer(GoogleApiClient apiClient) {
        return Games.j(apiClient).getCurrentPlayer();
    }

    public String getCurrentPlayerId(GoogleApiClient apiClient) {
        return Games.j(apiClient).getCurrentPlayerId();
    }

    public Intent getPlayerSearchIntent(GoogleApiClient apiClient) {
        return Games.j(apiClient).getPlayerSearchIntent();
    }

    public PendingResult<Players.LoadPlayersResult> loadInvitablePlayers(GoogleApiClient apiClient, final int pageSize, final boolean forceReload) {
        return apiClient.a(new a() {
            /* access modifiers changed from: protected */
            public void a(fl flVar) {
                flVar.a((a.c<Players.LoadPlayersResult>) this, pageSize, false, forceReload);
            }
        });
    }

    public PendingResult<Players.LoadPlayersResult> loadMoreInvitablePlayers(GoogleApiClient apiClient, final int pageSize) {
        return apiClient.a(new a() {
            /* access modifiers changed from: protected */
            public void a(fl flVar) {
                flVar.a((a.c<Players.LoadPlayersResult>) this, pageSize, true, false);
            }
        });
    }

    public PendingResult<Players.LoadPlayersResult> loadMoreRecentlyPlayedWithPlayers(GoogleApiClient apiClient, final int pageSize) {
        return apiClient.a(new a() {
            /* access modifiers changed from: protected */
            public void a(fl flVar) {
                flVar.a((a.c<Players.LoadPlayersResult>) this, "playedWith", pageSize, true, false);
            }
        });
    }

    public PendingResult<Players.LoadPlayersResult> loadPlayer(GoogleApiClient apiClient, final String playerId) {
        return apiClient.a(new a() {
            /* access modifiers changed from: protected */
            public void a(fl flVar) {
                flVar.a((a.c<Players.LoadPlayersResult>) this, playerId);
            }
        });
    }

    public PendingResult<Players.LoadPlayersResult> loadRecentlyPlayedWithPlayers(GoogleApiClient apiClient, final int pageSize, final boolean forceReload) {
        return apiClient.a(new a() {
            /* access modifiers changed from: protected */
            public void a(fl flVar) {
                flVar.a((a.c<Players.LoadPlayersResult>) this, "playedWith", pageSize, false, forceReload);
            }
        });
    }
}
