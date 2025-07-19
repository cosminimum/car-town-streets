package google.android.gms.appstate;

import android.content.Context;

import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.common.Scopes;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.a;
import com.google.android.gms.internal.dc;
import com.google.android.gms.internal.ds;
import com.google.android.gms.internal.eg;

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
    private final dc jx;

    @Deprecated
    public static final class Builder {
        private static final String[] jC = {Scopes.APP_STATE};
        private GooglePlayServicesClient.ConnectionCallbacks jD;
        private GooglePlayServicesClient.OnConnectionFailedListener jE;
        private String[] jF = jC;
        private String jG = "<<default account>>";
        private Context mContext;

        public Builder(Context context, GooglePlayServicesClient.ConnectionCallbacks connectedListener, GooglePlayServicesClient.OnConnectionFailedListener connectionFailedListener) {
            this.mContext = context;
            this.jD = connectedListener;
            this.jE = connectionFailedListener;
        }

        public AppStateClient create() {
            return new AppStateClient(this.mContext, this.jD, this.jE, this.jG, this.jF);
        }

        public Builder setAccountName(String accountName) {
            this.jG = (String) eg.f(accountName);
            return this;
        }

        public Builder setScopes(String... scopes) {
            this.jF = scopes;
            return this;
        }
    }

    private static final class a implements a.c<AppStateManager.StateResult> {
        private final OnStateLoadedListener jH;

        a(OnStateLoadedListener onStateLoadedListener) {
            this.jH = onStateLoadedListener;
        }

        public void a(AppStateManager.StateResult stateResult) {
            if (this.jH != null) {
                if (stateResult.getStatus().getStatusCode() == 2000) {
                    AppStateManager.StateConflictResult conflictResult = stateResult.getConflictResult();
                    ds.d(conflictResult);
                    this.jH.onStateConflict(conflictResult.getStateKey(), conflictResult.getResolvedVersion(), conflictResult.getLocalData(), conflictResult.getServerData());
                    return;
                }
                AppStateManager.StateLoadedResult loadedResult = stateResult.getLoadedResult();
                ds.d(loadedResult);
                this.jH.onStateLoaded(loadedResult.getStatus().getStatusCode(), loadedResult.getStateKey(), loadedResult.getLocalData());
            }
        }
    }

    private AppStateClient(Context context, GooglePlayServicesClient.ConnectionCallbacks connectedListener, GooglePlayServicesClient.OnConnectionFailedListener connectionFailedListener, String accountName, String[] scopes) {
        this.jx = new dc(context, connectedListener, connectionFailedListener, accountName, scopes);
    }

    @Deprecated
    public void connect() {
        this.jx.connect();
    }

    @Deprecated
    public void deleteState(final OnStateDeletedListener listener, int stateKey) {
        this.jx.a((a.c<AppStateManager.StateDeletedResult>) new a.c<AppStateManager.StateDeletedResult>() {
            public void a(AppStateManager.StateDeletedResult stateDeletedResult) {
                listener.onStateDeleted(stateDeletedResult.getStatus().getStatusCode(), stateDeletedResult.getStateKey());
            }
        }, stateKey);
    }

    @Deprecated
    public void disconnect() {
        this.jx.disconnect();
    }

    @Deprecated
    public int getMaxNumKeys() {
        return this.jx.getMaxNumKeys();
    }

    @Deprecated
    public int getMaxStateSize() {
        return this.jx.getMaxStateSize();
    }

    @Deprecated
    public boolean isConnected() {
        return this.jx.isConnected();
    }

    @Deprecated
    public boolean isConnecting() {
        return this.jx.isConnecting();
    }

    @Deprecated
    public boolean isConnectionCallbacksRegistered(GooglePlayServicesClient.ConnectionCallbacks listener) {
        return this.jx.isConnectionCallbacksRegistered(listener);
    }

    @Deprecated
    public boolean isConnectionFailedListenerRegistered(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        return this.jx.isConnectionFailedListenerRegistered(listener);
    }

    @Deprecated
    public void listStates(final OnStateListLoadedListener listener) {
        this.jx.a((a.c<AppStateManager.StateListResult>) new a.c<AppStateManager.StateListResult>() {
            public void a(AppStateManager.StateListResult stateListResult) {
                listener.onStateListLoaded(stateListResult.getStatus().getStatusCode(), stateListResult.getStateBuffer());
            }
        });
    }

    @Deprecated
    public void loadState(OnStateLoadedListener listener, int stateKey) {
        this.jx.b(new a(listener), stateKey);
    }

    @Deprecated
    public void reconnect() {
        this.jx.disconnect();
        this.jx.connect();
    }

    @Deprecated
    public void registerConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.jx.registerConnectionCallbacks(listener);
    }

    @Deprecated
    public void registerConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.jx.registerConnectionFailedListener(listener);
    }

    @Deprecated
    public void resolveState(OnStateLoadedListener listener, int stateKey, String resolvedVersion, byte[] resolvedData) {
        this.jx.a(new a(listener), stateKey, resolvedVersion, resolvedData);
    }

    @Deprecated
    public void signOut() {
        this.jx.b(new a.c<Status>() {
            public void a(Status status) {
            }
        });
    }

    @Deprecated
    public void signOut(final OnSignOutCompleteListener listener) {
        eg.b(listener, (Object) "Must provide a valid listener");
        this.jx.b(new a.c<Status>() {
            public void a(Status status) {
                listener.onSignOutComplete();
            }
        });
    }

    @Deprecated
    public void unregisterConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.jx.unregisterConnectionCallbacks(listener);
    }

    @Deprecated
    public void unregisterConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.jx.unregisterConnectionFailedListener(listener);
    }

    @Deprecated
    public void updateState(int stateKey, byte[] data) {
        this.jx.a(new a((OnStateLoadedListener) null), stateKey, data);
    }

    @Deprecated
    public void updateStateImmediate(OnStateLoadedListener listener, int stateKey, byte[] data) {
        eg.b(listener, (Object) "Must provide a valid listener");
        this.jx.a(new a(listener), stateKey, data);
    }
}
