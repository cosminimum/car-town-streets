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

/* renamed from: com.google.android.gms.internal.hz */
public final class C1384hz implements Moments {

    /* renamed from: Ea */
    private final Api.C0647b<C1368hs> f3243Ea;

    /* renamed from: com.google.android.gms.internal.hz$a */
    private static abstract class C1389a extends Plus.C1604a<Moments.LoadMomentsResult> {
        C1389a(Api.C0647b<C1368hs> bVar) {
            super(bVar);
        }

        /* renamed from: K */
        public Moments.LoadMomentsResult mo5631e(final Status status) {
            return new Moments.LoadMomentsResult() {
                public MomentBuffer getMomentBuffer() {
                    return null;
                }

                public String getNextPageToken() {
                    return null;
                }

                public Status getStatus() {
                    return status;
                }

                public String getUpdated() {
                    return null;
                }

                public void release() {
                }
            };
        }
    }

    /* renamed from: com.google.android.gms.internal.hz$b */
    private static abstract class C1391b extends Plus.C1604a<Status> {
        C1391b(Api.C0647b<C1368hs> bVar) {
            super(bVar);
        }

        /* renamed from: g */
        public Status mo5631e(Status status) {
            return status;
        }
    }

    /* renamed from: com.google.android.gms.internal.hz$c */
    private static abstract class C1392c extends Plus.C1604a<Status> {
        C1392c(Api.C0647b<C1368hs> bVar) {
            super(bVar);
        }

        /* renamed from: g */
        public Status mo5631e(Status status) {
            return status;
        }
    }

    public C1384hz(Api.C0647b<C1368hs> bVar) {
        this.f3243Ea = bVar;
    }

    public PendingResult<Moments.LoadMomentsResult> load(GoogleApiClient googleApiClient) {
        return googleApiClient.mo5867a(new C1389a(this.f3243Ea) {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1368hs hsVar) {
                hsVar.mo8298j(this);
            }
        });
    }

    public PendingResult<Moments.LoadMomentsResult> load(GoogleApiClient googleApiClient, int maxResults, String pageToken, Uri targetUrl, String type, String userId) {
        final int i = maxResults;
        final String str = pageToken;
        final Uri uri = targetUrl;
        final String str2 = type;
        final String str3 = userId;
        return googleApiClient.mo5867a(new C1389a(this.f3243Ea) {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1368hs hsVar) {
                hsVar.mo8289a(this, i, str, uri, str2, str3);
            }
        });
    }

    public PendingResult<Status> remove(GoogleApiClient googleApiClient, final String momentId) {
        return googleApiClient.mo5868b(new C1391b(this.f3243Ea) {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1368hs hsVar) {
                hsVar.removeMoment(momentId);
                mo5612a(Status.f1350nA);
            }
        });
    }

    public PendingResult<Status> write(GoogleApiClient googleApiClient, final Moment moment) {
        return googleApiClient.mo5868b(new C1392c(this.f3243Ea) {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1368hs hsVar) {
                hsVar.writeMoment(moment);
                mo5612a(Status.f1350nA);
            }
        });
    }
}
