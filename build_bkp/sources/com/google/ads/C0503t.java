package com.google.ads;

import android.webkit.WebView;
import com.google.ads.internal.AdWebView;
import com.google.ads.internal.C0462a;
import com.google.ads.internal.C0475d;
import com.google.ads.util.C0508b;
import java.util.HashMap;

/* renamed from: com.google.ads.t */
public class C0503t implements C0497n {

    /* renamed from: a */
    private static final C0462a f1032a = C0462a.f841a.mo3651b();

    /* renamed from: a */
    public void mo3535a(C0475d dVar, HashMap<String, String> hashMap, WebView webView) {
        String str = hashMap.get("js");
        if (str == null) {
            C0508b.m1030b("Could not get the JS to evaluate.");
        } else if (webView instanceof AdWebView) {
            AdActivity d = ((AdWebView) webView).mo3627d();
            if (d == null) {
                C0508b.m1030b("Could not get the AdActivity from the AdWebView.");
                return;
            }
            AdWebView openingAdWebView = d.getOpeningAdWebView();
            if (openingAdWebView == null) {
                C0508b.m1030b("Could not get the opening WebView.");
            } else {
                f1032a.mo3642a((WebView) openingAdWebView, str);
            }
        } else {
            C0508b.m1030b("Trying to evaluate JS in a WebView that isn't an AdWebView");
        }
    }
}
