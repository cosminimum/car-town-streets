package com.flurry.android;

import android.content.Context;
import android.webkit.WebView;
import android.webkit.WebViewClient;
/* loaded from: classes.dex */
final class q extends WebViewClient {
    private /* synthetic */ CatalogActivity a;

    /* JADX INFO: Access modifiers changed from: package-private */
    public q(CatalogActivity catalogActivity) {
        this.a = catalogActivity;
    }

    @Override // android.webkit.WebViewClient
    public final boolean shouldOverrideUrlLoading(WebView webView, String str) {
        p pVar;
        u uVar;
        p pVar2;
        p pVar3;
        long k;
        if (str != null) {
            pVar = this.a.f;
            if (pVar != null) {
                pVar3 = this.a.f;
                k = this.a.e.k();
                pVar3.a(new f((byte) 6, k));
            }
            uVar = this.a.e;
            Context context = webView.getContext();
            pVar2 = this.a.f;
            uVar.a(context, pVar2, str);
            return true;
        }
        return false;
    }

    @Override // android.webkit.WebViewClient
    public final void onReceivedError(WebView webView, int i, String str, String str2) {
        ah.c("FlurryAgent", "Failed to load url: " + str2 + " with an errorCode of " + i);
        webView.loadData("Cannot find Android Market information. <p>Please check your network", "text/html", "UTF-8");
    }

    @Override // android.webkit.WebViewClient
    public final void onPageFinished(WebView webView, String str) {
        p pVar;
        long k;
        p pVar2;
        try {
            pVar = this.a.f;
            k = this.a.e.k();
            f fVar = new f((byte) 5, k);
            pVar2 = this.a.f;
            long j = pVar2.c;
            pVar.d.add(fVar);
            pVar.c = j;
        } catch (Exception e) {
        }
    }
}
