package com.google.android.gms.internal;

import android.content.Context;
import android.os.SystemClock;
import android.text.TextUtils;
import android.webkit.WebView;
import com.getjar.sdk.utilities.Constants;
import com.google.android.gms.internal.C0959bu;
import com.google.android.gms.internal.C0966bw;
import com.google.android.gms.internal.C0972bz;
import com.google.android.gms.internal.C1009cx;
import com.tapjoy.TapjoyConstants;
import org.json.JSONException;

/* renamed from: com.google.android.gms.internal.bv */
public final class C0961bv extends C0992cm implements C0966bw.C0967a, C1009cx.C1011a {

    /* renamed from: ed */
    private final C0912bb f2281ed;
    /* access modifiers changed from: private */

    /* renamed from: fx */
    public final Object f2282fx = new Object();

    /* renamed from: fy */
    private C0888au f2283fy;
    /* access modifiers changed from: private */

    /* renamed from: gv */
    public final C1007cw f2284gv;
    /* access modifiers changed from: private */

    /* renamed from: hb */
    public final C0959bu.C0960a f2285hb;

    /* renamed from: hc */
    private final Object f2286hc = new Object();

    /* renamed from: hd */
    private final C0972bz.C0973a f2287hd;

    /* renamed from: he */
    private final C1332h f2288he;

    /* renamed from: hf */
    private C0992cm f2289hf;
    /* access modifiers changed from: private */

    /* renamed from: hg */
    public C0976cb f2290hg;

    /* renamed from: hh */
    private boolean f2291hh = false;

    /* renamed from: hi */
    private C0885as f2292hi;

    /* renamed from: hj */
    private C0893ay f2293hj;
    private final Context mContext;

    /* renamed from: com.google.android.gms.internal.bv$a */
    private static final class C0965a extends Exception {

        /* renamed from: hm */
        private final int f2298hm;

        public C0965a(String str, int i) {
            super(str);
            this.f2298hm = i;
        }

        public int getErrorCode() {
            return this.f2298hm;
        }
    }

    public C0961bv(Context context, C0972bz.C0973a aVar, C1332h hVar, C1007cw cwVar, C0912bb bbVar, C0959bu.C0960a aVar2) {
        this.f2281ed = bbVar;
        this.f2285hb = aVar2;
        this.f2284gv = cwVar;
        this.mContext = context;
        this.f2287hd = aVar;
        this.f2288he = hVar;
    }

    /* renamed from: a */
    private C1466x m2084a(C0972bz bzVar) throws C0965a {
        if (this.f2290hg.f2325hB == null) {
            throw new C0965a("The ad response must specify one of the supported ad sizes.", 0);
        }
        String[] split = this.f2290hg.f2325hB.split(Constants.f677X);
        if (split.length != 2) {
            throw new C0965a("Could not parse the ad size from the ad response: " + this.f2290hg.f2325hB, 0);
        }
        try {
            int parseInt = Integer.parseInt(split[0]);
            int parseInt2 = Integer.parseInt(split[1]);
            for (C1466x xVar : bzVar.f2306em.f3487eH) {
                float f = this.mContext.getResources().getDisplayMetrics().density;
                int i = xVar.width == -1 ? (int) (((float) xVar.widthPixels) / f) : xVar.width;
                int i2 = xVar.height == -2 ? (int) (((float) xVar.heightPixels) / f) : xVar.height;
                if (parseInt == i && parseInt2 == i2) {
                    return new C1466x(xVar, bzVar.f2306em.f3487eH);
                }
            }
            throw new C0965a("The ad size from the ad response was not one of the requested sizes: " + this.f2290hg.f2325hB, 0);
        } catch (NumberFormatException e) {
            throw new C0965a("Could not parse the ad size from the ad response: " + this.f2290hg.f2325hB, 0);
        }
    }

    /* renamed from: a */
    private void m2086a(C0972bz bzVar, long j) throws C0965a {
        synchronized (this.f2286hc) {
            this.f2292hi = new C0885as(this.mContext, bzVar, this.f2281ed, this.f2283fy);
        }
        this.f2293hj = this.f2292hi.mo7072a(j, TapjoyConstants.THROTTLE_GET_TAP_POINTS_INTERVAL);
        switch (this.f2293hj.f1999ga) {
            case 0:
                return;
            case 1:
                throw new C0965a("No fill from any mediation ad networks.", 3);
            default:
                throw new C0965a("Unexpected mediation result: " + this.f2293hj.f1999ga, 0);
        }
    }

