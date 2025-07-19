package com.google.android.gms.common.api;

import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.C0655a;
import com.google.android.gms.internal.C1067dt;
import com.google.android.gms.internal.C1080dx;
import com.google.android.gms.internal.C1102eg;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.Set;

public final class GoogleApiClient {
    /* access modifiers changed from: private */

    /* renamed from: mV */
    public final Object f1322mV;

    /* renamed from: nc */
    private final C0652a f1323nc;

    /* renamed from: ne */
    private final C1080dx f1324ne;

    /* renamed from: nf */
    final Queue<C0653b<?>> f1325nf;
    /* access modifiers changed from: private */

    /* renamed from: ng */
    public ConnectionResult f1326ng;
    /* access modifiers changed from: private */

    /* renamed from: nh */
    public int f1327nh;
    /* access modifiers changed from: private */

    /* renamed from: ni */
    public int f1328ni;

    /* renamed from: nj */
    private int f1329nj;
    /* access modifiers changed from: private */

    /* renamed from: nk */
    public final Bundle f1330nk;

    /* renamed from: nl */
    private final Map<Api.C0647b<?>, Api.C0646a> f1331nl;
    /* access modifiers changed from: private */

    /* renamed from: nm */
    public boolean f1332nm;

    /* renamed from: nn */
    final Set<C0653b> f1333nn;

    /* renamed from: no */
    final ConnectionCallbacks f1334no;

    /* renamed from: np */
    private final C1080dx.C1082b f1335np;

    public interface ApiOptions {
    }

    public static final class Builder {

        /* renamed from: jG */
        private String f1341jG;
        private final Context mContext;

        /* renamed from: ns */
        private final Set<String> f1342ns;

        /* renamed from: nt */
        private int f1343nt;

        /* renamed from: nu */
        private View f1344nu;

        /* renamed from: nv */
        private String f1345nv;

        /* renamed from: nw */
        private final Map<Api, ApiOptions> f1346nw;

        /* renamed from: nx */
        private final Set<ConnectionCallbacks> f1347nx;

        /* renamed from: ny */
        private final Set<OnConnectionFailedListener> f1348ny;

        public Builder(Context context) {
            this.f1342ns = new HashSet();
            this.f1346nw = new HashMap();
            this.f1347nx = new HashSet();
            this.f1348ny = new HashSet();
            this.mContext = context;
            this.f1345nv = context.getPackageName();
        }

        public Builder(Context context, ConnectionCallbacks connectedListener, OnConnectionFailedListener connectionFailedListener) {
            this(context);
            C1102eg.m2614b(connectedListener, (Object) "Must provide a connected listener");
            this.f1347nx.add(connectedListener);
            C1102eg.m2614b(connectionFailedListener, (Object) "Must provide a connection failed listener");
            this.f1348ny.add(connectionFailedListener);
        }

        public Builder addApi(Api api) {
            return addApi(api, (ApiOptions) null);
        }

        public Builder addApi(Api api, ApiOptions options) {
            this.f1346nw.put(api, options);
            List<Scope> bk = api.mo5862bk();
            int size = bk.size();
            for (int i = 0; i < size; i++) {
                this.f1342ns.add(bk.get(i).mo5905br());
            }
            return this;
        }

        public Builder addConnectionCallbacks(ConnectionCallbacks listener) {
            this.f1347nx.add(listener);
            return this;
        }

        public Builder addOnConnectionFailedListener(OnConnectionFailedListener listener) {
            this.f1348ny.add(listener);
            return this;
        }

        public Builder addScope(Scope scope) {
            this.f1342ns.add(scope.mo5905br());
            return this;
        }

        /* renamed from: bq */
        public C1067dt mo5891bq() {
            return new C1067dt(this.f1341jG, this.f1342ns, this.f1343nt, this.f1344nu, this.f1345nv);
        }

        public GoogleApiClient build() {
            return new GoogleApiClient(this.mContext, mo5891bq(), this.f1346nw, this.f1347nx, this.f1348ny);
        }

