package com.google.android.gms.common.api;

import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.a;
import com.google.android.gms.internal.dt;
import com.google.android.gms.internal.dx;
import com.google.android.gms.internal.eg;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.Set;
/* loaded from: classes.dex */
public final class GoogleApiClient {
    private final Object mV;
    private final a nc;
    private final dx ne;
    final Queue<b<?>> nf;
    private ConnectionResult ng;
    private int nh;
    private int ni;
    private int nj;
    private final Bundle nk;
    private final Map<Api.b<?>, Api.a> nl;
    private boolean nm;
    final Set<b> nn;
    final ConnectionCallbacks no;
    private final dx.b np;

    /* loaded from: classes.dex */
    public interface ApiOptions {
    }

    /* loaded from: classes.dex */
    public static final class Builder {
        private String jG;
        private final Context mContext;
        private final Set<String> ns;
        private int nt;
        private View nu;
        private String nv;
        private final Map<Api, ApiOptions> nw;
        private final Set<ConnectionCallbacks> nx;
        private final Set<OnConnectionFailedListener> ny;

        public Builder(Context context) {
            this.ns = new HashSet();
            this.nw = new HashMap();
            this.nx = new HashSet();
            this.ny = new HashSet();
            this.mContext = context;
            this.nv = context.getPackageName();
        }

        public Builder(Context context, ConnectionCallbacks connectedListener, OnConnectionFailedListener connectionFailedListener) {
            this(context);
            eg.b(connectedListener, "Must provide a connected listener");
            this.nx.add(connectedListener);
            eg.b(connectionFailedListener, "Must provide a connection failed listener");
            this.ny.add(connectionFailedListener);
        }

        public Builder addApi(Api api) {
            return addApi(api, null);
        }

        public Builder addApi(Api api, ApiOptions options) {
            this.nw.put(api, options);
            List<Scope> bk = api.bk();
            int size = bk.size();
            for (int i = 0; i < size; i++) {
                this.ns.add(bk.get(i).br());
            }
            return this;
        }

        public Builder addConnectionCallbacks(ConnectionCallbacks listener) {
            this.nx.add(listener);
            return this;
        }

        public Builder addOnConnectionFailedListener(OnConnectionFailedListener listener) {
            this.ny.add(listener);
            return this;
        }

        public Builder addScope(Scope scope) {
            this.ns.add(scope.br());
            return this;
        }

        public dt bq() {
            return new dt(this.jG, this.ns, this.nt, this.nu, this.nv);
        }

        public GoogleApiClient build() {
            return new GoogleApiClient(this.mContext, bq(), this.nw, this.nx, this.ny);
        }

        public Builder setAccountName(String accountName) {
            this.jG = accountName;
            return this;
        }

        public Builder setGravityForPopups(int gravityForPopups) {
            this.nt = gravityForPopups;
            return this;
        }

        public Builder setViewForPopups(View viewForPopups) {
            this.nu = viewForPopups;
            return this;
        }

        public Builder useDefaultAccount() {
            return setAccountName("<<default account>>");
        }
    }

    /* loaded from: classes.dex */
    public interface ConnectionCallbacks {
        public static final int CAUSE_NETWORK_LOST = 2;
        public static final int CAUSE_SERVICE_DISCONNECTED = 1;

        void onConnected(Bundle bundle);

        void onConnectionSuspended(int i);
    }

    /* loaded from: classes.dex */
    public interface OnConnectionFailedListener extends GooglePlayServicesClient.OnConnectionFailedListener {
    }

    /* loaded from: classes.dex */
    public interface a {
        void b(b bVar);
    }

    /* loaded from: classes.dex */
    public interface b<A extends Api.a> {
        void a(a aVar);

        void b(A a);

        Api.b<A> bj();
    }

