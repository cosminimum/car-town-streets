package com.google.android.gms.internal;

import com.tapjoy.TapjoyConstants;
import java.lang.ref.WeakReference;
/* loaded from: classes.dex */
public final class s {
    private final Runnable ep;
    private v eq;
    private boolean er = false;

    public s(final r rVar) {
        this.ep = new Runnable() { // from class: com.google.android.gms.internal.s.1
            private final WeakReference<r> es;

            {
                this.es = new WeakReference<>(rVar);
            }

            @Override // java.lang.Runnable
            public void run() {
                s.this.er = false;
                r rVar2 = this.es.get();
                if (rVar2 != null) {
                    rVar2.b(s.this.eq);
                }
            }
        };
    }

    public void a(v vVar, long j) {
        if (this.er) {
            ct.v("An ad refresh is already scheduled.");
            return;
        }
        ct.t("Scheduling ad refresh " + j + " milliseconds from now.");
        this.eq = vVar;
        this.er = true;
        cs.iI.postDelayed(this.ep, j);
    }

    public void cancel() {
        cs.iI.removeCallbacks(this.ep);
    }

    public void d(v vVar) {
        a(vVar, TapjoyConstants.THROTTLE_GET_TAP_POINTS_INTERVAL);
    }
}
