package com.google.android.gms.internal;

import android.content.Intent;
import android.os.Bundle;
import com.google.android.gms.common.api.C0655a;
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

/* renamed from: com.google.android.gms.internal.gb */
public final class C1270gb implements TurnBasedMultiplayer {

    /* renamed from: com.google.android.gms.internal.gb$a */
    private static abstract class C1281a extends Games.C0782a<TurnBasedMultiplayer.CancelMatchResult> {
        /* access modifiers changed from: private */

        /* renamed from: uS */
        public final String f2949uS;

        public C1281a(String str) {
            this.f2949uS = str;
        }

        /* renamed from: C */
        public TurnBasedMultiplayer.CancelMatchResult mo5631e(final Status status) {
            return new TurnBasedMultiplayer.CancelMatchResult() {
                public String getMatchId() {
                    return C1281a.this.f2949uS;
                }

                public Status getStatus() {
                    return status;
                }
            };
        }
    }

    /* renamed from: com.google.android.gms.internal.gb$b */
    private static abstract class C1283b extends Games.C0782a<TurnBasedMultiplayer.InitiateMatchResult> {
        private C1283b() {
        }

        /* renamed from: D */
        public TurnBasedMultiplayer.InitiateMatchResult mo5631e(final Status status) {
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

    /* renamed from: com.google.android.gms.internal.gb$c */
    private static abstract class C1285c extends Games.C0782a<TurnBasedMultiplayer.LeaveMatchResult> {
        private C1285c() {
        }

        /* renamed from: E */
        public TurnBasedMultiplayer.LeaveMatchResult mo5631e(final Status status) {
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

    /* renamed from: com.google.android.gms.internal.gb$d */
    private static abstract class C1287d extends Games.C0782a<TurnBasedMultiplayer.LoadMatchResult> {
        private C1287d() {
        }

        /* renamed from: F */
        public TurnBasedMultiplayer.LoadMatchResult mo5631e(final Status status) {
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

    /* renamed from: com.google.android.gms.internal.gb$e */
    private static abstract class C1289e extends Games.C0782a<TurnBasedMultiplayer.LoadMatchesResult> {
        private C1289e() {
        }

        /* renamed from: G */
        public TurnBasedMultiplayer.LoadMatchesResult mo5631e(final Status status) {
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

    /* renamed from: com.google.android.gms.internal.gb$f */
    private static abstract class C1291f extends Games.C0782a<TurnBasedMultiplayer.UpdateMatchResult> {
        private C1291f() {
        }

        /* renamed from: H */
        public TurnBasedMultiplayer.UpdateMatchResult mo5631e(final Status status) {
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
        return apiClient.mo5868b(new C1283b() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7752e(this, invitationId);
            }
        });
    }

    public PendingResult<TurnBasedMultiplayer.CancelMatchResult> cancelMatch(GoogleApiClient apiClient, final String matchId) {
        return apiClient.mo5868b(new C1281a(matchId) {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7755g(this, matchId);
            }
        });
    }

    public PendingResult<TurnBasedMultiplayer.InitiateMatchResult> createMatch(GoogleApiClient apiClient, final TurnBasedMatchConfig config) {
        return apiClient.mo5868b(new C1283b() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7727a((C0655a.C0659c<TurnBasedMultiplayer.InitiateMatchResult>) this, config);
            }
        });
    }

    public void declineInvitation(GoogleApiClient apiClient, String invitationId) {
        Games.m1707j(apiClient).mo7776j(invitationId, 1);
    }

    public void dismissInvitation(GoogleApiClient apiClient, String invitationId) {
        Games.m1707j(apiClient).mo7775i(invitationId, 1);
    }

    public void dismissMatch(GoogleApiClient apiClient, String matchId) {
        Games.m1707j(apiClient).dismissTurnBasedMatch(matchId);
    }

    public PendingResult<TurnBasedMultiplayer.UpdateMatchResult> finishMatch(GoogleApiClient apiClient, String matchId) {
        return finishMatch(apiClient, matchId, (byte[]) null, (ParticipantResult[]) null);
    }

    public PendingResult<TurnBasedMultiplayer.UpdateMatchResult> finishMatch(GoogleApiClient apiClient, String matchId, byte[] matchData, List<ParticipantResult> results) {
        return finishMatch(apiClient, matchId, matchData, results == null ? null : (ParticipantResult[]) results.toArray(new ParticipantResult[results.size()]));
    }

    public PendingResult<TurnBasedMultiplayer.UpdateMatchResult> finishMatch(GoogleApiClient apiClient, final String matchId, final byte[] matchData, final ParticipantResult... results) {
        return apiClient.mo5868b(new C1291f() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7737a((C0655a.C0659c<TurnBasedMultiplayer.UpdateMatchResult>) this, matchId, matchData, results);
            }
        });
    }

    public Intent getInboxIntent(GoogleApiClient apiClient) {
        return Games.m1707j(apiClient).getMatchInboxIntent();
    }

    public int getMaxMatchDataSize(GoogleApiClient apiClient) {
        return Games.m1707j(apiClient).getMaxTurnBasedMatchDataSize();
    }

    public Intent getSelectOpponentsIntent(GoogleApiClient apiClient, int minPlayers, int maxPlayers) {
        return Games.m1707j(apiClient).getTurnBasedSelectOpponentsIntent(minPlayers, maxPlayers, true);
    }

    public Intent getSelectOpponentsIntent(GoogleApiClient apiClient, int minPlayers, int maxPlayers, boolean allowAutomatch) {
        return Games.m1707j(apiClient).getTurnBasedSelectOpponentsIntent(minPlayers, maxPlayers, allowAutomatch);
    }

    public PendingResult<TurnBasedMultiplayer.LeaveMatchResult> leaveMatch(GoogleApiClient apiClient, final String matchId) {
        return apiClient.mo5868b(new C1285c() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7753f(this, matchId);
            }
        });
    }

