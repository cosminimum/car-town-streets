package com.google.ads;

import android.app.Activity;
import android.view.View;
import com.google.ads.C0453g;
import com.google.ads.internal.C0475d;
import com.google.ads.util.C0506a;
import com.google.ads.util.C0508b;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

/* renamed from: com.google.ads.e */
public class C0443e {
    /* access modifiers changed from: private */

    /* renamed from: a */
    public final C0475d f765a;
    /* access modifiers changed from: private */

    /* renamed from: b */
    public C0455h f766b;

    /* renamed from: c */
    private Object f767c;
    /* access modifiers changed from: private */

    /* renamed from: d */
    public Thread f768d;
    /* access modifiers changed from: private */

    /* renamed from: e */
    public Object f769e;

    /* renamed from: f */
    private boolean f770f;

    /* renamed from: g */
    private Object f771g;

    public C0443e(C0475d dVar) {
        this.f766b = null;
        this.f767c = new Object();
        this.f768d = null;
        this.f769e = new Object();
        this.f770f = false;
        this.f771g = new Object();
        C0506a.m1020b((Object) dVar);
        this.f765a = dVar;
    }

    /* renamed from: a */
    public boolean mo3571a() {
        boolean z;
        synchronized (this.f769e) {
            z = this.f768d != null;
        }
        return z;
    }

    /* renamed from: b */
    public void mo3572b() {
        synchronized (this.f771g) {
            this.f770f = true;
            mo3576d((C0455h) null);
            synchronized (this.f769e) {
                if (this.f768d != null) {
                    this.f768d.interrupt();
                }
            }
        }
    }

    /* renamed from: a */
    public void mo3567a(final C0440c cVar, final AdRequest adRequest) {
        synchronized (this.f769e) {
            if (mo3571a()) {
                C0508b.m1032c("Mediation thread is not done executing previous mediation  request. Ignoring new mediation request");
                return;
            }
            m724a(cVar, this.f765a);
            this.f768d = new Thread(new Runnable() {
                public void run() {
                    C0443e.this.m729b(cVar, adRequest);
                    synchronized (C0443e.this.f769e) {
                        Thread unused = C0443e.this.f768d = null;
                    }
                }
            });
            this.f768d.start();
        }
    }

    /* renamed from: a */
    public static boolean m724a(C0440c cVar, C0475d dVar) {
        if (cVar.mo3556j() == null) {
            return true;
        }
        if (!dVar.mo3708h().mo3791b()) {
            AdSize b = dVar.mo3708h().f990k.mo3874a().mo3768b();
            if (cVar.mo3556j().mo3767a()) {
                C0508b.m1036e("AdView received a mediation response corresponding to an interstitial ad. Make sure you specify the banner ad size corresponding to the AdSize you used in your AdView  (" + b + ") in the ad-type field in the mediation UI.");
                return false;
            }
            AdSize b2 = cVar.mo3556j().mo3768b();
            if (b2 == b) {
                return true;
            }
            C0508b.m1036e("Mediation server returned ad size: '" + b2 + "', while the AdView was created with ad size: '" + b + "'. Using the ad-size passed to the AdView on creation.");
            return false;
        } else if (cVar.mo3556j().mo3767a()) {
            return true;
        } else {
            C0508b.m1036e("InterstitialAd received a mediation response corresponding to a non-interstitial ad. Make sure you specify 'interstitial' as the ad-type in the mediation UI.");
            return false;
        }
    }

    /* renamed from: a */
    private boolean m726a(C0455h hVar, String str) {
        if (m732e() == hVar) {
            return true;
        }
        C0508b.m1032c("GWController: ignoring callback to " + str + " from non showing ambassador with adapter class: '" + hVar.mo3601h() + "'.");
        return false;
    }

    /* renamed from: a */
    public void mo3570a(C0455h hVar, final boolean z) {
        if (m726a(hVar, "onAdClicked()")) {
            final C0452f a = hVar.mo3590a();
            this.f765a.mo3693a((Runnable) new Runnable() {
                public void run() {
                    C0443e.this.f765a.mo3692a(a, z);
                }
            });
        }
    }

    /* renamed from: a */
    public void mo3569a(C0455h hVar, final View view) {
        if (m732e() != hVar) {
            C0508b.m1032c("GWController: ignoring onAdRefreshed() callback from non-showing ambassador (adapter class name is '" + hVar.mo3601h() + "').");
            return;
        }
        this.f765a.mo3713m().mo3740a(C0453g.C0454a.AD);
        final C0452f a = this.f766b.mo3590a();
        this.f765a.mo3693a((Runnable) new Runnable() {
            public void run() {
                C0443e.this.f765a.mo3688a(view, C0443e.this.f766b, a, true);
            }
        });
    }

