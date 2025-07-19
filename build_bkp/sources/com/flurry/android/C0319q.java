package com.flurry.android;

import android.webkit.WebView;
import android.webkit.WebViewClient;

/* renamed from: com.flurry.android.q */
final class C0319q extends WebViewClient {

    /* renamed from: a */
    private /* synthetic */ CatalogActivity f614a;

    C0319q(CatalogActivity catalogActivity) {
        this.f614a = catalogActivity;
    }

    public final boolean shouldOverrideUrlLoading(WebView webView, String str) {
        if (str == null) {
            return false;
        }
        if (this.f614a.f417f != null) {
            this.f614a.f417f.mo2419a(new C0308f((byte) 6, this.f614a.f416e.mo2453k()));
        }
        this.f614a.f416e.mo2433a(webView.getContext(), this.f614a.f417f, str);
        return true;
    }

    public final void onReceivedError(WebView webView, int i, String str, String str2) {
        C0299ah.m540c("FlurryAgent", "Failed to load url: " + str2 + " with an errorCode of " + i);
        webView.loadData("Cannot find Android Market information. <p>Please check your network", "text/html", "UTF-8");
    }

    public final void onPageFinished(WebView webView, String str) {
        try {
            C0318p a = this.f614a.f417f;
            C0308f fVar = new C0308f((byte) 5, this.f614a.f416e.mo2453k());
            long j = this.f614a.f417f.f611c;
            a.f612d.add(fVar);
            a.f611c = j;
        } catch (Exception e) {
        }
    }
}
