package com.google.ads;

import android.webkit.WebView;
import com.google.ads.internal.AdWebView;
import com.google.ads.internal.C0475d;
import com.google.ads.util.C0508b;
import java.util.HashMap;

/* renamed from: com.google.ads.s */
public class C0502s implements C0497n {
    /* renamed from: a */
    public void mo3535a(C0475d dVar, HashMap<String, String> hashMap, WebView webView) {
        if (webView instanceof AdWebView) {
            ((AdWebView) webView).setCustomClose("1".equals(hashMap.get(AdActivity.CUSTOM_CLOSE_PARAM)));
        } else {
            C0508b.m1030b("Trying to set a custom close icon on a WebView that isn't an AdWebView");
        }
    }
}
