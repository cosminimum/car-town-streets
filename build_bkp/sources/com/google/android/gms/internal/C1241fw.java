package com.google.android.gms.internal;

import android.content.Intent;
import com.google.android.gms.common.api.C0655a;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.games.Games;
import com.google.android.gms.games.leaderboard.Leaderboard;
import com.google.android.gms.games.leaderboard.LeaderboardBuffer;
import com.google.android.gms.games.leaderboard.LeaderboardScore;
import com.google.android.gms.games.leaderboard.LeaderboardScoreBuffer;
import com.google.android.gms.games.leaderboard.Leaderboards;
import com.google.android.gms.games.leaderboard.ScoreSubmissionData;

/* renamed from: com.google.android.gms.internal.fw */
public final class C1241fw implements Leaderboards {

    /* renamed from: com.google.android.gms.internal.fw$a */
    private static abstract class C1249a extends Games.C0782a<Leaderboards.LeaderboardMetadataResult> {
        private C1249a() {
        }

        /* renamed from: x */
        public Leaderboards.LeaderboardMetadataResult mo5631e(final Status status) {
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

    /* renamed from: com.google.android.gms.internal.fw$b */
    private static abstract class C1251b extends Games.C0782a<Leaderboards.LoadPlayerScoreResult> {
        private C1251b() {
        }

        /* renamed from: y */
        public Leaderboards.LoadPlayerScoreResult mo5631e(final Status status) {
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

    /* renamed from: com.google.android.gms.internal.fw$c */
    private static abstract class C1253c extends Games.C0782a<Leaderboards.LoadScoresResult> {
        private C1253c() {
        }

        /* renamed from: z */
        public Leaderboards.LoadScoresResult mo5631e(final Status status) {
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

    /* renamed from: com.google.android.gms.internal.fw$d */
    protected static abstract class C1255d extends Games.C0782a<Leaderboards.SubmitScoreResult> {
        protected C1255d() {
        }

        /* renamed from: A */
        public Leaderboards.SubmitScoreResult mo5631e(final Status status) {
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
        return Games.m1707j(apiClient).getAllLeaderboardsIntent();
    }

    public Intent getLeaderboardIntent(GoogleApiClient apiClient, String leaderboardId) {
        return Games.m1707j(apiClient).getLeaderboardIntent(leaderboardId);
    }

    public PendingResult<Leaderboards.LoadPlayerScoreResult> loadCurrentPlayerLeaderboardScore(GoogleApiClient apiClient, final String leaderboardId, final int span, final int leaderboardCollection) {
        return apiClient.mo5867a(new C1251b() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7734a((C0655a.C0659c<Leaderboards.LoadPlayerScoreResult>) this, (String) null, leaderboardId, span, leaderboardCollection);
            }
        });
    }

    public PendingResult<Leaderboards.LeaderboardMetadataResult> loadLeaderboardMetadata(GoogleApiClient apiClient, final String leaderboardId, final boolean forceReload) {
        return apiClient.mo5867a(new C1249a() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7735a((C0655a.C0659c<Leaderboards.LeaderboardMetadataResult>) this, leaderboardId, forceReload);
            }
        });
    }

    public PendingResult<Leaderboards.LeaderboardMetadataResult> loadLeaderboardMetadata(GoogleApiClient apiClient, final boolean forceReload) {
        return apiClient.mo5867a(new C1249a() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7738a((C0655a.C0659c<Leaderboards.LeaderboardMetadataResult>) this, forceReload);
            }
        });
    }

    public PendingResult<Leaderboards.LoadScoresResult> loadMoreScores(GoogleApiClient apiClient, final LeaderboardScoreBuffer buffer, final int maxResults, final int pageDirection) {
        return apiClient.mo5867a(new C1253c() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7726a((C0655a.C0659c<Leaderboards.LoadScoresResult>) this, buffer, maxResults, pageDirection);
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
        return apiClient.mo5867a(new C1253c() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7743b(this, str, i, i2, i3, z);
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
        return apiClient.mo5867a(new C1253c() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7730a(this, str, i, i2, i3, z);
            }
        });
    }

    public void submitScore(GoogleApiClient apiClient, String leaderboardId, long score) {
        submitScore(apiClient, leaderboardId, score, (String) null);
    }

    public void submitScore(GoogleApiClient apiClient, String leaderboardId, long score, String scoreTag) {
        Games.m1707j(apiClient).mo7732a((C0655a.C0659c<Leaderboards.SubmitScoreResult>) null, leaderboardId, score, scoreTag);
    }

    public PendingResult<Leaderboards.SubmitScoreResult> submitScoreImmediate(GoogleApiClient apiClient, String leaderboardId, long score) {
        return submitScoreImmediate(apiClient, leaderboardId, score, (String) null);
    }

    public PendingResult<Leaderboards.SubmitScoreResult> submitScoreImmediate(GoogleApiClient apiClient, String leaderboardId, long score, String scoreTag) {
        final String str = leaderboardId;
        final long j = score;
        final String str2 = scoreTag;
        return apiClient.mo5868b(new C1255d() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7732a((C0655a.C0659c<Leaderboards.SubmitScoreResult>) this, str, j, str2);
            }
        });
    }
}