    public PendingResult<TurnBasedMultiplayer.LeaveMatchResult> leaveMatchDuringTurn(GoogleApiClient apiClient, final String matchId, final String pendingParticipantId) {
        return apiClient.mo5868b(new C1285c() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7733a((C0655a.C0659c<TurnBasedMultiplayer.LeaveMatchResult>) this, matchId, pendingParticipantId);
            }
        });
    }

    public PendingResult<TurnBasedMultiplayer.LoadMatchResult> loadMatch(GoogleApiClient apiClient, final String matchId) {
        return apiClient.mo5867a(new C1287d() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7774h(this, matchId);
            }
        });
    }

    public PendingResult<TurnBasedMultiplayer.LoadMatchesResult> loadMatchesByStatus(GoogleApiClient apiClient, final int... matchTurnStatuses) {
        return apiClient.mo5867a(new C1289e() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7739a((C0655a.C0659c<TurnBasedMultiplayer.LoadMatchesResult>) this, matchTurnStatuses);
            }
        });
    }

    public void registerMatchUpdateListener(GoogleApiClient apiClient, OnTurnBasedMatchUpdateReceivedListener listener) {
        Games.m1707j(apiClient).registerMatchUpdateListener(listener);
    }

    public PendingResult<TurnBasedMultiplayer.InitiateMatchResult> rematch(GoogleApiClient apiClient, final String matchId) {
        return apiClient.mo5868b(new C1283b() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7748d(this, matchId);
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
        return apiClient.mo5868b(new C1291f() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7736a((C0655a.C0659c<TurnBasedMultiplayer.UpdateMatchResult>) this, str, bArr, str2, participantResultArr);
            }
        });
    }

    public void unregisterMatchUpdateListener(GoogleApiClient apiClient) {
        Games.m1707j(apiClient).unregisterMatchUpdateListener();
    }
}
