package com.google.android.gms.internal;

import android.content.Intent;
import com.google.android.gms.common.api.C0655a;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.games.Games;
import com.google.android.gms.games.achievement.AchievementBuffer;
import com.google.android.gms.games.achievement.Achievements;

/* renamed from: com.google.android.gms.internal.fs */
public final class C1218fs implements Achievements {

    /* renamed from: com.google.android.gms.internal.fs$a */
    private static abstract class C1228a extends Games.C0782a<Achievements.LoadAchievementsResult> {
        private C1228a() {
        }

        /* renamed from: t */
        public Achievements.LoadAchievementsResult mo5631e(final Status status) {
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

    /* renamed from: com.google.android.gms.internal.fs$b */
    private static abstract class C1230b extends Games.C0782a<Achievements.UpdateAchievementResult> {
        /* access modifiers changed from: private */

        /* renamed from: uS */
        public final String f2860uS;

        public C1230b(String str) {
            this.f2860uS = str;
        }

        /* renamed from: u */
        public Achievements.UpdateAchievementResult mo5631e(final Status status) {
            return new Achievements.UpdateAchievementResult() {
                public String getAchievementId() {
                    return C1230b.this.f2860uS;
                }

                public Status getStatus() {
                    return status;
                }
            };
        }
    }

    public Intent getAchievementsIntent(GoogleApiClient apiClient) {
        return Games.m1707j(apiClient).getAchievementsIntent();
    }

    public void increment(GoogleApiClient apiClient, final String id, final int numSteps) {
        apiClient.mo5868b(new C1230b(id) {
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7729a((C0655a.C0659c<Achievements.UpdateAchievementResult>) null, id, numSteps);
            }
        });
    }

    public PendingResult<Achievements.UpdateAchievementResult> incrementImmediate(GoogleApiClient apiClient, final String id, final int numSteps) {
        return apiClient.mo5868b(new C1230b(id) {
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7729a((C0655a.C0659c<Achievements.UpdateAchievementResult>) this, id, numSteps);
            }
        });
    }

    public PendingResult<Achievements.LoadAchievementsResult> load(GoogleApiClient apiClient, final boolean forceReload) {
        return apiClient.mo5867a(new C1228a() {
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7744b((C0655a.C0659c<Achievements.LoadAchievementsResult>) this, forceReload);
            }
        });
    }

    public void reveal(GoogleApiClient apiClient, final String id) {
        apiClient.mo5868b(new C1230b(id) {
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7741b((C0655a.C0659c<Achievements.UpdateAchievementResult>) null, id);
            }
        });
    }

    public PendingResult<Achievements.UpdateAchievementResult> revealImmediate(GoogleApiClient apiClient, final String id) {
        return apiClient.mo5868b(new C1230b(id) {
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7741b((C0655a.C0659c<Achievements.UpdateAchievementResult>) this, id);
            }
        });
    }

    public void setSteps(GoogleApiClient apiClient, final String id, final int numSteps) {
        apiClient.mo5868b(new C1230b(id) {
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7742b((C0655a.C0659c<Achievements.UpdateAchievementResult>) null, id, numSteps);
            }
        });
    }

    public PendingResult<Achievements.UpdateAchievementResult> setStepsImmediate(GoogleApiClient apiClient, final String id, final int numSteps) {
        return apiClient.mo5868b(new C1230b(id) {
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7742b(this, id, numSteps);
            }
        });
    }

    public void unlock(GoogleApiClient apiClient, final String id) {
        apiClient.mo5868b(new C1230b(id) {
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7745c((C0655a.C0659c<Achievements.UpdateAchievementResult>) null, id);
            }
        });
    }

    public PendingResult<Achievements.UpdateAchievementResult> unlockImmediate(GoogleApiClient apiClient, final String id) {
        return apiClient.mo5868b(new C1230b(id) {
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7745c(this, id);
            }
        });
    }
}
