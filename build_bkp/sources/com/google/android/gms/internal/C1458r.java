package com.google.android.gms.internal;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.RemoteException;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.webkit.WebView;
import android.widget.ViewSwitcher;
import com.getjar.sdk.utilities.Constants;
import com.google.android.gms.dynamic.C0772b;
import com.google.android.gms.dynamic.C0775c;
import com.google.android.gms.internal.C0855ac;
import com.google.android.gms.internal.C0959bu;
import com.google.android.gms.internal.C0972bz;

/* renamed from: com.google.android.gms.internal.r */
public final class C1458r extends C0855ac.C0856a implements C0871al, C0889av, C0945bn, C0950bq, C0959bu.C0960a, C1457q {

    /* renamed from: ed */
    private final C0912bb f3457ed;

    /* renamed from: ee */
    private final C1459a f3458ee;

    /* renamed from: ef */
    private final C1460s f3459ef = new C1460s(this);

    /* renamed from: com.google.android.gms.internal.r$a */
    private static final class C1459a {
        public final String adUnitId;

        /* renamed from: eg */
        public final ViewSwitcher f3460eg;

        /* renamed from: eh */
        public final Context f3461eh;

        /* renamed from: ei */
        public final C1332h f3462ei;

        /* renamed from: ej */
        public final C1005cu f3463ej;

        /* renamed from: ek */
        public C0852ab f3464ek;

        /* renamed from: el */
        public C0992cm f3465el;

        /* renamed from: em */
        public C1466x f3466em;

        /* renamed from: en */
        public C0989cj f3467en;

        /* renamed from: eo */
        public C0861ae f3468eo;

        public C1459a(Context context, C1466x xVar, String str, C1005cu cuVar) {
            if (xVar.f3486eG) {
                this.f3460eg = null;
            } else {
                this.f3460eg = new ViewSwitcher(context);
                this.f3460eg.setMinimumWidth(xVar.widthPixels);
                this.f3460eg.setMinimumHeight(xVar.heightPixels);
                this.f3460eg.setVisibility(4);
            }
            this.f3466em = xVar;
            this.adUnitId = str;
            this.f3461eh = context;
            this.f3462ei = new C1332h(C1267g.m3379a(cuVar.f2413iJ, context));
            this.f3463ej = cuVar;
        }
    }

    public C1458r(Context context, C1466x xVar, String str, C0912bb bbVar, C1005cu cuVar) {
        this.f3458ee = new C1459a(context, xVar, str, cuVar);
        this.f3457ed = bbVar;
        C1004ct.m2216t("Use AdRequest.Builder.addTestDevice(\"" + C1003cs.m2209l(context) + "\") to get test ads on this device.");
        C0997co.m2187i(context);
    }

    /* renamed from: I */
    private void m4035I() {
        C1004ct.m2216t("Ad closing.");
        if (this.f3458ee.f3464ek != null) {
            try {
                this.f3458ee.f3464ek.onAdClosed();
            } catch (RemoteException e) {
                C1004ct.m2212b("Could not call AdListener.onAdClosed().", e);
            }
        }
    }

    /* renamed from: J */
    private void m4036J() {
        C1004ct.m2216t("Ad leaving application.");
        if (this.f3458ee.f3464ek != null) {
            try {
                this.f3458ee.f3464ek.onAdLeftApplication();
            } catch (RemoteException e) {
                C1004ct.m2212b("Could not call AdListener.onAdLeftApplication().", e);
            }
        }
    }

    /* renamed from: K */
    private void m4037K() {
        C1004ct.m2216t("Ad opening.");
        if (this.f3458ee.f3464ek != null) {
            try {
                this.f3458ee.f3464ek.onAdOpened();
            } catch (RemoteException e) {
                C1004ct.m2212b("Could not call AdListener.onAdOpened().", e);
            }
        }
    }

