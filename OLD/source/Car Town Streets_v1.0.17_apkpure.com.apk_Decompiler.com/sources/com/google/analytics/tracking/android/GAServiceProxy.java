package com.google.analytics.tracking.android;

import android.content.Context;
import android.content.Intent;
import com.google.analytics.tracking.android.AnalyticsGmsCoreClient;
import com.google.android.gms.analytics.internal.Command;
import com.google.android.gms.common.util.VisibleForTesting;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.ConcurrentLinkedQueue;

class GAServiceProxy implements ServiceProxy, AnalyticsGmsCoreClient.OnConnectedListener, AnalyticsGmsCoreClient.OnConnectionFailedListener {
    private static final long FAILED_CONNECT_WAIT_TIME = 3000;
    private static final int MAX_TRIES = 2;
    private static final long RECONNECT_WAIT_TIME = 5000;
    private static final long SERVICE_CONNECTION_TIMEOUT = 300000;
    private volatile AnalyticsClient client;
    /* access modifiers changed from: private */
    public Clock clock;
    private volatile int connectTries;
    private final Context ctx;
    /* access modifiers changed from: private */
    public volatile Timer disconnectCheckTimer;
    private volatile Timer failedConnectTimer;
    private boolean forceLocalDispatch;
    private final GoogleAnalytics gaInstance;
    /* access modifiers changed from: private */
    public long idleTimeout;
    /* access modifiers changed from: private */
    public volatile long lastRequestTime;
    private boolean pendingClearHits;
    private boolean pendingDispatch;
    private boolean pendingServiceDisconnect;
    /* access modifiers changed from: private */
    public final Queue<HitParams> queue;
    private volatile Timer reConnectTimer;
    /* access modifiers changed from: private */
    public volatile ConnectState state;
    private AnalyticsStore store;
    private AnalyticsStore testStore;
    private final AnalyticsThread thread;

    private enum ConnectState {
        CONNECTING,
        CONNECTED_SERVICE,
        CONNECTED_LOCAL,
        BLOCKED,
        PENDING_CONNECTION,
        PENDING_DISCONNECT,
        DISCONNECTED
    }

    @VisibleForTesting
    GAServiceProxy(Context ctx2, AnalyticsThread thread2, AnalyticsStore store2, GoogleAnalytics gaInstance2) {
        this.queue = new ConcurrentLinkedQueue();
        this.idleTimeout = SERVICE_CONNECTION_TIMEOUT;
        this.testStore = store2;
        this.ctx = ctx2;
        this.thread = thread2;
        this.gaInstance = gaInstance2;
        this.clock = new Clock() {
            public long currentTimeMillis() {
                return System.currentTimeMillis();
            }
        };
        this.connectTries = 0;
        this.state = ConnectState.DISCONNECTED;
    }

    GAServiceProxy(Context ctx2, AnalyticsThread thread2) {
        this(ctx2, thread2, (AnalyticsStore) null, GoogleAnalytics.getInstance(ctx2));
    }

    /* access modifiers changed from: package-private */
    public void setClock(Clock clock2) {
        this.clock = clock2;
    }

    public void putHit(Map<String, String> wireFormatParams, long hitTimeInMilliseconds, String path, List<Command> commands) {
        Log.v("putHit called");
        this.queue.add(new HitParams(wireFormatParams, hitTimeInMilliseconds, path, commands));
        sendQueue();
    }

    public void dispatch() {
        switch (this.state) {
            case CONNECTED_LOCAL:
                dispatchToStore();
                return;
            case CONNECTED_SERVICE:
                return;
            default:
                this.pendingDispatch = true;
                return;
        }
    }

    public void clearHits() {
        Log.v("clearHits called");
        this.queue.clear();
        switch (this.state) {
            case CONNECTED_LOCAL:
                this.store.clearHits(0);
                this.pendingClearHits = false;
                return;
            case CONNECTED_SERVICE:
                this.client.clearHits();
                this.pendingClearHits = false;
                return;
            default:
                this.pendingClearHits = true;
                return;
        }
    }