    /* renamed from: aj */
    private void m2087aj() throws C0965a {
        if (this.f2290hg.errorCode != -3) {
            if (TextUtils.isEmpty(this.f2290hg.f2326hw)) {
                throw new C0965a("No fill from ad server.", 3);
            } else if (this.f2290hg.f2328hy) {
                try {
                    this.f2283fy = new C0888au(this.f2290hg.f2326hw);
                } catch (JSONException e) {
                    throw new C0965a("Could not parse mediation config: " + this.f2290hg.f2326hw, 0);
                }
            }
        }
    }

    /* renamed from: b */
    private void m2089b(long j) throws C0965a {
        C1003cs.f2412iI.post(new Runnable() {
            /* JADX WARNING: Code restructure failed: missing block: B:18:?, code lost:
                return;
             */
            /* Code decompiled incorrectly, please refer to instructions dump. */
            public void run() {
                /*
                    r7 = this;
                    com.google.android.gms.internal.bv r0 = com.google.android.gms.internal.C0961bv.this
                    java.lang.Object r6 = r0.f2282fx
                    monitor-enter(r6)
                    com.google.android.gms.internal.bv r0 = com.google.android.gms.internal.C0961bv.this     // Catch:{ all -> 0x005f }
                    com.google.android.gms.internal.cb r0 = r0.f2290hg     // Catch:{ all -> 0x005f }
                    int r0 = r0.errorCode     // Catch:{ all -> 0x005f }
                    r1 = -2
                    if (r0 == r1) goto L_0x0014
                    monitor-exit(r6)     // Catch:{ all -> 0x005f }
                L_0x0013:
                    return
                L_0x0014:
                    com.google.android.gms.internal.bv r0 = com.google.android.gms.internal.C0961bv.this     // Catch:{ all -> 0x005f }
                    com.google.android.gms.internal.cw r0 = r0.f2284gv     // Catch:{ all -> 0x005f }
                    com.google.android.gms.internal.cx r0 = r0.mo7240aC()     // Catch:{ all -> 0x005f }
                    com.google.android.gms.internal.bv r1 = com.google.android.gms.internal.C0961bv.this     // Catch:{ all -> 0x005f }
                    r0.mo7255a((com.google.android.gms.internal.C1009cx.C1011a) r1)     // Catch:{ all -> 0x005f }
                    com.google.android.gms.internal.bv r0 = com.google.android.gms.internal.C0961bv.this     // Catch:{ all -> 0x005f }
                    com.google.android.gms.internal.cb r0 = r0.f2290hg     // Catch:{ all -> 0x005f }
                    int r0 = r0.errorCode     // Catch:{ all -> 0x005f }
                    r1 = -3
                    if (r0 != r1) goto L_0x0062
                    java.lang.StringBuilder r0 = new java.lang.StringBuilder     // Catch:{ all -> 0x005f }
                    r0.<init>()     // Catch:{ all -> 0x005f }
                    java.lang.String r1 = "Loading URL in WebView: "
                    java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ all -> 0x005f }
                    com.google.android.gms.internal.bv r1 = com.google.android.gms.internal.C0961bv.this     // Catch:{ all -> 0x005f }
                    com.google.android.gms.internal.cb r1 = r1.f2290hg     // Catch:{ all -> 0x005f }
                    java.lang.String r1 = r1.f2323gL     // Catch:{ all -> 0x005f }
                    java.lang.StringBuilder r0 = r0.append(r1)     // Catch:{ all -> 0x005f }
                    java.lang.String r0 = r0.toString()     // Catch:{ all -> 0x005f }
                    com.google.android.gms.internal.C1004ct.m2217u(r0)     // Catch:{ all -> 0x005f }
                    com.google.android.gms.internal.bv r0 = com.google.android.gms.internal.C0961bv.this     // Catch:{ all -> 0x005f }
                    com.google.android.gms.internal.cw r0 = r0.f2284gv     // Catch:{ all -> 0x005f }
                    com.google.android.gms.internal.bv r1 = com.google.android.gms.internal.C0961bv.this     // Catch:{ all -> 0x005f }
                    com.google.android.gms.internal.cb r1 = r1.f2290hg     // Catch:{ all -> 0x005f }
                    java.lang.String r1 = r1.f2323gL     // Catch:{ all -> 0x005f }
                    r0.loadUrl(r1)     // Catch:{ all -> 0x005f }
                L_0x005d:
                    monitor-exit(r6)     // Catch:{ all -> 0x005f }
                    goto L_0x0013
                L_0x005f:
                    r0 = move-exception
                    monitor-exit(r6)     // Catch:{ all -> 0x005f }
                    throw r0
                L_0x0062:
                    java.lang.String r0 = "Loading HTML in WebView."
                    com.google.android.gms.internal.C1004ct.m2217u(r0)     // Catch:{ all -> 0x005f }
                    com.google.android.gms.internal.bv r0 = com.google.android.gms.internal.C0961bv.this     // Catch:{ all -> 0x005f }
                    com.google.android.gms.internal.cw r0 = r0.f2284gv     // Catch:{ all -> 0x005f }
                    com.google.android.gms.internal.bv r1 = com.google.android.gms.internal.C0961bv.this     // Catch:{ all -> 0x005f }
                    com.google.android.gms.internal.cb r1 = r1.f2290hg     // Catch:{ all -> 0x005f }
                    java.lang.String r1 = r1.f2323gL     // Catch:{ all -> 0x005f }
                    java.lang.String r1 = com.google.android.gms.internal.C0997co.m2192o(r1)     // Catch:{ all -> 0x005f }
                    com.google.android.gms.internal.bv r2 = com.google.android.gms.internal.C0961bv.this     // Catch:{ all -> 0x005f }
                    com.google.android.gms.internal.cb r2 = r2.f2290hg     // Catch:{ all -> 0x005f }
                    java.lang.String r2 = r2.f2326hw     // Catch:{ all -> 0x005f }
                    java.lang.String r3 = "text/html"
                    java.lang.String r4 = "UTF-8"
                    r5 = 0
                    r0.loadDataWithBaseURL(r1, r2, r3, r4, r5)     // Catch:{ all -> 0x005f }
                    goto L_0x005d
                */
                throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.C0961bv.C09643.run():void");
            }
        });
        m2093d(j);
    }