        public Builder setAccountName(String accountName) {
            this.f1341jG = accountName;
            return this;
        }

        public Builder setGravityForPopups(int gravityForPopups) {
            this.f1343nt = gravityForPopups;
            return this;
        }

        public Builder setViewForPopups(View viewForPopups) {
            this.f1344nu = viewForPopups;
            return this;
        }

        public Builder useDefaultAccount() {
            return setAccountName("<<default account>>");
        }
    }

    public interface ConnectionCallbacks {
        public static final int CAUSE_NETWORK_LOST = 2;
        public static final int CAUSE_SERVICE_DISCONNECTED = 1;

        void onConnected(Bundle bundle);

        void onConnectionSuspended(int i);
    }

    public interface OnConnectionFailedListener extends GooglePlayServicesClient.OnConnectionFailedListener {
    }

    /* renamed from: com.google.android.gms.common.api.GoogleApiClient$a */
    public interface C0652a {
        /* renamed from: b */
        void mo5880b(C0653b bVar);
    }

    /* renamed from: com.google.android.gms.common.api.GoogleApiClient$b */
    public interface C0653b<A extends Api.C0646a> {
        /* renamed from: a */
        void mo5897a(C0652a aVar);

        /* renamed from: b */
        void mo5898b(A a);

        /* renamed from: bj */
        Api.C0647b<A> mo5899bj();
    }

    private GoogleApiClient(Context context, C1067dt commonSettings, Map<Api, ApiOptions> apis, Set<ConnectionCallbacks> connectedCallbacks, Set<OnConnectionFailedListener> onConnectionFailedListeners) {
        this.f1322mV = new Object();
        this.f1325nf = new LinkedList();
        this.f1328ni = 4;
        this.f1330nk = new Bundle();
        this.f1331nl = new HashMap();
        this.f1333nn = new HashSet();
        this.f1323nc = new C0652a() {
            /* renamed from: b */
            public void mo5880b(C0653b bVar) {
                synchronized (GoogleApiClient.this.f1322mV) {
                    GoogleApiClient.this.f1333nn.remove(bVar);
                }
            }
        };
        this.f1334no = new ConnectionCallbacks() {
            public void onConnected(Bundle connectionHint) {
                synchronized (GoogleApiClient.this.f1322mV) {
                    if (GoogleApiClient.this.f1328ni == 1) {
                        if (connectionHint != null) {
                            GoogleApiClient.this.f1330nk.putAll(connectionHint);
                        }
                        GoogleApiClient.this.m1252bn();
                    }
                }
            }

            public void onConnectionSuspended(int cause) {
                synchronized (GoogleApiClient.this.f1322mV) {
                    GoogleApiClient.this.m1247A(cause);
                    if (cause == 2) {
                        GoogleApiClient.this.connect();
                    }
                }
            }
        };
        this.f1335np = new C1080dx.C1082b() {
            /* renamed from: aU */
            public Bundle mo5883aU() {
                return null;
            }

            /* renamed from: bp */
            public boolean mo5884bp() {
                return GoogleApiClient.this.f1332nm;
            }

            public boolean isConnected() {
                return GoogleApiClient.this.isConnected();
            }
        };
        this.f1324ne = new C1080dx(context, this.f1335np);
        for (ConnectionCallbacks registerConnectionCallbacks : connectedCallbacks) {
            this.f1324ne.registerConnectionCallbacks(registerConnectionCallbacks);
        }
        for (OnConnectionFailedListener registerConnectionFailedListener : onConnectionFailedListeners) {
            this.f1324ne.registerConnectionFailedListener(registerConnectionFailedListener);
        }
        for (Api next : apis.keySet()) {
            final Api.C0647b<?> bj = next.mo5861bj();
            this.f1331nl.put(bj, bj.mo5621b(context, commonSettings, apis.get(next), this.f1334no, new OnConnectionFailedListener() {
                public void onConnectionFailed(ConnectionResult result) {
                    synchronized (GoogleApiClient.this.f1322mV) {
                        if (GoogleApiClient.this.f1326ng == null || bj.getPriority() < GoogleApiClient.this.f1327nh) {
                            ConnectionResult unused = GoogleApiClient.this.f1326ng = result;
                            int unused2 = GoogleApiClient.this.f1327nh = bj.getPriority();
                        }
                        GoogleApiClient.this.m1252bn();
                    }
                }
            }));
        }
    }

