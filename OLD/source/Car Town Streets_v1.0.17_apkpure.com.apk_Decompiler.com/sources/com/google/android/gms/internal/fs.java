package com.google.android.gms.internal;

import android.content.Intent;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.a;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.games.Games;
import com.google.android.gms.games.achievement.AchievementBuffer;
import com.google.android.gms.games.achievement.Achievements;

public final class fs implements Achievements {

    private static abstract class a extends Games.a<Achievements.LoadAchievementsResult> {
        private a() {
        }

        /* renamed from: t */
        public Achievements.LoadAchievementsResult e(final Status status) {
            return new Achievements.LoadAchievementsResult() {
                public AchievementBuffer getAchievements() {
                    return new AchievementBuffer(DataHolder.empty(14));
                }

                public Status getStatus() {
                    return status;
                }

                public void release() {
                }
            };
        }
    }

    private static abstract class b extends Games.a<Achievements.UpdateAchievementResult> {
        /* access modifiers changed from: private */
        public final String uS;

        public b(String str) {
            this.uS = str;
        }

        /* renamed from: u */
        public Achievements.UpdateAchievementResult e(final Status status) {
            return new Achievements.UpdateAchievementResult() {
                public String getAchievementId() {
                    return b.this.uS;
                }

                public Status getStatus() {
                    return status;
                }
            };
        }
    }

    public Intent getAchievementsIntent(GoogleApiClient apiClient) {
        return Games.j(apiClient).getAchievementsIntent();
    }

    public void increment(GoogleApiClient apiClient, final String id, final int numSteps) {
        apiClient.b(new b(id) {
            public void a(fl flVar) {
                flVar.a((a.c<Achievements.UpdateAchievementResult>) null, id, numSteps);
            }
        });
    }

    public PendingResult<Achievements.UpdateAchievementResult> incrementImmediate(GoogleApiClient apiClient, final String id, final int numSteps) {
        return apiClient.b(new b(id) {
            public void a(fl flVar) {
                flVar.a((a.c<Achievements.UpdateAchievementResult>) this, id, numSteps);
            }
        });
    }

    public PendingResult<Achievements.LoadAchievementsResult> load(GoogleApiClient apiClient, final boolean forceReload) {
        return apiClient.a(new a() {
            public void a(fl flVar) {
                flVar.b((a.c<Achievements.LoadAchievementsResult>) this, forceReload);
            }
        });
    }

    public void reveal(GoogleApiClient apiClient, final String id) {
        apiClient.b(new b(id) {
            public void a(fl flVar) {
                flVar.b((a.c<Achievements.UpdateAchievementResult>) null, id);
            }
        });
    }

    public PendingResult<Achievements.UpdateAchievementResult> revealImmediate(GoogleApiClient apiClient, final String id) {
        return apiClient.b(new b(id) {
            public void a(fl flVar) {
                flVar.b((a.c<Achievements.UpdateAchievementResult>) this, id);
            }
        });
    }

    public void setSteps(GoogleApiClient apiClient, final String id, final int numSteps) {
        apiClient.b(new b(id) {
            public void a(fl flVar) {
                flVar.b((a.c<Achievements.UpdateAchievementResult>) null, id, numSteps);
            }
        });
    }

    public PendingResult<Achievements.UpdateAchievementResult> setStepsImmediate(GoogleApiClient apiClient, final String id, final int numSteps) {
        return apiClient.b(new b(id) {
            public void a(fl flVar) {
                flVar.b(this, id, numSteps);
            }
        });
    }

    public void unlock(GoogleApiClient apiClient, final String id) {
        apiClient.b(new b(id) {
            public void a(fl flVar) {
                flVar.c((a.c<Achievements.UpdateAchievementResult>) null, id);
            }
        });
    }

    public PendingResult<Achievements.UpdateAchievementResult> unlockImmediate(GoogleApiClient apiClient, final String id) {
        return apiClient.b(new b(id) {
            public void a(fl flVar) {
                flVar.c(this, id);
            }
        });
    }
}