    /* renamed from: c */
    private void m2091c(long j) throws C0965a {
        while (m2094e(j)) {
            if (this.f2290hg != null) {
                synchronized (this.f2286hc) {
                    this.f2289hf = null;
                }
                if (this.f2290hg.errorCode != -2 && this.f2290hg.errorCode != -3) {
                    throw new C0965a("There was a problem getting an ad response. ErrorCode: " + this.f2290hg.errorCode, this.f2290hg.errorCode);
                }
                return;
            }
        }
        throw new C0965a("Timed out waiting for ad response.", 2);
    }

    /* renamed from: d */
    private void m2093d(long j) throws C0965a {
        while (m2094e(j)) {
            if (this.f2291hh) {
                return;
            }
        }
        throw new C0965a("Timed out waiting for WebView to finish loading.", 2);
    }

    /* renamed from: e */
    private boolean m2094e(long j) throws C0965a {
        long elapsedRealtime = TapjoyConstants.THROTTLE_GET_TAP_POINTS_INTERVAL - (SystemClock.elapsedRealtime() - j);
        if (elapsedRealtime <= 0) {
            return false;
        }
        try {
            this.f2282fx.wait(elapsedRealtime);
            return true;
        } catch (InterruptedException e) {
            throw new C0965a("Ad request cancelled.", -1);
        }
    }

    /* renamed from: a */
    public void mo7187a(C0976cb cbVar) {
        synchronized (this.f2282fx) {
            C1004ct.m2214r("Received ad response.");
            this.f2290hg = cbVar;
            this.f2282fx.notify();
        }
    }

    /* renamed from: a */
    public void mo7147a(C1007cw cwVar) {
        synchronized (this.f2282fx) {
            C1004ct.m2214r("WebView finished loading.");
            this.f2291hh = true;
            this.f2282fx.notify();
        }
    }

