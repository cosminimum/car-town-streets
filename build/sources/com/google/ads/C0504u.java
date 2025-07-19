package com.google.ads;

import android.webkit.WebView;
import com.google.ads.internal.C0475d;
import com.google.ads.util.C0508b;
import java.util.HashMap;

/* renamed from: com.google.ads.u */
public class C0504u implements C0497n {
    /* renamed from: a */
    public void mo3535a(C0475d dVar, HashMap<String, String> hashMap, WebView webView) {
        String str = hashMap.get("u");
        if (str == null) {
            C0508b.m1036e("Could not get URL from click gmsg.");
        } else {
            new Thread(mo3847a(str, webView)).start();
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public Runnable mo3847a(String str, WebView webView) {
        return new C0427ac(str, webView.getContext().getApplicationContext());
    }
}
