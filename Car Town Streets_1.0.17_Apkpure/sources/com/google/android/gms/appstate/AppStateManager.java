package com.google.android.gms.appstate;

import android.content.Context;
import com.google.android.gms.common.Scopes;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.a;
import com.google.android.gms.internal.dc;
import com.google.android.gms.internal.dt;
import com.google.android.gms.internal.eg;
/* loaded from: classes.dex */
public final class AppStateManager {
    static final Api.b<dc> jO = new Api.b<dc>() { // from class: com.google.android.gms.appstate.AppStateManager.1
        @Override // com.google.android.gms.common.api.Api.b
        /* renamed from: a */
        public dc b(Context context, dt dtVar, GoogleApiClient.ApiOptions apiOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            return new dc(context, connectionCallbacks, onConnectionFailedListener, dtVar.bF(), (String[]) dtVar.bH().toArray(new String[0]));
        }

        @Override // com.google.android.gms.common.api.Api.b
        public int getPriority() {
            return Integer.MAX_VALUE;
        }
    };
    public static final Scope SCOPE_APP_STATE = new Scope(Scopes.APP_STATE);
    public static final Api API = new Api(jO, SCOPE_APP_STATE);

    /* loaded from: classes.dex */
    public interface StateConflictResult extends Result {
        byte[] getLocalData();

        String getResolvedVersion();

        byte[] getServerData();

        int getStateKey();
    }

    /* loaded from: classes.dex */
    public interface StateDeletedResult extends Result {
        int getStateKey();
    }

    /* loaded from: classes.dex */
    public interface StateListResult extends Result {
        AppStateBuffer getStateBuffer();
    }

    /* loaded from: classes.dex */
    public interface StateLoadedResult extends Result {
        byte[] getLocalData();

        int getStateKey();
    }

    /* loaded from: classes.dex */
    public interface StateResult extends Result {
        StateConflictResult getConflictResult();

        StateLoadedResult getLoadedResult();
    }

    /* loaded from: classes.dex */
    public static abstract class a<R extends Result> extends a.AbstractC0011a<R, dc> implements PendingResult<R> {
        public a() {
            super(AppStateManager.jO);
        }
    }

    /* loaded from: classes.dex */
    private static abstract class b extends a<StateDeletedResult> {
        private b() {
        }
    }

    /* loaded from: classes.dex */
    private static abstract class c extends a<StateListResult> {
        private c() {
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: f */
        public StateListResult e(final Status status) {
            return new StateListResult() { // from class: com.google.android.gms.appstate.AppStateManager.c.1
                @Override // com.google.android.gms.appstate.AppStateManager.StateListResult
                public AppStateBuffer getStateBuffer() {
                    return new AppStateBuffer(null);
                }

                @Override // com.google.android.gms.common.api.Result
                public Status getStatus() {
                    return status;
                }
            };
        }
    }

    /* loaded from: classes.dex */
    private static abstract class d extends a<Status> {
        private d() {
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: g */
        public Status e(Status status) {
            return status;
        }
    }

    /* loaded from: classes.dex */
    private static abstract class e extends a<StateResult> {
        private e() {
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: h */
        public StateResult e(Status status) {
            return AppStateManager.b(status);
        }
    }

    private AppStateManager() {
    }

    public static dc a(GoogleApiClient googleApiClient) {
        boolean z = true;
        eg.b(googleApiClient != null, "GoogleApiClient parameter is required.");
        eg.a(googleApiClient.isConnected(), "GoogleApiClient must be connected.");
        dc dcVar = (dc) googleApiClient.a(jO);
        if (dcVar == null) {
            z = false;
        }
        eg.a(z, "GoogleApiClient is not configured to use the AppState API. Pass AppStateManager.API into GoogleApiClient.Builder#addApi() to use this feature.");
        return dcVar;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static StateResult b(final Status status) {
        return new StateResult() { // from class: com.google.android.gms.appstate.AppStateManager.2
            @Override // com.google.android.gms.appstate.AppStateManager.StateResult
            public StateConflictResult getConflictResult() {
                return null;
            }

            @Override // com.google.android.gms.appstate.AppStateManager.StateResult
            public StateLoadedResult getLoadedResult() {
                return null;
            }

            @Override // com.google.android.gms.common.api.Result
            public Status getStatus() {
                return Status.this;
            }
        };
    }

    public static PendingResult<StateDeletedResult> delete(GoogleApiClient googleApiClient, final int stateKey) {
        return googleApiClient.b(new b() { // from class: com.google.android.gms.appstate.AppStateManager.5
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(dc dcVar) {
                dcVar.a(this, stateKey);
            }

            @Override // com.google.android.gms.common.api.PendingResult
            /* renamed from: d */
            public StateDeletedResult e(final Status status) {
                return new StateDeletedResult() { // from class: com.google.android.gms.appstate.AppStateManager.5.1
                    @Override // com.google.android.gms.appstate.AppStateManager.StateDeletedResult
                    public int getStateKey() {
                        return stateKey;
                    }

                    @Override // com.google.android.gms.common.api.Result
                    public Status getStatus() {
                        return status;
                    }
                };
            }
        });
    }

    public static int getMaxNumKeys(GoogleApiClient googleApiClient) {
        return a(googleApiClient).getMaxNumKeys();
    }

    public static int getMaxStateSize(GoogleApiClient googleApiClient) {
        return a(googleApiClient).getMaxStateSize();
    }

    public static PendingResult<StateListResult> list(GoogleApiClient googleApiClient) {
        return googleApiClient.a((GoogleApiClient) new c() { // from class: com.google.android.gms.appstate.AppStateManager.7
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(dc dcVar) {
                dcVar.a(this);
            }
        });
    }

    public static PendingResult<StateResult> load(GoogleApiClient googleApiClient, final int stateKey) {
        return googleApiClient.a((GoogleApiClient) new e() { // from class: com.google.android.gms.appstate.AppStateManager.6
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(dc dcVar) {
                dcVar.b(this, stateKey);
            }
        });
    }

    public static PendingResult<StateResult> resolve(GoogleApiClient googleApiClient, final int stateKey, final String resolvedVersion, final byte[] resolvedData) {
        return googleApiClient.b(new e() { // from class: com.google.android.gms.appstate.AppStateManager.8
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(dc dcVar) {
                dcVar.a(this, stateKey, resolvedVersion, resolvedData);
            }
        });
    }

    public static PendingResult<Status> signOut(GoogleApiClient googleApiClient) {
        return googleApiClient.b(new d() { // from class: com.google.android.gms.appstate.AppStateManager.9
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(dc dcVar) {
                dcVar.b(this);
            }
        });
    }

    public static void update(GoogleApiClient googleApiClient, final int stateKey, final byte[] data) {
        googleApiClient.b(new e() { // from class: com.google.android.gms.appstate.AppStateManager.3
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(dc dcVar) {
                dcVar.a((a.c<StateResult>) null, stateKey, data);
            }
        });
    }

    public static PendingResult<StateResult> updateImmediate(GoogleApiClient googleApiClient, final int stateKey, final byte[] data) {
        return googleApiClient.b(new e() { // from class: com.google.android.gms.appstate.AppStateManager.4
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(dc dcVar) {
                dcVar.a(this, stateKey, data);
            }
        });
    }
}