    /* renamed from: L */
    private void m4038L() {
        C1004ct.m2216t("Ad finished loading.");
        if (this.f3458ee.f3464ek != null) {
            try {
                this.f3458ee.f3464ek.onAdLoaded();
            } catch (RemoteException e) {
                C1004ct.m2212b("Could not call AdListener.onAdLoaded().", e);
            }
        }
    }

    /* renamed from: M */
    private boolean m4039M() {
        boolean z = true;
        if (!C0997co.m2178a(this.f3458ee.f3461eh.getPackageManager(), this.f3458ee.f3461eh.getPackageName(), "android.permission.INTERNET")) {
            if (!this.f3458ee.f3466em.f3486eG) {
                C1003cs.m2206a(this.f3458ee.f3460eg, this.f3458ee.f3466em, "Missing internet permission in AndroidManifest.xml.", "Missing internet permission in AndroidManifest.xml. You must have the following declaration: <uses-permission android:name=\"android.permission.INTERNET\" />");
            }
            z = false;
        }
        if (!C0997co.m2186h(this.f3458ee.f3461eh)) {
            if (!this.f3458ee.f3466em.f3486eG) {
                C1003cs.m2206a(this.f3458ee.f3460eg, this.f3458ee.f3466em, "Missing AdActivity with android:configChanges in AndroidManifest.xml.", "Missing AdActivity with android:configChanges in AndroidManifest.xml. You must have the following declaration within the <application> element: <activity android:name=\"com.google.android.gms.ads.AdActivity\" android:configChanges=\"keyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize\" />");
            }
            z = false;
        }
        if (!z && !this.f3458ee.f3466em.f3486eG) {
            this.f3458ee.f3460eg.setVisibility(0);
        }
        return z;
    }

    /* renamed from: N */
    private void m4040N() {
        if (this.f3458ee.f3467en == null) {
            C1004ct.m2218v("Ad state was null when trying to ping click URLs.");
            return;
        }
        C1004ct.m2214r("Pinging click URLs.");
        if (this.f3458ee.f3467en.f2377fK != null) {
            C0997co.m2173a(this.f3458ee.f3461eh, this.f3458ee.f3463ej.f2413iJ, this.f3458ee.f3467en.f2377fK);
        }
        if (this.f3458ee.f3467en.f2391is != null && this.f3458ee.f3467en.f2391is.f1979fK != null) {
            C0895az.m1986a(this.f3458ee.f3461eh, this.f3458ee.f3463ej.f2413iJ, this.f3458ee.f3467en, this.f3458ee.adUnitId, false, this.f3458ee.f3467en.f2391is.f1979fK);
        }
    }

    /* renamed from: O */
    private void m4041O() {
        if (this.f3458ee.f3467en != null) {
            this.f3458ee.f3467en.f2380gJ.destroy();
            this.f3458ee.f3467en = null;
        }
    }

    /* renamed from: a */
    private void m4042a(int i) {
        C1004ct.m2218v("Failed to load ad: " + i);
        if (this.f3458ee.f3464ek != null) {
            try {
                this.f3458ee.f3464ek.onAdFailedToLoad(i);
            } catch (RemoteException e) {
                C1004ct.m2212b("Could not call AdListener.onAdFailedToLoad().", e);
            }
        }
    }

    /* renamed from: b */
    private void m4043b(View view) {
        this.f3458ee.f3460eg.addView(view, new ViewGroup.LayoutParams(-2, -2));
    }

