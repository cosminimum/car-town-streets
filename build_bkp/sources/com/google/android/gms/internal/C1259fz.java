package com.google.android.gms.internal;

import android.content.Intent;
import com.google.android.gms.common.api.C0655a;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.games.Games;
import com.google.android.gms.games.Player;
import com.google.android.gms.games.PlayerBuffer;
import com.google.android.gms.games.Players;

/* renamed from: com.google.android.gms.internal.fz */
public final class C1259fz implements Players {

    /* renamed from: com.google.android.gms.internal.fz$a */
    private static abstract class C1265a extends Games.C0782a<Players.LoadPlayersResult> {
        private C1265a() {
        }

        /* renamed from: B */
        public Players.LoadPlayersResult mo5631e(final Status status) {
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
        return Games.m1707j(apiClient).getCurrentPlayer();
    }

    public String getCurrentPlayerId(GoogleApiClient apiClient) {
        return Games.m1707j(apiClient).getCurrentPlayerId();
    }

    public Intent getPlayerSearchIntent(GoogleApiClient apiClient) {
        return Games.m1707j(apiClient).getPlayerSearchIntent();
    }

    public PendingResult<Players.LoadPlayersResult> loadInvitablePlayers(GoogleApiClient apiClient, final int pageSize, final boolean forceReload) {
        return apiClient.mo5867a(new C1265a() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7725a((C0655a.C0659c<Players.LoadPlayersResult>) this, pageSize, false, forceReload);
            }
        });
    }

    public PendingResult<Players.LoadPlayersResult> loadMoreInvitablePlayers(GoogleApiClient apiClient, final int pageSize) {
        return apiClient.mo5867a(new C1265a() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7725a((C0655a.C0659c<Players.LoadPlayersResult>) this, pageSize, true, false);
            }
        });
    }

    public PendingResult<Players.LoadPlayersResult> loadMoreRecentlyPlayedWithPlayers(GoogleApiClient apiClient, final int pageSize) {
        return apiClient.mo5867a(new C1265a() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7731a((C0655a.C0659c<Players.LoadPlayersResult>) this, "playedWith", pageSize, true, false);
            }
        });
    }

    public PendingResult<Players.LoadPlayersResult> loadPlayer(GoogleApiClient apiClient, final String playerId) {
        return apiClient.mo5867a(new C1265a() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7728a((C0655a.C0659c<Players.LoadPlayersResult>) this, playerId);
            }
        });
    }

    public PendingResult<Players.LoadPlayersResult> loadRecentlyPlayedWithPlayers(GoogleApiClient apiClient, final int pageSize, final boolean forceReload) {
        return apiClient.mo5867a(new C1265a() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7731a((C0655a.C0659c<Players.LoadPlayersResult>) this, "playedWith", pageSize, false, forceReload);
            }
        });
    }
}
