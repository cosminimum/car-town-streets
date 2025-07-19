package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.Window;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;
import com.google.android.gms.ads.AdActivity;
import com.google.android.gms.internal.C0953bs;
import com.google.android.gms.internal.C1009cx;

/* renamed from: com.google.android.gms.internal.bk */
public final class C0939bk extends C0953bs.C0954a {

    /* renamed from: gA */
    private boolean f2239gA = false;

    /* renamed from: gB */
    private boolean f2240gB = false;

    /* renamed from: gC */
    private RelativeLayout f2241gC;

    /* renamed from: gs */
    private final Activity f2242gs;

    /* renamed from: gt */
    private C0944bm f2243gt;

    /* renamed from: gu */
    private C0946bo f2244gu;

    /* renamed from: gv */
    private C1007cw f2245gv;

    /* renamed from: gw */
    private C0942b f2246gw;

    /* renamed from: gx */
    private C0949bp f2247gx;

    /* renamed from: gy */
    private FrameLayout f2248gy;

    /* renamed from: gz */
    private WebChromeClient.CustomViewCallback f2249gz;

    /* renamed from: com.google.android.gms.internal.bk$a */
    private static final class C0941a extends Exception {
        public C0941a(String str) {
            super(str);
        }
    }

    /* renamed from: com.google.android.gms.internal.bk$b */
    private static final class C0942b {

        /* renamed from: gE */
        public final ViewGroup.LayoutParams f2251gE;

        /* renamed from: gF */
        public final ViewGroup f2252gF;
        public final int index;

        public C0942b(C1007cw cwVar) throws C0941a {
            this.f2251gE = cwVar.getLayoutParams();
            ViewParent parent = cwVar.getParent();
            if (parent instanceof ViewGroup) {
                this.f2252gF = (ViewGroup) parent;
                this.index = this.f2252gF.indexOfChild(cwVar);
                this.f2252gF.removeView(cwVar);
                cwVar.mo7245l(true);
                return;
            }
            throw new C0941a("Could not get the parent of the WebView for an overlay.");
        }
    }

    public C0939bk(Activity activity) {
        this.f2242gs = activity;
    }

    /* renamed from: Z */
    private void m2035Z() {
        if (this.f2242gs.isFinishing() && !this.f2240gB) {
            this.f2240gB = true;
            if (this.f2242gs.isFinishing()) {
                if (this.f2245gv != null) {
                    this.f2245gv.mo7244az();
                    this.f2241gC.removeView(this.f2245gv);
                    if (this.f2246gw != null) {
                        this.f2245gv.mo7245l(false);
                        this.f2246gw.f2252gF.addView(this.f2245gv, this.f2246gw.index, this.f2246gw.f2251gE);
                    }
                }
                if (this.f2243gt != null && this.f2243gt.f2256gI != null) {
                    this.f2243gt.f2256gI.mo7159A();
                }
            }
        }
    }

    /* renamed from: a */
    private static RelativeLayout.LayoutParams m2036a(int i, int i2, int i3, int i4) {
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(i3, i4);
        layoutParams.setMargins(i, i2, 0, 0);
        layoutParams.addRule(10);
        layoutParams.addRule(9);
        return layoutParams;
    }

    /* renamed from: a */
    public static void m2037a(Context context, C0944bm bmVar) {
        Intent intent = new Intent();
        intent.setClassName(context, AdActivity.CLASS_NAME);
        intent.putExtra("com.google.android.gms.ads.internal.overlay.useClientJar", bmVar.f2253ej.f2416iM);
        C0944bm.m2052a(intent, bmVar);
        intent.addFlags(524288);
        context.startActivity(intent);
    }

    /* renamed from: h */
    private void m2038h(boolean z) throws C0941a {
        this.f2242gs.requestWindowFeature(1);
        Window window = this.f2242gs.getWindow();
        window.setFlags(1024, 1024);
        setRequestedOrientation(this.f2243gt.orientation);
        if (Build.VERSION.SDK_INT >= 11) {
            C1004ct.m2214r("Enabling hardware acceleration on the AdActivity window.");
            C1000cp.m2195a(window);
        }
        this.f2241gC = new RelativeLayout(this.f2242gs);
        this.f2241gC.setBackgroundColor(-16777216);
        this.f2242gs.setContentView(this.f2241gC);
        boolean aJ = this.f2243gt.f2257gJ.mo7240aC().mo7261aJ();
        if (z) {
            this.f2245gv = C1007cw.m2222a(this.f2242gs, this.f2243gt.f2257gJ.mo7250y(), true, aJ, (C1332h) null, this.f2243gt.f2253ej);
            this.f2245gv.mo7240aC().mo7256a((C1457q) null, (C0945bn) null, this.f2243gt.f2258gK, this.f2243gt.f2262gO, true);
            this.f2245gv.mo7240aC().mo7255a((C1009cx.C1011a) new C1009cx.C1011a() {
                /* renamed from: a */
                public void mo7147a(C1007cw cwVar) {
                    cwVar.mo7238aA();
                }
            });
            if (this.f2243gt.f2264go != null) {
                this.f2245gv.loadUrl(this.f2243gt.f2264go);
            } else if (this.f2243gt.f2261gN != null) {
                this.f2245gv.loadDataWithBaseURL(this.f2243gt.f2259gL, this.f2243gt.f2261gN, "text/html", "UTF-8", (String) null);
            } else {
                throw new C0941a("No URL or HTML to display in ad overlay.");
            }
        } else {
            this.f2245gv = this.f2243gt.f2257gJ;
            this.f2245gv.setContext(this.f2242gs);
        }
        this.f2245gv.mo7235a(this);
        this.f2241gC.addView(this.f2245gv, -1, -1);
        if (!z) {
            this.f2245gv.mo7238aA();
        }
        mo7136f(aJ);
    }

