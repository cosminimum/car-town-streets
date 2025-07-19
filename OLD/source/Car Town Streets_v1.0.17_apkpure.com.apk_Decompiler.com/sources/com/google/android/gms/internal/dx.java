package com.google.android.gms.internal;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.common.api.GoogleApiClient;
import java.util.ArrayList;

public final class dx {
    private final Handler mHandler;
    /* access modifiers changed from: private */
    public final b ps;
    /* access modifiers changed from: private */
    public ArrayList<GoogleApiClient.ConnectionCallbacks> pt;
    final ArrayList<GoogleApiClient.ConnectionCallbacks> pu;
    private boolean pv;
    private ArrayList<GooglePlayServicesClient.OnConnectionFailedListener> pw;
    private boolean px;

    final class a extends Handler {
        public a(Looper looper) {
            super(looper);
        }

        public void handleMessage(Message msg) {
            if (msg.what == 1) {
                synchronized (dx.this.pt) {
                    if (dx.this.ps.bp() && dx.this.ps.isConnected() && dx.this.pt.contains(msg.obj)) {
                        ((GoogleApiClient.ConnectionCallbacks) msg.obj).onConnected(dx.this.ps.aU());
                    }
                }
                return;
            }
            Log.wtf("GmsClientEvents", "Don't know how to handle this message.");
        }
    }

    public interface b {
        Bundle aU();

        boolean bp();

        boolean isConnected();
    }

    public dx(Context context, b bVar) {
        this(context, bVar, (Handler) null);
    }

    dx(Context context, b bVar, Handler handler) {
        this.pu = new ArrayList<>();
        this.pv = false;
        this.px = false;
        handler = handler == null ? new a(Looper.getMainLooper()) : handler;
        this.pt = new ArrayList<>();
        this.pw = new ArrayList<>();
        this.ps = bVar;
        this.mHandler = handler;
    }

    public void J(int i) {
        this.mHandler.removeMessages(1);
        synchronized (this.pt) {
            this.pv = true;
            ArrayList<GoogleApiClient.ConnectionCallbacks> arrayList = this.pt;
            int size = arrayList.size();
            for (int i2 = 0; i2 < size && this.ps.bp(); i2++) {
                if (this.pt.contains(arrayList.get(i2))) {
                    arrayList.get(i2).onConnectionSuspended(i);
                }
            }
            this.pv = false;
        }
    }

    public void a(ConnectionResult connectionResult) {
        this.mHandler.removeMessages(1);
        synchronized (this.pw) {
            this.px = true;
            ArrayList<GooglePlayServicesClient.OnConnectionFailedListener> arrayList = this.pw;
            int size = arrayList.size();
            int i = 0;
            while (i < size) {
                if (this.ps.bp()) {
                    if (this.pw.contains(arrayList.get(i))) {
                        arrayList.get(i).onConnectionFailed(connectionResult);
                    }
                    i++;
                } else {
                    return;
                }
            }
            this.px = false;
        }
    }

    public void b(Bundle bundle) {
        boolean z = true;
        synchronized (this.pt) {
            eg.p(!this.pv);
            this.mHandler.removeMessages(1);
            this.pv = true;
            if (this.pu.size() != 0) {
                z = false;
            }
            eg.p(z);
            ArrayList<GoogleApiClient.ConnectionCallbacks> arrayList = this.pt;
            int size = arrayList.size();
            for (int i = 0; i < size && this.ps.bp() && this.ps.isConnected(); i++) {
                this.pu.size();
                if (!this.pu.contains(arrayList.get(i))) {
                    arrayList.get(i).onConnected(bundle);
                }
            }
            this.pu.clear();
            this.pv = false;
        }
    }

    /* access modifiers changed from: protected */
    public void bT() {
        synchronized (this.pt) {
            b(this.ps.aU());
        }
    }

    public boolean isConnectionCallbacksRegistered(GoogleApiClient.ConnectionCallbacks listener) {
        boolean contains;
        eg.f(listener);
        synchronized (this.pt) {
            contains = this.pt.contains(listener);
        }
        return contains;
    }

    public boolean isConnectionFailedListenerRegistered(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        boolean contains;
        eg.f(listener);
        synchronized (this.pw) {
            contains = this.pw.contains(listener);
        }
        return contains;
    }

    public void registerConnectionCallbacks(GoogleApiClient.ConnectionCallbacks listener) {
        eg.f(listener);
        synchronized (this.pt) {
            if (this.pt.contains(listener)) {
                Log.w("GmsClientEvents", "registerConnectionCallbacks(): listener " + listener + " is already registered");
            } else {
                if (this.pv) {
                    this.pt = new ArrayList<>(this.pt);
                }
                this.pt.add(listener);
            }
        }
        if (this.ps.isConnected()) {
            this.mHandler.sendMessage(this.mHandler.obtainMessage(1, listener));
        }
    }

    public void registerConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        eg.f(listener);
        synchronized (this.pw) {
            if (this.pw.contains(listener)) {
                Log.w("GmsClientEvents", "registerConnectionFailedListener(): listener " + listener + " is already registered");
            } else {
                if (this.px) {
                    this.pw = new ArrayList<>(this.pw);
                }
                this.pw.add(listener);
            }
        }
    }

    public void unregisterConnectionCallbacks(GoogleApiClient.ConnectionCallbacks listener) {
        eg.f(listener);
        synchronized (this.pt) {
            if (this.pt != null) {
                if (this.pv) {
                    this.pt = new ArrayList<>(this.pt);
                }
                if (!this.pt.remove(listener)) {
                    Log.w("GmsClientEvents", "unregisterConnectionCallbacks(): listener " + listener + " not found");
                } else if (this.pv && !this.pu.contains(listener)) {
                    this.pu.add(listener);
                }
            }
        }
    }

    public void unregisterConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        eg.f(listener);
        synchronized (this.pw) {
            if (this.pw != null) {
                if (this.px) {
                    this.pw = new ArrayList<>(this.pw);
                }
                if (!this.pw.remove(listener)) {
                    Log.w("GmsClientEvents", "unregisterConnectionFailedListener(): listener " + listener + " not found");
                }
            }
        }
    }
}
