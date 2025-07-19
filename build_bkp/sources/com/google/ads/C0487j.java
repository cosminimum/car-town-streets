package com.google.ads;

import com.google.ads.AdRequest;
import com.google.ads.C0453g;
import com.google.ads.mediation.MediationBannerAdapter;
import com.google.ads.mediation.MediationBannerListener;
import com.google.ads.util.C0506a;
import com.google.ads.util.C0508b;

/* renamed from: com.google.ads.j */
class C0487j implements MediationBannerListener {

    /* renamed from: a */
    private final C0455h f963a;

    /* renamed from: b */
    private boolean f964b;

    public C0487j(C0455h hVar) {
        this.f963a = hVar;
    }

    /* JADX WARNING: No exception handlers in catch block: Catch:{  } */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void onReceivedAd(com.google.ads.mediation.MediationBannerAdapter<?, ?> r5) {
        /*
            r4 = this;
            com.google.ads.h r1 = r4.f963a
            monitor-enter(r1)
            com.google.ads.h r0 = r4.f963a     // Catch:{ all -> 0x005f }
            com.google.ads.mediation.MediationAdapter r0 = r0.mo3602i()     // Catch:{ all -> 0x005f }
            com.google.ads.util.C0506a.m1016a((java.lang.Object) r5, (java.lang.Object) r0)     // Catch:{ all -> 0x005f }
            com.google.ads.h r0 = r4.f963a     // Catch:{ Throwable -> 0x002a }
            android.view.View r2 = r5.getBannerView()     // Catch:{ Throwable -> 0x002a }
            r0.mo3592a((android.view.View) r2)     // Catch:{ Throwable -> 0x002a }
            com.google.ads.h r0 = r4.f963a     // Catch:{ all -> 0x005f }
            boolean r0 = r0.mo3596c()     // Catch:{ all -> 0x005f }
            if (r0 != 0) goto L_0x0062
            r0 = 0
            r4.f964b = r0     // Catch:{ all -> 0x005f }
            com.google.ads.h r0 = r4.f963a     // Catch:{ all -> 0x005f }
            r2 = 1
            com.google.ads.g$a r3 = com.google.ads.C0453g.C0454a.AD     // Catch:{ all -> 0x005f }
            r0.mo3594a(r2, r3)     // Catch:{ all -> 0x005f }
            monitor-exit(r1)     // Catch:{ all -> 0x005f }
        L_0x0029:
            return
        L_0x002a:
            r0 = move-exception
            java.lang.StringBuilder r2 = new java.lang.StringBuilder     // Catch:{ all -> 0x005f }
            r2.<init>()     // Catch:{ all -> 0x005f }
            java.lang.String r3 = "Error while getting banner View from adapter ("
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch:{ all -> 0x005f }
            com.google.ads.h r3 = r4.f963a     // Catch:{ all -> 0x005f }
            java.lang.String r3 = r3.mo3601h()     // Catch:{ all -> 0x005f }
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch:{ all -> 0x005f }
            java.lang.String r3 = "): "
            java.lang.StringBuilder r2 = r2.append(r3)     // Catch:{ all -> 0x005f }
            java.lang.String r2 = r2.toString()     // Catch:{ all -> 0x005f }
            com.google.ads.util.C0508b.m1031b(r2, r0)     // Catch:{ all -> 0x005f }
            com.google.ads.h r0 = r4.f963a     // Catch:{ all -> 0x005f }
            boolean r0 = r0.mo3596c()     // Catch:{ all -> 0x005f }
            if (r0 != 0) goto L_0x005d
            com.google.ads.h r0 = r4.f963a     // Catch:{ all -> 0x005f }
            r2 = 0
            com.google.ads.g$a r3 = com.google.ads.C0453g.C0454a.EXCEPTION     // Catch:{ all -> 0x005f }
            r0.mo3594a(r2, r3)     // Catch:{ all -> 0x005f }
        L_0x005d:
            monitor-exit(r1)     // Catch:{ all -> 0x005f }
            goto L_0x0029
        L_0x005f:
            r0 = move-exception
            monitor-exit(r1)     // Catch:{ all -> 0x005f }
            throw r0
        L_0x0062:
            r0 = 1
            r4.f964b = r0     // Catch:{ all -> 0x005f }
            com.google.ads.h r0 = r4.f963a     // Catch:{ all -> 0x005f }
            com.google.ads.e r0 = r0.mo3603j()     // Catch:{ all -> 0x005f }
            com.google.ads.h r2 = r4.f963a     // Catch:{ all -> 0x005f }
            com.google.ads.h r3 = r4.f963a     // Catch:{ all -> 0x005f }
            android.view.View r3 = r3.mo3599f()     // Catch:{ all -> 0x005f }
            r0.mo3569a((com.google.ads.C0455h) r2, (android.view.View) r3)     // Catch:{ all -> 0x005f }
            monitor-exit(r1)     // Catch:{ all -> 0x005f }
            goto L_0x0029
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.ads.C0487j.onReceivedAd(com.google.ads.mediation.MediationBannerAdapter):void");
    }

    public void onFailedToReceiveAd(MediationBannerAdapter<?, ?> adapter, AdRequest.ErrorCode error) {
        synchronized (this.f963a) {
            C0506a.m1016a((Object) adapter, (Object) this.f963a.mo3602i());
            C0508b.m1026a("Mediation adapter " + adapter.getClass().getName() + " failed to receive ad with error code: " + error);
            if (!this.f963a.mo3596c()) {
                this.f963a.mo3594a(false, error == AdRequest.ErrorCode.NO_FILL ? C0453g.C0454a.NO_FILL : C0453g.C0454a.ERROR);
            }
        }
    }

    public void onPresentScreen(MediationBannerAdapter<?, ?> mediationBannerAdapter) {
        synchronized (this.f963a) {
            this.f963a.mo3603j().mo3568a(this.f963a);
        }
    }

    public void onDismissScreen(MediationBannerAdapter<?, ?> mediationBannerAdapter) {
        synchronized (this.f963a) {
            this.f963a.mo3603j().mo3573b(this.f963a);
        }
    }

    public void onLeaveApplication(MediationBannerAdapter<?, ?> mediationBannerAdapter) {
        synchronized (this.f963a) {
            this.f963a.mo3603j().mo3574c(this.f963a);
        }
    }

    public void onClick(MediationBannerAdapter<?, ?> mediationBannerAdapter) {
        synchronized (this.f963a) {
            C0506a.m1018a(this.f963a.mo3596c());
            this.f963a.mo3603j().mo3570a(this.f963a, this.f964b);
        }
    }
}
