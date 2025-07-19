package com.google.android.gms.internal;

import android.content.Context;
import android.os.RemoteException;
/* loaded from: classes.dex */
public final class as {
    private final bb ed;
    private ax fA;
    private final bz fw;
    private final au fy;
    private final Context mContext;
    private final Object fx = new Object();
    private boolean fz = false;

    public as(Context context, bz bzVar, bb bbVar, au auVar) {
        this.mContext = context;
        this.fw = bzVar;
        this.ed = bbVar;
        this.fy = auVar;
    }

    public ay a(long j, long j2) {
        ct.r("Starting mediation.");
        for (at atVar : this.fy.fI) {
            ct.t("Trying mediation network: " + atVar.fD);
            for (String str : atVar.fE) {
                synchronized (this.fx) {
                    if (this.fz) {
                        return new ay(-1);
                    }
                    this.fA = new ax(this.mContext, str, this.ed, this.fy, atVar, this.fw.hr, this.fw.em, this.fw.ej);
                    final ay b = this.fA.b(j, j2);
                    if (b.ga == 0) {
                        ct.r("Adapter succeeded.");
                        return b;
                    } else if (b.gc != null) {
                        cs.iI.post(new Runnable() { // from class: com.google.android.gms.internal.as.1
                            @Override // java.lang.Runnable
                            public void run() {
                                try {
                                    b.gc.destroy();
                                } catch (RemoteException e) {
                                    ct.b("Could not destroy mediation adapter.", e);
                                }
                            }
                        });
                    }
                }
            }
        }
        return new ay(1);
    }

    public void cancel() {
        synchronized (this.fx) {
            this.fz = true;
            if (this.fA != null) {
                this.fA.cancel();
            }
        }
    }
}
