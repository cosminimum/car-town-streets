package com.google.android.gms.internal;

import android.content.Intent;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.a;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.games.Games;
import com.google.android.gms.games.leaderboard.Leaderboard;
import com.google.android.gms.games.leaderboard.LeaderboardBuffer;
import com.google.android.gms.games.leaderboard.LeaderboardScore;
import com.google.android.gms.games.leaderboard.LeaderboardScoreBuffer;
import com.google.android.gms.games.leaderboard.Leaderboards;
import com.google.android.gms.games.leaderboard.ScoreSubmissionData;
/* loaded from: classes.dex */
public final class fw implements Leaderboards {

    /* loaded from: classes.dex */
    private static abstract class a extends Games.a<Leaderboards.LeaderboardMetadataResult> {
        private a() {
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: x */
        public Leaderboards.LeaderboardMetadataResult e(final Status status) {
            return new Leaderboards.LeaderboardMetadataResult() { // from class: com.google.android.gms.internal.fw.a.1
                @Override // com.google.android.gms.games.leaderboard.Leaderboards.LeaderboardMetadataResult
                public LeaderboardBuffer getLeaderboards() {
                    return new LeaderboardBuffer(DataHolder.empty(14));
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
    private static abstract class b extends Games.a<Leaderboards.LoadPlayerScoreResult> {
        private b() {
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: y */
        public Leaderboards.LoadPlayerScoreResult e(final Status status) {
            return new Leaderboards.LoadPlayerScoreResult() { // from class: com.google.android.gms.internal.fw.b.1
                @Override // com.google.android.gms.games.leaderboard.Leaderboards.LoadPlayerScoreResult
                public LeaderboardScore getScore() {
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
    private static abstract class c extends Games.a<Leaderboards.LoadScoresResult> {
        private c() {
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: z */
        public Leaderboards.LoadScoresResult e(final Status status) {
            return new Leaderboards.LoadScoresResult() { // from class: com.google.android.gms.internal.fw.c.1
                @Override // com.google.android.gms.games.leaderboard.Leaderboards.LoadScoresResult
                public Leaderboard getLeaderboard() {
                    return null;
                }

                @Override // com.google.android.gms.games.leaderboard.Leaderboards.LoadScoresResult
                public LeaderboardScoreBuffer getScores() {
                    return new LeaderboardScoreBuffer(DataHolder.empty(14));
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
    protected static abstract class d extends Games.a<Leaderboards.SubmitScoreResult> {
        protected d() {
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: A */
        public Leaderboards.SubmitScoreResult e(final Status status) {
            return new Leaderboards.SubmitScoreResult() { // from class: com.google.android.gms.internal.fw.d.1
                @Override // com.google.android.gms.games.leaderboard.Leaderboards.SubmitScoreResult
                public ScoreSubmissionData getScoreData() {
                    return new ScoreSubmissionData(DataHolder.empty(14));
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

    @Override // com.google.android.gms.games.leaderboard.Leaderboards
    public Intent getAllLeaderboardsIntent(GoogleApiClient apiClient) {
        return Games.j(apiClient).getAllLeaderboardsIntent();
    }

    @Override // com.google.android.gms.games.leaderboard.Leaderboards
    public Intent getLeaderboardIntent(GoogleApiClient apiClient, String leaderboardId) {
        return Games.j(apiClient).getLeaderboardIntent(leaderboardId);
    }

    @Override // com.google.android.gms.games.leaderboard.Leaderboards
    public PendingResult<Leaderboards.LoadPlayerScoreResult> loadCurrentPlayerLeaderboardScore(GoogleApiClient apiClient, final String leaderboardId, final int span, final int leaderboardCollection) {
        return apiClient.a((GoogleApiClient) new b() { // from class: com.google.android.gms.internal.fw.3
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.a(this, (String) null, leaderboardId, span, leaderboardCollection);
            }
        });
    }

    @Override // com.google.android.gms.games.leaderboard.Leaderboards
    public PendingResult<Leaderboards.LeaderboardMetadataResult> loadLeaderboardMetadata(GoogleApiClient apiClient, final String leaderboardId, final boolean forceReload) {
        return apiClient.a((GoogleApiClient) new a() { // from class: com.google.android.gms.internal.fw.2
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.a(this, leaderboardId, forceReload);
            }
        });
    }

    @Override // com.google.android.gms.games.leaderboard.Leaderboards
    public PendingResult<Leaderboards.LeaderboardMetadataResult> loadLeaderboardMetadata(GoogleApiClient apiClient, final boolean forceReload) {
        return apiClient.a((GoogleApiClient) new a() { // from class: com.google.android.gms.internal.fw.1
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.a(this, forceReload);
            }
        });
    }

    @Override // com.google.android.gms.games.leaderboard.Leaderboards
    public PendingResult<Leaderboards.LoadScoresResult> loadMoreScores(GoogleApiClient apiClient, final LeaderboardScoreBuffer buffer, final int maxResults, final int pageDirection) {
        return apiClient.a((GoogleApiClient) new c() { // from class: com.google.android.gms.internal.fw.6
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.a(this, buffer, maxResults, pageDirection);
            }
        });
    }

    @Override // com.google.android.gms.games.leaderboard.Leaderboards
    public PendingResult<Leaderboards.LoadScoresResult> loadPlayerCenteredScores(GoogleApiClient apiClient, String leaderboardId, int span, int leaderboardCollection, int maxResults) {
        return loadPlayerCenteredScores(apiClient, leaderboardId, span, leaderboardCollection, maxResults, false);
    }

    @Override // com.google.android.gms.games.leaderboard.Leaderboards
    public PendingResult<Leaderboards.LoadScoresResult> loadPlayerCenteredScores(GoogleApiClient apiClient, final String leaderboardId, final int span, final int leaderboardCollection, final int maxResults, final boolean forceReload) {
        return apiClient.a((GoogleApiClient) new c() { // from class: com.google.android.gms.internal.fw.5
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.b(this, leaderboardId, span, leaderboardCollection, maxResults, forceReload);
            }
        });
    }

    @Override // com.google.android.gms.games.leaderboard.Leaderboards
    public PendingResult<Leaderboards.LoadScoresResult> loadTopScores(GoogleApiClient apiClient, String leaderboardId, int span, int leaderboardCollection, int maxResults) {
        return loadTopScores(apiClient, leaderboardId, span, leaderboardCollection, maxResults, false);
    }

    @Override // com.google.android.gms.games.leaderboard.Leaderboards
    public PendingResult<Leaderboards.LoadScoresResult> loadTopScores(GoogleApiClient apiClient, final String leaderboardId, final int span, final int leaderboardCollection, final int maxResults, final boolean forceReload) {
        return apiClient.a((GoogleApiClient) new c() { // from class: com.google.android.gms.internal.fw.4
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.a(this, leaderboardId, span, leaderboardCollection, maxResults, forceReload);
            }
        });
    }

    @Override // com.google.android.gms.games.leaderboard.Leaderboards
    public void submitScore(GoogleApiClient apiClient, String leaderboardId, long score) {
        submitScore(apiClient, leaderboardId, score, null);
    }

    @Override // com.google.android.gms.games.leaderboard.Leaderboards
    public void submitScore(GoogleApiClient apiClient, String leaderboardId, long score, String scoreTag) {
        Games.j(apiClient).a((a.c<Leaderboards.SubmitScoreResult>) null, leaderboardId, score, scoreTag);
    }

    @Override // com.google.android.gms.games.leaderboard.Leaderboards
    public PendingResult<Leaderboards.SubmitScoreResult> submitScoreImmediate(GoogleApiClient apiClient, String leaderboardId, long score) {
        return submitScoreImmediate(apiClient, leaderboardId, score, null);
    }

    @Override // com.google.android.gms.games.leaderboard.Leaderboards
    public PendingResult<Leaderboards.SubmitScoreResult> submitScoreImmediate(GoogleApiClient apiClient, final String leaderboardId, final long score, final String scoreTag) {
        return apiClient.b(new d() { // from class: com.google.android.gms.internal.fw.7
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.a(this, leaderboardId, score, scoreTag);
            }
        });
    }
}
