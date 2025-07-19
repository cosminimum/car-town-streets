package com.google.android.gms.internal;

import android.content.Intent;
import android.os.Bundle;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.a;
import com.google.android.gms.games.Games;
import com.google.android.gms.games.multiplayer.ParticipantResult;
import com.google.android.gms.games.multiplayer.turnbased.LoadMatchesResponse;
import com.google.android.gms.games.multiplayer.turnbased.OnTurnBasedMatchUpdateReceivedListener;
import com.google.android.gms.games.multiplayer.turnbased.TurnBasedMatch;
import com.google.android.gms.games.multiplayer.turnbased.TurnBasedMatchConfig;
import com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer;
import java.util.List;

public final class gb implements TurnBasedMultiplayer {

    private static abstract class a extends Games.a<TurnBasedMultiplayer.CancelMatchResult> {
        /* access modifiers changed from: private */
        public final String uS;

        public a(String str) {
            this.uS = str;
        }

        /* renamed from: C */
        public TurnBasedMultiplayer.CancelMatchResult e(final Status status) {
            return new TurnBasedMultiplayer.CancelMatchResult() {
                public String getMatchId() {
                    return a.this.uS;
                }

                public Status getStatus() {
                    return status;
                }
            };
        }
    }

    private static abstract class b extends Games.a<TurnBasedMultiplayer.InitiateMatchResult> {
        private b() {
        }

        /* renamed from: D */
        public TurnBasedMultiplayer.InitiateMatchResult e(final Status status) {
            return new TurnBasedMultiplayer.InitiateMatchResult() {
                public TurnBasedMatch getMatch() {
                    return null;
                }

                public Status getStatus() {
                    return status;
                }
            };
        }
    }

    private static abstract class c extends Games.a<TurnBasedMultiplayer.LeaveMatchResult> {
        private c() {
        }

        /* renamed from: E */
        public TurnBasedMultiplayer.LeaveMatchResult e(final Status status) {
            return new TurnBasedMultiplayer.LeaveMatchResult() {
                public TurnBasedMatch getMatch() {
                    return null;
                }

                public Status getStatus() {
                    return status;
                }
            };
        }
    }

    private static abstract class d extends Games.a<TurnBasedMultiplayer.LoadMatchResult> {
        private d() {
        }

        /* renamed from: F */
        public TurnBasedMultiplayer.LoadMatchResult e(final Status status) {
            return new TurnBasedMultiplayer.LoadMatchResult() {
                public TurnBasedMatch getMatch() {
                    return null;
                }

                public Status getStatus() {
                    return status;
                }
            };
        }
    }

    private static abstract class e extends Games.a<TurnBasedMultiplayer.LoadMatchesResult> {
        private e() {
        }

        /* renamed from: G */
        public TurnBasedMultiplayer.LoadMatchesResult e(final Status status) {
            return new TurnBasedMultiplayer.LoadMatchesResult() {
                public LoadMatchesResponse getMatches() {
                    return new LoadMatchesResponse(new Bundle());
                }

                public Status getStatus() {
                    return status;
                }

                public void release() {
                }
            };
        }
    }

    private static abstract class f extends Games.a<TurnBasedMultiplayer.UpdateMatchResult> {
        private f() {
        }

        /* renamed from: H */
        public TurnBasedMultiplayer.UpdateMatchResult e(final Status status) {
            return new TurnBasedMultiplayer.UpdateMatchResult() {
                public TurnBasedMatch getMatch() {
                    return null;
                }

                public Status getStatus() {
                    return status;
                }
            };
        }
    }

    public PendingResult<TurnBasedMultiplayer.InitiateMatchResult> acceptInvitation(GoogleApiClient apiClient, final String invitationId) {
        return apiClient.b(new b() {
            /* access modifiers changed from: protected */
            public void a(fl flVar) {
                flVar.e(this, invitationId);
            }
        });
    }

    public PendingResult<TurnBasedMultiplayer.CancelMatchResult> cancelMatch(GoogleApiClient apiClient, final String matchId) {
        return apiClient.b(new a(matchId) {
            /* access modifiers changed from: protected */
            public void a(fl flVar) {
                flVar.g(this, matchId);
            }
        });
    }

    public PendingResult<TurnBasedMultiplayer.InitiateMatchResult> createMatch(GoogleApiClient apiClient, final TurnBasedMatchConfig config) {
        return apiClient.b(new b() {
            /* access modifiers changed from: protected */
            public void a(fl flVar) {
                flVar.a((a.c<TurnBasedMultiplayer.InitiateMatchResult>) this, config);
            }
        });
    }

    public void declineInvitation(GoogleApiClient apiClient, String invitationId) {
        Games.j(apiClient).j(invitationId, 1);
    }

    public void dismissInvitation(GoogleApiClient apiClient, String invitationId) {
        Games.j(apiClient).i(invitationId, 1);
    }

    public void dismissMatch(GoogleApiClient apiClient, String matchId) {
        Games.j(apiClient).dismissTurnBasedMatch(matchId);
    }

    public PendingResult<TurnBasedMultiplayer.UpdateMatchResult> finishMatch(GoogleApiClient apiClient, String matchId) {
        return finishMatch(apiClient, matchId, (byte[]) null, (ParticipantResult[]) null);
    }

