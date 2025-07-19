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

public final class fv implements Invitations {

    private static abstract class a extends Games.a<Invitations.LoadInvitationsResult> {
        private a() {
        }

        /* renamed from: w */
        public Invitations.LoadInvitationsResult e(final Status status) {
            return new Invitations.LoadInvitationsResult() {
                public InvitationBuffer getInvitations() {
                    return new InvitationBuffer(DataHolder.empty(14));
                }

                public Status getStatus() {
                    return status;
                }

                public void release() {
                }
            };
        }
    }

    public Intent getInvitationInboxIntent(GoogleApiClient apiClient) {
        return Games.j(apiClient).getInvitationInboxIntent();
    }

    public PendingResult<Invitations.LoadInvitationsResult> loadInvitations(GoogleApiClient apiClient) {
        return apiClient.a(new a() {
            /* access modifiers changed from: protected */
            public void a(fl flVar) {
                flVar.h(this);
            }
        });
    }

    public void registerInvitationListener(GoogleApiClient apiClient, OnInvitationReceivedListener listener) {
        Games.j(apiClient).registerInvitationListener(listener);
    }

    public void unregisterInvitationListener(GoogleApiClient apiClient) {
        Games.j(apiClient).unregisterInvitationListener();
    }
}