    /* renamed from: b */
    private void m4044b(boolean z) {
        if (this.f3458ee.f3467en == null) {
            C1004ct.m2218v("Ad state was null when trying to ping impression URLs.");
            return;
        }
        C1004ct.m2214r("Pinging Impression URLs.");
        if (this.f3458ee.f3467en.f2378fL != null) {
            C0997co.m2173a(this.f3458ee.f3461eh, this.f3458ee.f3463ej.f2413iJ, this.f3458ee.f3467en.f2378fL);
        }
        if (!(this.f3458ee.f3467en.f2391is == null || this.f3458ee.f3467en.f2391is.f1980fL == null)) {
            C0895az.m1986a(this.f3458ee.f3461eh, this.f3458ee.f3463ej.f2413iJ, this.f3458ee.f3467en, this.f3458ee.adUnitId, z, this.f3458ee.f3467en.f2391is.f1980fL);
        }
        if (this.f3458ee.f3467en.f2381gb != null && this.f3458ee.f3467en.f2381gb.f1975fG != null) {
            C0895az.m1986a(this.f3458ee.f3461eh, this.f3458ee.f3463ej.f2413iJ, this.f3458ee.f3467en, this.f3458ee.adUnitId, z, this.f3458ee.f3467en.f2381gb.f1975fG);
        }
    }

    /* renamed from: b */
    private boolean m4045b(C0989cj cjVar) {
        if (cjVar.f2389hy) {
            try {
                View view = (View) C0775c.m1695b(cjVar.f2382gc.getView());
                View nextView = this.f3458ee.f3460eg.getNextView();
                if (nextView != null) {
                    this.f3458ee.f3460eg.removeView(nextView);
                }
                try {
                    m4043b(view);
                } catch (Throwable th) {
                    C1004ct.m2212b("Could not add mediation view to view hierarchy.", th);
                    return false;
                }
            } catch (RemoteException e) {
                C1004ct.m2212b("Could not get View from mediation adapter.", e);
                return false;
            }
        } else if (cjVar.f2392it != null) {
            cjVar.f2380gJ.mo7236a(cjVar.f2392it);
            this.f3458ee.f3460eg.removeAllViews();
            this.f3458ee.f3460eg.setMinimumWidth(cjVar.f2392it.widthPixels);
            this.f3458ee.f3460eg.setMinimumHeight(cjVar.f2392it.heightPixels);
            m4043b((View) cjVar.f2380gJ);
        }
        if (this.f3458ee.f3460eg.getChildCount() > 1) {
            this.f3458ee.f3460eg.showNext();
        }
        if (this.f3458ee.f3467en != null) {
            View nextView2 = this.f3458ee.f3460eg.getNextView();
            if (nextView2 instanceof C1007cw) {
                ((C1007cw) nextView2).mo7234a(this.f3458ee.f3461eh, this.f3458ee.f3466em);
            } else if (nextView2 != null) {
                this.f3458ee.f3460eg.removeView(nextView2);
            }
            if (this.f3458ee.f3467en.f2382gc != null) {
                try {
                    this.f3458ee.f3467en.f2382gc.destroy();
                } catch (RemoteException e2) {
                    C1004ct.m2218v("Could not destroy previous mediation adapter.");
                }
            }
        }
        this.f3458ee.f3460eg.setVisibility(0);
        return true;
    }

    /* renamed from: c */
    private C0972bz.C0973a m4046c(C1464v vVar) {
        PackageInfo packageInfo;
        Bundle bundle;
        ApplicationInfo applicationInfo = this.f3458ee.f3461eh.getApplicationInfo();
        try {
            packageInfo = this.f3458ee.f3461eh.getPackageManager().getPackageInfo(applicationInfo.packageName, 0);
        } catch (PackageManager.NameNotFoundException e) {
            packageInfo = null;
        }
        if (this.f3458ee.f3466em.f3486eG || this.f3458ee.f3460eg.getParent() == null) {
            bundle = null;
        } else {
            int[] iArr = new int[2];
            this.f3458ee.f3460eg.getLocationOnScreen(iArr);
            int i = iArr[0];
            int i2 = iArr[1];
            DisplayMetrics displayMetrics = this.f3458ee.f3461eh.getResources().getDisplayMetrics();
            int width = this.f3458ee.f3460eg.getWidth();
            int height = this.f3458ee.f3460eg.getHeight();
            int i3 = (!this.f3458ee.f3460eg.isShown() || i + width <= 0 || i2 + height <= 0 || i > displayMetrics.widthPixels || i2 > displayMetrics.heightPixels) ? 0 : 1;
            bundle = new Bundle(5);
            bundle.putInt(Constants.f677X, i);
            bundle.putInt(Constants.f678Y, i2);
            bundle.putInt("width", width);
            bundle.putInt("height", height);
            bundle.putInt("visible", i3);
        }
        return new C0972bz.C0973a(bundle, vVar, this.f3458ee.f3466em, this.f3458ee.adUnitId, applicationInfo, packageInfo, C0990ck.m2162ar(), C0990ck.f2394iu, this.f3458ee.f3463ej);
    }

