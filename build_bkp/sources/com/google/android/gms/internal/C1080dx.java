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

/* renamed from: com.google.android.gms.internal.dx */
public final class C1080dx {
    private final Handler mHandler;
    /* access modifiers changed from: private */

    /* renamed from: ps */
    public final C1082b f2595ps;
    /* access modifiers changed from: private */

    /* renamed from: pt */
    public ArrayList<GoogleApiClient.ConnectionCallbacks> f2596pt;

    /* renamed from: pu */
    final ArrayList<GoogleApiClient.ConnectionCallbacks> f2597pu;

    /* renamed from: pv */
    private boolean f2598pv;

    /* renamed from: pw */
    private ArrayList<GooglePlayServicesClient.OnConnectionFailedListener> f2599pw;

    /* renamed from: px */
    private boolean f2600px;

    /* renamed from: com.google.android.gms.internal.dx$a */
    final class C1081a extends Handler {
        public C1081a(Looper looper) {
            super(looper);
        }

        public void handleMessage(Message msg) {
            if (msg.what == 1) {
                synchronized (C1080dx.this.f2596pt) {
                    if (C1080dx.this.f2595ps.mo5884bp() && C1080dx.this.f2595ps.isConnected() && C1080dx.this.f2596pt.contains(msg.obj)) {
                        ((GoogleApiClient.ConnectionCallbacks) msg.obj).onConnected(C1080dx.this.f2595ps.mo5883aU());
                    }
                }
                return;
            }
            Log.wtf("GmsClientEvents", "Don't know how to handle this message.");
        }
    }

    /* renamed from: com.google.android.gms.internal.dx$b */
    public interface C1082b {
        /* renamed from: aU */
        Bundle mo5883aU();

        /* renamed from: bp */
        boolean mo5884bp();

        boolean isConnected();
    }

    public C1080dx(Context context, C1082b bVar) {
        this(context, bVar, (Handler) null);
    }

    C1080dx(Context context, C1082b bVar, Handler handler) {
        this.f2597pu = new ArrayList<>();
        this.f2598pv = false;
        this.f2600px = false;
        handler = handler == null ? new C1081a(Looper.getMainLooper()) : handler;
        this.f2596pt = new ArrayList<>();
        this.f2599pw = new ArrayList<>();
        this.f2595ps = bVar;
        this.mHandler = handler;
    }

    /* renamed from: J */
    public void mo7469J(int i) {
        this.mHandler.removeMessages(1);
        synchronized (this.f2596pt) {
            this.f2598pv = true;
            ArrayList<GoogleApiClient.ConnectionCallbacks> arrayList = this.f2596pt;
            int size = arrayList.size();
            for (int i2 = 0; i2 < size && this.f2595ps.mo5884bp(); i2++) {
                if (this.f2596pt.contains(arrayList.get(i2))) {
                    arrayList.get(i2).onConnectionSuspended(i);
                }
            }
            this.f2598pv = false;
        }
    }

    /* renamed from: a */
    public void mo7470a(ConnectionResult connectionResult) {
        this.mHandler.removeMessages(1);
        synchronized (this.f2599pw) {
            this.f2600px = true;
            ArrayList<GooglePlayServicesClient.OnConnectionFailedListener> arrayList = this.f2599pw;
            int size = arrayList.size();
            int i = 0;
            while (i < size) {
                if (this.f2595ps.mo5884bp()) {
                    if (this.f2599pw.contains(arrayList.get(i))) {
                        arrayList.get(i).onConnectionFailed(connectionResult);
                    }
                    i++;
                } else {
                    return;
                }
            }
            this.f2600px = false;
        }
    }

    /* renamed from: b */
    public void mo7471b(Bundle bundle) {
        boolean z = true;
        synchronized (this.f2596pt) {
            C1102eg.m2617p(!this.f2598pv);
            this.mHandler.removeMessages(1);
            this.f2598pv = true;
            if (this.f2597pu.size() != 0) {
                z = false;
            }
            C1102eg.m2617p(z);
            ArrayList<GoogleApiClient.ConnectionCallbacks> arrayList = this.f2596pt;
            int size = arrayList.size();
            for (int i = 0; i < size && this.f2595ps.mo5884bp() && this.f2595ps.isConnected(); i++) {
                this.f2597pu.size();
                if (!this.f2597pu.contains(arrayList.get(i))) {
                    arrayList.get(i).onConnected(bundle);
                }
            }
            this.f2597pu.clear();
            this.f2598pv = false;
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: bT */
    public void mo7472bT() {
        synchronized (this.f2596pt) {
            mo7471b(this.f2595ps.mo5883aU());
        }
    }

    public boolean isConnectionCallbacksRegistered(GoogleApiClient.ConnectionCallbacks listener) {
        boolean contains;
        C1102eg.m2616f(listener);
        synchronized (this.f2596pt) {
            contains = this.f2596pt.contains(listener);
        }
        return contains;
    }

    public boolean isConnectionFailedListenerRegistered(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        boolean contains;
        C1102eg.m2616f(listener);
        synchronized (this.f2599pw) {
            contains = this.f2599pw.contains(listener);
        }
        return contains;
    }

    public void registerConnectionCallbacks(GoogleApiClient.ConnectionCallbacks listener) {
        C1102eg.m2616f(listener);
        synchronized (this.f2596pt) {
            if (this.f2596pt.contains(listener)) {
                Log.w("GmsClientEvents", "registerConnectionCallbacks(): listener " + listener + " is already registered");
            } else {
                if (this.f2598pv) {
                    this.f2596pt = new ArrayList<>(this.f2596pt);
                }
                this.f2596pt.add(listener);
            }
        }
        if (this.f2595ps.isConnected()) {
            this.mHandler.sendMessage(this.mHandler.obtainMessage(1, listener));
        }
    }

    public void registerConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        C1102eg.m2616f(listener);
        synchronized (this.f2599pw) {
            if (this.f2599pw.contains(listener)) {
                Log.w("GmsClientEvents", "registerConnectionFailedListener(): listener " + listener + " is already registered");
            } else {
                if (this.f2600px) {
                    this.f2599pw = new ArrayList<>(this.f2599pw);
                }
                this.f2599pw.add(listener);
            }
        }
    }

    public void unregisterConnectionCallbacks(GoogleApiClient.ConnectionCallbacks listener) {
        C1102eg.m2616f(listener);
        synchronized (this.f2596pt) {
            if (this.f2596pt != null) {
                if (this.f2598pv) {
                    this.f2596pt = new ArrayList<>(this.f2596pt);
                }
                if (!this.f2596pt.remove(listener)) {
                    Log.w("GmsClientEvents", "unregisterConnectionCallbacks(): listener " + listener + " not found");
                } else if (this.f2598pv && !this.f2597pu.contains(listener)) {
                    this.f2597pu.add(listener);
                }
            }
        }
    }

    public void unregisterConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        C1102eg.m2616f(listener);
        synchronized (this.f2599pw) {
            if (this.f2599pw != null) {
                if (this.f2600px) {
                    this.f2599pw = new ArrayList<>(this.f2599pw);
                }
                if (!this.f2599pw.remove(listener)) {
                    Log.w("GmsClientEvents", "unregisterConnectionFailedListener(): listener " + listener + " not found");
                }
            }
        }
    }
}