    /* renamed from: a */
    public void mo3568a(C0455h hVar) {
        if (m726a(hVar, "onPresentScreen")) {
            this.f765a.mo3693a((Runnable) new Runnable() {
                public void run() {
                    C0443e.this.f765a.mo3721u();
                }
            });
        }
    }

    /* renamed from: b */
    public void mo3573b(C0455h hVar) {
        if (m726a(hVar, "onDismissScreen")) {
            this.f765a.mo3693a((Runnable) new Runnable() {
                public void run() {
                    C0443e.this.f765a.mo3720t();
                }
            });
        }
    }

    /* renamed from: c */
    public void mo3574c(C0455h hVar) {
        if (m726a(hVar, "onLeaveApplication")) {
            this.f765a.mo3693a((Runnable) new Runnable() {
                public void run() {
                    C0443e.this.f765a.mo3722v();
                }
            });
        }
    }

    /* renamed from: c */
    public boolean mo3575c() {
        C0506a.m1018a(this.f765a.mo3708h().mo3791b());
        C0455h e = m732e();
        if (e != null) {
            e.mo3600g();
            return true;
        }
        C0508b.m1030b("There is no ad ready to show.");
        return false;
    }

    protected C0443e() {
        this.f766b = null;
        this.f767c = new Object();
        this.f768d = null;
        this.f769e = new Object();
        this.f770f = false;
        this.f771g = new Object();
        this.f765a = null;
    }

    /* renamed from: d */
    private boolean m731d() {
        boolean z;
        synchronized (this.f771g) {
            z = this.f770f;
        }
        return z;
    }

    /* access modifiers changed from: private */
    /* renamed from: b */
    public void m729b(final C0440c cVar, AdRequest adRequest) {
        synchronized (this.f769e) {
            C0506a.m1016a((Object) Thread.currentThread(), (Object) this.f768d);
        }
        List<C0424a> f = cVar.mo3552f();
        long b = cVar.mo3547a() ? (long) cVar.mo3548b() : 10000;
        for (C0424a next : f) {
            C0508b.m1026a("Looking to fetch ads from network: " + next.mo3531b());
            List<String> c = next.mo3532c();
            HashMap<String, String> e = next.mo3534e();
            List<String> d = next.mo3533d();
            String a = next.mo3530a();
            String b2 = next.mo3531b();
            String c2 = cVar.mo3549c();
            if (d == null) {
                d = cVar.mo3553g();
            }
            C0452f fVar = new C0452f(a, b2, c2, d, cVar.mo3554h(), cVar.mo3555i());
            Iterator<String> it = c.iterator();
            while (true) {
                if (it.hasNext()) {
                    String next2 = it.next();
                    Activity a2 = this.f765a.mo3708h().f984e.mo3877a();
                    if (a2 == null) {
                        C0508b.m1026a("Activity is null while mediating.  Terminating mediation thread.");
                        return;
                    }
                    this.f765a.mo3713m().mo3743c();
                    if (m727a(next2, a2, adRequest, fVar, e, b)) {
                        return;
                    }
                    if (m731d()) {
                        C0508b.m1026a("GWController.destroy() called. Terminating mediation thread.");
                        return;
                    }
                }
            }
        }
        this.f765a.mo3693a((Runnable) new Runnable() {
            public void run() {
                C0443e.this.f765a.mo3700b(cVar);
            }
        });
    }

