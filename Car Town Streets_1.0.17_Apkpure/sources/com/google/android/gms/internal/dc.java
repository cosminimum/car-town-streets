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
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.a;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.internal.de;
import com.google.android.gms.internal.dw;
/* loaded from: classes.dex */
public final class dc extends dw<de> {
    private final String jG;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public final class a extends db {
        private final a.c<AppStateManager.StateDeletedResult> jW;

        public a(a.c<AppStateManager.StateDeletedResult> cVar) {
            this.jW = (a.c) eg.b(cVar, "Result holder must not be null");
        }

        @Override // com.google.android.gms.internal.db, com.google.android.gms.internal.dd
        public void onStateDeleted(int statusCode, int stateKey) {
            dc.this.a(new b(this.jW, new Status(statusCode), stateKey));
        }
    }

    /* loaded from: classes.dex */
    final class b extends dw<de>.b<a.c<AppStateManager.StateDeletedResult>> implements AppStateManager.StateDeletedResult {
        private final Status jY;
        private final int jZ;

        public b(a.c<AppStateManager.StateDeletedResult> cVar, Status status, int i) {
            super(cVar);
            this.jY = status;
            this.jZ = i;
        }

        @Override // com.google.android.gms.internal.dw.b
        protected void aL() {
        }

        @Override // com.google.android.gms.internal.dw.b
        /* renamed from: c */
        public void b(a.c<AppStateManager.StateDeletedResult> cVar) {
            cVar.a(this);
        }

        @Override // com.google.android.gms.appstate.AppStateManager.StateDeletedResult
        public int getStateKey() {
            return this.jZ;
        }

