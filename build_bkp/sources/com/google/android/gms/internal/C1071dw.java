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
import com.google.android.gms.internal.C1080dx;
import com.google.android.gms.internal.C1089eb;
import com.google.android.gms.internal.C1092ec;
import java.util.ArrayList;

/* renamed from: com.google.android.gms.internal.dw */
public abstract class C1071dw<T extends IInterface> implements GooglePlayServicesClient, Api.C0646a, C1080dx.C1082b {

    /* renamed from: pk */
    public static final String[] f2574pk = {"service_esmobile", "service_googleme"};

    /* renamed from: jF */
    private final String[] f2575jF;
    /* access modifiers changed from: private */
    public final Context mContext;
    final Handler mHandler;
    /* access modifiers changed from: private */

    /* renamed from: ne */
    public final C1080dx f2576ne;
    /* access modifiers changed from: private */

    /* renamed from: pe */
    public T f2577pe;
    /* access modifiers changed from: private */

    /* renamed from: pf */
    public final ArrayList<C1071dw<T>.b<?>> f2578pf;
    /* access modifiers changed from: private */

    /* renamed from: pg */
    public C1071dw<T>.f f2579pg;

    /* renamed from: ph */
    boolean f2580ph;

    /* renamed from: pi */
    boolean f2581pi;
    /* access modifiers changed from: private */

    /* renamed from: pj */
    public final Object f2582pj;

    /* renamed from: com.google.android.gms.internal.dw$a */
    final class C1072a extends Handler {
        public C1072a(Looper looper) {
            super(looper);
        }

        public void handleMessage(Message msg) {
            if (msg.what != 1 || C1071dw.this.isConnecting()) {
                synchronized (C1071dw.this.f2582pj) {
                    C1071dw.this.f2581pi = false;
                }
                if (msg.what == 3) {
                    C1071dw.this.f2576ne.mo7470a(new ConnectionResult(((Integer) msg.obj).intValue(), (PendingIntent) null));
                } else if (msg.what == 4) {
                    C1071dw.this.f2576ne.mo7469J(((Integer) msg.obj).intValue());
                } else if (msg.what == 2 && !C1071dw.this.isConnected()) {
                    C1073b bVar = (C1073b) msg.obj;
                    bVar.mo7306aL();
                    bVar.unregister();
                } else if (msg.what == 2 || msg.what == 1) {
                    ((C1073b) msg.obj).mo7460bR();
                } else {
                    Log.wtf("GmsClient", "Don't know how to handle this message.");
                }
            } else {
                C1073b bVar2 = (C1073b) msg.obj;
                bVar2.mo7306aL();
                bVar2.unregister();
            }
        }
    }

    /* renamed from: com.google.android.gms.internal.dw$b */
    protected abstract class C1073b<TListener> {
        private TListener mListener;

        /* renamed from: pm */
        private boolean f2585pm = false;

        public C1073b(TListener tlistener) {
            this.mListener = tlistener;
        }

        /* access modifiers changed from: protected */
        /* renamed from: aL */
        public abstract void mo7306aL();

        /* access modifiers changed from: protected */
        /* renamed from: b */
        public abstract void mo7307b(TListener tlistener);

        /* renamed from: bR */
        public void mo7460bR() {
            TListener tlistener;
            synchronized (this) {
                tlistener = this.mListener;
                if (this.f2585pm) {
                    Log.w("GmsClient", "Callback proxy " + this + " being reused. This is not safe.");
                }
            }
            if (tlistener != null) {
                try {
                    mo7307b(tlistener);
                } catch (RuntimeException e) {
                    mo7306aL();
                    throw e;
                }
            } else {
                mo7306aL();
            }
            synchronized (this) {
                this.f2585pm = true;
            }
            unregister();
        }

        /* renamed from: bS */
        public void mo7461bS() {
            synchronized (this) {
                this.mListener = null;
            }
        }

        public void unregister() {
            mo7461bS();
            synchronized (C1071dw.this.f2578pf) {
                C1071dw.this.f2578pf.remove(this);
            }
        }
    }