    /* JADX WARNING: No exception handlers in catch block: Catch:{  } */
    /* renamed from: a */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private boolean m727a(java.lang.String r8, android.app.Activity r9, com.google.ads.AdRequest r10, final com.google.ads.C0452f r11, java.util.HashMap<java.lang.String, java.lang.String> r12, long r13) {
        /*
            r7 = this;
            com.google.ads.h r0 = new com.google.ads.h
            com.google.ads.internal.d r1 = r7.f765a
            com.google.ads.m r1 = r1.mo3708h()
            com.google.ads.util.i$b<com.google.ads.internal.h> r1 = r1.f990k
            java.lang.Object r2 = r1.mo3874a()
            com.google.ads.internal.h r2 = (com.google.ads.internal.C0481h) r2
            r1 = r7
            r3 = r11
            r4 = r8
            r5 = r10
            r6 = r12
            r0.<init>(r1, r2, r3, r4, r5, r6)
            monitor-enter(r0)
            r0.mo3591a((android.app.Activity) r9)     // Catch:{ all -> 0x008e }
        L_0x001c:
            boolean r1 = r0.mo3596c()     // Catch:{ InterruptedException -> 0x0037 }
            if (r1 != 0) goto L_0x004e
            r1 = 0
            int r1 = (r13 > r1 ? 1 : (r13 == r1 ? 0 : -1))
            if (r1 <= 0) goto L_0x004e
            long r1 = android.os.SystemClock.elapsedRealtime()     // Catch:{ InterruptedException -> 0x0037 }
            r0.wait(r13)     // Catch:{ InterruptedException -> 0x0037 }
            long r3 = android.os.SystemClock.elapsedRealtime()     // Catch:{ InterruptedException -> 0x0037 }
            long r1 = r3 - r1
            long r13 = r13 - r1
            goto L_0x001c
        L_0x0037:
            r1 = move-exception
            java.lang.StringBuilder r1 = new java.lang.StringBuilder     // Catch:{ all -> 0x008e }
            r1.<init>()     // Catch:{ all -> 0x008e }
            java.lang.String r2 = "Interrupted while waiting for ad network to load ad using adapter class: "
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch:{ all -> 0x008e }
            java.lang.StringBuilder r1 = r1.append(r8)     // Catch:{ all -> 0x008e }
            java.lang.String r1 = r1.toString()     // Catch:{ all -> 0x008e }
            com.google.ads.util.C0508b.m1026a((java.lang.String) r1)     // Catch:{ all -> 0x008e }
        L_0x004e:
            com.google.ads.internal.d r1 = r7.f765a     // Catch:{ all -> 0x008e }
            com.google.ads.internal.g r1 = r1.mo3713m()     // Catch:{ all -> 0x008e }
            com.google.ads.g$a r2 = r0.mo3598e()     // Catch:{ all -> 0x008e }
            r1.mo3740a((com.google.ads.C0453g.C0454a) r2)     // Catch:{ all -> 0x008e }
            boolean r1 = r0.mo3596c()     // Catch:{ all -> 0x008e }
            if (r1 == 0) goto L_0x0087
            boolean r1 = r0.mo3597d()     // Catch:{ all -> 0x008e }
            if (r1 == 0) goto L_0x0087
            com.google.ads.internal.d r1 = r7.f765a     // Catch:{ all -> 0x008e }
            com.google.ads.m r1 = r1.mo3708h()     // Catch:{ all -> 0x008e }
            boolean r1 = r1.mo3791b()     // Catch:{ all -> 0x008e }
            if (r1 == 0) goto L_0x0082
            r1 = 0
        L_0x0074:
            com.google.ads.internal.d r2 = r7.f765a     // Catch:{ all -> 0x008e }
            com.google.ads.e$8 r3 = new com.google.ads.e$8     // Catch:{ all -> 0x008e }
            r3.<init>(r0, r1, r11)     // Catch:{ all -> 0x008e }
            r2.mo3693a((java.lang.Runnable) r3)     // Catch:{ all -> 0x008e }
            r1 = 1
            monitor-exit(r0)     // Catch:{ all -> 0x008e }
            r0 = r1
        L_0x0081:
            return r0
        L_0x0082:
            android.view.View r1 = r0.mo3599f()     // Catch:{ all -> 0x008e }
            goto L_0x0074
        L_0x0087:
            r0.mo3595b()     // Catch:{ all -> 0x008e }
            r1 = 0
            monitor-exit(r0)     // Catch:{ all -> 0x008e }
            r0 = r1
            goto L_0x0081
        L_0x008e:
            r1 = move-exception
            monitor-exit(r0)     // Catch:{ all -> 0x008e }
            throw r1
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.ads.C0443e.m727a(java.lang.String, android.app.Activity, com.google.ads.AdRequest, com.google.ads.f, java.util.HashMap, long):boolean");
    }

    /* access modifiers changed from: private */
    /* renamed from: e */
    public boolean m733e(C0455h hVar) {
        boolean z;
        synchronized (this.f771g) {
            if (m731d()) {
                hVar.mo3595b();
                z = true;
            } else {
                z = false;
            }
        }
        return z;
    }

    /* renamed from: e */
    private C0455h m732e() {
        C0455h hVar;
        synchronized (this.f767c) {
            hVar = this.f766b;
        }
        return hVar;
    }

    /* renamed from: d */
    public void mo3576d(C0455h hVar) {
        synchronized (this.f767c) {
            if (this.f766b != hVar) {
                if (this.f766b != null) {
                    this.f766b.mo3595b();
                }
                this.f766b = hVar;
            }
        }
    }
}
