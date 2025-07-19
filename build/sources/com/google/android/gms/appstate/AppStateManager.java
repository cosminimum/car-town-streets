package com.google.android.gms.appstate;

import android.content.Context;
import com.google.android.gms.common.Scopes;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.C0655a;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.internal.C1024dc;
import com.google.android.gms.internal.C1067dt;
import com.google.android.gms.internal.C1102eg;

public final class AppStateManager {
    public static final Api API = new Api(f1169jO, SCOPE_APP_STATE);
    public static final Scope SCOPE_APP_STATE = new Scope(Scopes.APP_STATE);

    /* renamed from: jO */
    static final Api.C0647b<C1024dc> f1169jO = new Api.C0647b<C1024dc>() {
        /* renamed from: a */
        public C1024dc mo5621b(Context context, C1067dt dtVar, GoogleApiClient.ApiOptions apiOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            return new C1024dc(context, connectionCallbacks, onConnectionFailedListener, dtVar.mo7433bF(), (String[]) dtVar.mo7435bH().toArray(new String[0]));
        }

        public int getPriority() {
            return Integer.MAX_VALUE;
        }
    };

    public interface StateConflictResult extends Result {
        byte[] getLocalData();

        String getResolvedVersion();

        byte[] getServerData();

        int getStateKey();
    }

    public interface StateDeletedResult extends Result {
        int getStateKey();
    }

    public interface StateListResult extends Result {
        AppStateBuffer getStateBuffer();
    }

    public interface StateLoadedResult extends Result {
        byte[] getLocalData();

        int getStateKey();
    }

    public interface StateResult extends Result {
        StateConflictResult getConflictResult();

        StateLoadedResult getLoadedResult();
    }

    /* renamed from: com.google.android.gms.appstate.AppStateManager$a */
    public static abstract class C0607a<R extends Result> extends C0655a.C0656a<R, C1024dc> implements PendingResult<R> {
        public C0607a() {
            super(AppStateManager.f1169jO);
        }
    }

    /* renamed from: com.google.android.gms.appstate.AppStateManager$b */
    private static abstract class C0608b extends C0607a<StateDeletedResult> {
        private C0608b() {
        }
    }

    /* renamed from: com.google.android.gms.appstate.AppStateManager$c */
    private static abstract class C0609c extends C0607a<StateListResult> {
        private C0609c() {
        }

        /* renamed from: f */
        public StateListResult mo5631e(final Status status) {
            return new StateListResult() {
                public AppStateBuffer getStateBuffer() {
                    return new AppStateBuffer((DataHolder) null);
                }

                public Status getStatus() {
                    return status;
                }
            };
        }
    }

    /* renamed from: com.google.android.gms.appstate.AppStateManager$d */
    private static abstract class C0611d extends C0607a<Status> {
        private C0611d() {
        }

        /* renamed from: g */
        public Status mo5631e(Status status) {
            return status;
        }
    }

    /* renamed from: com.google.android.gms.appstate.AppStateManager$e */
    private static abstract class C0612e extends C0607a<StateResult> {
        private C0612e() {
        }

        /* renamed from: h */
        public StateResult mo5631e(Status status) {
            return AppStateManager.m1111b(status);
        }
    }

    private AppStateManager() {
    }

    /* renamed from: a */
    public static C1024dc m1110a(GoogleApiClient googleApiClient) {
        boolean z = true;
        C1102eg.m2615b(googleApiClient != null, (Object) "GoogleApiClient parameter is required.");
        C1102eg.m2612a(googleApiClient.isConnected(), "GoogleApiClient must be connected.");
        C1024dc dcVar = (C1024dc) googleApiClient.mo5866a(f1169jO);
        if (dcVar == null) {
            z = false;
        }
        C1102eg.m2612a(z, "GoogleApiClient is not configured to use the AppState API. Pass AppStateManager.API into GoogleApiClient.Builder#addApi() to use this feature.");
        return dcVar;
    }

    /* access modifiers changed from: private */
    /* renamed from: b */
    public static StateResult m1111b(final Status status) {
        return new StateResult() {
            public StateConflictResult getConflictResult() {
                return null;
            }

            public StateLoadedResult getLoadedResult() {
                return null;
            }

            public Status getStatus() {
                return status;
            }
        };
    }

    public static PendingResult<StateDeletedResult> delete(GoogleApiClient googleApiClient, final int stateKey) {
        return googleApiClient.mo5868b(new C0608b() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1024dc dcVar) {
                dcVar.mo7297a((C0655a.C0659c<StateDeletedResult>) this, stateKey);
            }

            /* renamed from: d */
            public StateDeletedResult mo5631e(final Status status) {
                return new StateDeletedResult() {
                    public int getStateKey() {
                        return stateKey;
                    }

                    public Status getStatus() {
                        return status;
                    }
                };
            }
        });
    }

    public static int getMaxNumKeys(GoogleApiClient googleApiClient) {
        return m1110a(googleApiClient).getMaxNumKeys();
    }

    public static int getMaxStateSize(GoogleApiClient googleApiClient) {
        return m1110a(googleApiClient).getMaxStateSize();
    }

    public static PendingResult<StateListResult> list(GoogleApiClient googleApiClient) {
        return googleApiClient.mo5867a(new C0609c() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1024dc dcVar) {
                dcVar.mo7296a((C0655a.C0659c<StateListResult>) this);
            }
        });
    }

    public static PendingResult<StateResult> load(GoogleApiClient googleApiClient, final int stateKey) {
        return googleApiClient.mo5867a(new C0612e() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1024dc dcVar) {
                dcVar.mo7302b(this, stateKey);
            }
        });
    }

    public static PendingResult<StateResult> resolve(GoogleApiClient googleApiClient, final int stateKey, final String resolvedVersion, final byte[] resolvedData) {
        return googleApiClient.mo5868b(new C0612e() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1024dc dcVar) {
                dcVar.mo7298a(this, stateKey, resolvedVersion, resolvedData);
            }
        });
    }

    public static PendingResult<Status> signOut(GoogleApiClient googleApiClient) {
        return googleApiClient.mo5868b(new C0611d() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1024dc dcVar) {
                dcVar.mo7301b(this);
            }
        });
    }

    public static void update(GoogleApiClient googleApiClient, final int stateKey, final byte[] data) {
        googleApiClient.mo5868b(new C0612e() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1024dc dcVar) {
                dcVar.mo7299a((C0655a.C0659c<StateResult>) null, stateKey, data);
            }
        });
    }

    public static PendingResult<StateResult> updateImmediate(GoogleApiClient googleApiClient, final int stateKey, final byte[] data) {
        return googleApiClient.mo5868b(new C0612e() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1024dc dcVar) {
                dcVar.mo7299a(this, stateKey, data);
            }
        });
    }
}
