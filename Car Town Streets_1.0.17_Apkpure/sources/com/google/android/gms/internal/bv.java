package com.google.android.gms.internal;

import android.content.Context;
import android.os.SystemClock;
import android.text.TextUtils;
import com.getjar.sdk.utilities.Constants;
import com.google.android.gms.internal.bu;
import com.google.android.gms.internal.bw;
import com.google.android.gms.internal.bz;
import com.google.android.gms.internal.cx;
import com.tapjoy.TapjoyConstants;
import org.json.JSONException;
/* loaded from: classes.dex */
public final class bv extends cm implements bw.a, cx.a {
    private final bb ed;
    private au fy;
    private final cw gv;
    private final bu.a hb;
    private final bz.a hd;
    private final h he;
    private cm hf;
    private cb hg;
    private as hi;
    private ay hj;
    private final Context mContext;
    private final Object hc = new Object();
    private final Object fx = new Object();
    private boolean hh = false;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static final class a extends Exception {
        private final int hm;

        public a(String str, int i) {
            super(str);
            this.hm = i;
        }

        public int getErrorCode() {
            return this.hm;
        }
    }

    public bv(Context context, bz.a aVar, h hVar, cw cwVar, bb bbVar, bu.a aVar2) {
        this.ed = bbVar;
        this.hb = aVar2;
        this.gv = cwVar;
        this.mContext = context;
        this.hd = aVar;
        this.he = hVar;
    }

    private x a(bz bzVar) throws a {
        x[] xVarArr;
        if (this.hg.hB == null) {
            throw new a("The ad response must specify one of the supported ad sizes.", 0);
        }
        String[] split = this.hg.hB.split(Constants.X);
        if (split.length != 2) {
            throw new a("Could not parse the ad size from the ad response: " + this.hg.hB, 0);
        }
        try {
            int parseInt = Integer.parseInt(split[0]);
            int parseInt2 = Integer.parseInt(split[1]);
            for (x xVar : bzVar.em.eH) {
                float f = this.mContext.getResources().getDisplayMetrics().density;
                int i = xVar.width == -1 ? (int) (xVar.widthPixels / f) : xVar.width;
                int i2 = xVar.height == -2 ? (int) (xVar.heightPixels / f) : xVar.height;
                if (parseInt == i && parseInt2 == i2) {
                    return new x(xVar, bzVar.em.eH);
                }
            }
            throw new a("The ad size from the ad response was not one of the requested sizes: " + this.hg.hB, 0);
        } catch (NumberFormatException e) {
            throw new a("Could not parse the ad size from the ad response: " + this.hg.hB, 0);
        }
    }

    private void a(bz bzVar, long j) throws a {
        synchronized (this.hc) {
            this.hi = new as(this.mContext, bzVar, this.ed, this.fy);
        }
        this.hj = this.hi.a(j, TapjoyConstants.THROTTLE_GET_TAP_POINTS_INTERVAL);
        switch (this.hj.ga) {
            case 0:
                return;
            case 1:
                throw new a("No fill from any mediation ad networks.", 3);
            default:
                throw new a("Unexpected mediation result: " + this.hj.ga, 0);
        }
    }

    private void aj() throws a {
        if (this.hg.errorCode == -3) {
            return;
        }
        if (TextUtils.isEmpty(this.hg.hw)) {
            throw new a("No fill from ad server.", 3);
        }
        if (!this.hg.hy) {
            return;
        }
        try {
            this.fy = new au(this.hg.hw);
        } catch (JSONException e) {
            throw new a("Could not parse mediation config: " + this.hg.hw, 0);
        }
    }

    private void b(long j) throws a {
        cs.iI.post(new Runnable() { // from class: com.google.android.gms.internal.bv.3
            @Override // java.lang.Runnable
            public void run() {
                synchronized (bv.this.fx) {
                    if (bv.this.hg.errorCode != -2) {
                        return;
                    }
                    bv.this.gv.aC().a(bv.this);
                    if (bv.this.hg.errorCode == -3) {
                        ct.u("Loading URL in WebView: " + bv.this.hg.gL);
                        bv.this.gv.loadUrl(bv.this.hg.gL);
                    } else {
                        ct.u("Loading HTML in WebView.");
                        bv.this.gv.loadDataWithBaseURL(co.o(bv.this.hg.gL), bv.this.hg.hw, "text/html", "UTF-8", null);
                    }
                }
            }
        });
        d(j);
    }

