package com.google.android.gms.internal;

import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.plus.Account;
import com.google.android.gms.plus.Plus;

/* renamed from: com.google.android.gms.internal.hx */
public final class C1380hx implements Account {

    /* renamed from: Ea */
    private final Api.C0647b<C1368hs> f3240Ea;

    /* renamed from: com.google.android.gms.internal.hx$a */
    private static abstract class C1382a extends Plus.C1604a<Status> {
        C1382a(Api.C0647b<C1368hs> bVar) {
            super(bVar);
        }

        /* renamed from: g */
        public Status mo5631e(Status status) {
            return status;
        }
    }

    public C1380hx(Api.C0647b<C1368hs> bVar) {
        this.f3240Ea = bVar;
    }

    /* renamed from: a */
    private static C1368hs m3717a(GoogleApiClient googleApiClient, Api.C0647b<C1368hs> bVar) {
        boolean z = true;
        C1102eg.m2615b(googleApiClient != null, (Object) "GoogleApiClient parameter is required.");
        C1102eg.m2612a(googleApiClient.isConnected(), "GoogleApiClient must be connected.");
        C1368hs hsVar = (C1368hs) googleApiClient.mo5866a(bVar);
        if (hsVar == null) {
            z = false;
        }
        C1102eg.m2612a(z, "GoogleApiClient is not configured to use the Plus.API Api. Pass this into GoogleApiClient.Builder#addApi() to use this feature.");
        return hsVar;
    }

    public void clearDefaultAccount(GoogleApiClient googleApiClient) {
        m3717a(googleApiClient, this.f3240Ea).clearDefaultAccount();
    }

    public String getAccountName(GoogleApiClient googleApiClient) {
        return m3717a(googleApiClient, this.f3240Ea).getAccountName();
    }

    public PendingResult<Status> revokeAccessAndDisconnect(GoogleApiClient googleApiClient) {
        return googleApiClient.mo5868b(new C1382a(this.f3240Ea) {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1368hs hsVar) {
                hsVar.mo8300l(this);
            }
        });
    }
}
