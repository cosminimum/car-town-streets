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

/* renamed from: com.google.android.gms.internal.fv */
public final class C1237fv implements Invitations {

    /* renamed from: com.google.android.gms.internal.fv$a */
    private static abstract class C1239a extends Games.C0782a<Invitations.LoadInvitationsResult> {
        private C1239a() {
        }

        /* renamed from: w */
        public Invitations.LoadInvitationsResult mo5631e(final Status status) {
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
        return Games.m1707j(apiClient).getInvitationInboxIntent();
    }

    public PendingResult<Invitations.LoadInvitationsResult> loadInvitations(GoogleApiClient apiClient) {
        return apiClient.mo5867a(new C1239a() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7773h(this);
            }
        });
    }

    public void registerInvitationListener(GoogleApiClient apiClient, OnInvitationReceivedListener listener) {
        Games.m1707j(apiClient).registerInvitationListener(listener);
    }

    public void unregisterInvitationListener(GoogleApiClient apiClient) {
        Games.m1707j(apiClient).unregisterInvitationListener();
    }
}
