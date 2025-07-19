package com.google.android.gms.internal;

import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.games.Game;
import com.google.android.gms.games.GameBuffer;
import com.google.android.gms.games.Games;
import com.google.android.gms.games.GamesMetadata;
/* loaded from: classes.dex */
public final class fu implements GamesMetadata {

    /* loaded from: classes.dex */
    private static abstract class a extends Games.a<GamesMetadata.LoadGamesResult> {
        private a() {
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: v */
        public GamesMetadata.LoadGamesResult e(final Status status) {
            return new GamesMetadata.LoadGamesResult() { // from class: com.google.android.gms.internal.fu.a.1
                @Override // com.google.android.gms.games.GamesMetadata.LoadGamesResult
                public GameBuffer getGames() {
                    return new GameBuffer(DataHolder.empty(14));
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

    @Override // com.google.android.gms.games.GamesMetadata
    public Game getCurrentGame(GoogleApiClient apiClient) {
        return Games.j(apiClient).getCurrentGame();
    }

    @Override // com.google.android.gms.games.GamesMetadata
    public PendingResult<GamesMetadata.LoadGamesResult> loadGame(GoogleApiClient apiClient) {
        return apiClient.a((GoogleApiClient) new a() { // from class: com.google.android.gms.internal.fu.1
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.g(this);
            }
        });
    }
}