    /* renamed from: com.google.android.gms.internal.dw$c */
    public static final class C1074c implements GoogleApiClient.ConnectionCallbacks {

        /* renamed from: pn */
        private final GooglePlayServicesClient.ConnectionCallbacks f2586pn;

        public C1074c(GooglePlayServicesClient.ConnectionCallbacks connectionCallbacks) {
            this.f2586pn = connectionCallbacks;
        }

        public boolean equals(Object other) {
            return other instanceof C1074c ? this.f2586pn.equals(((C1074c) other).f2586pn) : this.f2586pn.equals(other);
        }

        public void onConnected(Bundle connectionHint) {
            this.f2586pn.onConnected(connectionHint);
        }

        public void onConnectionSuspended(int cause) {
            this.f2586pn.onDisconnected();
        }
    }

    /* renamed from: com.google.android.gms.internal.dw$d */
    public abstract class C1075d<TListener> extends C1071dw<T>.b<TListener> {

        /* renamed from: nE */
        private final DataHolder f2587nE;

        public C1075d(TListener tlistener, DataHolder dataHolder) {
            super(tlistener);
            this.f2587nE = dataHolder;
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public abstract void mo7310a(TListener tlistener, DataHolder dataHolder);

        /* access modifiers changed from: protected */
        /* renamed from: aL */
        public void mo7306aL() {
            if (this.f2587nE != null) {
                this.f2587nE.close();
            }
        }

        /* access modifiers changed from: protected */
        /* renamed from: b */
        public final void mo7307b(TListener tlistener) {
            mo7310a(tlistener, this.f2587nE);
        }

        /* renamed from: bR */
        public /* bridge */ /* synthetic */ void mo7460bR() {
            super.mo7460bR();
        }

        /* renamed from: bS */
        public /* bridge */ /* synthetic */ void mo7461bS() {
            super.mo7461bS();
        }

        public /* bridge */ /* synthetic */ void unregister() {
            super.unregister();
        }
    }

    /* renamed from: com.google.android.gms.internal.dw$e */
    public static final class C1076e extends C1089eb.C1090a {

        /* renamed from: po */
        private C1071dw f2589po;

        public C1076e(C1071dw dwVar) {
            this.f2589po = dwVar;
        }

        /* renamed from: b */
        public void mo7464b(int i, IBinder iBinder, Bundle bundle) {
            C1102eg.m2614b("onPostInitComplete can be called only once per call to getServiceFromBroker", (Object) this.f2589po);
            this.f2589po.mo6201a(i, iBinder, bundle);
            this.f2589po = null;
        }
    }

    /* renamed from: com.google.android.gms.internal.dw$f */
    final class C1077f implements ServiceConnection {
        C1077f() {
        }

        public void onServiceConnected(ComponentName component, IBinder binder) {
            C1071dw.this.mo7458w(binder);
        }

        public void onServiceDisconnected(ComponentName component) {
            IInterface unused = C1071dw.this.f2577pe = null;
            C1071dw.this.f2576ne.mo7469J(1);
        }
    }

    /* renamed from: com.google.android.gms.internal.dw$g */
    public static final class C1078g implements GoogleApiClient.OnConnectionFailedListener {

        /* renamed from: pp */
        private final GooglePlayServicesClient.OnConnectionFailedListener f2591pp;

        public C1078g(GooglePlayServicesClient.OnConnectionFailedListener onConnectionFailedListener) {
            this.f2591pp = onConnectionFailedListener;
        }

        public boolean equals(Object other) {
            return other instanceof C1078g ? this.f2591pp.equals(((C1078g) other).f2591pp) : this.f2591pp.equals(other);
        }

        public void onConnectionFailed(ConnectionResult result) {
            this.f2591pp.onConnectionFailed(result);
        }
    }

    /* renamed from: com.google.android.gms.internal.dw$h */
    protected final class C1079h extends C1071dw<T>.b<Boolean> {

        /* renamed from: pq */
        public final Bundle f2593pq;

        /* renamed from: pr */
        public final IBinder f2594pr;
        public final int statusCode;

        public C1079h(int i, IBinder iBinder, Bundle bundle) {
            super(true);
            this.statusCode = i;
            this.f2594pr = iBinder;
            this.f2593pq = bundle;
        }

