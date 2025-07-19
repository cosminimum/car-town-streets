package com.google.android.gms.internal;

import android.content.Context;
import android.os.Bundle;
import android.os.RemoteException;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.internal.C0966bw;

/* renamed from: com.google.android.gms.internal.bx */
public abstract class C0968bx extends C0992cm {

    /* renamed from: fw */
    private final C0972bz f2299fw;

    /* renamed from: hn */
    private final C0966bw.C0967a f2300hn;

    /* renamed from: com.google.android.gms.internal.bx$a */
    public static final class C0969a extends C0968bx {
        private final Context mContext;

        public C0969a(Context context, C0972bz bzVar, C0966bw.C0967a aVar) {
            super(bzVar, aVar);
            this.mContext = context;
        }

        /* renamed from: ak */
        public void mo7194ak() {
        }

        /* renamed from: al */
        public C0978cd mo7195al() {
            return C0981ce.m2127a(this.mContext, new C0884ar());
        }
    }

    /* renamed from: com.google.android.gms.internal.bx$b */
    public static final class C0970b extends C0968bx implements GooglePlayServicesClient.ConnectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener {

        /* renamed from: fx */
        private final Object f2301fx = new Object();

        /* renamed from: hn */
        private final C0966bw.C0967a f2302hn;

        /* renamed from: ho */
        private final C0971by f2303ho;

        public C0970b(Context context, C0972bz bzVar, C0966bw.C0967a aVar) {
            super(bzVar, aVar);
            this.f2302hn = aVar;
            this.f2303ho = new C0971by(context, this, this, bzVar.f2305ej.f2415iL);
            this.f2303ho.connect();
        }

        /* renamed from: ak */
        public void mo7194ak() {
            synchronized (this.f2301fx) {
                if (this.f2303ho.isConnected() || this.f2303ho.isConnecting()) {
                    this.f2303ho.disconnect();
                }
            }
        }

        /* renamed from: al */
        public C0978cd mo7195al() {
            C0978cd cdVar;
            synchronized (this.f2301fx) {
                try {
                    cdVar = this.f2303ho.mo7196ao();
                } catch (IllegalStateException e) {
                    cdVar = null;
                }
            }
            return cdVar;
        }

        public void onConnected(Bundle connectionHint) {
            start();
        }

        public void onConnectionFailed(ConnectionResult result) {
            this.f2302hn.mo7187a(new C0976cb(0));
        }

        public void onDisconnected() {
            C1004ct.m2214r("Disconnected from remote ad request service.");
        }
    }

    public C0968bx(C0972bz bzVar, C0966bw.C0967a aVar) {
        this.f2299fw = bzVar;
        this.f2300hn = aVar;
    }

    /* renamed from: a */
    private static C0976cb m2102a(C0978cd cdVar, C0972bz bzVar) {
        try {
            return cdVar.mo7210b(bzVar);
        } catch (RemoteException e) {
            C1004ct.m2212b("Could not fetch ad response from ad request service.", e);
            return null;
        }
    }

    /* JADX INFO: finally extract failed */
    /* renamed from: ai */
    public final void mo7188ai() {
        C0976cb a;
        try {
            C0978cd al = mo7195al();
            if (al == null) {
                a = new C0976cb(0);
            } else {
                a = m2102a(al, this.f2299fw);
                if (a == null) {
                    a = new C0976cb(0);
                }
            }
            mo7194ak();
            this.f2300hn.mo7187a(a);
        } catch (Throwable th) {
            mo7194ak();
            throw th;
        }
    }

    /* renamed from: ak */
    public abstract void mo7194ak();

    /* renamed from: al */
    public abstract C0978cd mo7195al();

    public final void onStop() {
        mo7194ak();
    }
}
