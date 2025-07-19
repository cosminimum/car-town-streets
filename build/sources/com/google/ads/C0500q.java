package com.google.ads;

import android.net.Uri;
import android.webkit.WebView;
import com.google.ads.internal.C0475d;
import com.google.ads.internal.C0480g;
import com.google.ads.util.C0508b;
import java.util.HashMap;
import java.util.Locale;

/* renamed from: com.google.ads.q */
public class C0500q extends C0504u {
    /* renamed from: a */
    public void mo3535a(C0475d dVar, HashMap<String, String> hashMap, WebView webView) {
        Uri parse;
        String host;
        String str = hashMap.get("u");
        if (str == null) {
            C0508b.m1036e("Could not get URL from click gmsg.");
            return;
        }
        C0480g m = dVar.mo3713m();
        if (!(m == null || (host = parse.getHost()) == null || !host.toLowerCase(Locale.US).endsWith(".admob.com"))) {
            String str2 = null;
            String path = (parse = Uri.parse(str)).getPath();
            if (path != null) {
                String[] split = path.split("/");
                if (split.length >= 4) {
                    str2 = split[2] + "/" + split[3];
                }
            }
            m.mo3741a(str2);
        }
        super.mo3535a(dVar, hashMap, webView);
    }
}