    /* renamed from: A */
    public void mo7159A() {
        if (this.f3458ee.f3466em.f3486eG) {
            m4041O();
        }
        m4035I();
    }

    /* renamed from: B */
    public void mo7160B() {
        if (this.f3458ee.f3466em.f3486eG) {
            m4044b(false);
        }
        m4037K();
    }

    /* renamed from: C */
    public void mo7075C() {
        mo8822w();
    }

    /* renamed from: D */
    public void mo7076D() {
        mo7159A();
    }

    /* renamed from: E */
    public void mo7077E() {
        mo7178z();
    }

    /* renamed from: F */
    public void mo7078F() {
        mo7160B();
    }

    /* renamed from: G */
    public void mo7079G() {
        if (this.f3458ee.f3467en != null) {
            C1004ct.m2218v("Mediation adapter " + this.f3458ee.f3467en.f2383gd + " refreshed, but mediation adapters should never refresh.");
        }
        m4044b(true);
        m4038L();
    }

    /* renamed from: H */
    public void mo6995H() {
        C1102eg.m2609N("recordManualImpression must be called on the main UI thread.");
        if (this.f3458ee.f3467en == null) {
            C1004ct.m2218v("Ad state was null when trying to ping manual tracking URLs.");
            return;
        }
        C1004ct.m2214r("Pinging manual tracking URLs.");
        if (this.f3458ee.f3467en.f2385hA != null) {
            C0997co.m2173a(this.f3458ee.f3461eh, this.f3458ee.f3463ej.f2413iJ, this.f3458ee.f3467en.f2385hA);
        }
    }

    /* renamed from: a */
    public void mo6996a(C0852ab abVar) {
        C1102eg.m2609N("setAdListener must be called on the main UI thread.");
        this.f3458ee.f3464ek = abVar;
    }

    /* renamed from: a */
    public void mo6997a(C0861ae aeVar) {
        C1102eg.m2609N("setAppEventListener must be called on the main UI thread.");
        this.f3458ee.f3468eo = aeVar;
    }

    /* renamed from: a */
    public void mo7186a(C0989cj cjVar) {
        this.f3458ee.f3465el = null;
        if (cjVar.errorCode != -1) {
            boolean z = cjVar.f2386hr.extras != null ? cjVar.f2386hr.extras.getBoolean("_noRefresh", false) : false;
            if (this.f3458ee.f3466em.f3486eG) {
                C0997co.m2175a((WebView) cjVar.f2380gJ);
            } else if (!z) {
                if (cjVar.f2379fO > 0) {
                    this.f3459ef.mo8824a(cjVar.f2386hr, cjVar.f2379fO);
                } else if (cjVar.f2391is != null && cjVar.f2391is.f1983fO > 0) {
                    this.f3459ef.mo8824a(cjVar.f2386hr, cjVar.f2391is.f1983fO);
                } else if (!cjVar.f2389hy && cjVar.errorCode == 2) {
                    this.f3459ef.mo8826d(cjVar.f2386hr);
                }
            }
            if (!(cjVar.errorCode != 3 || cjVar.f2391is == null || cjVar.f2391is.f1981fM == null)) {
                C1004ct.m2214r("Pinging no fill URLs.");
                C0895az.m1986a(this.f3458ee.f3461eh, this.f3458ee.f3463ej.f2413iJ, cjVar, this.f3458ee.adUnitId, false, cjVar.f2391is.f1981fM);
            }
            if (cjVar.errorCode != -2) {
                m4042a(cjVar.errorCode);
            } else if (this.f3458ee.f3466em.f3486eG || m4045b(cjVar)) {
                if (!(this.f3458ee.f3467en == null || this.f3458ee.f3467en.f2384ge == null)) {
                    this.f3458ee.f3467en.f2384ge.mo7080a((C0889av) null);
                }
                if (cjVar.f2384ge != null) {
                    cjVar.f2384ge.mo7080a((C0889av) this);
                }
                this.f3458ee.f3467en = cjVar;
                if (cjVar.f2392it != null) {
                    this.f3458ee.f3466em = cjVar.f2392it;
                }
                if (!this.f3458ee.f3466em.f3486eG) {
                    m4044b(false);
                }
                m4038L();
            } else {
                m4042a(0);
            }
        }
    }