    /* renamed from: W */
    public C0946bo mo7129W() {
        return this.f2244gu;
    }

    /* renamed from: X */
    public void mo7130X() {
        if (this.f2243gt != null) {
            setRequestedOrientation(this.f2243gt.orientation);
        }
        if (this.f2248gy != null) {
            this.f2242gs.setContentView(this.f2241gC);
            this.f2248gy.removeAllViews();
            this.f2248gy = null;
        }
        if (this.f2249gz != null) {
            this.f2249gz.onCustomViewHidden();
            this.f2249gz = null;
        }
    }

    /* renamed from: Y */
    public void mo7131Y() {
        this.f2241gC.removeView(this.f2247gx);
        mo7136f(true);
    }

    /* renamed from: a */
    public void mo7132a(View view, WebChromeClient.CustomViewCallback customViewCallback) {
        this.f2248gy = new FrameLayout(this.f2242gs);
        this.f2248gy.setBackgroundColor(-16777216);
        this.f2248gy.addView(view, -1, -1);
        this.f2242gs.setContentView(this.f2248gy);
        this.f2249gz = customViewCallback;
    }

    /* renamed from: b */
    public void mo7133b(int i, int i2, int i3, int i4) {
        if (this.f2244gu != null) {
            this.f2244gu.setLayoutParams(m2036a(i, i2, i3, i4));
        }
    }

    /* renamed from: c */
    public void mo7134c(int i, int i2, int i3, int i4) {
        if (this.f2244gu == null) {
            this.f2244gu = new C0946bo(this.f2242gs, this.f2245gv);
            this.f2241gC.addView(this.f2244gu, 0, m2036a(i, i2, i3, i4));
            this.f2245gv.mo7240aC().mo7262m(false);
        }
    }

    public void close() {
        this.f2242gs.finish();
    }

    /* renamed from: f */
    public void mo7136f(boolean z) {
        this.f2247gx = new C0949bp(this.f2242gs, z ? 50 : 32);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.addRule(10);
        layoutParams.addRule(z ? 11 : 9);
        this.f2247gx.mo7176g(this.f2243gt.f2260gM);
        this.f2241gC.addView(this.f2247gx, layoutParams);
    }

    /* renamed from: g */
    public void mo7137g(boolean z) {
        if (this.f2247gx != null) {
            this.f2247gx.mo7176g(z);
        }
    }

    public void onCreate(Bundle savedInstanceState) {
        boolean z = false;
        if (savedInstanceState != null) {
            z = savedInstanceState.getBoolean("com.google.android.gms.ads.internal.overlay.hasResumed", false);
        }
        this.f2239gA = z;
        try {
            this.f2243gt = C0944bm.m2051a(this.f2242gs.getIntent());
            if (this.f2243gt == null) {
                throw new C0941a("Could not get info for ad overlay.");
            }
            if (savedInstanceState == null) {
                if (this.f2243gt.f2256gI != null) {
                    this.f2243gt.f2256gI.mo7160B();
                }
                if (!(this.f2243gt.f2263gP == 1 || this.f2243gt.f2255gH == null)) {
                    this.f2243gt.f2255gH.mo8822w();
                }
            }
            switch (this.f2243gt.f2263gP) {
                case 1:
                    m2038h(false);
                    return;
                case 2:
                    this.f2246gw = new C0942b(this.f2243gt.f2257gJ);
                    m2038h(false);
                    return;
                case 3:
                    m2038h(true);
                    return;
                case 4:
                    if (this.f2239gA) {
                        this.f2242gs.finish();
                        return;
                    } else if (!C0936bh.m2031a(this.f2242gs, this.f2243gt.f2254gG, this.f2243gt.f2262gO)) {
                        this.f2242gs.finish();
                        return;
                    } else {
                        return;
                    }
                default:
                    throw new C0941a("Could not determine ad overlay type.");
            }
        } catch (C0941a e) {
            C1004ct.m2218v(e.getMessage());
            this.f2242gs.finish();
        }
    }

    public void onDestroy() {
        if (this.f2244gu != null) {
            this.f2244gu.destroy();
        }
        if (this.f2245gv != null) {
            this.f2241gC.removeView(this.f2245gv);
        }
        m2035Z();
    }

    public void onPause() {
        if (this.f2244gu != null) {
            this.f2244gu.pause();
        }
        mo7130X();
        if (this.f2245gv != null && (!this.f2242gs.isFinishing() || this.f2246gw == null)) {
            C0997co.m2175a((WebView) this.f2245gv);
        }
        m2035Z();
    }

    public void onRestart() {
    }

    public void onResume() {
        if (this.f2243gt != null && this.f2243gt.f2263gP == 4) {
            if (this.f2239gA) {
                this.f2242gs.finish();
            } else {
                this.f2239gA = true;
            }
        }
        if (this.f2245gv != null) {
            C0997co.m2185b(this.f2245gv);
        }
    }

    public void onSaveInstanceState(Bundle outBundle) {
        outBundle.putBoolean("com.google.android.gms.ads.internal.overlay.hasResumed", this.f2239gA);
    }

    public void onStart() {
    }

    public void onStop() {
        m2035Z();
    }

    public void setRequestedOrientation(int requestedOrientation) {
        this.f2242gs.setRequestedOrientation(requestedOrientation);
    }
}