        /* access modifiers changed from: protected */
        /* renamed from: aL */
        public void mo7306aL() {
        }

        /* access modifiers changed from: protected */
        /* renamed from: b */
        public void mo7307b(Boolean bool) {
            if (bool != null) {
                switch (this.statusCode) {
                    case 0:
                        try {
                            if (C1071dw.this.mo6204an().equals(this.f2594pr.getInterfaceDescriptor())) {
                                IInterface unused = C1071dw.this.f2577pe = C1071dw.this.mo6207p(this.f2594pr);
                                if (C1071dw.this.f2577pe != null) {
                                    C1071dw.this.f2576ne.mo7472bT();
                                    return;
                                }
                            }
                        } catch (RemoteException e) {
                        }
                        C1083dy.m2519s(C1071dw.this.mContext).mo7481b(C1071dw.this.mo6203am(), C1071dw.this.f2579pg);
                        C1077f unused2 = C1071dw.this.f2579pg = null;
                        IInterface unused3 = C1071dw.this.f2577pe = null;
                        C1071dw.this.f2576ne.mo7470a(new ConnectionResult(8, (PendingIntent) null));
                        return;
                    case 10:
                        throw new IllegalStateException("A fatal developer error has occurred. Check the logs for further information.");
                    default:
                        PendingIntent pendingIntent = this.f2593pq != null ? (PendingIntent) this.f2593pq.getParcelable("pendingIntent") : null;
                        if (C1071dw.this.f2579pg != null) {
                            C1083dy.m2519s(C1071dw.this.mContext).mo7481b(C1071dw.this.mo6203am(), C1071dw.this.f2579pg);
                            C1077f unused4 = C1071dw.this.f2579pg = null;
                        }
                        IInterface unused5 = C1071dw.this.f2577pe = null;
                        C1071dw.this.f2576ne.mo7470a(new ConnectionResult(this.statusCode, pendingIntent));
                        return;
                }
            }
        }
    }

    protected C1071dw(Context context, GooglePlayServicesClient.ConnectionCallbacks connectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener onConnectionFailedListener, String... strArr) {
        this(context, (GoogleApiClient.ConnectionCallbacks) new C1074c(connectionCallbacks), (GoogleApiClient.OnConnectionFailedListener) new C1078g(onConnectionFailedListener), strArr);
    }

    protected C1071dw(Context context, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener, String... strArr) {
        this.f2578pf = new ArrayList<>();
        this.f2580ph = false;
        this.f2581pi = false;
        this.f2582pj = new Object();
        this.mContext = (Context) C1102eg.m2616f(context);
        this.f2576ne = new C1080dx(context, this, (Handler) null);
        this.mHandler = new C1072a(context.getMainLooper());
        mo7300a(strArr);
        this.f2575jF = strArr;
        registerConnectionCallbacks((GoogleApiClient.ConnectionCallbacks) C1102eg.m2616f(connectionCallbacks));
        registerConnectionFailedListener((GoogleApiClient.OnConnectionFailedListener) C1102eg.m2616f(onConnectionFailedListener));
    }

