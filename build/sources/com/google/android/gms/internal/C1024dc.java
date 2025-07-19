package com.google.android.gms.internal;

import android.content.Context;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.appstate.AppStateBuffer;
import com.google.android.gms.appstate.AppStateManager;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.common.Scopes;
import com.google.android.gms.common.api.C0655a;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.internal.C1036de;
import com.google.android.gms.internal.C1071dw;

/* renamed from: com.google.android.gms.internal.dc */
public final class C1024dc extends C1071dw<C1036de> {

    /* renamed from: jG */
    private final String f2449jG;

    /* renamed from: com.google.android.gms.internal.dc$a */
    final class C1025a extends C1023db {

        /* renamed from: jW */
        private final C0655a.C0659c<AppStateManager.StateDeletedResult> f2450jW;

        public C1025a(C0655a.C0659c<AppStateManager.StateDeletedResult> cVar) {
            this.f2450jW = (C0655a.C0659c) C1102eg.m2614b(cVar, (Object) "Result holder must not be null");
        }

        public void onStateDeleted(int statusCode, int stateKey) {
            C1024dc.this.mo7451a((C1071dw<T>.b<?>) new C1026b(this.f2450jW, new Status(statusCode), stateKey));
        }
    }

    /* renamed from: com.google.android.gms.internal.dc$b */
    final class C1026b extends C1071dw<C1036de>.b<C0655a.C0659c<AppStateManager.StateDeletedResult>> implements AppStateManager.StateDeletedResult {

        /* renamed from: jY */
        private final Status f2453jY;

        /* renamed from: jZ */
        private final int f2454jZ;

        public C1026b(C0655a.C0659c<AppStateManager.StateDeletedResult> cVar, Status status, int i) {
            super(cVar);
            this.f2453jY = status;
            this.f2454jZ = i;
        }

        /* access modifiers changed from: protected */
        /* renamed from: aL */
        public void mo7306aL() {
        }

        /* renamed from: c */
        public void mo7307b(C0655a.C0659c<AppStateManager.StateDeletedResult> cVar) {
            cVar.mo5612a(this);
        }

        public int getStateKey() {
            return this.f2454jZ;
        }

        public Status getStatus() {
            return this.f2453jY;
        }
    }

    /* renamed from: com.google.android.gms.internal.dc$c */
    final class C1027c extends C1023db {

        /* renamed from: jW */
        private final C0655a.C0659c<AppStateManager.StateListResult> f2455jW;

        public C1027c(C0655a.C0659c<AppStateManager.StateListResult> cVar) {
            this.f2455jW = (C0655a.C0659c) C1102eg.m2614b(cVar, (Object) "Result holder must not be null");
        }

        /* renamed from: a */
        public void mo7292a(DataHolder dataHolder) {
            C1024dc.this.mo7451a((C1071dw<T>.b<?>) new C1028d(this.f2455jW, new Status(dataHolder.getStatusCode()), dataHolder));
        }
    }

    /* renamed from: com.google.android.gms.internal.dc$d */
    final class C1028d extends C1071dw<C1036de>.d<C0655a.C0659c<AppStateManager.StateListResult>> implements AppStateManager.StateListResult {

        /* renamed from: jY */
        private final Status f2458jY;

        /* renamed from: ka */
        private final AppStateBuffer f2459ka;

        public C1028d(C0655a.C0659c<AppStateManager.StateListResult> cVar, Status status, DataHolder dataHolder) {
            super(cVar, dataHolder);
            this.f2458jY = status;
            this.f2459ka = new AppStateBuffer(dataHolder);
        }

        /* renamed from: a */
        public void mo7310a(C0655a.C0659c<AppStateManager.StateListResult> cVar, DataHolder dataHolder) {
            cVar.mo5612a(this);
        }

        public AppStateBuffer getStateBuffer() {
            return this.f2459ka;
        }

        public Status getStatus() {
            return this.f2458jY;
        }
    }

    /* renamed from: com.google.android.gms.internal.dc$e */
    final class C1029e extends C1023db {

