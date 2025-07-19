package com.google.android.gms.internal;

import android.content.Intent;
import android.os.Bundle;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.games.Games;
import com.google.android.gms.games.multiplayer.ParticipantResult;
import com.google.android.gms.games.multiplayer.turnbased.LoadMatchesResponse;
import com.google.android.gms.games.multiplayer.turnbased.OnTurnBasedMatchUpdateReceivedListener;
import com.google.android.gms.games.multiplayer.turnbased.TurnBasedMatch;
import com.google.android.gms.games.multiplayer.turnbased.TurnBasedMatchConfig;
import com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer;
import java.util.List;
/* loaded from: classes.dex */
public final class gb implements TurnBasedMultiplayer {

    /* loaded from: classes.dex */
    private static abstract class a extends Games.a<TurnBasedMultiplayer.CancelMatchResult> {
        private final String uS;

        public a(String str) {
            this.uS = str;
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: C */
        public TurnBasedMultiplayer.CancelMatchResult e(final Status status) {
            return new TurnBasedMultiplayer.CancelMatchResult() { // from class: com.google.android.gms.internal.gb.a.1
                @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer.CancelMatchResult
                public String getMatchId() {
                    return a.this.uS;
                }

                @Override // com.google.android.gms.common.api.Result
                public Status getStatus() {
                    return status;
                }
            };
        }
    }

    /* loaded from: classes.dex */
    private static abstract class b extends Games.a<TurnBasedMultiplayer.InitiateMatchResult> {
        private b() {
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: D */
        public TurnBasedMultiplayer.InitiateMatchResult e(final Status status) {
            return new TurnBasedMultiplayer.InitiateMatchResult() { // from class: com.google.android.gms.internal.gb.b.1
                @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer.InitiateMatchResult
                public TurnBasedMatch getMatch() {
                    return null;
                }

                @Override // com.google.android.gms.common.api.Result
                public Status getStatus() {
                    return status;
                }
            };
        }
    }

    /* loaded from: classes.dex */
    private static abstract class c extends Games.a<TurnBasedMultiplayer.LeaveMatchResult> {
        private c() {
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: E */
        public TurnBasedMultiplayer.LeaveMatchResult e(final Status status) {
            return new TurnBasedMultiplayer.LeaveMatchResult() { // from class: com.google.android.gms.internal.gb.c.1
                @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer.LeaveMatchResult
                public TurnBasedMatch getMatch() {
                    return null;
                }

                @Override // com.google.android.gms.common.api.Result
                public Status getStatus() {
                    return status;
                }
            };
        }
    }

    /* loaded from: classes.dex */
    private static abstract class d extends Games.a<TurnBasedMultiplayer.LoadMatchResult> {
        private d() {
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: F */
        public TurnBasedMultiplayer.LoadMatchResult e(final Status status) {
            return new TurnBasedMultiplayer.LoadMatchResult() { // from class: com.google.android.gms.internal.gb.d.1
                @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer.LoadMatchResult
                public TurnBasedMatch getMatch() {
                    return null;
                }

                @Override // com.google.android.gms.common.api.Result
                public Status getStatus() {
                    return status;
                }
            };
        }
    }

