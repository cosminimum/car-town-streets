package com.google.ads;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.view.View;
import com.google.ads.C0453g;
import com.google.ads.internal.C0481h;
import com.google.ads.mediation.MediationAdapter;
import com.google.ads.mediation.MediationInterstitialAdapter;
import com.google.ads.util.C0506a;
import com.google.ads.util.C0508b;
import java.util.HashMap;

/* renamed from: com.google.ads.h */
public class C0455h {

    /* renamed from: a */
    final C0481h f803a;

    /* renamed from: b */
    private final C0452f f804b;

    /* renamed from: c */
    private boolean f805c = false;

    /* renamed from: d */
    private boolean f806d = false;

    /* renamed from: e */
    private C0453g.C0454a f807e = null;

    /* renamed from: f */
    private final C0443e f808f;
    /* access modifiers changed from: private */

    /* renamed from: g */
    public MediationAdapter<?, ?> f809g = null;

    /* renamed from: h */
    private boolean f810h = false;

    /* renamed from: i */
    private boolean f811i = false;

    /* renamed from: j */
    private View f812j = null;

    /* renamed from: k */
    private final Handler f813k = new Handler(Looper.getMainLooper());

    /* renamed from: l */
    private final String f814l;

    /* renamed from: m */
    private final AdRequest f815m;

    /* renamed from: n */
    private final HashMap<String, String> f816n;

    public C0455h(C0443e eVar, C0481h hVar, C0452f fVar, String str, AdRequest adRequest, HashMap<String, String> hashMap) {
        C0506a.m1021b(TextUtils.isEmpty(str));
        this.f808f = eVar;
        this.f803a = hVar;
        this.f804b = fVar;
        this.f814l = str;
        this.f815m = adRequest;
        this.f816n = hashMap;
    }

    /* renamed from: a */
    public C0452f mo3590a() {
        return this.f804b;
    }

    /* renamed from: a */
    public synchronized void mo3591a(Activity activity) {
        C0506a.m1022b(this.f810h, "startLoadAdTask has already been called.");
        this.f810h = true;
        this.f813k.post(new C0458i(this, activity, this.f814l, this.f815m, this.f816n));
    }

    /* renamed from: b */
    public synchronized void mo3595b() {
        C0506a.m1019a(this.f810h, "destroy() called but startLoadAdTask has not been called.");
        this.f813k.post(new Runnable() {
            public void run() {
                if (C0455h.this.mo3605l()) {
                    C0506a.m1020b((Object) C0455h.this.f809g);
                    try {
                        C0455h.this.f809g.destroy();
                        C0508b.m1026a("Called destroy() for adapter with class: " + C0455h.this.f809g.getClass().getName());
                    } catch (Throwable th) {
                        C0508b.m1031b("Error while destroying adapter (" + C0455h.this.mo3601h() + "):", th);
                    }
                }
            }
        });
    }

    /* renamed from: c */
    public synchronized boolean mo3596c() {
        return this.f805c;
    }

    /* renamed from: d */
    public synchronized boolean mo3597d() {
        C0506a.m1019a(this.f805c, "isLoadAdTaskSuccessful() called when isLoadAdTaskDone() is false.");
        return this.f806d;
    }

    /* renamed from: e */
    public synchronized C0453g.C0454a mo3598e() {
        C0453g.C0454a aVar;
        if (this.f807e == null) {
            aVar = C0453g.C0454a.TIMEOUT;
        } else {
            aVar = this.f807e;
        }
        return aVar;
    }

    /* renamed from: f */
    public synchronized View mo3599f() {
        C0506a.m1019a(this.f805c, "getAdView() called when isLoadAdTaskDone() is false.");
        return this.f812j;
    }

    /* renamed from: g */
    public synchronized void mo3600g() {
        C0506a.m1018a(this.f803a.mo3767a());
        try {
            final MediationInterstitialAdapter mediationInterstitialAdapter = (MediationInterstitialAdapter) this.f809g;
            this.f813k.post(new Runnable() {
                public void run() {
                    try {
                        mediationInterstitialAdapter.showInterstitial();
                    } catch (Throwable th) {
                        C0508b.m1031b("Error while telling adapter (" + C0455h.this.mo3601h() + ") ad to show interstitial: ", th);
                    }
                }
            });
        } catch (ClassCastException e) {
            C0508b.m1031b("In Ambassador.show(): ambassador.adapter does not implement the MediationInterstitialAdapter interface.", e);
        }
        return;
    }

    /* renamed from: h */
    public synchronized String mo3601h() {
        return this.f809g != null ? this.f809g.getClass().getName() : "\"adapter was not created.\"";
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public synchronized void mo3594a(boolean z, C0453g.C0454a aVar) {
        this.f806d = z;
        this.f805c = true;
        this.f807e = aVar;
        notify();
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public synchronized void mo3593a(MediationAdapter<?, ?> mediationAdapter) {
        this.f809g = mediationAdapter;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: i */
    public synchronized MediationAdapter<?, ?> mo3602i() {
        return this.f809g;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: j */
    public C0443e mo3603j() {
        return this.f808f;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public synchronized void mo3592a(View view) {
        this.f812j = view;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: k */
    public synchronized void mo3604k() {
        this.f811i = true;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: l */
    public synchronized boolean mo3605l() {
        return this.f811i;
    }
}
