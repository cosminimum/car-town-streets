package com.google.android.gms.internal;

import android.net.Uri;
import android.net.UrlQuerySanitizer;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import java.util.HashMap;

/* renamed from: com.google.android.gms.internal.cx */
public class C1009cx extends WebViewClient {

    /* renamed from: fm */
    private C0871al f2428fm;

    /* renamed from: fx */
    private final Object f2429fx = new Object();

    /* renamed from: gv */
    protected final C1007cw f2430gv;

    /* renamed from: iU */
    private final HashMap<String, C0880an> f2431iU = new HashMap<>();

    /* renamed from: iV */
    private C1457q f2432iV;

    /* renamed from: iW */
    private C0945bn f2433iW;

    /* renamed from: iX */
    private C1011a f2434iX;

    /* renamed from: iY */
    private boolean f2435iY = false;

    /* renamed from: iZ */
    private boolean f2436iZ;

    /* renamed from: ja */
    private C0950bq f2437ja;

    /* renamed from: com.google.android.gms.internal.cx$a */
    public interface C1011a {
        /* renamed from: a */
        void mo7147a(C1007cw cwVar);
    }

    public C1009cx(C1007cw cwVar, boolean z) {
        this.f2430gv = cwVar;
        this.f2436iZ = z;
    }

    /* renamed from: a */
    private void m2239a(C0944bm bmVar) {
        C0939bk.m2037a(this.f2430gv.getContext(), bmVar);
    }

    /* renamed from: b */
    private static boolean m2240b(Uri uri) {
        String scheme = uri.getScheme();
        return "http".equalsIgnoreCase(scheme) || "https".equalsIgnoreCase(scheme);
    }

    /* renamed from: c */
    private void m2241c(Uri uri) {
        String path = uri.getPath();
        C0880an anVar = this.f2431iU.get(path);
        if (anVar != null) {
            HashMap hashMap = new HashMap();
            UrlQuerySanitizer urlQuerySanitizer = new UrlQuerySanitizer();
            urlQuerySanitizer.setAllowUnregisteredParamaters(true);
            urlQuerySanitizer.setUnregisteredParameterValueSanitizer(UrlQuerySanitizer.getAllButNulLegal());
            urlQuerySanitizer.parseUrl(uri.toString());
            for (UrlQuerySanitizer.ParameterValuePair next : urlQuerySanitizer.getParameterList()) {
                hashMap.put(next.mParameter, next.mValue);
            }
            if (C1004ct.m2213n(2)) {
                C1004ct.m2217u("Received GMSG: " + path);
                for (String str : hashMap.keySet()) {
                    C1004ct.m2217u("  " + str + ": " + ((String) hashMap.get(str)));
                }
            }
            anVar.mo7068a(this.f2430gv, hashMap);
            return;
        }
        C1004ct.m2218v("No GMSG handler found for GMSG: " + uri);
    }

    /* renamed from: Y */
    public final void mo7253Y() {
        synchronized (this.f2429fx) {
            this.f2435iY = false;
            this.f2436iZ = true;
            final C0939bk aB = this.f2430gv.mo7239aB();
            if (aB != null) {
                if (!C1003cs.m2208ay()) {
                    C1003cs.f2412iI.post(new Runnable() {
                        public void run() {
                            aB.mo7131Y();
                        }
                    });
                } else {
                    aB.mo7131Y();
                }
            }
        }
    }

    /* renamed from: a */
    public final void mo7254a(C0938bj bjVar) {
        C0945bn bnVar = null;
        boolean aF = this.f2430gv.mo7243aF();
        C1457q qVar = (!aF || this.f2430gv.mo7250y().f3486eG) ? this.f2432iV : null;
        if (!aF) {
            bnVar = this.f2433iW;
        }
        m2239a(new C0944bm(bjVar, qVar, bnVar, this.f2437ja, this.f2430gv.mo7242aE()));
    }

    /* renamed from: a */
    public final void mo7255a(C1011a aVar) {
        this.f2434iX = aVar;
    }

