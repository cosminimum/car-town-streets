package com.google.android.gms.internal;

import android.content.Intent;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.games.Games;
import com.google.android.gms.games.multiplayer.InvitationBuffer;
import com.google.android.gms.games.multiplayer.Invitations;
import com.google.android.gms.games.multiplayer.OnInvitationReceivedListener;
/* loaded from: classes.dex */
public final class fv implements Invitations {

    /* loaded from: classes.dex */
    private static abstract class a extends Games.a<Invitations.LoadInvitationsResult> {
        private a() {
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: w */
        public Invitations.LoadInvitationsResult e(final Status status) {
            return new Invitations.LoadInvitationsResult() { // from class: com.google.android.gms.internal.fv.a.1
                @Override // com.google.android.gms.games.multiplayer.Invitations.LoadInvitationsResult
                public InvitationBuffer getInvitations() {
                    return new InvitationBuffer(DataHolder.empty(14));
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

    @Override // com.google.android.gms.games.multiplayer.Invitations
    public Intent getInvitationInboxIntent(GoogleApiClient apiClient) {
        return Games.j(apiClient).getInvitationInboxIntent();
    }

    @Override // com.google.android.gms.games.multiplayer.Invitations
    public PendingResult<Invitations.LoadInvitationsResult> loadInvitations(GoogleApiClient apiClient) {
        return apiClient.a((GoogleApiClient) new a() { // from class: com.google.android.gms.internal.fv.1
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(fl flVar) {
                flVar.h(this);
            }
        });
    }

    @Override // com.google.android.gms.games.multiplayer.Invitations
    public void registerInvitationListener(GoogleApiClient apiClient, OnInvitationReceivedListener listener) {
        Games.j(apiClient).registerInvitationListener(listener);
    }

    @Override // com.google.android.gms.games.multiplayer.Invitations
    public void unregisterInvitationListener(GoogleApiClient apiClient) {
        Games.j(apiClient).unregisterInvitationListener();
    }
}