    /* renamed from: a */
    public void mo6998a(C1466x xVar) {
        C1102eg.m2609N("setAdSize must be called on the main UI thread.");
        this.f3458ee.f3466em = xVar;
        if (this.f3458ee.f3467en != null) {
            this.f3458ee.f3467en.f2380gJ.mo7236a(xVar);
        }
        if (this.f3458ee.f3460eg.getChildCount() > 1) {
            this.f3458ee.f3460eg.removeView(this.f3458ee.f3460eg.getNextView());
        }
        this.f3458ee.f3460eg.setMinimumWidth(xVar.widthPixels);
        this.f3458ee.f3460eg.setMinimumHeight(xVar.heightPixels);
        this.f3458ee.f3460eg.requestLayout();
    }

    /* renamed from: a */
    public boolean mo6999a(C1464v vVar) {
        C1007cw a;
        C1007cw cwVar;
        C1102eg.m2609N("loadAd must be called on the main UI thread.");
        if (this.f3458ee.f3465el != null) {
            C1004ct.m2218v("An ad request is already in progress. Aborting.");
            return false;
        } else if (this.f3458ee.f3466em.f3486eG && this.f3458ee.f3467en != null) {
            C1004ct.m2218v("An interstitial is already loading. Aborting.");
            return false;
        } else if (!m4039M()) {
            return false;
        } else {
            C1004ct.m2216t("Starting ad request.");
            this.f3459ef.cancel();
            C0972bz.C0973a c = m4046c(vVar);
            if (this.f3458ee.f3466em.f3486eG) {
                C1007cw a2 = C1007cw.m2222a(this.f3458ee.f3461eh, this.f3458ee.f3466em, false, false, this.f3458ee.f3462ei, this.f3458ee.f3463ej);
                a2.mo7240aC().mo7256a(this, (C0945bn) null, this, this, true);
                cwVar = a2;
            } else {
                View nextView = this.f3458ee.f3460eg.getNextView();
                if (nextView instanceof C1007cw) {
                    a = (C1007cw) nextView;
                    a.mo7234a(this.f3458ee.f3461eh, this.f3458ee.f3466em);
                } else {
                    if (nextView != null) {
                        this.f3458ee.f3460eg.removeView(nextView);
                    }
                    a = C1007cw.m2222a(this.f3458ee.f3461eh, this.f3458ee.f3466em, false, false, this.f3458ee.f3462ei, this.f3458ee.f3463ej);
                    if (this.f3458ee.f3466em.f3487eH == null) {
                        m4043b((View) a);
                    }
                }
                a.mo7240aC().mo7256a(this, this, this, this, false);
                cwVar = a;
            }
            this.f3458ee.f3465el = C0959bu.m2082a(this.f3458ee.f3461eh, c, this.f3458ee.f3462ei, cwVar, this.f3457ed, this);
            return true;
        }
    }

