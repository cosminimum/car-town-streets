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
/* loaded from: classes.dex */
public final class fs implements Achievements {

    /* loaded from: classes.dex */
    private static abstract class a extends Games.a<Achievements.LoadAchievementsResult> {
        private a() {
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: t */
        public Achievements.LoadAchievementsResult e(final Status status) {
            return new Achievements.LoadAchievementsResult() { // from class: com.google.android.gms.internal.fs.a.1
                @Override // com.google.android.gms.games.achievement.Achievements.LoadAchievementsResult
                public AchievementBuffer getAchievements() {
                    return new AchievementBuffer(DataHolder.empty(14));
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
    private static abstract class b extends Games.a<Achievements.UpdateAchievementResult> {
        private final String uS;

        public b(String str) {
            this.uS = str;
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: u */
        public Achievements.UpdateAchievementResult e(final Status status) {
            return new Achievements.UpdateAchievementResult() { // from class: com.google.android.gms.internal.fs.b.1
                @Override // com.google.android.gms.games.achievement.Achievements.UpdateAchievementResult
                public String getAchievementId() {
                    return b.this.uS;
                }

                @Override // com.google.android.gms.common.api.Result
                public Status getStatus() {
                    return status;
                }
            };
        }
    }

    @Override // com.google.android.gms.games.achievement.Achievements
    public Intent getAchievementsIntent(GoogleApiClient apiClient) {
        return Games.j(apiClient).getAchievementsIntent();
    }

    @Override // com.google.android.gms.games.achievement.Achievements
    public void increment(GoogleApiClient apiClient, final String id, final int numSteps) {
        apiClient.b(new b(id) { // from class: com.google.android.gms.internal.fs.6
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.a((a.c<Achievements.UpdateAchievementResult>) null, id, numSteps);
            }
        });
    }

    @Override // com.google.android.gms.games.achievement.Achievements
    public PendingResult<Achievements.UpdateAchievementResult> incrementImmediate(GoogleApiClient apiClient, final String id, final int numSteps) {
        return apiClient.b(new b(id) { // from class: com.google.android.gms.internal.fs.7
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.a(this, id, numSteps);
            }
        });
    }

    @Override // com.google.android.gms.games.achievement.Achievements
    public PendingResult<Achievements.LoadAchievementsResult> load(GoogleApiClient apiClient, final boolean forceReload) {
        return apiClient.a((GoogleApiClient) new a() { // from class: com.google.android.gms.internal.fs.1
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.b(this, forceReload);
            }
        });
    }

    @Override // com.google.android.gms.games.achievement.Achievements
    public void reveal(GoogleApiClient apiClient, final String id) {
        apiClient.b(new b(id) { // from class: com.google.android.gms.internal.fs.2
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.b((a.c<Achievements.UpdateAchievementResult>) null, id);
            }
        });
    }

    @Override // com.google.android.gms.games.achievement.Achievements
    public PendingResult<Achievements.UpdateAchievementResult> revealImmediate(GoogleApiClient apiClient, final String id) {
        return apiClient.b(new b(id) { // from class: com.google.android.gms.internal.fs.3
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.b(this, id);
            }
        });
    }

    @Override // com.google.android.gms.games.achievement.Achievements
    public void setSteps(GoogleApiClient apiClient, final String id, final int numSteps) {
        apiClient.b(new b(id) { // from class: com.google.android.gms.internal.fs.8
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.b(null, id, numSteps);
            }
        });
    }

    @Override // com.google.android.gms.games.achievement.Achievements
    public PendingResult<Achievements.UpdateAchievementResult> setStepsImmediate(GoogleApiClient apiClient, final String id, final int numSteps) {
        return apiClient.b(new b(id) { // from class: com.google.android.gms.internal.fs.9
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.b(this, id, numSteps);
            }
        });
    }

    @Override // com.google.android.gms.games.achievement.Achievements
    public void unlock(GoogleApiClient apiClient, final String id) {
        apiClient.b(new b(id) { // from class: com.google.android.gms.internal.fs.4
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.c(null, id);
            }
        });
    }

    @Override // com.google.android.gms.games.achievement.Achievements
    public PendingResult<Achievements.UpdateAchievementResult> unlockImmediate(GoogleApiClient apiClient, final String id) {
        return apiClient.b(new b(id) { // from class: com.google.android.gms.internal.fs.5
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.c(this, id);
            }
        });
    }
}