    /* access modifiers changed from: private */
    /* renamed from: A */
    public void m1247A(int i) {
        synchronized (this.f1322mV) {
            if (this.f1328ni != 3) {
                boolean isConnected = isConnected();
                this.f1328ni = 3;
                if (i == -1) {
                    this.f1325nf.clear();
                }
                for (C0653b next : this.f1333nn) {
                    if (next instanceof Releasable) {
                        try {
                            ((Releasable) next).release();
                        } catch (Exception e) {
                            Log.w("GoogleApiClient", "Unable to release " + next, e);
                        }
                    }
                }
                this.f1333nn.clear();
                this.f1332nm = false;
                for (Api.C0646a next2 : this.f1331nl.values()) {
                    if (next2.isConnected()) {
                        next2.disconnect();
                    }
                }
                this.f1332nm = true;
                this.f1328ni = 4;
                if (isConnected) {
                    if (i != -1) {
                        this.f1324ne.mo7469J(i);
                    }
                    this.f1332nm = false;
                }
            }
        }
    }

    /* renamed from: a */
    private <A extends Api.C0646a> void m1249a(C0653b<A> bVar) {
        synchronized (this.f1322mV) {
            C1102eg.m2612a(isConnected(), "GoogleApiClient is not connected yet.");
            C1102eg.m2612a(bVar.mo5899bj() != null, "This task can not be executed or enqueued (it's probably a Batch or malformed)");
            if (bVar instanceof Releasable) {
                this.f1333nn.add(bVar);
                bVar.mo5897a(this.f1323nc);
            }
            bVar.mo5898b(mo5866a(bVar.mo5899bj()));
        }
    }

    /* access modifiers changed from: private */
    /* renamed from: bn */
    public void m1252bn() {
        synchronized (this.f1322mV) {
            this.f1329nj--;
            if (this.f1329nj == 0) {
                if (this.f1326ng != null) {
                    m1247A(3);
                    this.f1324ne.mo7470a(this.f1326ng);
                    this.f1332nm = false;
                } else {
                    this.f1328ni = 2;
                    m1253bo();
                    this.f1324ne.mo7471b(this.f1330nk.isEmpty() ? null : this.f1330nk);
                }
            }
        }
    }

    /* renamed from: bo */
    private void m1253bo() {
        C1102eg.m2612a(isConnected(), "GoogleApiClient is not connected yet.");
        synchronized (this.f1322mV) {
            while (!this.f1325nf.isEmpty()) {
                m1249a(this.f1325nf.remove());
            }
        }
    }

    /* renamed from: a */
    public <C extends Api.C0646a> C mo5866a(Api.C0647b<C> bVar) {
        C c = (Api.C0646a) this.f1331nl.get(bVar);
        C1102eg.m2614b(c, (Object) "Appropriate Api was not requested.");
        return c;
    }

    /* renamed from: a */
    public <A extends Api.C0646a, T extends C0655a.C0656a<? extends Result, A>> T mo5867a(T t) {
        synchronized (this.f1322mV) {
            if (isConnected()) {
                mo5868b(t);
            } else {
                this.f1325nf.add(t);
            }
        }
        return t;
    }

