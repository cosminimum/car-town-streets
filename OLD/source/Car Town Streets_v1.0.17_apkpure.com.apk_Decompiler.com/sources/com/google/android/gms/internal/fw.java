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

public final class fw implements Leaderboards {

    private static abstract class a extends Games.a<Leaderboards.LeaderboardMetadataResult> {
        private a() {
        }

        /* renamed from: x */
        public Leaderboards.LeaderboardMetadataResult e(final Status status) {
            return new Leaderboards.LeaderboardMetadataResult() {
                public LeaderboardBuffer getLeaderboards() {
                    return new LeaderboardBuffer(DataHolder.empty(14));
                }

                public Status getStatus() {
                    return status;
                }

                public void release() {
                }
            };
        }
    }

    private static abstract class b extends Games.a<Leaderboards.LoadPlayerScoreResult> {
        private b() {
        }

        /* renamed from: y */
        public Leaderboards.LoadPlayerScoreResult e(final Status status) {
            return new Leaderboards.LoadPlayerScoreResult() {
                public LeaderboardScore getScore() {
                    return null;
                }

                public Status getStatus() {
                    return status;
                }
            };
        }
    }

    private static abstract class c extends Games.a<Leaderboards.LoadScoresResult> {
        private c() {
        }

        /* renamed from: z */
        public Leaderboards.LoadScoresResult e(final Status status) {
            return new Leaderboards.LoadScoresResult() {
                public Leaderboard getLeaderboard() {
                    return null;
                }

                public LeaderboardScoreBuffer getScores() {
                    return new LeaderboardScoreBuffer(DataHolder.empty(14));
                }

                public Status getStatus() {
                    return status;
                }

                public void release() {
                }
            };
        }
    }

    protected static abstract class d extends Games.a<Leaderboards.SubmitScoreResult> {
        protected d() {
        }

        /* renamed from: A */
        public Leaderboards.SubmitScoreResult e(final Status status) {
            return new Leaderboards.SubmitScoreResult() {
                public ScoreSubmissionData getScoreData() {
                    return new ScoreSubmissionData(DataHolder.empty(14));
                }

                public Status getStatus() {
                    return status;
                }

                public void release() {
                }
            };
        }
    }

    public Intent getAllLeaderboardsIntent(GoogleApiClient apiClient) {
        return Games.j(apiClient).getAllLeaderboardsIntent();
    }

    public Intent getLeaderboardIntent(GoogleApiClient apiClient, String leaderboardId) {
        return Games.j(apiClient).getLeaderboardIntent(leaderboardId);
    }

    public PendingResult<Leaderboards.LoadPlayerScoreResult> loadCurrentPlayerLeaderboardScore(GoogleApiClient apiClient, final String leaderboardId, final int span, final int leaderboardCollection) {
        return apiClient.a(new b() {
            /* access modifiers changed from: protected */
            public void a(fl flVar) {
                flVar.a((a.c<Leaderboards.LoadPlayerScoreResult>) this, (String) null, leaderboardId, span, leaderboardCollection);
            }
        });
    }

    public PendingResult<Leaderboards.LeaderboardMetadataResult> loadLeaderboardMetadata(GoogleApiClient apiClient, final String leaderboardId, final boolean forceReload) {
        return apiClient.a(new a() {
            /* access modifiers changed from: protected */
            public void a(fl flVar) {
                flVar.a((a.c<Leaderboards.LeaderboardMetadataResult>) this, leaderboardId, forceReload);
            }
        });
    }

    public PendingResult<Leaderboards.LeaderboardMetadataResult> loadLeaderboardMetadata(GoogleApiClient apiClient, final boolean forceReload) {
        return apiClient.a(new a() {
            /* access modifiers changed from: protected */
            public void a(fl flVar) {
                flVar.a((a.c<Leaderboards.LeaderboardMetadataResult>) this, forceReload);
            }
        });
    }

    public PendingResult<Leaderboards.LoadScoresResult> loadMoreScores(GoogleApiClient apiClient, final LeaderboardScoreBuffer buffer, final int maxResults, final int pageDirection) {
        return apiClient.a(new c() {
            /* access modifiers changed from: protected */
            public void a(fl flVar) {
                flVar.a((a.c<Leaderboards.LoadScoresResult>) this, buffer, maxResults, pageDirection);
            }
        });
    }

    public PendingResult<Leaderboards.LoadScoresResult> loadPlayerCenteredScores(GoogleApiClient apiClient, String leaderboardId, int span, int leaderboardCollection, int maxResults) {
        return loadPlayerCenteredScores(apiClient, leaderboardId, span, leaderboardCollection, maxResults, false);
    }

    public PendingResult<Leaderboards.LoadScoresResult> loadPlayerCenteredScores(GoogleApiClient apiClient, String leaderboardId, int span, int leaderboardCollection, int maxResults, boolean forceReload) {
        final String str = leaderboardId;
        final int i = span;
        final int i2 = leaderboardCollection;
        final int i3 = maxResults;
        final boolean z = forceReload;
        return apiClient.a(new c() {
            /* access modifiers changed from: protected */
            public void a(fl flVar) {
                flVar.b(this, str, i, i2, i3, z);
            }
        });
    }

    public PendingResult<Leaderboards.LoadScoresResult> loadTopScores(GoogleApiClient apiClient, String leaderboardId, int span, int leaderboardCollection, int maxResults) {
        return loadTopScores(apiClient, leaderboardId, span, leaderboardCollection, maxResults, false);
    }

    public PendingResult<Leaderboards.LoadScoresResult> loadTopScores(GoogleApiClient apiClient, String leaderboardId, int span, int leaderboardCollection, int maxResults, boolean forceReload) {
        final String str = leaderboardId;
        final int i = span;
        final int i2 = leaderboardCollection;
        final int i3 = maxResults;
        final boolean z = forceReload;
        return apiClient.a(new c() {
            /* access modifiers changed from: protected */
            public void a(fl flVar) {
                flVar.a(this, str, i, i2, i3, z);
            }
        });
    }

    public void submitScore(GoogleApiClient apiClient, String leaderboardId, long score) {
        submitScore(apiClient, leaderboardId, score, (String) null);
    }

    public void submitScore(GoogleApiClient apiClient, String leaderboardId, long score, String scoreTag) {
        Games.j(apiClient).a((a.c<Leaderboards.SubmitScoreResult>) null, leaderboardId, score, scoreTag);
    }

    public PendingResult<Leaderboards.SubmitScoreResult> submitScoreImmediate(GoogleApiClient apiClient, String leaderboardId, long score) {
        return submitScoreImmediate(apiClient, leaderboardId, score, (String) null);
    }

    public PendingResult<Leaderboards.SubmitScoreResult> submitScoreImmediate(GoogleApiClient apiClient, String leaderboardId, long score, String scoreTag) {
        final String str = leaderboardId;
        final long j = score;
        final String str2 = scoreTag;
        return apiClient.b(new d() {
            /* access modifiers changed from: protected */
            public void a(fl flVar) {
                flVar.a((a.c<Leaderboards.SubmitScoreResult>) this, str, j, str2);
            }
        });
    }
}