    public synchronized void setForceLocalDispatch() {
        if (!this.forceLocalDispatch) {
            Log.v("setForceLocalDispatch called.");
            this.forceLocalDispatch = true;
            switch (this.state) {
                case CONNECTED_LOCAL:
                case PENDING_CONNECTION:
                case PENDING_DISCONNECT:
                case DISCONNECTED:
                    break;
                case CONNECTED_SERVICE:
                    disconnectFromService();
                    break;
                case CONNECTING:
                    this.pendingServiceDisconnect = true;
                    break;
            }
        }
    }

    private Timer cancelTimer(Timer timer) {
        if (timer == null) {
            return null;
        }
        timer.cancel();
        return null;
    }

    private void clearAllTimers() {
        this.reConnectTimer = cancelTimer(this.reConnectTimer);
        this.failedConnectTimer = cancelTimer(this.failedConnectTimer);
        this.disconnectCheckTimer = cancelTimer(this.disconnectCheckTimer);
    }

    public void createService() {
        if (this.client == null) {
            this.client = new AnalyticsGmsCoreClient(this.ctx, this, this);
            connectToService();
        }
    }

    /* access modifiers changed from: package-private */
    public void createService(AnalyticsClient client2) {
        if (this.client == null) {
            this.client = client2;
            connectToService();
        }
    }

    public void setIdleTimeout(long idleTimeout2) {
        this.idleTimeout = idleTimeout2;
    }

