package com.google.android.gms.internal;

import com.tapjoy.TapjoyConstants;
import java.lang.ref.WeakReference;

/* renamed from: com.google.android.gms.internal.s */
public final class C1460s {

    /* renamed from: ep */
    private final Runnable f3469ep;
    /* access modifiers changed from: private */

    /* renamed from: eq */
    public C1464v f3470eq;
    /* access modifiers changed from: private */

    /* renamed from: er */
    public boolean f3471er = false;

    public C1460s(final C1458r rVar) {
        this.f3469ep = new Runnable() {

            /* renamed from: es */
            private final WeakReference<C1458r> f3472es = new WeakReference<>(rVar);

            public void run() {
                boolean unused = C1460s.this.f3471er = false;
                C1458r rVar = (C1458r) this.f3472es.get();
                if (rVar != null) {
                    rVar.mo8823b(C1460s.this.f3470eq);
                }
            }
        };
    }

    /* renamed from: a */
    public void mo8824a(C1464v vVar, long j) {
        if (this.f3471er) {
            C1004ct.m2218v("An ad refresh is already scheduled.");
            return;
        }
        C1004ct.m2216t("Scheduling ad refresh " + j + " milliseconds from now.");
        this.f3470eq = vVar;
        this.f3471er = true;
        C1003cs.f2412iI.postDelayed(this.f3469ep, j);
    }

    public void cancel() {
        C1003cs.f2412iI.removeCallbacks(this.f3469ep);
    }

    /* renamed from: d */
    public void mo8826d(C1464v vVar) {
        mo8824a(vVar, (long) TapjoyConstants.THROTTLE_GET_TAP_POINTS_INTERVAL);
    }
}