    /* renamed from: b */
    public <A extends Api.C0646a, T extends C0655a.C0656a<? extends Result, A>> T mo5868b(T t) {
        C1102eg.m2612a(isConnected(), "GoogleApiClient is not connected yet.");
        m1253bo();
        m1249a(t);
        return t;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:17:?, code lost:
        return;
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void connect() {
        /*
            r3 = this;
            java.lang.Object r1 = r3.f1322mV
            monitor-enter(r1)
            boolean r0 = r3.isConnected()     // Catch:{ all -> 0x0041 }
            if (r0 != 0) goto L_0x000f
            boolean r0 = r3.isConnecting()     // Catch:{ all -> 0x0041 }
            if (r0 == 0) goto L_0x0011
        L_0x000f:
            monitor-exit(r1)     // Catch:{ all -> 0x0041 }
        L_0x0010:
            return
        L_0x0011:
            r0 = 1
            r3.f1332nm = r0     // Catch:{ all -> 0x0041 }
            r0 = 0
            r3.f1326ng = r0     // Catch:{ all -> 0x0041 }
            r0 = 1
            r3.f1328ni = r0     // Catch:{ all -> 0x0041 }
            android.os.Bundle r0 = r3.f1330nk     // Catch:{ all -> 0x0041 }
            r0.clear()     // Catch:{ all -> 0x0041 }
            java.util.Map<com.google.android.gms.common.api.Api$b<?>, com.google.android.gms.common.api.Api$a> r0 = r3.f1331nl     // Catch:{ all -> 0x0041 }
            int r0 = r0.size()     // Catch:{ all -> 0x0041 }
            r3.f1329nj = r0     // Catch:{ all -> 0x0041 }
            java.util.Map<com.google.android.gms.common.api.Api$b<?>, com.google.android.gms.common.api.Api$a> r0 = r3.f1331nl     // Catch:{ all -> 0x0041 }
            java.util.Collection r0 = r0.values()     // Catch:{ all -> 0x0041 }
            java.util.Iterator r2 = r0.iterator()     // Catch:{ all -> 0x0041 }
        L_0x0031:
            boolean r0 = r2.hasNext()     // Catch:{ all -> 0x0041 }
            if (r0 == 0) goto L_0x0044
            java.lang.Object r0 = r2.next()     // Catch:{ all -> 0x0041 }
            com.google.android.gms.common.api.Api$a r0 = (com.google.android.gms.common.api.Api.C0646a) r0     // Catch:{ all -> 0x0041 }
            r0.connect()     // Catch:{ all -> 0x0041 }
            goto L_0x0031
        L_0x0041:
            r0 = move-exception
            monitor-exit(r1)     // Catch:{ all -> 0x0041 }
            throw r0
        L_0x0044:
            monitor-exit(r1)     // Catch:{ all -> 0x0041 }
            goto L_0x0010
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.common.api.GoogleApiClient.connect():void");
    }

    public void disconnect() {
        m1247A(-1);
    }

    public boolean isConnected() {
        boolean z;
        synchronized (this.f1322mV) {
            z = this.f1328ni == 2;
        }
        return z;
    }

    public boolean isConnecting() {
        boolean z = true;
        synchronized (this.f1322mV) {
            if (this.f1328ni != 1) {
                z = false;
            }
        }
        return z;
    }

    public boolean isConnectionCallbacksRegistered(ConnectionCallbacks listener) {
        return this.f1324ne.isConnectionCallbacksRegistered(listener);
    }

    public boolean isConnectionFailedListenerRegistered(OnConnectionFailedListener listener) {
        return this.f1324ne.isConnectionFailedListenerRegistered(listener);
    }

    public void reconnect() {
        disconnect();
        connect();
    }

    public void registerConnectionCallbacks(ConnectionCallbacks listener) {
        this.f1324ne.registerConnectionCallbacks(listener);
    }

    public void registerConnectionFailedListener(OnConnectionFailedListener listener) {
        this.f1324ne.registerConnectionFailedListener(listener);
    }

    public void unregisterConnectionCallbacks(ConnectionCallbacks listener) {
        this.f1324ne.unregisterConnectionCallbacks(listener);
    }

    public void unregisterConnectionFailedListener(OnConnectionFailedListener listener) {
        this.f1324ne.unregisterConnectionFailedListener(listener);
    }
}
