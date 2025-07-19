package com.google.android.gms.panorama;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.C0655a;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.internal.C1067dt;
import com.google.android.gms.internal.C1351hm;

public final class Panorama {
    public static final Api API = new Api(f3704jO, new Scope[0]);

    /* renamed from: jO */
    static final Api.C0647b<C1351hm> f3704jO = new Api.C0647b<C1351hm>() {
        /* renamed from: f */
        public C1351hm mo5621b(Context context, C1067dt dtVar, GoogleApiClient.ApiOptions apiOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            return new C1351hm(context, connectionCallbacks, onConnectionFailedListener);
        }

        public int getPriority() {
            return Integer.MAX_VALUE;
        }
    };

    public interface PanoramaResult extends Result {
        Intent getViewerIntent();
    }

    /* renamed from: com.google.android.gms.panorama.Panorama$a */
    public interface C1598a extends PanoramaResult {
    }

    /* renamed from: com.google.android.gms.panorama.Panorama$b */
    private static abstract class C1599b extends C0655a.C0656a<PanoramaResult, C1351hm> {
        public C1599b() {
            super(Panorama.f3704jO);
        }

        /* renamed from: J */
        public PanoramaResult mo5631e(final Status status) {
            return new PanoramaResult() {
                public Status getStatus() {
                    return status;
                }

                public Intent getViewerIntent() {
                    return null;
                }
            };
        }
    }

    private Panorama() {
    }

    public static PendingResult<PanoramaResult> loadPanoramaInfo(GoogleApiClient client, final Uri uri) {
        return client.mo5867a(new C1599b() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1351hm hmVar) {
                hmVar.mo8240a(this, uri, false);
            }
        });
    }

    public static PendingResult<PanoramaResult> loadPanoramaInfoAndGrantAccess(GoogleApiClient client, final Uri uri) {
        return client.mo5867a(new C1599b() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1351hm hmVar) {
                hmVar.mo8240a(this, uri, true);
            }
        });
    }
}
