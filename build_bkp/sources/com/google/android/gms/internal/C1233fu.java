package com.google.android.gms.internal;

import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.games.Game;
import com.google.android.gms.games.GameBuffer;
import com.google.android.gms.games.Games;
import com.google.android.gms.games.GamesMetadata;

/* renamed from: com.google.android.gms.internal.fu */
public final class C1233fu implements GamesMetadata {

    /* renamed from: com.google.android.gms.internal.fu$a */
    private static abstract class C1235a extends Games.C0782a<GamesMetadata.LoadGamesResult> {
        private C1235a() {
        }

        /* renamed from: v */
        public GamesMetadata.LoadGamesResult mo5631e(final Status status) {
            return new GamesMetadata.LoadGamesResult() {
                public GameBuffer getGames() {
                    return new GameBuffer(DataHolder.empty(14));
                }

                public Status getStatus() {
                    return status;
                }

                public void release() {
                }
            };
        }
    }

    public Game getCurrentGame(GoogleApiClient apiClient) {
        return Games.m1707j(apiClient).getCurrentGame();
    }

    public PendingResult<GamesMetadata.LoadGamesResult> loadGame(GoogleApiClient apiClient) {
        return apiClient.mo5867a(new C1235a() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7754g(this);
            }
        });
    }
}
