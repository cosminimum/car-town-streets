package com.google.ads.internal;

import android.net.Uri;
import android.webkit.WebView;
import com.google.ads.aa;
import com.google.ads.ab;
import com.google.ads.ai;
import com.google.ads.n;
import com.google.ads.o;
import com.google.ads.p;
import com.google.ads.q;
import com.google.ads.r;
import com.google.ads.s;
import com.google.ads.t;
import com.google.ads.u;
import com.google.ads.util.AdUtil;
import com.google.ads.v;
import com.google.ads.w;
import com.google.ads.x;
import com.google.ads.y;
import com.google.ads.z;
import com.google.android.gms.plus.PlusShare;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class a {
    private static final a d = new a();
    public static final com.google.ads.util.f<a> a = new com.google.ads.util.f<a>() { // from class: com.google.ads.internal.a.2
        @Override // com.google.ads.util.f
        /* renamed from: a */
        public a b() {
            return a.d;
        }
    };
    public static final Map<String, n> b = Collections.unmodifiableMap(new HashMap<String, n>() { // from class: com.google.ads.internal.a.3
        {
            put("/invalidRequest", new v());
            put("/loadAdURL", new w());
            put("/loadSdkConstants", new x());
        }
    });
    public static final Map<String, n> c = Collections.unmodifiableMap(new HashMap<String, n>() { // from class: com.google.ads.internal.a.1
        {
            put("/open", new z());
            put("/canOpenURLs", new p());
            put("/close", new r());
            put("/customClose", new s());
            put("/appEvent", new o());
            put("/evalInOpener", new t());
            put("/log", new y());
            put("/click", new q());
            put("/httpTrack", new u());
            put("/touch", new aa());
            put("/video", new ab());
            put("/plusOne", new ai());
        }
    });

    public String a(Uri uri, HashMap<String, String> hashMap) {
        if (c(uri)) {
            String host = uri.getHost();
            if (host == null) {
                com.google.ads.util.b.e("An error occurred while parsing the AMSG parameters.");
                return null;
            } else if (host.equals("launch")) {
                hashMap.put("a", "intent");
                hashMap.put("u", hashMap.get(PlusShare.KEY_CALL_TO_ACTION_URL));
                hashMap.remove(PlusShare.KEY_CALL_TO_ACTION_URL);
                return "/open";
            } else if (host.equals("closecanvas")) {
                return "/close";
            } else {
                if (host.equals("log")) {
                    return "/log";
                }
                com.google.ads.util.b.e("An error occurred while parsing the AMSG: " + uri.toString());
                return null;
            }
        } else if (b(uri)) {
            return uri.getPath();
        } else {
            com.google.ads.util.b.e("Message was neither a GMSG nor an AMSG.");
            return null;
        }
    }

    public void a(d dVar, Map<String, n> map, Uri uri, WebView webView) {
        HashMap<String, String> b2 = AdUtil.b(uri);
        if (b2 == null) {
            com.google.ads.util.b.e("An error occurred while parsing the message parameters.");
            return;
        }
        String a2 = a(uri, b2);
        if (a2 == null) {
            com.google.ads.util.b.e("An error occurred while parsing the message.");
            return;
        }
        n nVar = map.get(a2);
        if (nVar == null) {
            com.google.ads.util.b.e("No AdResponse found, <message: " + a2 + ">");
        } else {
            nVar.a(dVar, b2, webView);
        }
    }

    public boolean a(Uri uri) {
        if (uri == null || !uri.isHierarchical()) {
            return false;
        }
        return b(uri) || c(uri);
    }

    public boolean b(Uri uri) {
        String authority;
        String scheme = uri.getScheme();
        return scheme != null && scheme.equals("gmsg") && (authority = uri.getAuthority()) != null && authority.equals("mobileads.google.com");
    }

    public boolean c(Uri uri) {
        String scheme = uri.getScheme();
        return scheme != null && scheme.equals("admob");
    }

    public void a(WebView webView, String str, String str2) {
        if (str2 != null) {
            a(webView, "AFMA_ReceiveMessage('" + str + "', " + str2 + ");");
        } else {
            a(webView, "AFMA_ReceiveMessage('" + str + "');");
        }
    }

    public void a(WebView webView, String str) {
        com.google.ads.util.b.a("Sending JS to a WebView: " + str);
        webView.loadUrl("javascript:" + str);
    }

    public void a(WebView webView, Map<String, Boolean> map) {
        a(webView, "openableURLs", new JSONObject(map).toString());
    }

    public void a(WebView webView) {
        a(webView, "onshow", "{'version': 'afma-sdk-a-v6.2.0'}");
    }

    public void b(WebView webView) {
        a(webView, "onhide", null);
    }
}