    public PendingResult<TurnBasedMultiplayer.UpdateMatchResult> finishMatch(GoogleApiClient apiClient, String matchId, byte[] matchData, List<ParticipantResult> results) {
        return finishMatch(apiClient, matchId, matchData, results == null ? null : (ParticipantResult[]) results.toArray(new ParticipantResult[results.size()]));
    }

    public PendingResult<TurnBasedMultiplayer.UpdateMatchResult> finishMatch(GoogleApiClient apiClient, final String matchId, final byte[] matchData, final ParticipantResult... results) {
        return apiClient.b(new f() {
            /* access modifiers changed from: protected */
            public void a(fl flVar) {
                flVar.a((a.c<TurnBasedMultiplayer.UpdateMatchResult>) this, matchId, matchData, results);
            }
        });
    }

    public Intent getInboxIntent(GoogleApiClient apiClient) {
        return Games.j(apiClient).getMatchInboxIntent();
    }

    public int getMaxMatchDataSize(GoogleApiClient apiClient) {
        return Games.j(apiClient).getMaxTurnBasedMatchDataSize();
    }

    public Intent getSelectOpponentsIntent(GoogleApiClient apiClient, int minPlayers, int maxPlayers) {
        return Games.j(apiClient).getTurnBasedSelectOpponentsIntent(minPlayers, maxPlayers, true);
    }

    public Intent getSelectOpponentsIntent(GoogleApiClient apiClient, int minPlayers, int maxPlayers, boolean allowAutomatch) {
        return Games.j(apiClient).getTurnBasedSelectOpponentsIntent(minPlayers, maxPlayers, allowAutomatch);
    }

    public PendingResult<TurnBasedMultiplayer.LeaveMatchResult> leaveMatch(GoogleApiClient apiClient, final String matchId) {
        return apiClient.b(new c() {
            /* access modifiers changed from: protected */
            public void a(fl flVar) {
                flVar.f(this, matchId);
            }
        });
    }

    public PendingResult<TurnBasedMultiplayer.LeaveMatchResult> leaveMatchDuringTurn(GoogleApiClient apiClient, final String matchId, final String pendingParticipantId) {
        return apiClient.b(new c() {
            /* access modifiers changed from: protected */
            public void a(fl flVar) {
                flVar.a((a.c<TurnBasedMultiplayer.LeaveMatchResult>) this, matchId, pendingParticipantId);
            }
        });
    }

    public PendingResult<TurnBasedMultiplayer.LoadMatchResult> loadMatch(GoogleApiClient apiClient, final String matchId) {
        return apiClient.a(new d() {
            /* access modifiers changed from: protected */
            public void a(fl flVar) {
                flVar.h(this, matchId);
            }
        });
    }

    public PendingResult<TurnBasedMultiplayer.LoadMatchesResult> loadMatchesByStatus(GoogleApiClient apiClient, final int... matchTurnStatuses) {
        return apiClient.a(new e() {
            /* access modifiers changed from: protected */
            public void a(fl flVar) {
                flVar.a((a.c<TurnBasedMultiplayer.LoadMatchesResult>) this, matchTurnStatuses);
            }
        });
    }

    public void registerMatchUpdateListener(GoogleApiClient apiClient, OnTurnBasedMatchUpdateReceivedListener listener) {
        Games.j(apiClient).registerMatchUpdateListener(listener);
    }

    public PendingResult<TurnBasedMultiplayer.InitiateMatchResult> rematch(GoogleApiClient apiClient, final String matchId) {
        return apiClient.b(new b() {
            /* access modifiers changed from: protected */
            public void a(fl flVar) {
                flVar.d(this, matchId);
            }
        });
    }

    public PendingResult<TurnBasedMultiplayer.UpdateMatchResult> takeTurn(GoogleApiClient apiClient, String matchId, byte[] matchData, String pendingParticipantId) {
        return takeTurn(apiClient, matchId, matchData, pendingParticipantId, (ParticipantResult[]) null);
    }

    public PendingResult<TurnBasedMultiplayer.UpdateMatchResult> takeTurn(GoogleApiClient apiClient, String matchId, byte[] matchData, String pendingParticipantId, List<ParticipantResult> results) {
        return takeTurn(apiClient, matchId, matchData, pendingParticipantId, results == null ? null : (ParticipantResult[]) results.toArray(new ParticipantResult[results.size()]));
    }

    public PendingResult<TurnBasedMultiplayer.UpdateMatchResult> takeTurn(GoogleApiClient apiClient, String matchId, byte[] matchData, String pendingParticipantId, ParticipantResult... results) {
        final String str = matchId;
        final byte[] bArr = matchData;
        final String str2 = pendingParticipantId;
        final ParticipantResult[] participantResultArr = results;
        return apiClient.b(new f() {
            /* access modifiers changed from: protected */
            public void a(fl flVar) {
                flVar.a((a.c<TurnBasedMultiplayer.UpdateMatchResult>) this, str, bArr, str2, participantResultArr);
            }
        });
    }

    public void unregisterMatchUpdateListener(GoogleApiClient apiClient) {
        Games.j(apiClient).unregisterMatchUpdateListener();
    }
}