        /* renamed from: jW */
        private final C0655a.C0659c<AppStateManager.StateResult> f2460jW;

        public C1029e(C0655a.C0659c<AppStateManager.StateResult> cVar) {
            this.f2460jW = (C0655a.C0659c) C1102eg.m2614b(cVar, (Object) "Result holder must not be null");
        }

        /* renamed from: a */
        public void mo7291a(int i, DataHolder dataHolder) {
            C1024dc.this.mo7451a((C1071dw<T>.b<?>) new C1030f(this.f2460jW, i, dataHolder));
        }
    }

    /* renamed from: com.google.android.gms.internal.dc$f */
    final class C1030f extends C1071dw<C1036de>.d<C0655a.C0659c<AppStateManager.StateResult>> implements AppStateManager.StateConflictResult, AppStateManager.StateLoadedResult, AppStateManager.StateResult {

        /* renamed from: jY */
        private final Status f2463jY;

        /* renamed from: jZ */
        private final int f2464jZ;

        /* renamed from: ka */
        private final AppStateBuffer f2465ka;

        public C1030f(C0655a.C0659c<AppStateManager.StateResult> cVar, int i, DataHolder dataHolder) {
            super(cVar, dataHolder);
            this.f2464jZ = i;
            this.f2463jY = new Status(dataHolder.getStatusCode());
            this.f2465ka = new AppStateBuffer(dataHolder);
        }

        /* renamed from: aM */
        private boolean m2284aM() {
            return this.f2463jY.getStatusCode() == 2000;
        }

        /* renamed from: a */
        public void mo7310a(C0655a.C0659c<AppStateManager.StateResult> cVar, DataHolder dataHolder) {
            cVar.mo5612a(this);
        }

        public AppStateManager.StateConflictResult getConflictResult() {
            if (m2284aM()) {
                return this;
            }
            return null;
        }

        public AppStateManager.StateLoadedResult getLoadedResult() {
            if (m2284aM()) {
                return null;
            }
            return this;
        }

        public byte[] getLocalData() {
            if (this.f2465ka.getCount() == 0) {
                return null;
            }
            return this.f2465ka.get(0).getLocalData();
        }

        public String getResolvedVersion() {
            if (this.f2465ka.getCount() == 0) {
                return null;
            }
            return this.f2465ka.get(0).getConflictVersion();
        }

        public byte[] getServerData() {
            if (this.f2465ka.getCount() == 0) {
                return null;
            }
            return this.f2465ka.get(0).getConflictData();
        }

        public int getStateKey() {
            return this.f2464jZ;
        }

        public Status getStatus() {
            return this.f2463jY;
        }
    }

    /* renamed from: com.google.android.gms.internal.dc$g */
    final class C1031g extends C1023db {

        /* renamed from: jW */
        C0655a.C0659c<Status> f2466jW;

        public C1031g(C0655a.C0659c<Status> cVar) {
            this.f2466jW = (C0655a.C0659c) C1102eg.m2614b(cVar, (Object) "Holder must not be null");
        }

        public void onSignOutComplete() {
            C1024dc.this.mo7451a((C1071dw<T>.b<?>) new C1032h(this.f2466jW, new Status(0)));
        }
    }

    /* renamed from: com.google.android.gms.internal.dc$h */
    final class C1032h extends C1071dw<C1036de>.b<C0655a.C0659c<Status>> {

        /* renamed from: jY */
        private final Status f2469jY;

        public C1032h(C0655a.C0659c<Status> cVar, Status status) {
            super(cVar);
            this.f2469jY = status;
        }

        /* access modifiers changed from: protected */
        /* renamed from: aL */
        public void mo7306aL() {
        }

        /* renamed from: c */
        public void mo7307b(C0655a.C0659c<Status> cVar) {
            cVar.mo5612a(this.f2469jY);
        }
    }

