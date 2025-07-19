package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.a;
import com.google.android.gms.internal.dw;
import com.google.android.gms.internal.hk;
import com.google.android.gms.internal.hl;
import com.google.android.gms.panorama.Panorama;
/* loaded from: classes.dex */
public class hm extends dw<hl> {

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public final class a extends dw<hl>.b<a.c<Panorama.a>> implements Panorama.a {
        public final Status Dl;
        public final Intent Dm;
        public final int type;

        public a(a.c<Panorama.a> cVar, Status status, int i, Intent intent) {
            super(cVar);
            this.Dl = status;
            this.type = i;
            this.Dm = intent;
        }

        @Override // com.google.android.gms.internal.dw.b
        protected void aL() {
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.dw.b
        /* renamed from: c */
        public void b(a.c<Panorama.a> cVar) {
            cVar.a(this);
        }

        @Override // com.google.android.gms.common.api.Result
        public Status getStatus() {
            return this.Dl;
        }

        @Override // com.google.android.gms.panorama.Panorama.PanoramaResult
        public Intent getViewerIntent() {
            return this.Dm;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public final class b extends hk.a {
        private final a.c<Panorama.a> Do;
        private final a.c<Panorama.PanoramaResult> Dp;
        private final Uri Dq;

        public b(a.c<Panorama.a> cVar, a.c<Panorama.PanoramaResult> cVar2, Uri uri) {
            this.Do = cVar;
            this.Dp = cVar2;
            this.Dq = uri;
        }

        @Override // com.google.android.gms.internal.hk
        public void a(int i, Bundle bundle, int i2, Intent intent) {
            if (this.Dq != null) {
                hm.this.getContext().revokeUriPermission(this.Dq, 1);
            }
            Status status = new Status(i, null, bundle != null ? (PendingIntent) bundle.getParcelable("pendingIntent") : null);
            if (this.Dp != null) {
                hm.this.a(new c(this.Dp, status, intent));
            } else if (this.Do == null) {
            } else {
                hm.this.a(new a(this.Do, status, i2, intent));
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public final class c extends dw<hl>.b<a.c<Panorama.PanoramaResult>> implements Panorama.PanoramaResult {
        private final Status Dl;
        private final Intent Dm;

        public c(a.c<Panorama.PanoramaResult> cVar, Status status, Intent intent) {
            super(cVar);
            this.Dl = status;
            this.Dm = intent;
        }

        @Override // com.google.android.gms.internal.dw.b
        protected void aL() {
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.dw.b
        /* renamed from: c */
        public void b(a.c<Panorama.PanoramaResult> cVar) {
            cVar.a(this);
        }

        @Override // com.google.android.gms.common.api.Result
        public Status getStatus() {
            return this.Dl;
        }

        @Override // com.google.android.gms.panorama.Panorama.PanoramaResult
        public Intent getViewerIntent() {
            return this.Dm;
        }
    }

    @Deprecated
    public hm(Context context, GooglePlayServicesClient.ConnectionCallbacks connectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener onConnectionFailedListener) {
        this(context, new dw.c(connectionCallbacks), new dw.g(onConnectionFailedListener));
    }

    public hm(Context context, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
        super(context, connectionCallbacks, onConnectionFailedListener, (String[]) null);
    }

    public void a(a.c<Panorama.PanoramaResult> cVar, Uri uri, boolean z) {
        a(new b(null, cVar, z ? uri : null), uri, null, z);
    }

    @Override // com.google.android.gms.internal.dw
    protected void a(ec ecVar, dw.e eVar) throws RemoteException {
        ecVar.a(eVar, GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_VERSION_CODE, getContext().getPackageName(), new Bundle());
    }

    public void a(b bVar, Uri uri, Bundle bundle, boolean z) {
        bP();
        if (z) {
            getContext().grantUriPermission(GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_PACKAGE, uri, 1);
        }
        try {
            bQ().a(bVar, uri, bundle, z);
        } catch (RemoteException e) {
            bVar.a(8, null, 0, null);
        }
    }

    @Override // com.google.android.gms.internal.dw
    protected String am() {
        return "com.google.android.gms.panorama.service.START";
    }

    @Override // com.google.android.gms.internal.dw
    protected String an() {
        return "com.google.android.gms.panorama.internal.IPanoramaService";
    }

    @Override // com.google.android.gms.internal.dw
    /* renamed from: at */
    public hl p(IBinder iBinder) {
        return hl.a.as(iBinder);
    }
}
