package com.chartboost.sdk;

import android.app.Activity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.chartboost.sdk.impl.C0069a;
import com.chartboost.sdk.impl.C0192n;
import com.chartboost.sdk.impl.C0203r;
import com.chartboost.sdk.impl.C0204s;

/* renamed from: com.chartboost.sdk.a */
public final class C0060a {
    /* access modifiers changed from: private */

    /* renamed from: a */
    public C0038Chartboost f74a;

    /* renamed from: b */
    private Activity f75b;

    /* renamed from: c */
    private C0203r f76c;

    /* renamed from: d */
    private boolean f77d = false;

    /* renamed from: e */
    private boolean f78e = false;

    /* renamed from: f */
    private boolean f79f = false;

    /* renamed from: g */
    private C0204s f80g;

    /* renamed from: h */
    private C0204s f81h;

    protected C0060a(C0038Chartboost chartboost, Activity activity) {
        this.f74a = chartboost;
        this.f75b = activity;
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo1221a(Activity activity) {
        this.f75b = activity;
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo1222a(C0062a aVar) {
        if (aVar.f83a) {
            m107b();
        } else if (aVar.f84b != null) {
            m108b(aVar.f84b);
        }
    }

    /* renamed from: b */
    private void m108b(C0069a aVar) {
        if (!this.f78e) {
            aVar.f104c = C0069a.C0075b.CBImpressionStateWaitingForDisplay;
            if (!aVar.f107f.mo1237b()) {
                if (aVar.f107f.f91d != null) {
                    aVar.f107f.f91d.mo1241a();
                }
            } else if (aVar.f110i) {
                aVar.f110i = false;
                this.f80g = new C0204s(this.f75b, aVar.f107f.mo1239d());
                this.f75b.addContentView(this.f80g, new FrameLayout.LayoutParams(-1, -1));
                aVar.f104c = C0069a.C0075b.CBImpressionStateDisplayedByDefaultController;
                aVar.f109h = this.f80g;
                this.f78e = true;
            } else {
                this.f80g = new C0204s(this.f75b, aVar.f107f.mo1239d());
                this.f75b.addContentView(this.f80g, new FrameLayout.LayoutParams(-1, -1));
                this.f80g.mo1497b().mo1482a();
                C0192n.C0196b bVar = C0192n.C0196b.CBAnimationTypePerspectiveRotate;
                if (aVar.f105d == C0069a.C0076c.CBImpressionTypeMoreApps) {
                    bVar = C0192n.C0196b.CBAnimationTypePerspectiveZoom;
                }
                if (aVar.f102a.optInt("animation") != 0) {
                    bVar = C0192n.C0196b.values()[aVar.f102a.optInt("animation")];
                }
                aVar.f104c = C0069a.C0075b.CBImpressionStateDisplayedByDefaultController;
                aVar.f109h = this.f80g;
                C0192n.m412a(bVar, aVar);
                this.f78e = true;
                ChartboostDelegate delegate = this.f74a.getDelegate();
                if (delegate == null) {
                    return;
                }
                if (aVar.f105d == C0069a.C0076c.CBImpressionTypeInterstitial) {
                    delegate.didShowInterstitial(aVar.f106e);
                } else if (aVar.f105d == C0069a.C0076c.CBImpressionTypeMoreApps) {
                    delegate.didShowMoreApps();
                }
            }
        }
    }

    /* renamed from: a */
    public void mo1224a(C0069a aVar, boolean z) {
        this.f78e = false;
        if (!z) {
            this.f79f = true;
        }
        aVar.f104c = C0069a.C0075b.CBImpressionStateWaitingForDismissal;
        C0192n.C0196b bVar = C0192n.C0196b.CBAnimationTypePerspectiveRotate;
        if (aVar.f105d == C0069a.C0076c.CBImpressionTypeMoreApps) {
            bVar = C0192n.C0196b.CBAnimationTypePerspectiveZoom;
        }
        if (aVar.f102a.optInt("animation") != 0) {
            bVar = C0192n.C0196b.values()[aVar.f102a.optInt("animation")];
        }
        C0192n.m416b(bVar, aVar, m109c(aVar));
    }

    /* renamed from: a */
    public void mo1223a(C0069a aVar) {
        this.f78e = false;
        new C0063b(aVar, true).run();
        if (aVar.f104c == C0069a.C0075b.CBImpressionStateDisplayedByDefaultController) {
            aVar.f104c = C0069a.C0075b.CBImpressionStateWaitingForDisplay;
        } else {
            aVar.f104c = C0069a.C0075b.CBImpressionStateOther;
        }
        aVar.mo1251c();
        try {
            ((ViewGroup) this.f80g.getParent()).removeView(this.f80g);
        } catch (Exception e) {
        }
    }

    /* renamed from: b */
    private void m107b() {
        this.f76c = new C0203r(this.f75b);
        this.f81h = new C0204s(this.f75b, this.f76c);
        this.f81h.mo1497b().mo1484a(true);
        this.f75b.addContentView(this.f81h, new FrameLayout.LayoutParams(-1, -1));
        this.f81h.mo1497b().mo1482a();
        this.f81h.mo1497b().mo1483a((View) this.f76c.getParent());
        this.f77d = true;
    }

    /* renamed from: a */
    public void mo1225a(boolean z) {
        if (mo1226a()) {
            try {
                ((ViewGroup) this.f81h.getParent()).removeView(this.f81h);
            } catch (Exception e) {
                e.printStackTrace();
            }
            this.f76c = null;
            this.f81h = null;
            this.f77d = false;
            if (!this.f79f && z && this.f74a.getImpressionsUseActivities() && !this.f78e && (this.f75b instanceof CBImpressionActivity)) {
                this.f74a.mo1126c();
                this.f75b.finish();
            }
        }
    }

    /* renamed from: b */
    public void mo1227b(C0069a aVar, boolean z) {
        if (this.f80g != null) {
            try {
                ((ViewGroup) this.f80g.getParent()).removeView(this.f80g);
            } catch (Exception e) {
                e.printStackTrace();
            }
            aVar.mo1250b();
            this.f80g = null;
            this.f79f = false;
            if (this.f74a.getImpressionsUseActivities() && !z && !this.f77d && (this.f75b instanceof CBImpressionActivity)) {
                this.f74a.mo1126c();
                this.f75b.finish();
            }
        }
    }

    /* renamed from: com.chartboost.sdk.a$b */
    private class C0063b implements Runnable {

        /* renamed from: b */
        private C0069a f86b;

        /* renamed from: c */
        private boolean f87c;

        public C0063b(C0069a aVar, boolean z) {
            this.f86b = aVar;
            this.f87c = z;
        }

        public void run() {
            if (this.f86b.f104c == C0069a.C0075b.CBImpressionStateWaitingForDismissal) {
                this.f86b.f104c = C0069a.C0075b.CBImpressionStateOther;
                C0060a.this.mo1227b(this.f86b, this.f87c);
            }
        }
    }

    /* renamed from: c */
    private C0192n.C0195a m109c(C0069a aVar) {
        return new C0192n.C0195a() {
            /* renamed from: a */
            public void mo1228a(C0069a aVar) {
                C0060a.this.f74a.f8a.post(new C0063b(aVar, false));
            }
        };
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public boolean mo1226a() {
        return this.f77d;
    }

    /* renamed from: com.chartboost.sdk.a$a */
    protected static final class C0062a {

        /* renamed from: a */
        protected boolean f83a;

        /* renamed from: b */
        protected C0069a f84b;

        protected C0062a(boolean z, C0069a aVar) {
            this.f83a = z;
            this.f84b = aVar;
        }

        public C0062a(C0069a aVar) {
            this.f83a = false;
            this.f84b = aVar;
        }
    }
}
