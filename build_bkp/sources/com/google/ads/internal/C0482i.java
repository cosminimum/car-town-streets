package com.google.ads.internal;

import android.net.Uri;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.google.ads.AdActivity;
import com.google.ads.C0497n;
import com.google.ads.util.AdUtil;
import com.google.ads.util.C0508b;
import com.google.ads.util.C0518g;
import java.util.HashMap;
import java.util.Map;

/* renamed from: com.google.ads.internal.i */
public class C0482i extends WebViewClient {

    /* renamed from: c */
    private static final C0462a f948c = C0462a.f841a.mo3651b();

    /* renamed from: a */
    protected C0475d f949a;

    /* renamed from: b */
    protected boolean f950b = false;

    /* renamed from: d */
    private final Map<String, C0497n> f951d;

    /* renamed from: e */
    private final boolean f952e;

    /* renamed from: f */
    private boolean f953f;

    /* renamed from: g */
    private boolean f954g = false;

    /* renamed from: h */
    private boolean f955h = false;

    public C0482i(C0475d dVar, Map<String, C0497n> map, boolean z, boolean z2) {
        this.f949a = dVar;
        this.f951d = map;
        this.f952e = z;
        this.f953f = z2;
    }

    /* renamed from: a */
    public static C0482i m948a(C0475d dVar, Map<String, C0497n> map, boolean z, boolean z2) {
        if (AdUtil.f1033a >= 11) {
            return new C0518g.C0527b(dVar, map, z, z2);
        }
        return new C0482i(dVar, map, z, z2);
    }

    public boolean shouldOverrideUrlLoading(WebView webView, String url) {
        try {
            C0508b.m1026a("shouldOverrideUrlLoading(\"" + url + "\")");
            Uri parse = Uri.parse(url);
            if (f948c.mo3646a(parse)) {
                f948c.mo3645a(this.f949a, this.f951d, parse, webView);
                return true;
            } else if (this.f953f) {
                if (AdUtil.m996a(parse)) {
                    return super.shouldOverrideUrlLoading(webView, url);
                }
                HashMap hashMap = new HashMap();
                hashMap.put("u", url);
                AdActivity.launchAdActivity(this.f949a, new C0476e("intent", hashMap));
                return true;
            } else if (this.f952e) {
                HashMap hashMap2 = new HashMap();
                hashMap2.put("u", parse.toString());
                AdActivity.launchAdActivity(this.f949a, new C0476e("intent", hashMap2));
                return true;
            } else {
                C0508b.m1036e("URL is not a GMSG and can't handle URL: " + url);
                return true;
            }
        } catch (Throwable th) {
            C0508b.m1031b("An unknown error occurred in shouldOverrideUrlLoading.", th);
            return true;
        }
    }

    public void onPageFinished(WebView view, String url) {
        if (this.f954g) {
            C0467c j = this.f949a.mo3710j();
            if (j != null) {
                j.mo3669c();
            } else {
                C0508b.m1026a("adLoader was null while trying to setFinishedLoadingHtml().");
            }
            this.f954g = false;
        }
        if (this.f955h) {
            f948c.mo3641a(view);
            this.f955h = false;
        }
    }

    /* renamed from: a */
    public void mo3770a(boolean z) {
        this.f950b = z;
    }

    /* renamed from: b */
    public void mo3771b(boolean z) {
        this.f953f = z;
    }

    /* renamed from: c */
    public void mo3772c(boolean z) {
        this.f954g = z;
    }

    /* renamed from: d */
    public void mo3773d(boolean z) {
        this.f955h = z;
    }
}
