package com.google.ads;

import android.webkit.WebView;
import com.google.ads.AdActivity;
import com.google.ads.internal.C0475d;
import com.google.ads.internal.C0476e;
import com.google.ads.util.C0508b;
import java.util.HashMap;

/* renamed from: com.google.ads.z */
public class C0540z implements C0497n {

    /* renamed from: a */
    private AdActivity.StaticMethodWrapper f1103a;

    public C0540z() {
        this(new AdActivity.StaticMethodWrapper());
    }

    public C0540z(AdActivity.StaticMethodWrapper staticMethodWrapper) {
        this.f1103a = staticMethodWrapper;
    }

    /* renamed from: a */
    public void mo3535a(C0475d dVar, HashMap<String, String> hashMap, WebView webView) {
        String str = hashMap.get("a");
        if (str == null) {
            C0508b.m1026a("Could not get the action parameter for open GMSG.");
        } else if (str.equals("webapp")) {
            this.f1103a.launchAdActivity(dVar, new C0476e("webapp", hashMap));
        } else if (str.equals("expand")) {
            this.f1103a.launchAdActivity(dVar, new C0476e("expand", hashMap));
        } else {
            this.f1103a.launchAdActivity(dVar, new C0476e("intent", hashMap));
        }
    }
}
