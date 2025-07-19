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

public final class hz implements Moments {
    private final Api.b<hs> Ea;

    private static abstract class a extends Plus.a<Moments.LoadMomentsResult> {
        a(Api.b<hs> bVar) {
            super(bVar);
        }

        /* renamed from: K */
        public Moments.LoadMomentsResult e(final Status status) {
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

    private static abstract class b extends Plus.a<Status> {
        b(Api.b<hs> bVar) {
            super(bVar);
        }

        /* renamed from: g */
        public Status e(Status status) {
            return status;
        }
    }

    private static abstract class c extends Plus.a<Status> {
        c(Api.b<hs> bVar) {
            super(bVar);
        }

        /* renamed from: g */
        public Status e(Status status) {
            return status;
        }
    }

    public hz(Api.b<hs> bVar) {
        this.Ea = bVar;
    }

    public PendingResult<Moments.LoadMomentsResult> load(GoogleApiClient googleApiClient) {
        return googleApiClient.a(new a(this.Ea) {
            /* access modifiers changed from: protected */
            public void a(hs hsVar) {
                hsVar.j(this);
            }
        });
    }

    public PendingResult<Moments.LoadMomentsResult> load(GoogleApiClient googleApiClient, int maxResults, String pageToken, Uri targetUrl, String type, String userId) {
        final int i = maxResults;
        final String str = pageToken;
        final Uri uri = targetUrl;
        final String str2 = type;
        final String str3 = userId;
        return googleApiClient.a(new a(this.Ea) {
            /* access modifiers changed from: protected */
            public void a(hs hsVar) {
                hsVar.a(this, i, str, uri, str2, str3);
            }
        });
    }

    public PendingResult<Status> remove(GoogleApiClient googleApiClient, final String momentId) {
        return googleApiClient.b(new b(this.Ea) {
            /* access modifiers changed from: protected */
            public void a(hs hsVar) {
                hsVar.removeMoment(momentId);
                a(Status.nA);
            }
        });
    }

    public PendingResult<Status> write(GoogleApiClient googleApiClient, final Moment moment) {
        return googleApiClient.b(new c(this.Ea) {
            /* access modifiers changed from: protected */
            public void a(hs hsVar) {
                hsVar.writeMoment(moment);
                a(Status.nA);
            }
        });
    }
}