    /* access modifiers changed from: private */
    /* JADX WARNING: Can't fix incorrect switch cases order */
    /* JADX WARNING: Code restructure failed: missing block: B:15:0x003c, code lost:
        if (r7.queue.isEmpty() != false) goto L_0x0075;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:16:0x003e, code lost:
        r6 = r7.queue.poll();
        com.google.analytics.tracking.android.Log.v("Sending hit to store  " + r6);
        r7.store.putHit(r6.getWireFormatParams(), r6.getHitTimeInMilliseconds(), r6.getPath(), r6.getCommands());
     */
    /* JADX WARNING: Code restructure failed: missing block: B:22:0x0077, code lost:
        if (r7.pendingDispatch == false) goto L_0x001f;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:23:0x0079, code lost:
        dispatchToStore();
     */
    /* JADX WARNING: Code restructure failed: missing block: B:31:0x00cc, code lost:
        r7.lastRequestTime = r7.clock.currentTimeMillis();
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized void sendQueue() {
        /*
            r7 = this;
            monitor-enter(r7)
            java.lang.Thread r0 = java.lang.Thread.currentThread()     // Catch:{ all -> 0x0072 }
            com.google.analytics.tracking.android.AnalyticsThread r1 = r7.thread     // Catch:{ all -> 0x0072 }
            java.lang.Thread r1 = r1.getThread()     // Catch:{ all -> 0x0072 }
            boolean r0 = r0.equals(r1)     // Catch:{ all -> 0x0072 }
            if (r0 != 0) goto L_0x0021
            com.google.analytics.tracking.android.AnalyticsThread r0 = r7.thread     // Catch:{ all -> 0x0072 }
            java.util.concurrent.LinkedBlockingQueue r0 = r0.getQueue()     // Catch:{ all -> 0x0072 }
            com.google.analytics.tracking.android.GAServiceProxy$2 r1 = new com.google.analytics.tracking.android.GAServiceProxy$2     // Catch:{ all -> 0x0072 }
            r1.<init>()     // Catch:{ all -> 0x0072 }
            r0.add(r1)     // Catch:{ all -> 0x0072 }
        L_0x001f:
            monitor-exit(r7)
            return
        L_0x0021:
            boolean r0 = r7.pendingClearHits     // Catch:{ all -> 0x0072 }
            if (r0 == 0) goto L_0x0028
            r7.clearHits()     // Catch:{ all -> 0x0072 }
        L_0x0028:
            int[] r0 = com.google.analytics.tracking.android.GAServiceProxy.AnonymousClass3.$SwitchMap$com$google$analytics$tracking$android$GAServiceProxy$ConnectState     // Catch:{ all -> 0x0072 }
            com.google.analytics.tracking.android.GAServiceProxy$ConnectState r1 = r7.state     // Catch:{ all -> 0x0072 }
            int r1 = r1.ordinal()     // Catch:{ all -> 0x0072 }
            r0 = r0[r1]     // Catch:{ all -> 0x0072 }
            switch(r0) {
                case 1: goto L_0x0036;
                case 2: goto L_0x007d;
                case 3: goto L_0x0035;
                case 4: goto L_0x0035;
                case 5: goto L_0x0035;
                case 6: goto L_0x00d6;
                default: goto L_0x0035;
            }     // Catch:{ all -> 0x0072 }
        L_0x0035:
            goto L_0x001f
        L_0x0036:
            java.util.Queue<com.google.analytics.tracking.android.GAServiceProxy$HitParams> r0 = r7.queue     // Catch:{ all -> 0x0072 }
            boolean r0 = r0.isEmpty()     // Catch:{ all -> 0x0072 }
            if (r0 != 0) goto L_0x0075
            java.util.Queue<com.google.analytics.tracking.android.GAServiceProxy$HitParams> r0 = r7.queue     // Catch:{ all -> 0x0072 }
            java.lang.Object r6 = r0.poll()     // Catch:{ all -> 0x0072 }
            com.google.analytics.tracking.android.GAServiceProxy$HitParams r6 = (com.google.analytics.tracking.android.GAServiceProxy.HitParams) r6     // Catch:{ all -> 0x0072 }
            java.lang.StringBuilder r0 = new java.lang.StringBuilder     // Catch:{ all -> 0x0072 }
            r0.<init>()     // Catch:{ all -> 0x0072 }
            java.lang.String r1 = "Sending hit to store  "
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ all -> 0x0072 }
            java.lang.StringBuilder r0 = r0.append(r6)     // Catch:{ all -> 0x0072 }
            java.lang.String r0 = r0.toString()     // Catch:{ all -> 0x0072 }
            com.google.analytics.tracking.android.Log.v(r0)     // Catch:{ all -> 0x0072 }
            com.google.analytics.tracking.android.AnalyticsStore r0 = r7.store     // Catch:{ all -> 0x0072 }
            java.util.Map r1 = r6.getWireFormatParams()     // Catch:{ all -> 0x0072 }
            long r2 = r6.getHitTimeInMilliseconds()     // Catch:{ all -> 0x0072 }
            java.lang.String r4 = r6.getPath()     // Catch:{ all -> 0x0072 }
            java.util.List r5 = r6.getCommands()     // Catch:{ all -> 0x0072 }
            r0.putHit(r1, r2, r4, r5)     // Catch:{ all -> 0x0072 }
            goto L_0x0036
        L_0x0072:
            r0 = move-exception
            monitor-exit(r7)
            throw r0
        L_0x0075:
            boolean r0 = r7.pendingDispatch     // Catch:{ all -> 0x0072 }
            if (r0 == 0) goto L_0x001f
            r7.dispatchToStore()     // Catch:{ all -> 0x0072 }
            goto L_0x001f
        L_0x007d:
            java.util.Queue<com.google.analytics.tracking.android.GAServiceProxy$HitParams> r0 = r7.queue     // Catch:{ all -> 0x0072 }
            boolean r0 = r0.isEmpty()     // Catch:{ all -> 0x0072 }
            if (r0 != 0) goto L_0x00cc
            java.util.Queue<com.google.analytics.tracking.android.GAServiceProxy$HitParams> r0 = r7.queue     // Catch:{ all -> 0x0072 }
            java.lang.Object r6 = r0.peek()     // Catch:{ all -> 0x0072 }
            com.google.analytics.tracking.android.GAServiceProxy$HitParams r6 = (com.google.analytics.tracking.android.GAServiceProxy.HitParams) r6     // Catch:{ all -> 0x0072 }
            java.lang.StringBuilder r0 = new java.lang.StringBuilder     // Catch:{ all -> 0x0072 }
            r0.<init>()     // Catch:{ all -> 0x0072 }
            java.lang.String r1 = "Sending hit to service   "
            java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ all -> 0x0072 }
            java.lang.StringBuilder r0 = r0.append(r6)     // Catch:{ all -> 0x0072 }
            java.lang.String r0 = r0.toString()     // Catch:{ all -> 0x0072 }
            com.google.analytics.tracking.android.Log.v(r0)     // Catch:{ all -> 0x0072 }
            com.google.analytics.tracking.android.GoogleAnalytics r0 = r7.gaInstance     // Catch:{ all -> 0x0072 }
            boolean r0 = r0.isDryRunEnabled()     // Catch:{ all -> 0x0072 }
            if (r0 != 0) goto L_0x00c6
            com.google.analytics.tracking.android.AnalyticsClient r0 = r7.client     // Catch:{ all -> 0x0072 }
            java.util.Map r1 = r6.getWireFormatParams()     // Catch:{ all -> 0x0072 }
            long r2 = r6.getHitTimeInMilliseconds()     // Catch:{ all -> 0x0072 }
            java.lang.String r4 = r6.getPath()     // Catch:{ all -> 0x0072 }
            java.util.List r5 = r6.getCommands()     // Catch:{ all -> 0x0072 }
            r0.sendHit(r1, r2, r4, r5)     // Catch:{ all -> 0x0072 }
        L_0x00c0:
            java.util.Queue<com.google.analytics.tracking.android.GAServiceProxy$HitParams> r0 = r7.queue     // Catch:{ all -> 0x0072 }
            r0.poll()     // Catch:{ all -> 0x0072 }
            goto L_0x007d
        L_0x00c6:
            java.lang.String r0 = "Dry run enabled. Hit not actually sent to service."
            com.google.analytics.tracking.android.Log.v(r0)     // Catch:{ all -> 0x0072 }
            goto L_0x00c0
        L_0x00cc:
            com.google.analytics.tracking.android.Clock r0 = r7.clock     // Catch:{ all -> 0x0072 }
            long r0 = r0.currentTimeMillis()     // Catch:{ all -> 0x0072 }
            r7.lastRequestTime = r0     // Catch:{ all -> 0x0072 }
            goto L_0x001f
        L_0x00d6:
            java.lang.String r0 = "Need to reconnect"
            com.google.analytics.tracking.android.Log.v(r0)     // Catch:{ all -> 0x0072 }
            java.util.Queue<com.google.analytics.tracking.android.GAServiceProxy$HitParams> r0 = r7.queue     // Catch:{ all -> 0x0072 }
            boolean r0 = r0.isEmpty()     // Catch:{ all -> 0x0072 }
            if (r0 != 0) goto L_0x001f
            r7.connectToService()     // Catch:{ all -> 0x0072 }
            goto L_0x001f
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.analytics.tracking.android.GAServiceProxy.sendQueue():void");
    }

    private void dispatchToStore() {
        this.store.dispatch();
        this.pendingDispatch = false;
    }

    /* access modifiers changed from: private */
    public synchronized void useStore() {
        if (this.state != ConnectState.CONNECTED_LOCAL) {
            clearAllTimers();
            Log.v("falling back to local store");
            if (this.testStore != null) {
                this.store = this.testStore;
            } else {
                GAServiceManager instance = GAServiceManager.getInstance();
                instance.initialize(this.ctx, this.thread);
                this.store = instance.getStore();
            }
            this.state = ConnectState.CONNECTED_LOCAL;
            sendQueue();
        }
    }

