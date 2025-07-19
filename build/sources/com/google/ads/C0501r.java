package com.google.ads;

import android.webkit.WebView;
import com.google.ads.internal.AdWebView;
import com.google.ads.internal.C0475d;
import com.google.ads.util.C0508b;
import java.util.HashMap;

/* renamed from: com.google.ads.r */
public class C0501r implements C0497n {
    /* renamed from: a */
    public void mo3535a(C0475d dVar, HashMap<String, String> hashMap, WebView webView) {
        if (webView instanceof AdWebView) {
            ((AdWebView) webView).mo3624a();
        } else {
            C0508b.m1030b("Trying to close WebView that isn't an AdWebView");
        }
    }
}
