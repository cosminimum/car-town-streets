package com.google.android.gms.internal;

import android.os.SystemClock;
import org.json.JSONObject;

/* renamed from: com.google.android.gms.internal.do */
public final class C1058do {

    /* renamed from: lA */
    private static final C1052dk f2529lA = new C1052dk("RequestTracker");

    /* renamed from: mw */
    public static final Object f2530mw = new Object();

    /* renamed from: ms */
    private long f2531ms;

    /* renamed from: mt */
    private long f2532mt = -1;

    /* renamed from: mu */
    private long f2533mu = 0;

    /* renamed from: mv */
    private C1057dn f2534mv;

    public C1058do(long j) {
        this.f2531ms = j;
    }

    /* renamed from: be */
    private void m2436be() {
        this.f2532mt = -1;
        this.f2534mv = null;
        this.f2533mu = 0;
    }

    /* renamed from: a */
    public void mo7397a(long j, C1057dn dnVar) {
        C1057dn dnVar2;
        long j2;
        synchronized (f2530mw) {
            dnVar2 = this.f2534mv;
            j2 = this.f2532mt;
            this.f2532mt = j;
            this.f2534mv = dnVar;
            this.f2533mu = SystemClock.elapsedRealtime();
        }
        if (dnVar2 != null) {
            dnVar2.mo5832g(j2);
        }
    }

    /* renamed from: b */
    public boolean mo7398b(long j, int i, JSONObject jSONObject) {
        boolean z = true;
        C1057dn dnVar = null;
        synchronized (f2530mw) {
            if (this.f2532mt == -1 || this.f2532mt != j) {
                z = false;
            } else {
                f2529lA.mo7380b("request %d completed", Long.valueOf(this.f2532mt));
                dnVar = this.f2534mv;
                m2436be();
            }
        }
        if (dnVar != null) {
            dnVar.mo5831a(j, i, jSONObject);
        }
        return z;
    }

    /* renamed from: bf */
    public boolean mo7399bf() {
        boolean z;
        synchronized (f2530mw) {
            z = this.f2532mt != -1;
        }
        return z;
    }

    /* renamed from: c */
    public boolean mo7400c(long j, int i) {
        return mo7398b(j, i, (JSONObject) null);
    }

    public void clear() {
        synchronized (f2530mw) {
            if (this.f2532mt != -1) {
                m2436be();
            }
        }
    }

    /* renamed from: d */
    public boolean mo7402d(long j, int i) {
        C1057dn dnVar;
        boolean z = true;
        long j2 = 0;
        synchronized (f2530mw) {
            if (this.f2532mt == -1 || j - this.f2533mu < this.f2531ms) {
                z = false;
                dnVar = null;
            } else {
                f2529lA.mo7380b("request %d timed out", Long.valueOf(this.f2532mt));
                j2 = this.f2532mt;
                dnVar = this.f2534mv;
                m2436be();
            }
        }
        if (dnVar != null) {
            dnVar.mo5831a(j2, i, (JSONObject) null);
        }
        return z;
    }

    /* renamed from: i */
    public boolean mo7403i(long j) {
        boolean z;
        synchronized (f2530mw) {
            z = this.f2532mt != -1 && this.f2532mt == j;
        }
        return z;
    }
}
