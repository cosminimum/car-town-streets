package com.google.android.gms.appstate;

import android.content.Context;
import com.google.android.gms.appstate.AppStateManager;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.common.Scopes;
import com.google.android.gms.common.api.C0655a;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.internal.C1024dc;
import com.google.android.gms.internal.C1066ds;
import com.google.android.gms.internal.C1102eg;

@Deprecated
public final class AppStateClient implements GooglePlayServicesClient {
    public static final int STATUS_CLIENT_RECONNECT_REQUIRED = 2;
    public static final int STATUS_DEVELOPER_ERROR = 7;
    public static final int STATUS_INTERNAL_ERROR = 1;
    public static final int STATUS_NETWORK_ERROR_NO_DATA = 4;
    public static final int STATUS_NETWORK_ERROR_OPERATION_DEFERRED = 5;
    public static final int STATUS_NETWORK_ERROR_OPERATION_FAILED = 6;
    public static final int STATUS_NETWORK_ERROR_STALE_DATA = 3;
    public static final int STATUS_OK = 0;
    public static final int STATUS_STATE_KEY_LIMIT_EXCEEDED = 2003;
    public static final int STATUS_STATE_KEY_NOT_FOUND = 2002;
    public static final int STATUS_WRITE_OUT_OF_DATE_VERSION = 2000;
    public static final int STATUS_WRITE_SIZE_EXCEEDED = 2001;

    /* renamed from: jx */
    private final C1024dc f1155jx;

    @Deprecated
    public static final class Builder {

        /* renamed from: jC */
        private static final String[] f1163jC = {Scopes.APP_STATE};

        /* renamed from: jD */
        private GooglePlayServicesClient.ConnectionCallbacks f1164jD;

        /* renamed from: jE */
        private GooglePlayServicesClient.OnConnectionFailedListener f1165jE;

        /* renamed from: jF */
        private String[] f1166jF = f1163jC;

        /* renamed from: jG */
        private String f1167jG = "<<default account>>";
        private Context mContext;

        public Builder(Context context, GooglePlayServicesClient.ConnectionCallbacks connectedListener, GooglePlayServicesClient.OnConnectionFailedListener connectionFailedListener) {
            this.mContext = context;
            this.f1164jD = connectedListener;
            this.f1165jE = connectionFailedListener;
        }

        public AppStateClient create() {
            return new AppStateClient(this.mContext, this.f1164jD, this.f1165jE, this.f1167jG, this.f1166jF);
        }

        public Builder setAccountName(String accountName) {
            this.f1167jG = (String) C1102eg.m2616f(accountName);
            return this;
        }

        public Builder setScopes(String... scopes) {
            this.f1166jF = scopes;
            return this;
        }
    }

    /* renamed from: com.google.android.gms.appstate.AppStateClient$a */
    private static final class C0596a implements C0655a.C0659c<AppStateManager.StateResult> {

        /* renamed from: jH */
        private final OnStateLoadedListener f1168jH;

        C0596a(OnStateLoadedListener onStateLoadedListener) {
            this.f1168jH = onStateLoadedListener;
        }

        /* renamed from: a */
        public void mo5612a(AppStateManager.StateResult stateResult) {
            if (this.f1168jH != null) {
                if (stateResult.getStatus().getStatusCode() == 2000) {
                    AppStateManager.StateConflictResult conflictResult = stateResult.getConflictResult();
                    C1066ds.m2458d(conflictResult);
                    this.f1168jH.onStateConflict(conflictResult.getStateKey(), conflictResult.getResolvedVersion(), conflictResult.getLocalData(), conflictResult.getServerData());
                    return;
                }
                AppStateManager.StateLoadedResult loadedResult = stateResult.getLoadedResult();
                C1066ds.m2458d(loadedResult);
                this.f1168jH.onStateLoaded(loadedResult.getStatus().getStatusCode(), loadedResult.getStateKey(), loadedResult.getLocalData());
            }
        }
    }

    private AppStateClient(Context context, GooglePlayServicesClient.ConnectionCallbacks connectedListener, GooglePlayServicesClient.OnConnectionFailedListener connectionFailedListener, String accountName, String[] scopes) {
        this.f1155jx = new C1024dc(context, connectedListener, connectionFailedListener, accountName, scopes);
    }