    @Deprecated
    public C1024dc(Context context, GooglePlayServicesClient.ConnectionCallbacks connectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener onConnectionFailedListener, String str, String[] strArr) {
        this(context, (GoogleApiClient.ConnectionCallbacks) new C1071dw.C1074c(connectionCallbacks), (GoogleApiClient.OnConnectionFailedListener) new C1071dw.C1078g(onConnectionFailedListener), str, strArr);
    }

    public C1024dc(Context context, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener, String str, String[] strArr) {
        super(context, connectionCallbacks, onConnectionFailedListener, strArr);
        this.f2449jG = (String) C1102eg.m2616f(str);
    }

    /* renamed from: a */
    public void mo7296a(C0655a.C0659c<AppStateManager.StateListResult> cVar) {
        try {
            ((C1036de) mo7454bQ()).mo7316a(new C1027c(cVar));
        } catch (RemoteException e) {
            Log.w("AppStateClient", "service died");
        }
    }

    /* renamed from: a */
    public void mo7297a(C0655a.C0659c<AppStateManager.StateDeletedResult> cVar, int i) {
        try {
            ((C1036de) mo7454bQ()).mo7321b(new C1025a(cVar), i);
        } catch (RemoteException e) {
            Log.w("AppStateClient", "service died");
        }
    }

    /* renamed from: a */
    public void mo7298a(C0655a.C0659c<AppStateManager.StateResult> cVar, int i, String str, byte[] bArr) {
        try {
            ((C1036de) mo7454bQ()).mo7318a(new C1029e(cVar), i, str, bArr);
        } catch (RemoteException e) {
            Log.w("AppStateClient", "service died");
        }
    }

    /* renamed from: a */
    public void mo7299a(C0655a.C0659c<AppStateManager.StateResult> cVar, int i, byte[] bArr) {
        try {
            ((C1036de) mo7454bQ()).mo7319a(cVar == null ? null : new C1029e(cVar), i, bArr);
        } catch (RemoteException e) {
            Log.w("AppStateClient", "service died");
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo6202a(C1092ec ecVar, C1071dw.C1076e eVar) throws RemoteException {
        ecVar.mo7513a((C1089eb) eVar, (int) GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_VERSION_CODE, getContext().getPackageName(), this.f2449jG, mo7452bO());
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo7300a(String... strArr) {
        boolean z = false;
        for (String equals : strArr) {
            if (equals.equals(Scopes.APP_STATE)) {
                z = true;
            }
        }
        C1102eg.m2612a(z, String.format("App State APIs requires %s to function.", new Object[]{Scopes.APP_STATE}));
    }

    /* access modifiers changed from: protected */
    /* renamed from: am */
    public String mo6203am() {
        return "com.google.android.gms.appstate.service.START";
    }

    /* access modifiers changed from: protected */
    /* renamed from: an */
    public String mo6204an() {
        return "com.google.android.gms.appstate.internal.IAppStateService";
    }

    /* renamed from: b */
    public void mo7301b(C0655a.C0659c<Status> cVar) {
        try {
            ((C1036de) mo7454bQ()).mo7320b(new C1031g(cVar));
        } catch (RemoteException e) {
            Log.w("AppStateClient", "service died");
        }
    }

    /* renamed from: b */
    public void mo7302b(C0655a.C0659c<AppStateManager.StateResult> cVar, int i) {
        try {
            ((C1036de) mo7454bQ()).mo7317a(new C1029e(cVar), i);
        } catch (RemoteException e) {
            Log.w("AppStateClient", "service died");
        }
    }

    public int getMaxNumKeys() {
        try {
            return ((C1036de) mo7454bQ()).getMaxNumKeys();
        } catch (RemoteException e) {
            Log.w("AppStateClient", "service died");
            return 2;
        }
    }

    public int getMaxStateSize() {
        try {
            return ((C1036de) mo7454bQ()).getMaxStateSize();
        } catch (RemoteException e) {
            Log.w("AppStateClient", "service died");
            return 2;
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: r */
    public C1036de mo6207p(IBinder iBinder) {
        return C1036de.C1037a.m2304t(iBinder);
    }
}