    private void c(long j) throws a {
        while (e(j)) {
            if (this.hg != null) {
                synchronized (this.hc) {
                    this.hf = null;
                }
                if (this.hg.errorCode != -2 && this.hg.errorCode != -3) {
                    throw new a("There was a problem getting an ad response. ErrorCode: " + this.hg.errorCode, this.hg.errorCode);
                }
                return;
            }
        }
        throw new a("Timed out waiting for ad response.", 2);
    }

    private void d(long j) throws a {
        while (e(j)) {
            if (this.hh) {
                return;
            }
        }
        throw new a("Timed out waiting for WebView to finish loading.", 2);
    }

    private boolean e(long j) throws a {
        long elapsedRealtime = TapjoyConstants.THROTTLE_GET_TAP_POINTS_INTERVAL - (SystemClock.elapsedRealtime() - j);
        if (elapsedRealtime <= 0) {
            return false;
        }
        try {
            this.fx.wait(elapsedRealtime);
            return true;
        } catch (InterruptedException e) {
            throw new a("Ad request cancelled.", -1);
        }
    }

    @Override // com.google.android.gms.internal.bw.a
    public void a(cb cbVar) {
        synchronized (this.fx) {
            ct.r("Received ad response.");
            this.hg = cbVar;
            this.fx.notify();
        }
    }

    @Override // com.google.android.gms.internal.cx.a
    public void a(cw cwVar) {
        synchronized (this.fx) {
            ct.r("WebView finished loading.");
            this.hh = true;
            this.fx.notify();
        }
    }

    @Override // com.google.android.gms.internal.cm
    public void ai() {
        x xVar;
        synchronized (this.fx) {
            ct.r("AdLoaderBackgroundTask started.");
            bz bzVar = new bz(this.hd, this.he.g().a(this.mContext));
            x xVar2 = null;
            int i = -2;
            try {
                long elapsedRealtime = SystemClock.elapsedRealtime();
                cm a2 = bw.a(this.mContext, bzVar, this);
                synchronized (this.hc) {
                    this.hf = a2;
                    if (this.hf == null) {
                        throw new a("Could not start the ad request service.", 0);
                    }
                }
                c(elapsedRealtime);
                aj();
                if (bzVar.em.eH != null) {
                    xVar2 = a(bzVar);
                }
                if (this.hg.hy) {
                    a(bzVar, elapsedRealtime);
                } else {
                    b(elapsedRealtime);
                }
                xVar = xVar2;
            } catch (a e) {
                i = e.getErrorCode();
                if (i == 3 || i == -1) {
                    ct.t(e.getMessage());
                } else {
                    ct.v(e.getMessage());
                }
                this.hg = new cb(i);
                cs.iI.post(new Runnable() { // from class: com.google.android.gms.internal.bv.1
                    @Override // java.lang.Runnable
                    public void run() {
                        bv.this.onStop();
                    }
                });
                xVar = null;
            }
            final cj cjVar = new cj(bzVar.hr, this.gv, this.hg.fK, i, this.hg.fL, this.hg.hA, this.hg.orientation, this.hg.fO, bzVar.hu, this.hg.hy, this.hj != null ? this.hj.gb : null, this.hj != null ? this.hj.gc : null, this.hj != null ? this.hj.gd : null, this.fy, this.hj != null ? this.hj.ge : null, this.hg.hz, xVar, this.hg.hx);
            cs.iI.post(new Runnable() { // from class: com.google.android.gms.internal.bv.2
                @Override // java.lang.Runnable
                public void run() {
                    synchronized (bv.this.fx) {
                        bv.this.hb.a(cjVar);
                    }
                }
            });
        }
    }

    @Override // com.google.android.gms.internal.cm
    public void onStop() {
        synchronized (this.hc) {
            if (this.hf != null) {
                this.hf.cancel();
            }
            this.gv.stopLoading();
            co.a(this.gv);
            if (this.hi != null) {
                this.hi.cancel();
            }
        }
    }
}
