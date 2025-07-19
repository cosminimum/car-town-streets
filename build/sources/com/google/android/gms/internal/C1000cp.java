package com.google.android.gms.internal;

import android.content.Context;
import android.graphics.Paint;
import android.view.View;
import android.view.Window;
import android.webkit.WebSettings;
import android.webkit.WebView;
import java.io.File;

/* renamed from: com.google.android.gms.internal.cp */
public final class C1000cp {
    /* renamed from: a */
    public static void m2194a(Context context, WebSettings webSettings) {
        webSettings.setAppCachePath(new File(context.getCacheDir(), "com.google.android.gms.ads.appcache").getAbsolutePath());
        webSettings.setAppCacheMaxSize(0);
        webSettings.setAppCacheEnabled(true);
        webSettings.setDatabasePath(context.getDatabasePath("com.google.android.gms.ads.db").getAbsolutePath());
        webSettings.setDatabaseEnabled(true);
        webSettings.setDomStorageEnabled(true);
        webSettings.setDisplayZoomControls(false);
        webSettings.setBuiltInZoomControls(true);
        webSettings.setSupportZoom(true);
    }

    /* renamed from: a */
    public static void m2195a(Window window) {
        window.setFlags(16777216, 16777216);
    }

    /* renamed from: a */
    public static void m2196a(WebView webView) {
        webView.onPause();
    }

    /* renamed from: b */
    public static void m2197b(WebView webView) {
        webView.onResume();
    }

    /* renamed from: c */
    public static void m2198c(View view) {
        view.setLayerType(1, (Paint) null);
    }

    /* renamed from: d */
    public static void m2199d(View view) {
        view.setLayerType(0, (Paint) null);
    }
}