    /* renamed from: a */
    public void mo7256a(C1457q qVar, C0945bn bnVar, C0871al alVar, C0950bq bqVar, boolean z) {
        mo7257a("/appEvent", (C0880an) new C0870ak(alVar));
        mo7257a("/canOpenURLs", C0872am.f1955fn);
        mo7257a("/click", C0872am.f1956fo);
        mo7257a("/close", C0872am.f1957fp);
        mo7257a("/customClose", C0872am.f1958fq);
        mo7257a("/httpTrack", C0872am.f1959fr);
        mo7257a("/log", C0872am.f1960fs);
        mo7257a("/open", C0872am.f1961ft);
        mo7257a("/touch", C0872am.f1962fu);
        mo7257a("/video", C0872am.f1963fv);
        this.f2432iV = qVar;
        this.f2433iW = bnVar;
        this.f2428fm = alVar;
        this.f2437ja = bqVar;
        mo7262m(z);
    }

    /* renamed from: a */
    public final void mo7257a(String str, C0880an anVar) {
        this.f2431iU.put(str, anVar);
    }

    /* renamed from: a */
    public final void mo7258a(boolean z, int i) {
        m2239a(new C0944bm((!this.f2430gv.mo7243aF() || this.f2430gv.mo7250y().f3486eG) ? this.f2432iV : null, this.f2433iW, this.f2437ja, this.f2430gv, z, i, this.f2430gv.mo7242aE()));
    }

    /* renamed from: a */
    public final void mo7259a(boolean z, int i, String str) {
        C0945bn bnVar = null;
        boolean aF = this.f2430gv.mo7243aF();
        C1457q qVar = (!aF || this.f2430gv.mo7250y().f3486eG) ? this.f2432iV : null;
        if (!aF) {
            bnVar = this.f2433iW;
        }
        m2239a(new C0944bm(qVar, bnVar, this.f2428fm, this.f2437ja, this.f2430gv, z, i, str, this.f2430gv.mo7242aE()));
    }

    /* renamed from: a */
    public final void mo7260a(boolean z, int i, String str, String str2) {
        C0945bn bnVar = null;
        boolean aF = this.f2430gv.mo7243aF();
        C1457q qVar = (!aF || this.f2430gv.mo7250y().f3486eG) ? this.f2432iV : null;
        if (!aF) {
            bnVar = this.f2433iW;
        }
        m2239a(new C0944bm(qVar, bnVar, this.f2428fm, this.f2437ja, this.f2430gv, z, i, str, str2, this.f2430gv.mo7242aE()));
    }

    /* renamed from: aJ */
    public boolean mo7261aJ() {
        boolean z;
        synchronized (this.f2429fx) {
            z = this.f2436iZ;
        }
        return z;
    }

    /* renamed from: m */
    public final void mo7262m(boolean z) {
        this.f2435iY = z;
    }

    public final void onPageFinished(WebView webView, String url) {
        if (this.f2434iX != null) {
            this.f2434iX.mo7147a(this.f2430gv);
            this.f2434iX = null;
        }
    }

    public final void reset() {
        synchronized (this.f2429fx) {
            this.f2431iU.clear();
            this.f2432iV = null;
            this.f2433iW = null;
            this.f2434iX = null;
            this.f2428fm = null;
            this.f2435iY = false;
            this.f2436iZ = false;
            this.f2437ja = null;
        }
    }

    public final boolean shouldOverrideUrlLoading(WebView webView, String url) {
        Uri uri;
        C1004ct.m2217u("AdWebView shouldOverrideUrlLoading: " + url);
        Uri parse = Uri.parse(url);
        if ("gmsg".equalsIgnoreCase(parse.getScheme()) && "mobileads.google.com".equalsIgnoreCase(parse.getHost())) {
            m2241c(parse);
        } else if (this.f2435iY && webView == this.f2430gv && m2240b(parse)) {
            return super.shouldOverrideUrlLoading(webView, url);
        } else {
            if (!this.f2430gv.willNotDraw()) {
                try {
                    C1332h aD = this.f2430gv.mo7241aD();
                    if (aD != null && aD.mo8162a(parse)) {
                        parse = aD.mo8160a(parse, this.f2430gv.getContext());
                    }
                    uri = parse;
                } catch (C1393i e) {
                    C1004ct.m2218v("Unable to append parameter to URL: " + url);
                    uri = parse;
                }
                mo7254a(new C0938bj("android.intent.action.VIEW", uri.toString(), (String) null, (String) null, (String) null, (String) null, (String) null));
            } else {
                C1004ct.m2218v("AdWebView unable to handle URL: " + url);
            }
        }
        return true;
    }
}