    /* renamed from: b */
    public void mo8823b(C1464v vVar) {
        ViewParent parent = this.f3458ee.f3460eg.getParent();
        if (!(parent instanceof View) || !((View) parent).isShown() || !C0997co.m2180at()) {
            C1004ct.m2216t("Ad is not visible. Not refreshing ad.");
            this.f3459ef.mo8826d(vVar);
            return;
        }
        mo6999a(vVar);
    }

    public void destroy() {
        C1102eg.m2609N("destroy must be called on the main UI thread.");
        this.f3458ee.f3464ek = null;
        this.f3458ee.f3468eo = null;
        this.f3459ef.cancel();
        stopLoading();
        if (this.f3458ee.f3460eg != null) {
            this.f3458ee.f3460eg.removeAllViews();
        }
        if (this.f3458ee.f3467en != null && this.f3458ee.f3467en.f2380gJ != null) {
            this.f3458ee.f3467en.f2380gJ.destroy();
        }
    }

    public boolean isReady() {
        C1102eg.m2609N("isLoaded must be called on the main UI thread.");
        return this.f3458ee.f3465el == null && this.f3458ee.f3467en != null;
    }

    public void onAppEvent(String name, String info) {
        if (this.f3458ee.f3468eo != null) {
            try {
                this.f3458ee.f3468eo.onAppEvent(name, info);
            } catch (RemoteException e) {
                C1004ct.m2212b("Could not call the AppEventListener.", e);
            }
        }
    }

    public void pause() {
        C1102eg.m2609N("pause must be called on the main UI thread.");
        if (this.f3458ee.f3467en != null) {
            C0997co.m2175a((WebView) this.f3458ee.f3467en.f2380gJ);
        }
    }

    public void resume() {
        C1102eg.m2609N("resume must be called on the main UI thread.");
        if (this.f3458ee.f3467en != null) {
            C0997co.m2185b(this.f3458ee.f3467en.f2380gJ);
        }
    }

    public void showInterstitial() {
        C1102eg.m2609N("showInterstitial must be called on the main UI thread.");
        if (!this.f3458ee.f3466em.f3486eG) {
            C1004ct.m2218v("Cannot call showInterstitial on a banner ad.");
        } else if (this.f3458ee.f3467en == null) {
            C1004ct.m2218v("The interstitial has not loaded.");
        } else if (this.f3458ee.f3467en.f2380gJ.mo7243aF()) {
            C1004ct.m2218v("The interstitial is already showing.");
        } else {
            this.f3458ee.f3467en.f2380gJ.mo7245l(true);
            if (this.f3458ee.f3467en.f2389hy) {
                try {
                    this.f3458ee.f3467en.f2382gc.showInterstitial();
                } catch (RemoteException e) {
                    C1004ct.m2212b("Could not show interstitial.", e);
                    m4041O();
                }
            } else {
                C0939bk.m2037a(this.f3458ee.f3461eh, new C0944bm(this, this, this, this.f3458ee.f3467en.f2380gJ, this.f3458ee.f3467en.orientation, this.f3458ee.f3463ej));
            }
        }
    }

    public void stopLoading() {
        C1102eg.m2609N("stopLoading must be called on the main UI thread.");
        if (this.f3458ee.f3467en != null) {
            this.f3458ee.f3467en.f2380gJ.stopLoading();
            this.f3458ee.f3467en = null;
        }
        if (this.f3458ee.f3465el != null) {
            this.f3458ee.f3465el.cancel();
        }
    }

    /* renamed from: w */
    public void mo8822w() {
        m4040N();
    }

    /* renamed from: x */
    public C0772b mo7006x() {
        C1102eg.m2609N("getAdFrame must be called on the main UI thread.");
        return C0775c.m1696h(this.f3458ee.f3460eg);
    }

    /* renamed from: y */
    public C1466x mo7007y() {
        C1102eg.m2609N("getAdSize must be called on the main UI thread.");
        return this.f3458ee.f3466em;
    }

    /* renamed from: z */
    public void mo7178z() {
        m4036J();
    }
}
