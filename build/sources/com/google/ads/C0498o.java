package com.google.ads;

import android.webkit.WebView;
import com.google.ads.internal.C0475d;
import com.google.ads.util.C0508b;
import java.util.HashMap;

/* renamed from: com.google.ads.o */
public class C0498o implements C0497n {
    /* renamed from: a */
    public void mo3535a(C0475d dVar, HashMap<String, String> hashMap, WebView webView) {
        String str = hashMap.get("name");
        if (str == null) {
            C0508b.m1030b("Error: App event with no name parameter.");
        } else {
            dVar.mo3695a(str, hashMap.get("info"));
        }
    }
}
