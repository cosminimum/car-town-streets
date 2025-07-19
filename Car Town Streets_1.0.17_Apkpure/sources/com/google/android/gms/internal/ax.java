package com.google.android.gms.internal;

import android.content.Context;
import android.os.RemoteException;
import android.os.SystemClock;
import com.google.android.gms.internal.ay;
/* loaded from: classes.dex */
public final class ax implements ay.a {
    private final bb ed;
    private final v eq;
    private final String fR;
    private final long fS;
    private final at fT;
    private final x fU;
    private final cu fV;
    private bc fW;
    private final Context mContext;
    private final Object fx = new Object();
    private int fX = -2;

    public ax(Context context, String str, bb bbVar, au auVar, at atVar, v vVar, x xVar, cu cuVar) {
        this.mContext = context;
        this.fR = str;
        this.ed = bbVar;
        this.fS = auVar.fJ != -1 ? auVar.fJ : 10000L;
        this.fT = atVar;
        this.eq = vVar;
        this.fU = xVar;
        this.fV = cuVar;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public bc V() {
        ct.t("Instantiating mediation adapter: " + this.fR);
        try {
            return this.ed.l(this.fR);
        } catch (RemoteException e) {
            ct.a("Could not instantiate mediation adapter: " + this.fR, e);
            return null;
        }
    }

    private void a(long j, long j2, long j3, long j4) {
        while (this.fX == -2) {
            b(j, j2, j3, j4);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void a(aw awVar) {
        try {
            if (this.fV.iL < 4100000) {
                if (this.fU.eG) {
                    this.fW.a(com.google.android.gms.dynamic.c.h(this.mContext), this.eq, this.fT.fH, awVar);
                } else {
                    this.fW.a(com.google.android.gms.dynamic.c.h(this.mContext), this.fU, this.eq, this.fT.fH, awVar);
                }
            } else if (this.fU.eG) {
                this.fW.a(com.google.android.gms.dynamic.c.h(this.mContext), this.eq, this.fT.fH, this.fT.adJson, awVar);
            } else {
                this.fW.a(com.google.android.gms.dynamic.c.h(this.mContext), this.fU, this.eq, this.fT.fH, this.fT.adJson, awVar);
            }
        } catch (RemoteException e) {
            ct.b("Could not request ad from mediation adapter.", e);
            f(5);
        }
    }

    private void b(long j, long j2, long j3, long j4) {
        long elapsedRealtime = SystemClock.elapsedRealtime();
        long j5 = j2 - (elapsedRealtime - j);
        long j6 = j4 - (elapsedRealtime - j3);
        if (j5 <= 0 || j6 <= 0) {
            ct.t("Timed out waiting for adapter.");
            this.fX = 3;
            return;
        }
        try {
            this.fx.wait(Math.min(j5, j6));
        } catch (InterruptedException e) {
            this.fX = -1;
        }
    }

    public ay b(long j, long j2) {
        ay ayVar;
        synchronized (this.fx) {
            long elapsedRealtime = SystemClock.elapsedRealtime();
            final aw awVar = new aw();
            cs.iI.post(new Runnable() { // from class: com.google.android.gms.internal.ax.1
                @Override // java.lang.Runnable
                public void run() {
                    synchronized (ax.this.fx) {
                        if (ax.this.fX != -2) {
                            return;
                        }
                        ax.this.fW = ax.this.V();
                        if (ax.this.fW == null) {
                            ax.this.f(4);
                            return;
                        }
                        awVar.a(ax.this);
                        ax.this.a(awVar);
                    }
                }
            });
            a(elapsedRealtime, this.fS, j, j2);
            ayVar = new ay(this.fT, this.fW, this.fR, awVar, this.fX);
        }
        return ayVar;
    }

    public void cancel() {
        synchronized (this.fx) {
            try {
                if (this.fW != null) {
                    this.fW.destroy();
                }
            } catch (RemoteException e) {
                ct.b("Could not destroy mediation adapter.", e);
            }
            this.fX = -1;
            this.fx.notify();
        }
    }

    @Override // com.google.android.gms.internal.ay.a
    public void f(int i) {
        synchronized (this.fx) {
            this.fX = i;
            this.fx.notify();
        }
    }
}
