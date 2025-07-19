package com.google.android.gms.internal;

import android.content.Context;
import android.os.RemoteException;
import android.os.SystemClock;
import com.google.android.gms.dynamic.C0775c;
import com.google.android.gms.internal.C0893ay;

/* renamed from: com.google.android.gms.internal.ax */
public final class C0891ax implements C0893ay.C0894a {

    /* renamed from: ed */
    private final C0912bb f1987ed;

    /* renamed from: eq */
    private final C1464v f1988eq;

    /* renamed from: fR */
    private final String f1989fR;

    /* renamed from: fS */
    private final long f1990fS;

    /* renamed from: fT */
    private final C0887at f1991fT;

    /* renamed from: fU */
    private final C1466x f1992fU;

    /* renamed from: fV */
    private final C1005cu f1993fV;
    /* access modifiers changed from: private */

    /* renamed from: fW */
    public C0915bc f1994fW;
    /* access modifiers changed from: private */

    /* renamed from: fX */
    public int f1995fX = -2;
    /* access modifiers changed from: private */

    /* renamed from: fx */
    public final Object f1996fx = new Object();
    private final Context mContext;

    public C0891ax(Context context, String str, C0912bb bbVar, C0888au auVar, C0887at atVar, C1464v vVar, C1466x xVar, C1005cu cuVar) {
        this.mContext = context;
        this.f1989fR = str;
        this.f1987ed = bbVar;
        this.f1990fS = auVar.f1978fJ != -1 ? auVar.f1978fJ : 10000;
        this.f1991fT = atVar;
        this.f1988eq = vVar;
        this.f1992fU = xVar;
        this.f1993fV = cuVar;
    }

    /* access modifiers changed from: private */
    /* renamed from: V */
    public C0915bc m1972V() {
        C1004ct.m2216t("Instantiating mediation adapter: " + this.f1989fR);
        try {
            return this.f1987ed.mo7095l(this.f1989fR);
        } catch (RemoteException e) {
            C1004ct.m2211a("Could not instantiate mediation adapter: " + this.f1989fR, e);
            return null;
        }
    }

    /* renamed from: a */
    private void m1975a(long j, long j2, long j3, long j4) {
        while (this.f1995fX == -2) {
            m1979b(j, j2, j3, j4);
        }
    }

    /* access modifiers changed from: private */
    /* renamed from: a */
    public void m1976a(C0890aw awVar) {
        try {
            if (this.f1993fV.f2415iL < 4100000) {
                if (this.f1992fU.f3486eG) {
                    this.f1994fW.mo7099a(C0775c.m1696h(this.mContext), this.f1988eq, this.f1991fT.f1976fH, awVar);
                } else {
                    this.f1994fW.mo7101a(C0775c.m1696h(this.mContext), this.f1992fU, this.f1988eq, this.f1991fT.f1976fH, (C0918bd) awVar);
                }
            } else if (this.f1992fU.f3486eG) {
                this.f1994fW.mo7100a(C0775c.m1696h(this.mContext), this.f1988eq, this.f1991fT.f1976fH, this.f1991fT.adJson, (C0918bd) awVar);
            } else {
                this.f1994fW.mo7102a(C0775c.m1696h(this.mContext), this.f1992fU, this.f1988eq, this.f1991fT.f1976fH, this.f1991fT.adJson, awVar);
            }
        } catch (RemoteException e) {
            C1004ct.m2212b("Could not request ad from mediation adapter.", e);
            mo7090f(5);
        }
    }

    /* renamed from: b */
    private void m1979b(long j, long j2, long j3, long j4) {
        long elapsedRealtime = SystemClock.elapsedRealtime();
        long j5 = j2 - (elapsedRealtime - j);
        long j6 = j4 - (elapsedRealtime - j3);
        if (j5 <= 0 || j6 <= 0) {
            C1004ct.m2216t("Timed out waiting for adapter.");
            this.f1995fX = 3;
            return;
        }
        try {
            this.f1996fx.wait(Math.min(j5, j6));
        } catch (InterruptedException e) {
            this.f1995fX = -1;
        }
    }

    /* renamed from: b */
    public C0893ay mo7088b(long j, long j2) {
        C0893ay ayVar;
        synchronized (this.f1996fx) {
            long elapsedRealtime = SystemClock.elapsedRealtime();
            final C0890aw awVar = new C0890aw();
            C1003cs.f2412iI.post(new Runnable() {
                public void run() {
                    synchronized (C0891ax.this.f1996fx) {
                        if (C0891ax.this.f1995fX == -2) {
                            C0915bc unused = C0891ax.this.f1994fW = C0891ax.this.m1972V();
                            if (C0891ax.this.f1994fW == null) {
                                C0891ax.this.mo7090f(4);
                                return;
                            }
                            awVar.mo7081a((C0893ay.C0894a) C0891ax.this);
                            C0891ax.this.m1976a(awVar);
                        }
                    }
                }
            });
            m1975a(elapsedRealtime, this.f1990fS, j, j2);
            ayVar = new C0893ay(this.f1991fT, this.f1994fW, this.f1989fR, awVar, this.f1995fX);
        }
        return ayVar;
    }

    public void cancel() {
        synchronized (this.f1996fx) {
            try {
                if (this.f1994fW != null) {
                    this.f1994fW.destroy();
                }
            } catch (RemoteException e) {
                C1004ct.m2212b("Could not destroy mediation adapter.", e);
            }
            this.f1995fX = -1;
            this.f1996fx.notify();
        }
    }

    /* renamed from: f */
    public void mo7090f(int i) {
        synchronized (this.f1996fx) {
            this.f1995fX = i;
            this.f1996fx.notify();
        }
    }
}
