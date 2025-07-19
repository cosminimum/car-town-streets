package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.ServiceConnection;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;
import android.os.Message;
import android.os.RemoteException;
import android.util.Log;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.internal.dx;
import com.google.android.gms.internal.eb;
import com.google.android.gms.internal.ec;
import java.util.ArrayList;
/* loaded from: classes.dex */
public abstract class dw<T extends IInterface> implements GooglePlayServicesClient, Api.a, dx.b {
    public static final String[] pk = {"service_esmobile", "service_googleme"};
    private final String[] jF;
    private final Context mContext;
    final Handler mHandler;
    private final dx ne;
    private T pe;
    private final ArrayList<dw<T>.b<?>> pf;
    private dw<T>.f pg;
    boolean ph;
    boolean pi;
    private final Object pj;

    /* loaded from: classes.dex */
    final class a extends Handler {
        public a(Looper looper) {
            super(looper);
        }

        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            if (msg.what == 1 && !dw.this.isConnecting()) {
                b bVar = (b) msg.obj;
                bVar.aL();
                bVar.unregister();
                return;
            }
            synchronized (dw.this.pj) {
                dw.this.pi = false;
            }
            if (msg.what == 3) {
                dw.this.ne.a(new ConnectionResult(((Integer) msg.obj).intValue(), null));
            } else if (msg.what == 4) {
                dw.this.ne.J(((Integer) msg.obj).intValue());
            } else if (msg.what == 2 && !dw.this.isConnected()) {
                b bVar2 = (b) msg.obj;
                bVar2.aL();
                bVar2.unregister();
            } else if (msg.what == 2 || msg.what == 1) {
                ((b) msg.obj).bR();
            } else {
                Log.wtf("GmsClient", "Don't know how to handle this message.");
            }
        }
    }

    /* loaded from: classes.dex */
    protected abstract class b<TListener> {
        private TListener mListener;
        private boolean pm = false;

        public b(TListener tlistener) {
            this.mListener = tlistener;
        }

        protected abstract void aL();

        protected abstract void b(TListener tlistener);

        public void bR() {
            TListener tlistener;
            synchronized (this) {
                tlistener = this.mListener;
                if (this.pm) {
                    Log.w("GmsClient", "Callback proxy " + this + " being reused. This is not safe.");
                }
            }
            if (tlistener != null) {
                try {
                    b(tlistener);
                } catch (RuntimeException e) {
                    aL();
                    throw e;
                }
            } else {
                aL();
            }
            synchronized (this) {
                this.pm = true;
            }
            unregister();
        }

        public void bS() {
            synchronized (this) {
                this.mListener = null;
            }
        }

        public void unregister() {
            bS();
            synchronized (dw.this.pf) {
                dw.this.pf.remove(this);
            }
        }
    }

    /* loaded from: classes.dex */
    public static final class c implements GoogleApiClient.ConnectionCallbacks {
        private final GooglePlayServicesClient.ConnectionCallbacks pn;

        public c(GooglePlayServicesClient.ConnectionCallbacks connectionCallbacks) {
            this.pn = connectionCallbacks;
        }

        public boolean equals(Object other) {
            return other instanceof c ? this.pn.equals(((c) other).pn) : this.pn.equals(other);
        }

        @Override // com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks
        public void onConnected(Bundle connectionHint) {
            this.pn.onConnected(connectionHint);
        }

        @Override // com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks
        public void onConnectionSuspended(int cause) {
            this.pn.onDisconnected();
        }
    }

    /* loaded from: classes.dex */
    public abstract class d<TListener> extends dw<T>.b<TListener> {
        private final DataHolder nE;

        public d(TListener tlistener, DataHolder dataHolder) {
            super(tlistener);
            this.nE = dataHolder;
        }

        protected abstract void a(TListener tlistener, DataHolder dataHolder);

        @Override // com.google.android.gms.internal.dw.b
        protected void aL() {
            if (this.nE != null) {
                this.nE.close();
            }
        }

        @Override // com.google.android.gms.internal.dw.b
        protected final void b(TListener tlistener) {
            a(tlistener, this.nE);
        }

        @Override // com.google.android.gms.internal.dw.b
        public /* bridge */ /* synthetic */ void bR() {
            super.bR();
        }

        @Override // com.google.android.gms.internal.dw.b
        public /* bridge */ /* synthetic */ void bS() {
            super.bS();
        }

        @Override // com.google.android.gms.internal.dw.b
        public /* bridge */ /* synthetic */ void unregister() {
            super.unregister();
        }
    }

    /* loaded from: classes.dex */
    public static final class e extends eb.a {
        private dw po;

        public e(dw dwVar) {
            this.po = dwVar;
        }

        @Override // com.google.android.gms.internal.eb
        public void b(int i, IBinder iBinder, Bundle bundle) {
            eg.b("onPostInitComplete can be called only once per call to getServiceFromBroker", this.po);
            this.po.a(i, iBinder, bundle);
            this.po = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public final class f implements ServiceConnection {
        f() {
        }

        @Override // android.content.ServiceConnection
        public void onServiceConnected(ComponentName component, IBinder binder) {
            dw.this.w(binder);
        }

        @Override // android.content.ServiceConnection
        public void onServiceDisconnected(ComponentName component) {
            dw.this.pe = null;
            dw.this.ne.J(1);
        }
    }

    /* loaded from: classes.dex */
    public static final class g implements GoogleApiClient.OnConnectionFailedListener {
        private final GooglePlayServicesClient.OnConnectionFailedListener pp;

        public g(GooglePlayServicesClient.OnConnectionFailedListener onConnectionFailedListener) {
            this.pp = onConnectionFailedListener;
        }

        public boolean equals(Object other) {
            return other instanceof g ? this.pp.equals(((g) other).pp) : this.pp.equals(other);
        }

        @Override // com.google.android.gms.common.GooglePlayServicesClient.OnConnectionFailedListener
        public void onConnectionFailed(ConnectionResult result) {
            this.pp.onConnectionFailed(result);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes.dex */
    public final class h extends dw<T>.b<Boolean> {
        public final Bundle pq;
        public final IBinder pr;
        public final int statusCode;

        public h(int i, IBinder iBinder, Bundle bundle) {
            super(true);
            this.statusCode = i;
            this.pr = iBinder;
            this.pq = bundle;
        }

        @Override // com.google.android.gms.internal.dw.b
        protected void aL() {
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.dw.b
        public void b(Boolean bool) {
            if (bool == null) {
                return;
            }
            switch (this.statusCode) {
                case 0:
                    try {
                        if (dw.this.an().equals(this.pr.getInterfaceDescriptor())) {
                            dw.this.pe = dw.this.p(this.pr);
                            if (dw.this.pe != null) {
                                dw.this.ne.bT();
                                return;
                            }
                        }
                    } catch (RemoteException e) {
                    }
                    dy.s(dw.this.mContext).b(dw.this.am(), dw.this.pg);
                    dw.this.pg = null;
                    dw.this.pe = null;
                    dw.this.ne.a(new ConnectionResult(8, null));
                    return;
                case 10:
                    throw new IllegalStateException("A fatal developer error has occurred. Check the logs for further information.");
                default:
                    PendingIntent pendingIntent = this.pq != null ? (PendingIntent) this.pq.getParcelable("pendingIntent") : null;
                    if (dw.this.pg != null) {
                        dy.s(dw.this.mContext).b(dw.this.am(), dw.this.pg);
                        dw.this.pg = null;
                    }
                    dw.this.pe = null;
                    dw.this.ne.a(new ConnectionResult(this.statusCode, pendingIntent));
                    return;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public dw(Context context, GooglePlayServicesClient.ConnectionCallbacks connectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener onConnectionFailedListener, String... strArr) {
        this(context, new c(connectionCallbacks), new g(onConnectionFailedListener), strArr);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public dw(Context context, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener, String... strArr) {
        this.pf = new ArrayList<>();
        this.ph = false;
        this.pi = false;
        this.pj = new Object();
        this.mContext = (Context) eg.f(context);
        this.ne = new dx(context, this, null);
        this.mHandler = new a(context.getMainLooper());
        a(strArr);
        this.jF = strArr;
        registerConnectionCallbacks((GoogleApiClient.ConnectionCallbacks) eg.f(connectionCallbacks));
        registerConnectionFailedListener((GoogleApiClient.OnConnectionFailedListener) eg.f(onConnectionFailedListener));
    }

    public void I(int i) {
        this.mHandler.sendMessage(this.mHandler.obtainMessage(4, Integer.valueOf(i)));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void a(int i, IBinder iBinder, Bundle bundle) {
        this.mHandler.sendMessage(this.mHandler.obtainMessage(1, new h(i, iBinder, bundle)));
    }

    public final void a(dw<T>.b<?> bVar) {
        synchronized (this.pf) {
            this.pf.add(bVar);
        }
        this.mHandler.sendMessage(this.mHandler.obtainMessage(2, bVar));
    }

    protected abstract void a(ec ecVar, e eVar) throws RemoteException;

    protected void a(String... strArr) {
    }

    public Bundle aU() {
        return null;
    }

    protected abstract String am();

    protected abstract String an();

    public final String[] bO() {
        return this.jF;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final void bP() {
        if (!isConnected()) {
            throw new IllegalStateException("Not connected. Call connect() and wait for onConnected() to be called.");
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final T bQ() {
        bP();
        return this.pe;
    }

    @Override // com.google.android.gms.internal.dx.b
    public boolean bp() {
        return this.ph;
    }

    @Override // com.google.android.gms.common.GooglePlayServicesClient
    public void connect() {
        this.ph = true;
        synchronized (this.pj) {
            this.pi = true;
        }
        int isGooglePlayServicesAvailable = GooglePlayServicesUtil.isGooglePlayServicesAvailable(this.mContext);
        if (isGooglePlayServicesAvailable != 0) {
            this.mHandler.sendMessage(this.mHandler.obtainMessage(3, Integer.valueOf(isGooglePlayServicesAvailable)));
            return;
        }
        if (this.pg != null) {
            Log.e("GmsClient", "Calling connect() while still connected, missing disconnect().");
            this.pe = null;
            dy.s(this.mContext).b(am(), this.pg);
        }
        this.pg = new f();
        if (dy.s(this.mContext).a(am(), this.pg)) {
            return;
        }
        Log.e("GmsClient", "unable to connect to service: " + am());
        this.mHandler.sendMessage(this.mHandler.obtainMessage(3, 9));
    }

    @Override // com.google.android.gms.common.GooglePlayServicesClient
    public void disconnect() {
        this.ph = false;
        synchronized (this.pj) {
            this.pi = false;
        }
        synchronized (this.pf) {
            int size = this.pf.size();
            for (int i = 0; i < size; i++) {
                this.pf.get(i).bS();
            }
            this.pf.clear();
        }
        this.pe = null;
        if (this.pg != null) {
            dy.s(this.mContext).b(am(), this.pg);
            this.pg = null;
            this.ne.J(-1);
        }
    }

    public final Context getContext() {
        return this.mContext;
    }

    @Override // com.google.android.gms.common.GooglePlayServicesClient
    public boolean isConnected() {
        return this.pe != null;
    }

    @Override // com.google.android.gms.common.GooglePlayServicesClient
    public boolean isConnecting() {
        boolean z;
        synchronized (this.pj) {
            z = this.pi;
        }
        return z;
    }

    @Override // com.google.android.gms.common.GooglePlayServicesClient
    public boolean isConnectionCallbacksRegistered(GooglePlayServicesClient.ConnectionCallbacks listener) {
        return this.ne.isConnectionCallbacksRegistered(new c(listener));
    }

    @Override // com.google.android.gms.common.GooglePlayServicesClient
    public boolean isConnectionFailedListenerRegistered(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        return this.ne.isConnectionFailedListenerRegistered(listener);
    }

    protected abstract T p(IBinder iBinder);

    @Override // com.google.android.gms.common.GooglePlayServicesClient
    public void registerConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.ne.registerConnectionCallbacks(new c(listener));
    }

    public void registerConnectionCallbacks(GoogleApiClient.ConnectionCallbacks listener) {
        this.ne.registerConnectionCallbacks(listener);
    }

    @Override // com.google.android.gms.common.GooglePlayServicesClient
    public void registerConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.ne.registerConnectionFailedListener(listener);
    }

    public void registerConnectionFailedListener(GoogleApiClient.OnConnectionFailedListener listener) {
        this.ne.registerConnectionFailedListener(listener);
    }

    @Override // com.google.android.gms.common.GooglePlayServicesClient
    public void unregisterConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.ne.unregisterConnectionCallbacks(new c(listener));
    }

    @Override // com.google.android.gms.common.GooglePlayServicesClient
    public void unregisterConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.ne.unregisterConnectionFailedListener(listener);
    }

    protected final void w(IBinder iBinder) {
        try {
            a(ec.a.y(iBinder), new e(this));
        } catch (RemoteException e2) {
            Log.w("GmsClient", "service died");
        }
    }
}