    /* access modifiers changed from: private */
    public synchronized void connectToService() {
        if (this.forceLocalDispatch || this.client == null || this.state == ConnectState.CONNECTED_LOCAL) {
            Log.w("client not initialized.");
            useStore();
        } else {
            try {
                this.connectTries++;
                cancelTimer(this.failedConnectTimer);
                this.state = ConnectState.CONNECTING;
                this.failedConnectTimer = new Timer("Failed Connect");
                this.failedConnectTimer.schedule(new FailedConnectTask(), FAILED_CONNECT_WAIT_TIME);
                Log.v("connecting to Analytics service");
                this.client.connect();
            } catch (SecurityException e) {
                Log.w("security exception on connectToService");
                useStore();
            }
        }
        return;
    }

    /* access modifiers changed from: private */
    public synchronized void disconnectFromService() {
        if (this.client != null && this.state == ConnectState.CONNECTED_SERVICE) {
            this.state = ConnectState.PENDING_DISCONNECT;
            this.client.disconnect();
        }
    }

    public synchronized void onConnected() {
        this.failedConnectTimer = cancelTimer(this.failedConnectTimer);
        this.connectTries = 0;
        Log.v("Connected to service");
        this.state = ConnectState.CONNECTED_SERVICE;
        if (this.pendingServiceDisconnect) {
            disconnectFromService();
            this.pendingServiceDisconnect = false;
        } else {
            sendQueue();
            this.disconnectCheckTimer = cancelTimer(this.disconnectCheckTimer);
            this.disconnectCheckTimer = new Timer("disconnect check");
            this.disconnectCheckTimer.schedule(new DisconnectCheckTask(), this.idleTimeout);
        }
    }

