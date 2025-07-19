package com.google.android.gms.panorama;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.a;
import com.google.android.gms.internal.dt;
import com.google.android.gms.internal.hm;
/* loaded from: classes.dex */
public final class Panorama {
    static final Api.b<hm> jO = new Api.b<hm>() { // from class: com.google.android.gms.panorama.Panorama.1
        @Override // com.google.android.gms.common.api.Api.b
        /* renamed from: f */
        public hm b(Context context, dt dtVar, GoogleApiClient.ApiOptions apiOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            return new hm(context, connectionCallbacks, onConnectionFailedListener);
        }

        @Override // com.google.android.gms.common.api.Api.b
        public int getPriority() {
            return Integer.MAX_VALUE;
        }
    };
    public static final Api API = new Api(jO, new Scope[0]);

    /* loaded from: classes.dex */
    public interface PanoramaResult extends Result {
        Intent getViewerIntent();
    }

    /* loaded from: classes.dex */
    public interface a extends PanoramaResult {
    }

    /* loaded from: classes.dex */
    private static abstract class b extends a.AbstractC0011a<PanoramaResult, hm> {
        public b() {
            super(Panorama.jO);
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: J */
        public PanoramaResult e(final Status status) {
            return new PanoramaResult() { // from class: com.google.android.gms.panorama.Panorama.b.1
                @Override // com.google.android.gms.common.api.Result
                public Status getStatus() {
                    return status;
                }

                @Override // com.google.android.gms.panorama.Panorama.PanoramaResult
                public Intent getViewerIntent() {
                    return null;
                }
            };
        }
    }

    private Panorama() {
    }

    public static PendingResult<PanoramaResult> loadPanoramaInfo(GoogleApiClient client, final Uri uri) {
        return client.a((GoogleApiClient) new b() { // from class: com.google.android.gms.panorama.Panorama.2
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(hm hmVar) {
                hmVar.a((a.c<PanoramaResult>) this, uri, false);
            }
        });
    }

    public static PendingResult<PanoramaResult> loadPanoramaInfoAndGrantAccess(GoogleApiClient client, final Uri uri) {
        return client.a((GoogleApiClient) new b() { // from class: com.google.android.gms.panorama.Panorama.3
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(hm hmVar) {
                hmVar.a((a.c<PanoramaResult>) this, uri, true);
            }
        });
    }
}
