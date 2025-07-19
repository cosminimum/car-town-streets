package com.google.ads;

import android.webkit.WebView;
import com.google.ads.AdActivity;
import java.util.HashMap;
/* loaded from: classes.dex */
public class z implements n {
    private AdActivity.StaticMethodWrapper a;

    public z() {
        this(new AdActivity.StaticMethodWrapper());
    }

    public z(AdActivity.StaticMethodWrapper staticMethodWrapper) {
        this.a = staticMethodWrapper;
    }

    @Override // com.google.ads.n
    public void a(com.google.ads.internal.d dVar, HashMap<String, String> hashMap, WebView webView) {
        String str = hashMap.get("a");
        if (str == null) {
            com.google.ads.util.b.a("Could not get the action parameter for open GMSG.");
        } else if (str.equals("webapp")) {
            this.a.launchAdActivity(dVar, new com.google.ads.internal.e("webapp", hashMap));
        } else if (str.equals("expand")) {
            this.a.launchAdActivity(dVar, new com.google.ads.internal.e("expand", hashMap));
        } else {
            this.a.launchAdActivity(dVar, new com.google.ads.internal.e("intent", hashMap));
        }
    }
}
