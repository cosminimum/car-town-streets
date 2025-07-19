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
import com.google.android.gms.common.api.C0655a;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.internal.C1071dw;
import com.google.android.gms.internal.C1345hk;
import com.google.android.gms.internal.C1348hl;
import com.google.android.gms.panorama.Panorama;

/* renamed from: com.google.android.gms.internal.hm */
public class C1351hm extends C1071dw<C1348hl> {

    /* renamed from: com.google.android.gms.internal.hm$a */
    final class C1352a extends C1071dw<C1348hl>.b<C0655a.C0659c<Panorama.C1598a>> implements Panorama.C1598a {

        /* renamed from: Dl */
        public final Status f3189Dl;

        /* renamed from: Dm */
        public final Intent f3190Dm;
        public final int type;

        public C1352a(C0655a.C0659c<Panorama.C1598a> cVar, Status status, int i, Intent intent) {
            super(cVar);
            this.f3189Dl = status;
            this.type = i;
            this.f3190Dm = intent;
        }

        /* access modifiers changed from: protected */
        /* renamed from: aL */
        public void mo7306aL() {
        }

        /* access modifiers changed from: protected */
        /* renamed from: c */
        public void mo7307b(C0655a.C0659c<Panorama.C1598a> cVar) {
            cVar.mo5612a(this);
        }

        public Status getStatus() {
            return this.f3189Dl;
        }

        public Intent getViewerIntent() {
            return this.f3190Dm;
        }
    }

    /* renamed from: com.google.android.gms.internal.hm$b */
    final class C1353b extends C1345hk.C1346a {

        /* renamed from: Do */
        private final C0655a.C0659c<Panorama.C1598a> f3193Do;

        /* renamed from: Dp */
        private final C0655a.C0659c<Panorama.PanoramaResult> f3194Dp;

        /* renamed from: Dq */
        private final Uri f3195Dq;

        public C1353b(C0655a.C0659c<Panorama.C1598a> cVar, C0655a.C0659c<Panorama.PanoramaResult> cVar2, Uri uri) {
            this.f3193Do = cVar;
            this.f3194Dp = cVar2;
            this.f3195Dq = uri;
        }

        /* renamed from: a */
        public void mo8233a(int i, Bundle bundle, int i2, Intent intent) {
            if (this.f3195Dq != null) {
                C1351hm.this.getContext().revokeUriPermission(this.f3195Dq, 1);
            }
            Status status = new Status(i, (String) null, bundle != null ? (PendingIntent) bundle.getParcelable("pendingIntent") : null);
            if (this.f3194Dp != null) {
                C1351hm.this.mo7451a((C1071dw<T>.b<?>) new C1354c(this.f3194Dp, status, intent));
            } else if (this.f3193Do != null) {
                C1351hm.this.mo7451a((C1071dw<T>.b<?>) new C1352a(this.f3193Do, status, i2, intent));
            }
        }
    }

    /* renamed from: com.google.android.gms.internal.hm$c */
    final class C1354c extends C1071dw<C1348hl>.b<C0655a.C0659c<Panorama.PanoramaResult>> implements Panorama.PanoramaResult {

        /* renamed from: Dl */
        private final Status f3196Dl;

        /* renamed from: Dm */
        private final Intent f3197Dm;

        public C1354c(C0655a.C0659c<Panorama.PanoramaResult> cVar, Status status, Intent intent) {
            super(cVar);
            this.f3196Dl = status;
            this.f3197Dm = intent;
        }

        /* access modifiers changed from: protected */
        /* renamed from: aL */
        public void mo7306aL() {
        }

        /* access modifiers changed from: protected */
        /* renamed from: c */
        public void mo7307b(C0655a.C0659c<Panorama.PanoramaResult> cVar) {
            cVar.mo5612a(this);
        }

        public Status getStatus() {
            return this.f3196Dl;
        }

        public Intent getViewerIntent() {
            return this.f3197Dm;
        }
    }

    @Deprecated
    public C1351hm(Context context, GooglePlayServicesClient.ConnectionCallbacks connectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener onConnectionFailedListener) {
        this(context, (GoogleApiClient.ConnectionCallbacks) new C1071dw.C1074c(connectionCallbacks), (GoogleApiClient.OnConnectionFailedListener) new C1071dw.C1078g(onConnectionFailedListener));
    }

    public C1351hm(Context context, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
        super(context, connectionCallbacks, onConnectionFailedListener, (String[]) null);
    }

    /* renamed from: a */
    public void mo8240a(C0655a.C0659c<Panorama.PanoramaResult> cVar, Uri uri, boolean z) {
        mo8241a(new C1353b((C0655a.C0659c<Panorama.C1598a>) null, cVar, z ? uri : null), uri, (Bundle) null, z);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo6202a(C1092ec ecVar, C1071dw.C1076e eVar) throws RemoteException {
        ecVar.mo7511a(eVar, GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_VERSION_CODE, getContext().getPackageName(), new Bundle());
    }

    /* renamed from: a */
    public void mo8241a(C1353b bVar, Uri uri, Bundle bundle, boolean z) {
        mo7453bP();
        if (z) {
            getContext().grantUriPermission(GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_PACKAGE, uri, 1);
        }
        try {
            ((C1348hl) mo7454bQ()).mo8237a(bVar, uri, bundle, z);
        } catch (RemoteException e) {
            bVar.mo8233a(8, (Bundle) null, 0, (Intent) null);
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: am */
    public String mo6203am() {
        return "com.google.android.gms.panorama.service.START";
    }

    /* access modifiers changed from: protected */
    /* renamed from: an */
    public String mo6204an() {
        return "com.google.android.gms.panorama.internal.IPanoramaService";
    }

    /* renamed from: at */
    public C1348hl mo6207p(IBinder iBinder) {
        return C1348hl.C1349a.m3591as(iBinder);
    }
}