    /* loaded from: classes.dex */
    private static abstract class e extends Games.a<TurnBasedMultiplayer.LoadMatchesResult> {
        private e() {
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: G */
        public TurnBasedMultiplayer.LoadMatchesResult e(final Status status) {
            return new TurnBasedMultiplayer.LoadMatchesResult() { // from class: com.google.android.gms.internal.gb.e.1
                @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer.LoadMatchesResult
                public LoadMatchesResponse getMatches() {
                    return new LoadMatchesResponse(new Bundle());
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

    /* loaded from: classes.dex */
    private static abstract class f extends Games.a<TurnBasedMultiplayer.UpdateMatchResult> {
        private f() {
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: H */
        public TurnBasedMultiplayer.UpdateMatchResult e(final Status status) {
            return new TurnBasedMultiplayer.UpdateMatchResult() { // from class: com.google.android.gms.internal.gb.f.1
                @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer.UpdateMatchResult
                public TurnBasedMatch getMatch() {
                    return null;
                }

                @Override // com.google.android.gms.common.api.Result
                public Status getStatus() {
                    return status;
                }
            };
        }
    }

    @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer
    public PendingResult<TurnBasedMultiplayer.InitiateMatchResult> acceptInvitation(GoogleApiClient apiClient, final String invitationId) {
        return apiClient.b(new b() { // from class: com.google.android.gms.internal.gb.4
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.e(this, invitationId);
            }
        });
    }

    @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer
    public PendingResult<TurnBasedMultiplayer.CancelMatchResult> cancelMatch(GoogleApiClient apiClient, final String matchId) {
        return apiClient.b(new a(matchId) { // from class: com.google.android.gms.internal.gb.9
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.g(this, matchId);
            }
        });
    }

    @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer
    public PendingResult<TurnBasedMultiplayer.InitiateMatchResult> createMatch(GoogleApiClient apiClient, final TurnBasedMatchConfig config) {
        return apiClient.b(new b() { // from class: com.google.android.gms.internal.gb.1
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.a(this, config);
            }
        });
    }

    @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer
    public void declineInvitation(GoogleApiClient apiClient, String invitationId) {
        Games.j(apiClient).j(invitationId, 1);
    }

    @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer
    public void dismissInvitation(GoogleApiClient apiClient, String invitationId) {
        Games.j(apiClient).i(invitationId, 1);
    }

    @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer
    public void dismissMatch(GoogleApiClient apiClient, String matchId) {
        Games.j(apiClient).dismissTurnBasedMatch(matchId);
    }

    @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer
    public PendingResult<TurnBasedMultiplayer.UpdateMatchResult> finishMatch(GoogleApiClient apiClient, String matchId) {
        return finishMatch(apiClient, matchId, (byte[]) null, (ParticipantResult[]) null);
    }

    @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer
    public PendingResult<TurnBasedMultiplayer.UpdateMatchResult> finishMatch(GoogleApiClient apiClient, String matchId, byte[] matchData, List<ParticipantResult> results) {
        return finishMatch(apiClient, matchId, matchData, results == null ? null : (ParticipantResult[]) results.toArray(new ParticipantResult[results.size()]));
    }

    @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer
    public PendingResult<TurnBasedMultiplayer.UpdateMatchResult> finishMatch(GoogleApiClient apiClient, final String matchId, final byte[] matchData, final ParticipantResult... results) {
        return apiClient.b(new f() { // from class: com.google.android.gms.internal.gb.6
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.a(this, matchId, matchData, results);
            }
        });
    }

    @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer
    public Intent getInboxIntent(GoogleApiClient apiClient) {
        return Games.j(apiClient).getMatchInboxIntent();
    }

    @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer
    public int getMaxMatchDataSize(GoogleApiClient apiClient) {
        return Games.j(apiClient).getMaxTurnBasedMatchDataSize();
    }

    @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer
    public Intent getSelectOpponentsIntent(GoogleApiClient apiClient, int minPlayers, int maxPlayers) {
        return Games.j(apiClient).getTurnBasedSelectOpponentsIntent(minPlayers, maxPlayers, true);
    }

    @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer
    public Intent getSelectOpponentsIntent(GoogleApiClient apiClient, int minPlayers, int maxPlayers, boolean allowAutomatch) {
        return Games.j(apiClient).getTurnBasedSelectOpponentsIntent(minPlayers, maxPlayers, allowAutomatch);
    }

    @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer
    public PendingResult<TurnBasedMultiplayer.LeaveMatchResult> leaveMatch(GoogleApiClient apiClient, final String matchId) {
        return apiClient.b(new c() { // from class: com.google.android.gms.internal.gb.7
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.f(this, matchId);
            }
        });
    }

    @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer
    public PendingResult<TurnBasedMultiplayer.LeaveMatchResult> leaveMatchDuringTurn(GoogleApiClient apiClient, final String matchId, final String pendingParticipantId) {
        return apiClient.b(new c() { // from class: com.google.android.gms.internal.gb.8
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.a(this, matchId, pendingParticipantId);
            }
        });
    }

    @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer
    public PendingResult<TurnBasedMultiplayer.LoadMatchResult> loadMatch(GoogleApiClient apiClient, final String matchId) {
        return apiClient.a((GoogleApiClient) new d() { // from class: com.google.android.gms.internal.gb.2
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.h(this, matchId);
            }
        });
    }

    @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer
    public PendingResult<TurnBasedMultiplayer.LoadMatchesResult> loadMatchesByStatus(GoogleApiClient apiClient, final int... matchTurnStatuses) {
        return apiClient.a((GoogleApiClient) new e() { // from class: com.google.android.gms.internal.gb.10
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.a(this, matchTurnStatuses);
            }
        });
    }

    @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer
    public void registerMatchUpdateListener(GoogleApiClient apiClient, OnTurnBasedMatchUpdateReceivedListener listener) {
        Games.j(apiClient).registerMatchUpdateListener(listener);
    }

    @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer
    public PendingResult<TurnBasedMultiplayer.InitiateMatchResult> rematch(GoogleApiClient apiClient, final String matchId) {
        return apiClient.b(new b() { // from class: com.google.android.gms.internal.gb.3
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.d(this, matchId);
            }
        });
    }

    @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer
    public PendingResult<TurnBasedMultiplayer.UpdateMatchResult> takeTurn(GoogleApiClient apiClient, String matchId, byte[] matchData, String pendingParticipantId) {
        return takeTurn(apiClient, matchId, matchData, pendingParticipantId, (ParticipantResult[]) null);
    }

    @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer
    public PendingResult<TurnBasedMultiplayer.UpdateMatchResult> takeTurn(GoogleApiClient apiClient, String matchId, byte[] matchData, String pendingParticipantId, List<ParticipantResult> results) {
        return takeTurn(apiClient, matchId, matchData, pendingParticipantId, results == null ? null : (ParticipantResult[]) results.toArray(new ParticipantResult[results.size()]));
    }

    @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer
    public PendingResult<TurnBasedMultiplayer.UpdateMatchResult> takeTurn(GoogleApiClient apiClient, final String matchId, final byte[] matchData, final String pendingParticipantId, final ParticipantResult... results) {
        return apiClient.b(new f() { // from class: com.google.android.gms.internal.gb.5
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.a(this, matchId, matchData, pendingParticipantId, results);
            }
        });
    }

    @Override // com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer
    public void unregisterMatchUpdateListener(GoogleApiClient apiClient) {
        Games.j(apiClient).unregisterMatchUpdateListener();
    }
}
