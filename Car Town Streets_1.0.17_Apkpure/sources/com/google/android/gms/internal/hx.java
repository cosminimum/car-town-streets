package com.google.android.gms.internal;

import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.plus.Account;
import com.google.android.gms.plus.Plus;
/* loaded from: classes.dex */
public final class hx implements Account {
    private final Api.b<hs> Ea;

    /* loaded from: classes.dex */
    private static abstract class a extends Plus.a<Status> {
        a(Api.b<hs> bVar) {
            super(bVar);
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: g */
        public Status e(Status status) {
            return status;
        }
    }

    public hx(Api.b<hs> bVar) {
        this.Ea = bVar;
    }

    private static hs a(GoogleApiClient googleApiClient, Api.b<hs> bVar) {
        boolean z = true;
        eg.b(googleApiClient != null, "GoogleApiClient parameter is required.");
        eg.a(googleApiClient.isConnected(), "GoogleApiClient must be connected.");
        hs hsVar = (hs) googleApiClient.a(bVar);
        if (hsVar == null) {
            z = false;
        }
        eg.a(z, "GoogleApiClient is not configured to use the Plus.API Api. Pass this into GoogleApiClient.Builder#addApi() to use this feature.");
        return hsVar;
    }

    @Override // com.google.android.gms.plus.Account
    public void clearDefaultAccount(GoogleApiClient googleApiClient) {
        a(googleApiClient, this.Ea).clearDefaultAccount();
    }

    @Override // com.google.android.gms.plus.Account
    public String getAccountName(GoogleApiClient googleApiClient) {
        return a(googleApiClient, this.Ea).getAccountName();
    }

    @Override // com.google.android.gms.plus.Account
    public PendingResult<Status> revokeAccessAndDisconnect(GoogleApiClient googleApiClient) {
        return googleApiClient.b(new a(this.Ea) { // from class: com.google.android.gms.internal.hx.1
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(hs hsVar) {
                hsVar.l(this);
            }
        });
    }
}