    /* renamed from: I */
    public void mo7450I(int i) {
        this.mHandler.sendMessage(this.mHandler.obtainMessage(4, Integer.valueOf(i)));
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo6201a(int i, IBinder iBinder, Bundle bundle) {
        this.mHandler.sendMessage(this.mHandler.obtainMessage(1, new C1079h(i, iBinder, bundle)));
    }

    /* renamed from: a */
    public final void mo7451a(C1071dw<T>.b<?> bVar) {
        synchronized (this.f2578pf) {
            this.f2578pf.add(bVar);
        }
        this.mHandler.sendMessage(this.mHandler.obtainMessage(2, bVar));
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public abstract void mo6202a(C1092ec ecVar, C1076e eVar) throws RemoteException;

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo7300a(String... strArr) {
    }

    /* renamed from: aU */
    public Bundle mo5883aU() {
        return null;
    }

    /* access modifiers changed from: protected */
    /* renamed from: am */
    public abstract String mo6203am();

    /* access modifiers changed from: protected */
    /* renamed from: an */
    public abstract String mo6204an();

    /* renamed from: bO */
    public final String[] mo7452bO() {
        return this.f2575jF;
    }

    /* access modifiers changed from: protected */
    /* renamed from: bP */
    public final void mo7453bP() {
        if (!isConnected()) {
            throw new IllegalStateException("Not connected. Call connect() and wait for onConnected() to be called.");
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: bQ */
    public final T mo7454bQ() {
        mo7453bP();
        return this.f2577pe;
    }

    /* renamed from: bp */
    public boolean mo5884bp() {
        return this.f2580ph;
    }

    public void connect() {
        this.f2580ph = true;
        synchronized (this.f2582pj) {
            this.f2581pi = true;
        }
        int isGooglePlayServicesAvailable = GooglePlayServicesUtil.isGooglePlayServicesAvailable(this.mContext);
        if (isGooglePlayServicesAvailable != 0) {
            this.mHandler.sendMessage(this.mHandler.obtainMessage(3, Integer.valueOf(isGooglePlayServicesAvailable)));
            return;
        }
        if (this.f2579pg != null) {
            Log.e("GmsClient", "Calling connect() while still connected, missing disconnect().");
            this.f2577pe = null;
            C1083dy.m2519s(this.mContext).mo7481b(mo6203am(), this.f2579pg);
        }
        this.f2579pg = new C1077f();
        if (!C1083dy.m2519s(this.mContext).mo7480a(mo6203am(), this.f2579pg)) {
            Log.e("GmsClient", "unable to connect to service: " + mo6203am());
            this.mHandler.sendMessage(this.mHandler.obtainMessage(3, 9));
        }
    }

    public void disconnect() {
        this.f2580ph = false;
        synchronized (this.f2582pj) {
            this.f2581pi = false;
        }
        synchronized (this.f2578pf) {
            int size = this.f2578pf.size();
            for (int i = 0; i < size; i++) {
                this.f2578pf.get(i).mo7461bS();
            }
            this.f2578pf.clear();
        }
        this.f2577pe = null;
        if (this.f2579pg != null) {
            C1083dy.m2519s(this.mContext).mo7481b(mo6203am(), this.f2579pg);
            this.f2579pg = null;
            this.f2576ne.mo7469J(-1);
        }
    }

    public final Context getContext() {
        return this.mContext;
    }

    public boolean isConnected() {
        return this.f2577pe != null;
    }

    public boolean isConnecting() {
        boolean z;
        synchronized (this.f2582pj) {
            z = this.f2581pi;
        }
        return z;
    }

    public boolean isConnectionCallbacksRegistered(GooglePlayServicesClient.ConnectionCallbacks listener) {
        return this.f2576ne.isConnectionCallbacksRegistered(new C1074c(listener));
    }

    public boolean isConnectionFailedListenerRegistered(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        return this.f2576ne.isConnectionFailedListenerRegistered(listener);
    }

    /* access modifiers changed from: protected */
    /* renamed from: p */
    public abstract T mo6207p(IBinder iBinder);

    public void registerConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.f2576ne.registerConnectionCallbacks(new C1074c(listener));
    }

    public void registerConnectionCallbacks(GoogleApiClient.ConnectionCallbacks listener) {
        this.f2576ne.registerConnectionCallbacks(listener);
    }

    public void registerConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.f2576ne.registerConnectionFailedListener(listener);
    }

    public void registerConnectionFailedListener(GoogleApiClient.OnConnectionFailedListener listener) {
        this.f2576ne.registerConnectionFailedListener(listener);
    }

    public void unregisterConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.f2576ne.unregisterConnectionCallbacks(new C1074c(listener));
    }

    public void unregisterConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.f2576ne.unregisterConnectionFailedListener(listener);
    }

    /* access modifiers changed from: protected */
    /* renamed from: w */
    public final void mo7458w(IBinder iBinder) {
        try {
            mo6202a(C1092ec.C1093a.m2579y(iBinder), new C1076e(this));
        } catch (RemoteException e) {
            Log.w("GmsClient", "service died");
        }
    }
}