        @Override // com.google.android.gms.common.api.Result
        public Status getStatus() {
            return this.jY;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public final class c extends db {
        private final a.c<AppStateManager.StateListResult> jW;

        public c(a.c<AppStateManager.StateListResult> cVar) {
            this.jW = (a.c) eg.b(cVar, "Result holder must not be null");
        }

        @Override // com.google.android.gms.internal.db, com.google.android.gms.internal.dd
        public void a(DataHolder dataHolder) {
            dc.this.a(new d(this.jW, new Status(dataHolder.getStatusCode()), dataHolder));
        }
    }

    /* loaded from: classes.dex */
    final class d extends dw<de>.d<a.c<AppStateManager.StateListResult>> implements AppStateManager.StateListResult {
        private final Status jY;
        private final AppStateBuffer ka;

        public d(a.c<AppStateManager.StateListResult> cVar, Status status, DataHolder dataHolder) {
            super(cVar, dataHolder);
            this.jY = status;
            this.ka = new AppStateBuffer(dataHolder);
        }

        @Override // com.google.android.gms.internal.dw.d
        public void a(a.c<AppStateManager.StateListResult> cVar, DataHolder dataHolder) {
            cVar.a(this);
        }

        @Override // com.google.android.gms.appstate.AppStateManager.StateListResult
        public AppStateBuffer getStateBuffer() {
            return this.ka;
        }

        @Override // com.google.android.gms.common.api.Result
        public Status getStatus() {
            return this.jY;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public final class e extends db {
        private final a.c<AppStateManager.StateResult> jW;

        public e(a.c<AppStateManager.StateResult> cVar) {
            this.jW = (a.c) eg.b(cVar, "Result holder must not be null");
        }

        @Override // com.google.android.gms.internal.db, com.google.android.gms.internal.dd
        public void a(int i, DataHolder dataHolder) {
            dc.this.a(new f(this.jW, i, dataHolder));
        }
    }

    /* loaded from: classes.dex */
    final class f extends dw<de>.d<a.c<AppStateManager.StateResult>> implements AppStateManager.StateConflictResult, AppStateManager.StateLoadedResult, AppStateManager.StateResult {
        private final Status jY;
        private final int jZ;
        private final AppStateBuffer ka;

        public f(a.c<AppStateManager.StateResult> cVar, int i, DataHolder dataHolder) {
            super(cVar, dataHolder);
            this.jZ = i;
            this.jY = new Status(dataHolder.getStatusCode());
            this.ka = new AppStateBuffer(dataHolder);
        }

        private boolean aM() {
            return this.jY.getStatusCode() == 2000;
        }

        @Override // com.google.android.gms.internal.dw.d
        public void a(a.c<AppStateManager.StateResult> cVar, DataHolder dataHolder) {
            cVar.a(this);
        }

        @Override // com.google.android.gms.appstate.AppStateManager.StateResult
        public AppStateManager.StateConflictResult getConflictResult() {
            if (aM()) {
                return this;
            }
            return null;
        }

        @Override // com.google.android.gms.appstate.AppStateManager.StateResult
        public AppStateManager.StateLoadedResult getLoadedResult() {
            if (aM()) {
                return null;
            }
            return this;
        }

        @Override // com.google.android.gms.appstate.AppStateManager.StateConflictResult, com.google.android.gms.appstate.AppStateManager.StateLoadedResult
        public byte[] getLocalData() {
            if (this.ka.getCount() == 0) {
                return null;
            }
            return this.ka.mo391get(0).getLocalData();
        }

        @Override // com.google.android.gms.appstate.AppStateManager.StateConflictResult
        public String getResolvedVersion() {
            if (this.ka.getCount() == 0) {
                return null;
            }
            return this.ka.mo391get(0).getConflictVersion();
        }

        @Override // com.google.android.gms.appstate.AppStateManager.StateConflictResult
        public byte[] getServerData() {
            if (this.ka.getCount() == 0) {
                return null;
            }
            return this.ka.mo391get(0).getConflictData();
        }

        @Override // com.google.android.gms.appstate.AppStateManager.StateConflictResult, com.google.android.gms.appstate.AppStateManager.StateLoadedResult
        public int getStateKey() {
            return this.jZ;
        }

        @Override // com.google.android.gms.common.api.Result
        public Status getStatus() {
            return this.jY;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public final class g extends db {
        a.c<Status> jW;

        public g(a.c<Status> cVar) {
            this.jW = (a.c) eg.b(cVar, "Holder must not be null");
        }

        @Override // com.google.android.gms.internal.db, com.google.android.gms.internal.dd
        public void onSignOutComplete() {
            dc.this.a(new h(this.jW, new Status(0)));
        }
    }

    /* loaded from: classes.dex */
    final class h extends dw<de>.b<a.c<Status>> {
        private final Status jY;

        public h(a.c<Status> cVar, Status status) {
            super(cVar);
            this.jY = status;
        }

        @Override // com.google.android.gms.internal.dw.b
        protected void aL() {
        }

        @Override // com.google.android.gms.internal.dw.b
        /* renamed from: c */
        public void b(a.c<Status> cVar) {
            cVar.a(this.jY);
        }
    }

    @Deprecated
    public dc(Context context, GooglePlayServicesClient.ConnectionCallbacks connectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener onConnectionFailedListener, String str, String[] strArr) {
        this(context, new dw.c(connectionCallbacks), new dw.g(onConnectionFailedListener), str, strArr);
    }

    public dc(Context context, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener, String str, String[] strArr) {
        super(context, connectionCallbacks, onConnectionFailedListener, strArr);
        this.jG = (String) eg.f(str);
    }

    public void a(a.c<AppStateManager.StateListResult> cVar) {
        try {
            bQ().a(new c(cVar));
        } catch (RemoteException e2) {
            Log.w("AppStateClient", "service died");
        }
    }

    public void a(a.c<AppStateManager.StateDeletedResult> cVar, int i) {
        try {
            bQ().b(new a(cVar), i);
        } catch (RemoteException e2) {
            Log.w("AppStateClient", "service died");
        }
    }

    public void a(a.c<AppStateManager.StateResult> cVar, int i, String str, byte[] bArr) {
        try {
            bQ().a(new e(cVar), i, str, bArr);
        } catch (RemoteException e2) {
            Log.w("AppStateClient", "service died");
        }
    }

    public void a(a.c<AppStateManager.StateResult> cVar, int i, byte[] bArr) {
        e eVar;
        if (cVar == null) {
            eVar = null;
        } else {
            try {
                eVar = new e(cVar);
            } catch (RemoteException e2) {
                Log.w("AppStateClient", "service died");
                return;
            }
        }
        bQ().a(eVar, i, bArr);
    }

    @Override // com.google.android.gms.internal.dw
    protected void a(ec ecVar, dw.e eVar) throws RemoteException {
        ecVar.a(eVar, GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_VERSION_CODE, getContext().getPackageName(), this.jG, bO());
    }

    @Override // com.google.android.gms.internal.dw
    protected void a(String... strArr) {
        boolean z = false;
        for (String str : strArr) {
            if (str.equals(Scopes.APP_STATE)) {
                z = true;
            }
        }
        eg.a(z, String.format("App State APIs requires %s to function.", Scopes.APP_STATE));
    }

    @Override // com.google.android.gms.internal.dw
    protected String am() {
        return "com.google.android.gms.appstate.service.START";
    }

    @Override // com.google.android.gms.internal.dw
    protected String an() {
        return "com.google.android.gms.appstate.internal.IAppStateService";
    }

    public void b(a.c<Status> cVar) {
        try {
            bQ().b(new g(cVar));
        } catch (RemoteException e2) {
            Log.w("AppStateClient", "service died");
        }
    }

    public void b(a.c<AppStateManager.StateResult> cVar, int i) {
        try {
            bQ().a(new e(cVar), i);
        } catch (RemoteException e2) {
            Log.w("AppStateClient", "service died");
        }
    }

    public int getMaxNumKeys() {
        try {
            return bQ().getMaxNumKeys();
        } catch (RemoteException e2) {
            Log.w("AppStateClient", "service died");
            return 2;
        }
    }

    public int getMaxStateSize() {
        try {
            return bQ().getMaxStateSize();
        } catch (RemoteException e2) {
            Log.w("AppStateClient", "service died");
            return 2;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.internal.dw
    /* renamed from: r */
    public de p(IBinder iBinder) {
        return de.a.t(iBinder);
    }
}
