package com.google.ads;

import android.webkit.WebView;
import java.util.HashMap;
/* loaded from: classes.dex */
public class u implements n {
    @Override // com.google.ads.n
    public void a(com.google.ads.internal.d dVar, HashMap<String, String> hashMap, WebView webView) {
        String str = hashMap.get("u");
        if (str == null) {
            com.google.ads.util.b.e("Could not get URL from click gmsg.");
        } else {
            new Thread(a(str, webView)).start();
        }
    }

    protected Runnable a(String str, WebView webView) {
        return new ac(str, webView.getContext().getApplicationContext());
    }
}
