package com.google.android.gms.internal;

import android.content.Context;
import android.webkit.WebResourceResponse;
import android.webkit.WebView;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

/* renamed from: com.google.android.gms.internal.cz */
public final class C1020cz extends C1009cx {
    public C1020cz(C1007cw cwVar, boolean z) {
        super(cwVar, z);
    }

    /* renamed from: d */
    private static WebResourceResponse m2257d(Context context, String str, String str2) throws IOException {
        HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(str2).openConnection();
        try {
            C0997co.m2174a(context, str, true, httpURLConnection);
            httpURLConnection.connect();
            return new WebResourceResponse("application/javascript", "UTF-8", new ByteArrayInputStream(C0997co.m2168a((Readable) new InputStreamReader(httpURLConnection.getInputStream())).getBytes("UTF-8")));
        } finally {
            httpURLConnection.disconnect();
        }
    }

    public WebResourceResponse shouldInterceptRequest(WebView webView, String url) {
        try {
            if (!"mraid.js".equalsIgnoreCase(new File(url).getName())) {
                return super.shouldInterceptRequest(webView, url);
            }
            if (!(webView instanceof C1007cw)) {
                C1004ct.m2218v("Tried to intercept request from a WebView that wasn't an AdWebView.");
                return super.shouldInterceptRequest(webView, url);
            }
            C1007cw cwVar = (C1007cw) webView;
            cwVar.mo7240aC().mo7253Y();
            if (cwVar.mo7250y().f3486eG) {
                C1004ct.m2217u("shouldInterceptRequest(http://media.admob.com/mraid/v1/mraid_app_interstitial.js)");
                return m2257d(cwVar.getContext(), this.f2430gv.mo7242aE().f2413iJ, "http://media.admob.com/mraid/v1/mraid_app_interstitial.js");
            } else if (cwVar.mo7243aF()) {
                C1004ct.m2217u("shouldInterceptRequest(http://media.admob.com/mraid/v1/mraid_app_expanded_banner.js)");
                return m2257d(cwVar.getContext(), this.f2430gv.mo7242aE().f2413iJ, "http://media.admob.com/mraid/v1/mraid_app_expanded_banner.js");
            } else {
                C1004ct.m2217u("shouldInterceptRequest(http://media.admob.com/mraid/v1/mraid_app_banner.js)");
                return m2257d(cwVar.getContext(), this.f2430gv.mo7242aE().f2413iJ, "http://media.admob.com/mraid/v1/mraid_app_banner.js");
            }
        } catch (IOException e) {
            C1004ct.m2218v("Could not fetching MRAID JS. " + e.getMessage());
            return super.shouldInterceptRequest(webView, url);
        }
    }
}
