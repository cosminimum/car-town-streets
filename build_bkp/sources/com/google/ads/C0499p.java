package com.google.ads;

import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.webkit.WebView;
import com.google.ads.internal.C0462a;
import com.google.ads.internal.C0475d;
import com.google.ads.util.C0508b;
import java.util.HashMap;
import java.util.Map;

/* renamed from: com.google.ads.p */
public class C0499p implements C0497n {

    /* renamed from: a */
    private static final C0462a f1016a = C0462a.f841a.mo3651b();

    /* renamed from: a */
    public void mo3535a(C0475d dVar, HashMap<String, String> hashMap, WebView webView) {
        boolean z;
        String str = hashMap.get("urls");
        if (str == null) {
            C0508b.m1036e("Could not get the urls param from canOpenURLs gmsg.");
            return;
        }
        String[] split = str.split(",");
        HashMap hashMap2 = new HashMap();
        PackageManager packageManager = webView.getContext().getPackageManager();
        for (String str2 : split) {
            String[] split2 = str2.split(";", 2);
            if (packageManager.resolveActivity(new Intent(split2.length >= 2 ? split2[1] : "android.intent.action.VIEW", Uri.parse(split2[0])), 65536) != null) {
                z = true;
            } else {
                z = false;
            }
            hashMap2.put(str2, Boolean.valueOf(z));
        }
        f1016a.mo3644a(webView, (Map<String, Boolean>) hashMap2);
    }
}