    @Deprecated
    public void connect() {
        this.f1155jx.connect();
    }

    @Deprecated
    public void deleteState(final OnStateDeletedListener listener, int stateKey) {
        this.f1155jx.mo7297a((C0655a.C0659c<AppStateManager.StateDeletedResult>) new C0655a.C0659c<AppStateManager.StateDeletedResult>() {
            /* renamed from: a */
            public void mo5612a(AppStateManager.StateDeletedResult stateDeletedResult) {
                listener.onStateDeleted(stateDeletedResult.getStatus().getStatusCode(), stateDeletedResult.getStateKey());
            }
        }, stateKey);
    }

    @Deprecated
    public void disconnect() {
        this.f1155jx.disconnect();
    }

    @Deprecated
    public int getMaxNumKeys() {
        return this.f1155jx.getMaxNumKeys();
    }

    @Deprecated
    public int getMaxStateSize() {
        return this.f1155jx.getMaxStateSize();
    }

    @Deprecated
    public boolean isConnected() {
        return this.f1155jx.isConnected();
    }

    @Deprecated
    public boolean isConnecting() {
        return this.f1155jx.isConnecting();
    }

    @Deprecated
    public boolean isConnectionCallbacksRegistered(GooglePlayServicesClient.ConnectionCallbacks listener) {
        return this.f1155jx.isConnectionCallbacksRegistered(listener);
    }

    @Deprecated
    public boolean isConnectionFailedListenerRegistered(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        return this.f1155jx.isConnectionFailedListenerRegistered(listener);
    }

    @Deprecated
    public void listStates(final OnStateListLoadedListener listener) {
        this.f1155jx.mo7296a((C0655a.C0659c<AppStateManager.StateListResult>) new C0655a.C0659c<AppStateManager.StateListResult>() {
            /* renamed from: a */
            public void mo5612a(AppStateManager.StateListResult stateListResult) {
                listener.onStateListLoaded(stateListResult.getStatus().getStatusCode(), stateListResult.getStateBuffer());
            }
        });
    }

    @Deprecated
    public void loadState(OnStateLoadedListener listener, int stateKey) {
        this.f1155jx.mo7302b(new C0596a(listener), stateKey);
    }

    @Deprecated
    public void reconnect() {
        this.f1155jx.disconnect();
        this.f1155jx.connect();
    }

    @Deprecated
    public void registerConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.f1155jx.registerConnectionCallbacks(listener);
    }

    @Deprecated
    public void registerConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.f1155jx.registerConnectionFailedListener(listener);
    }

    @Deprecated
    public void resolveState(OnStateLoadedListener listener, int stateKey, String resolvedVersion, byte[] resolvedData) {
        this.f1155jx.mo7298a(new C0596a(listener), stateKey, resolvedVersion, resolvedData);
    }

    @Deprecated
    public void signOut() {
        this.f1155jx.mo7301b(new C0655a.C0659c<Status>() {
            /* renamed from: a */
            public void mo5612a(Status status) {
            }
        });
    }

    @Deprecated
    public void signOut(final OnSignOutCompleteListener listener) {
        C1102eg.m2614b(listener, (Object) "Must provide a valid listener");
        this.f1155jx.mo7301b(new C0655a.C0659c<Status>() {
            /* renamed from: a */
            public void mo5612a(Status status) {
                listener.onSignOutComplete();
            }
        });
    }

    @Deprecated
    public void unregisterConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.f1155jx.unregisterConnectionCallbacks(listener);
    }

    @Deprecated
    public void unregisterConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.f1155jx.unregisterConnectionFailedListener(listener);
    }

    @Deprecated
    public void updateState(int stateKey, byte[] data) {
        this.f1155jx.mo7299a(new C0596a((OnStateLoadedListener) null), stateKey, data);
    }

    @Deprecated
    public void updateStateImmediate(OnStateLoadedListener listener, int stateKey, byte[] data) {
        C1102eg.m2614b(listener, (Object) "Must provide a valid listener");
        this.f1155jx.mo7299a(new C0596a(listener), stateKey, data);
    }
}
