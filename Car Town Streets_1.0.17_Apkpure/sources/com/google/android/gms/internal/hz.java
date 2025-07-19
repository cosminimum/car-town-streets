package com.google.android.gms.internal;

import android.net.Uri;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.plus.Moments;
import com.google.android.gms.plus.Plus;
import com.google.android.gms.plus.model.moments.Moment;
import com.google.android.gms.plus.model.moments.MomentBuffer;
/* loaded from: classes.dex */
public final class hz implements Moments {
    private final Api.b<hs> Ea;

    /* loaded from: classes.dex */
    private static abstract class a extends Plus.a<Moments.LoadMomentsResult> {
        a(Api.b<hs> bVar) {
            super(bVar);
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: K */
        public Moments.LoadMomentsResult e(final Status status) {
            return new Moments.LoadMomentsResult() { // from class: com.google.android.gms.internal.hz.a.1
                @Override // com.google.android.gms.plus.Moments.LoadMomentsResult
                public MomentBuffer getMomentBuffer() {
                    return null;
                }

                @Override // com.google.android.gms.plus.Moments.LoadMomentsResult
                public String getNextPageToken() {
                    return null;
                }

                @Override // com.google.android.gms.common.api.Result
                public Status getStatus() {
                    return status;
                }

                @Override // com.google.android.gms.plus.Moments.LoadMomentsResult
                public String getUpdated() {
                    return null;
                }

                @Override // com.google.android.gms.common.api.Releasable
                public void release() {
                }
            };
        }
    }

    /* loaded from: classes.dex */
    private static abstract class b extends Plus.a<Status> {
        b(Api.b<hs> bVar) {
            super(bVar);
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: g */
        public Status e(Status status) {
            return status;
        }
    }

    /* loaded from: classes.dex */
    private static abstract class c extends Plus.a<Status> {
        c(Api.b<hs> bVar) {
            super(bVar);
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: g */
        public Status e(Status status) {
            return status;
        }
    }

    public hz(Api.b<hs> bVar) {
        this.Ea = bVar;
    }

    @Override // com.google.android.gms.plus.Moments
    public PendingResult<Moments.LoadMomentsResult> load(GoogleApiClient googleApiClient) {
        return googleApiClient.a((GoogleApiClient) new a(this.Ea) { // from class: com.google.android.gms.internal.hz.1
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(hs hsVar) {
                hsVar.j(this);
            }
        });
    }

    @Override // com.google.android.gms.plus.Moments
    public PendingResult<Moments.LoadMomentsResult> load(GoogleApiClient googleApiClient, final int maxResults, final String pageToken, final Uri targetUrl, final String type, final String userId) {
        return googleApiClient.a((GoogleApiClient) new a(this.Ea) { // from class: com.google.android.gms.internal.hz.2
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(hs hsVar) {
                hsVar.a(this, maxResults, pageToken, targetUrl, type, userId);
            }
        });
    }

    @Override // com.google.android.gms.plus.Moments
    public PendingResult<Status> remove(GoogleApiClient googleApiClient, final String momentId) {
        return googleApiClient.b(new b(this.Ea) { // from class: com.google.android.gms.internal.hz.4
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(hs hsVar) {
                hsVar.removeMoment(momentId);
                a((AnonymousClass4) Status.nA);
            }
        });
    }

    @Override // com.google.android.gms.plus.Moments
    public PendingResult<Status> write(GoogleApiClient googleApiClient, final Moment moment) {
        return googleApiClient.b(new c(this.Ea) { // from class: com.google.android.gms.internal.hz.3
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(hs hsVar) {
                hsVar.writeMoment(moment);
                a((AnonymousClass3) Status.nA);
            }
        });
    }
}