    public synchronized void onDisconnected() {
        if (this.state == ConnectState.PENDING_DISCONNECT) {
            Log.v("Disconnected from service");
            clearAllTimers();
            this.state = ConnectState.DISCONNECTED;
        } else {
            Log.v("Unexpected disconnect.");
            this.state = ConnectState.PENDING_CONNECTION;
            if (this.connectTries < 2) {
                fireReconnectAttempt();
            } else {
                useStore();
            }
        }
    }

    public synchronized void onConnectionFailed(int errorCode, Intent resolution) {
        this.state = ConnectState.PENDING_CONNECTION;
        if (this.connectTries < 2) {
            Log.w("Service unavailable (code=" + errorCode + "), will retry.");
            fireReconnectAttempt();
        } else {
            Log.w("Service unavailable (code=" + errorCode + "), using local store.");
            useStore();
        }
    }

    private void fireReconnectAttempt() {
        this.reConnectTimer = cancelTimer(this.reConnectTimer);
        this.reConnectTimer = new Timer("Service Reconnect");
        this.reConnectTimer.schedule(new ReconnectTask(), RECONNECT_WAIT_TIME);
    }

    private class FailedConnectTask extends TimerTask {
        private FailedConnectTask() {
        }

        public void run() {
            if (GAServiceProxy.this.state == ConnectState.CONNECTING) {
                GAServiceProxy.this.useStore();
            }
        }
    }

    private class ReconnectTask extends TimerTask {
        private ReconnectTask() {
        }

        public void run() {
            GAServiceProxy.this.connectToService();
        }
    }

    private class DisconnectCheckTask extends TimerTask {
        private DisconnectCheckTask() {
        }

        public void run() {
            if (GAServiceProxy.this.state != ConnectState.CONNECTED_SERVICE || !GAServiceProxy.this.queue.isEmpty() || GAServiceProxy.this.lastRequestTime + GAServiceProxy.this.idleTimeout >= GAServiceProxy.this.clock.currentTimeMillis()) {
                GAServiceProxy.this.disconnectCheckTimer.schedule(new DisconnectCheckTask(), GAServiceProxy.this.idleTimeout);
                return;
            }
            Log.v("Disconnecting due to inactivity");
            GAServiceProxy.this.disconnectFromService();
        }
    }

    private static class HitParams {
        private final List<Command> commands;
        private final long hitTimeInMilliseconds;
        private final String path;
        private final Map<String, String> wireFormatParams;

        public HitParams(Map<String, String> wireFormatParams2, long hitTimeInMilliseconds2, String path2, List<Command> commands2) {
            this.wireFormatParams = wireFormatParams2;
            this.hitTimeInMilliseconds = hitTimeInMilliseconds2;
            this.path = path2;
            this.commands = commands2;
        }

        public Map<String, String> getWireFormatParams() {
            return this.wireFormatParams;
        }

        public long getHitTimeInMilliseconds() {
            return this.hitTimeInMilliseconds;
        }

        public String getPath() {
            return this.path;
        }

        public List<Command> getCommands() {
            return this.commands;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("PATH: ");
            sb.append(this.path);
            if (this.wireFormatParams != null) {
                sb.append("  PARAMS: ");
                for (Map.Entry<String, String> entry : this.wireFormatParams.entrySet()) {
                    sb.append(entry.getKey());
                    sb.append("=");
                    sb.append(entry.getValue());
                    sb.append(",  ");
                }
            }
            return sb.toString();
        }
    }
}
