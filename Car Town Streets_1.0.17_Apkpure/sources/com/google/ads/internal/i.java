package com.google.ads.internal;

import android.net.Uri;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.google.ads.AdActivity;
import com.google.ads.n;
import com.google.ads.util.AdUtil;
import com.google.ads.util.g;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes.dex */
public class i extends WebViewClient {
    private static final a c = a.a.b();
    protected d a;
    private final Map<String, n> d;
    private final boolean e;
    private boolean f;
    protected boolean b = false;
    private boolean g = false;
    private boolean h = false;

    public i(d dVar, Map<String, n> map, boolean z, boolean z2) {
        this.a = dVar;
        this.d = map;
        this.e = z;
        this.f = z2;
    }

    public static i a(d dVar, Map<String, n> map, boolean z, boolean z2) {
        return AdUtil.a >= 11 ? new g.b(dVar, map, z, z2) : new i(dVar, map, z, z2);
    }

    @Override // android.webkit.WebViewClient
    public boolean shouldOverrideUrlLoading(WebView webView, String url) {
        boolean z = true;
        try {
            com.google.ads.util.b.a("shouldOverrideUrlLoading(\"" + url + "\")");
            Uri parse = Uri.parse(url);
            if (c.a(parse)) {
                c.a(this.a, this.d, parse, webView);
            } else if (this.f) {
                if (AdUtil.a(parse)) {
                    z = super.shouldOverrideUrlLoading(webView, url);
                } else {
                    HashMap hashMap = new HashMap();
                    hashMap.put("u", url);
                    AdActivity.launchAdActivity(this.a, new e("intent", hashMap));
                }
            } else if (this.e) {
                HashMap hashMap2 = new HashMap();
                hashMap2.put("u", parse.toString());
                AdActivity.launchAdActivity(this.a, new e("intent", hashMap2));
            } else {
                com.google.ads.util.b.e("URL is not a GMSG and can't handle URL: " + url);
            }
        } catch (Throwable th) {
            com.google.ads.util.b.b("An unknown error occurred in shouldOverrideUrlLoading.", th);
        }
        return z;
    }

    @Override // android.webkit.WebViewClient
    public void onPageFinished(WebView view, String url) {
        if (this.g) {
            c j = this.a.j();
            if (j != null) {
                j.c();
            } else {
                com.google.ads.util.b.a("adLoader was null while trying to setFinishedLoadingHtml().");
            }
            this.g = false;
        }
        if (this.h) {
            c.a(view);
            this.h = false;
        }
    }

    public void a(boolean z) {
        this.b = z;
    }

    public void b(boolean z) {
        this.f = z;
    }

    public void c(boolean z) {
        this.g = z;
    }

    public void d(boolean z) {
        this.h = z;
    }
}