    /*  JADX ERROR: IndexOutOfBoundsException in pass: RegionMakerVisitor
        java.lang.IndexOutOfBoundsException: Index 0 out of bounds for length 0
        	at java.base/jdk.internal.util.Preconditions.outOfBounds(Preconditions.java:64)
        	at java.base/jdk.internal.util.Preconditions.outOfBoundsCheckIndex(Preconditions.java:70)
        	at java.base/jdk.internal.util.Preconditions.checkIndex(Preconditions.java:248)
        	at java.base/java.util.Objects.checkIndex(Objects.java:372)
        	at java.base/java.util.ArrayList.get(ArrayList.java:458)
        	at jadx.core.dex.nodes.InsnNode.getArg(InsnNode.java:101)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:611)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.processMonitorEnter(RegionMaker.java:561)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverse(RegionMaker.java:133)
        	at jadx.core.dex.visitors.regions.RegionMaker.makeRegion(RegionMaker.java:86)
        	at jadx.core.dex.visitors.regions.RegionMaker.processMonitorEnter(RegionMaker.java:598)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverse(RegionMaker.java:133)
        	at jadx.core.dex.visitors.regions.RegionMaker.makeRegion(RegionMaker.java:86)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:49)
        */
    /* renamed from: ai */
    public void mo7188ai() {
        /*
            r25 = this;
            r0 = r25
            java.lang.Object r0 = r0.f2282fx
            r24 = r0
            monitor-enter(r24)
            java.lang.String r2 = "AdLoaderBackgroundTask started."
            com.google.android.gms.internal.C1004ct.m2214r(r2)     // Catch:{ all -> 0x0142 }
            r0 = r25
            com.google.android.gms.internal.h r2 = r0.f2288he     // Catch:{ all -> 0x0142 }
            com.google.android.gms.internal.d r2 = r2.mo8163g()     // Catch:{ all -> 0x0142 }
            r0 = r25
            android.content.Context r3 = r0.mContext     // Catch:{ all -> 0x0142 }
            java.lang.String r2 = r2.mo7286a((android.content.Context) r3)     // Catch:{ all -> 0x0142 }
            com.google.android.gms.internal.bz r12 = new com.google.android.gms.internal.bz     // Catch:{ all -> 0x0142 }
            r0 = r25
            com.google.android.gms.internal.bz$a r3 = r0.f2287hd     // Catch:{ all -> 0x0142 }
            r12.<init>(r3, r2)     // Catch:{ all -> 0x0142 }
            r3 = 0
            r6 = -2
            long r4 = android.os.SystemClock.elapsedRealtime()     // Catch:{ a -> 0x0050 }
            r0 = r25
            android.content.Context r2 = r0.mContext     // Catch:{ a -> 0x0050 }
            r0 = r25
            com.google.android.gms.internal.cm r2 = com.google.android.gms.internal.C0966bw.m2098a(r2, r12, r0)     // Catch:{ a -> 0x0050 }
            r0 = r25
            java.lang.Object r7 = r0.f2286hc     // Catch:{ a -> 0x0050 }
            monitor-enter(r7)     // Catch:{ a -> 0x0050 }
            r0 = r25
            r0.f2289hf = r2     // Catch:{ all -> 0x004d }
            r0 = r25
            com.google.android.gms.internal.cm r2 = r0.f2289hf     // Catch:{ all -> 0x004d }
            if (r2 != 0) goto L_0x0116
            com.google.android.gms.internal.bv$a r2 = new com.google.android.gms.internal.bv$a     // Catch:{ all -> 0x004d }
            java.lang.String r4 = "Could not start the ad request service."
            r5 = 0
            r2.<init>(r4, r5)     // Catch:{ all -> 0x004d }
            throw r2     // Catch:{ all -> 0x004d }
        L_0x004d:
            r2 = move-exception
            monitor-exit(r7)     // Catch:{ all -> 0x004d }
            throw r2     // Catch:{ a -> 0x0050 }
        L_0x0050:
            r2 = move-exception
            int r6 = r2.getErrorCode()     // Catch:{ all -> 0x0142 }
            r4 = 3
            if (r6 == r4) goto L_0x005b
            r4 = -1
            if (r6 != r4) goto L_0x0145
        L_0x005b:
            java.lang.String r2 = r2.getMessage()     // Catch:{ all -> 0x0142 }
            com.google.android.gms.internal.C1004ct.m2216t(r2)     // Catch:{ all -> 0x0142 }
        L_0x0062:
            com.google.android.gms.internal.cb r2 = new com.google.android.gms.internal.cb     // Catch:{ all -> 0x0142 }
            r2.<init>(r6)     // Catch:{ all -> 0x0142 }
            r0 = r25
            r0.f2290hg = r2     // Catch:{ all -> 0x0142 }
            android.os.Handler r2 = com.google.android.gms.internal.C1003cs.f2412iI     // Catch:{ all -> 0x0142 }
            com.google.android.gms.internal.bv$1 r4 = new com.google.android.gms.internal.bv$1     // Catch:{ all -> 0x0142 }
            r0 = r25
            r4.<init>()     // Catch:{ all -> 0x0142 }
            r2.post(r4)     // Catch:{ all -> 0x0142 }
            r21 = r3
        L_0x0079:
            com.google.android.gms.internal.cj r2 = new com.google.android.gms.internal.cj     // Catch:{ all -> 0x0142 }
            com.google.android.gms.internal.v r3 = r12.f2308hr     // Catch:{ all -> 0x0142 }
            r0 = r25
            com.google.android.gms.internal.cw r4 = r0.f2284gv     // Catch:{ all -> 0x0142 }
            r0 = r25
            com.google.android.gms.internal.cb r5 = r0.f2290hg     // Catch:{ all -> 0x0142 }
            java.util.List<java.lang.String> r5 = r5.f2320fK     // Catch:{ all -> 0x0142 }
            r0 = r25
            com.google.android.gms.internal.cb r7 = r0.f2290hg     // Catch:{ all -> 0x0142 }
            java.util.List<java.lang.String> r7 = r7.f2321fL     // Catch:{ all -> 0x0142 }
            r0 = r25
            com.google.android.gms.internal.cb r8 = r0.f2290hg     // Catch:{ all -> 0x0142 }
            java.util.List<java.lang.String> r8 = r8.f2324hA     // Catch:{ all -> 0x0142 }
            r0 = r25
            com.google.android.gms.internal.cb r9 = r0.f2290hg     // Catch:{ all -> 0x0142 }
            int r9 = r9.orientation     // Catch:{ all -> 0x0142 }
            r0 = r25
            com.google.android.gms.internal.cb r10 = r0.f2290hg     // Catch:{ all -> 0x0142 }
            long r10 = r10.f2322fO     // Catch:{ all -> 0x0142 }
            java.lang.String r12 = r12.f2311hu     // Catch:{ all -> 0x0142 }
            r0 = r25
            com.google.android.gms.internal.cb r13 = r0.f2290hg     // Catch:{ all -> 0x0142 }
            boolean r13 = r13.f2328hy     // Catch:{ all -> 0x0142 }
            r0 = r25
            com.google.android.gms.internal.ay r14 = r0.f2293hj     // Catch:{ all -> 0x0142 }
            if (r14 == 0) goto L_0x014e
            r0 = r25
            com.google.android.gms.internal.ay r14 = r0.f2293hj     // Catch:{ all -> 0x0142 }
            com.google.android.gms.internal.at r14 = r14.f2000gb     // Catch:{ all -> 0x0142 }
        L_0x00b3:
            r0 = r25
            com.google.android.gms.internal.ay r15 = r0.f2293hj     // Catch:{ all -> 0x0142 }
            if (r15 == 0) goto L_0x0151
            r0 = r25
            com.google.android.gms.internal.ay r15 = r0.f2293hj     // Catch:{ all -> 0x0142 }
            com.google.android.gms.internal.bc r15 = r15.f2001gc     // Catch:{ all -> 0x0142 }
        L_0x00bf:
            r0 = r25
            com.google.android.gms.internal.ay r0 = r0.f2293hj     // Catch:{ all -> 0x0142 }
            r16 = r0
            if (r16 == 0) goto L_0x0154
            r0 = r25
            com.google.android.gms.internal.ay r0 = r0.f2293hj     // Catch:{ all -> 0x0142 }
            r16 = r0
            r0 = r16
            java.lang.String r0 = r0.f2002gd     // Catch:{ all -> 0x0142 }
            r16 = r0
        L_0x00d3:
            r0 = r25
            com.google.android.gms.internal.au r0 = r0.f2283fy     // Catch:{ all -> 0x0142 }
            r17 = r0
            r0 = r25
            com.google.android.gms.internal.ay r0 = r0.f2293hj     // Catch:{ all -> 0x0142 }
            r18 = r0
            if (r18 == 0) goto L_0x0158
            r0 = r25
            com.google.android.gms.internal.ay r0 = r0.f2293hj     // Catch:{ all -> 0x0142 }
            r18 = r0
            r0 = r18
            com.google.android.gms.internal.aw r0 = r0.f2003ge     // Catch:{ all -> 0x0142 }
            r18 = r0
        L_0x00ed:
            r0 = r25
            com.google.android.gms.internal.cb r0 = r0.f2290hg     // Catch:{ all -> 0x0142 }
            r19 = r0
            r0 = r19
            long r0 = r0.f2329hz     // Catch:{ all -> 0x0142 }
            r19 = r0
            r0 = r25
            com.google.android.gms.internal.cb r0 = r0.f2290hg     // Catch:{ all -> 0x0142 }
            r22 = r0
            r0 = r22
            long r0 = r0.f2327hx     // Catch:{ all -> 0x0142 }
            r22 = r0
            r2.<init>(r3, r4, r5, r6, r7, r8, r9, r10, r12, r13, r14, r15, r16, r17, r18, r19, r21, r22)     // Catch:{ all -> 0x0142 }
            android.os.Handler r3 = com.google.android.gms.internal.C1003cs.f2412iI     // Catch:{ all -> 0x0142 }
            com.google.android.gms.internal.bv$2 r4 = new com.google.android.gms.internal.bv$2     // Catch:{ all -> 0x0142 }
            r0 = r25
            r4.<init>(r2)     // Catch:{ all -> 0x0142 }
            r3.post(r4)     // Catch:{ all -> 0x0142 }
            monitor-exit(r24)     // Catch:{ all -> 0x0142 }
            return
        L_0x0116:
            monitor-exit(r7)     // Catch:{ all -> 0x004d }
            r0 = r25
            r0.m2091c((long) r4)     // Catch:{ a -> 0x0050 }
            r25.m2087aj()     // Catch:{ a -> 0x0050 }
            com.google.android.gms.internal.x r2 = r12.f2306em     // Catch:{ a -> 0x0050 }
            com.google.android.gms.internal.x[] r2 = r2.f3487eH     // Catch:{ a -> 0x0050 }
            if (r2 == 0) goto L_0x012b
            r0 = r25
            com.google.android.gms.internal.x r3 = r0.m2084a((com.google.android.gms.internal.C0972bz) r12)     // Catch:{ a -> 0x0050 }
        L_0x012b:
            r0 = r25
            com.google.android.gms.internal.cb r2 = r0.f2290hg     // Catch:{ a -> 0x0050 }
            boolean r2 = r2.f2328hy     // Catch:{ a -> 0x0050 }
            if (r2 == 0) goto L_0x013c
            r0 = r25
            r0.m2086a(r12, r4)     // Catch:{ a -> 0x0050 }
        L_0x0138:
            r21 = r3
            goto L_0x0079
        L_0x013c:
            r0 = r25
            r0.m2089b((long) r4)     // Catch:{ a -> 0x0050 }
            goto L_0x0138
        L_0x0142:
            r2 = move-exception
            monitor-exit(r24)     // Catch:{ all -> 0x0142 }
            throw r2
        L_0x0145:
            java.lang.String r2 = r2.getMessage()     // Catch:{ all -> 0x0142 }
            com.google.android.gms.internal.C1004ct.m2218v(r2)     // Catch:{ all -> 0x0142 }
            goto L_0x0062
        L_0x014e:
            r14 = 0
            goto L_0x00b3
        L_0x0151:
            r15 = 0
            goto L_0x00bf
        L_0x0154:
            r16 = 0
            goto L_0x00d3
        L_0x0158:
            r18 = 0
            goto L_0x00ed
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.C0961bv.mo7188ai():void");
    }

    public void onStop() {
        synchronized (this.f2286hc) {
            if (this.f2289hf != null) {
                this.f2289hf.cancel();
            }
            this.f2284gv.stopLoading();
            C0997co.m2175a((WebView) this.f2284gv);
            if (this.f2292hi != null) {
                this.f2292hi.cancel();
            }
        }
    }
}