    /* JADX WARN: Multi-variable type inference failed */
    private GoogleApiClient(Context context, dt commonSettings, Map<Api, ApiOptions> apis, Set<ConnectionCallbacks> connectedCallbacks, Set<OnConnectionFailedListener> onConnectionFailedListeners) {
        this.mV = new Object();
        this.nf = new LinkedList();
        this.ni = 4;
        this.nk = new Bundle();
        this.nl = new HashMap();
        this.nn = new HashSet();
        this.nc = new a() { // from class: com.google.android.gms.common.api.GoogleApiClient.1
            @Override // com.google.android.gms.common.api.GoogleApiClient.a
            public void b(b bVar) {
                synchronized (GoogleApiClient.this.mV) {
                    GoogleApiClient.this.nn.remove(bVar);
                }
            }
        };
        this.no = new ConnectionCallbacks() { // from class: com.google.android.gms.common.api.GoogleApiClient.2
            @Override // com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks
            public void onConnected(Bundle connectionHint) {
                synchronized (GoogleApiClient.this.mV) {
                    if (GoogleApiClient.this.ni == 1) {
                        if (connectionHint != null) {
                            GoogleApiClient.this.nk.putAll(connectionHint);
                        }
                        GoogleApiClient.this.bn();
                    }
                }
            }

            @Override // com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks
            public void onConnectionSuspended(int cause) {
                synchronized (GoogleApiClient.this.mV) {
                    GoogleApiClient.this.A(cause);
                    if (cause == 2) {
                        GoogleApiClient.this.connect();
                    }
                }
            }
        };
        this.np = new dx.b() { // from class: com.google.android.gms.common.api.GoogleApiClient.3
            @Override // com.google.android.gms.internal.dx.b
            public Bundle aU() {
                return null;
            }

            @Override // com.google.android.gms.internal.dx.b
            public boolean bp() {
                return GoogleApiClient.this.nm;
            }

            @Override // com.google.android.gms.internal.dx.b
            public boolean isConnected() {
                return GoogleApiClient.this.isConnected();
            }
        };
        this.ne = new dx(context, this.np);
        for (ConnectionCallbacks connectionCallbacks : connectedCallbacks) {
            this.ne.registerConnectionCallbacks(connectionCallbacks);
        }
        for (OnConnectionFailedListener onConnectionFailedListener : onConnectionFailedListeners) {
            this.ne.registerConnectionFailedListener(onConnectionFailedListener);
        }
        for (Api api : apis.keySet()) {
            final Api.b<?> bj = api.bj();
            this.nl.put(bj, bj.b(context, commonSettings, apis.get(api), this.no, new OnConnectionFailedListener() { // from class: com.google.android.gms.common.api.GoogleApiClient.4
                @Override // com.google.android.gms.common.GooglePlayServicesClient.OnConnectionFailedListener
                public void onConnectionFailed(ConnectionResult result) {
                    synchronized (GoogleApiClient.this.mV) {
                        if (GoogleApiClient.this.ng == null || bj.getPriority() < GoogleApiClient.this.nh) {
                            GoogleApiClient.this.ng = result;
                            GoogleApiClient.this.nh = bj.getPriority();
                        }
                        GoogleApiClient.this.bn();
                    }
                }
            }));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void A(int i) {
        synchronized (this.mV) {
            if (this.ni != 3) {
                boolean isConnected = isConnected();
                this.ni = 3;
                if (i == -1) {
                    this.nf.clear();
                }
                for (b bVar : this.nn) {
                    if (bVar instanceof Releasable) {
                        try {
                            ((Releasable) bVar).release();
                        } catch (Exception e) {
                            Log.w("GoogleApiClient", "Unable to release " + bVar, e);
                        }
                    }
                }
                this.nn.clear();
                this.nm = false;
                for (Api.a aVar : this.nl.values()) {
                    if (aVar.isConnected()) {
                        aVar.disconnect();
                    }
                }
                this.nm = true;
                this.ni = 4;
                if (isConnected) {
                    if (i != -1) {
                        this.ne.J(i);
                    }
                    this.nm = false;
                }
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    private <A extends Api.a> void a(b<A> bVar) {
        synchronized (this.mV) {
            eg.a(isConnected(), "GoogleApiClient is not connected yet.");
            eg.a(bVar.bj() != null, "This task can not be executed or enqueued (it's probably a Batch or malformed)");
            if (bVar instanceof Releasable) {
                this.nn.add(bVar);
                bVar.a(this.nc);
            }
            bVar.b(a(bVar.bj()));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void bn() {
        synchronized (this.mV) {
            this.nj--;
            if (this.nj == 0) {
                if (this.ng != null) {
                    A(3);
                    this.ne.a(this.ng);
                    this.nm = false;
                } else {
                    this.ni = 2;
                    bo();
                    this.ne.b(this.nk.isEmpty() ? null : this.nk);
                }
            }
        }
    }

    private void bo() {
        eg.a(isConnected(), "GoogleApiClient is not connected yet.");
        synchronized (this.mV) {
            while (!this.nf.isEmpty()) {
                a(this.nf.remove());
            }
        }
    }

    public <C extends Api.a> C a(Api.b<C> bVar) {
        C c = (C) this.nl.get(bVar);
        eg.b(c, "Appropriate Api was not requested.");
        return c;
    }

    public <A extends Api.a, T extends a.AbstractC0011a<? extends Result, A>> T a(T t) {
        synchronized (this.mV) {
            if (isConnected()) {
                b(t);
            } else {
                this.nf.add(t);
            }
        }
        return t;
    }

    public <A extends Api.a, T extends a.AbstractC0011a<? extends Result, A>> T b(T t) {
        eg.a(isConnected(), "GoogleApiClient is not connected yet.");
        bo();
        a((b) t);
        return t;
    }

    public void connect() {
        synchronized (this.mV) {
            if (isConnected() || isConnecting()) {
                return;
            }
            this.nm = true;
            this.ng = null;
            this.ni = 1;
            this.nk.clear();
            this.nj = this.nl.size();
            for (Api.a aVar : this.nl.values()) {
                aVar.connect();
            }
        }
    }

    public void disconnect() {
        A(-1);
    }

    public boolean isConnected() {
        boolean z;
        synchronized (this.mV) {
            z = this.ni == 2;
        }
        return z;
    }

    public boolean isConnecting() {
        boolean z = true;
        synchronized (this.mV) {
            if (this.ni != 1) {
                z = false;
            }
        }
        return z;
    }

    public boolean isConnectionCallbacksRegistered(ConnectionCallbacks listener) {
        return this.ne.isConnectionCallbacksRegistered(listener);
    }

    public boolean isConnectionFailedListenerRegistered(OnConnectionFailedListener listener) {
        return this.ne.isConnectionFailedListenerRegistered(listener);
    }

    public void reconnect() {
        disconnect();
        connect();
    }

    public void registerConnectionCallbacks(ConnectionCallbacks listener) {
        this.ne.registerConnectionCallbacks(listener);
    }

    public void registerConnectionFailedListener(OnConnectionFailedListener listener) {
        this.ne.registerConnectionFailedListener(listener);
    }

    public void unregisterConnectionCallbacks(ConnectionCallbacks listener) {
        this.ne.unregisterConnectionCallbacks(listener);
    }

    public void unregisterConnectionFailedListener(OnConnectionFailedListener listener) {
        this.ne.unregisterConnectionFailedListener(listener);
    }
}
