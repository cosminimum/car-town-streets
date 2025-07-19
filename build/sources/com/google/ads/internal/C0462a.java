package com.google.ads.internal;

import android.net.Uri;
import android.webkit.WebView;
import com.google.ads.C0425aa;
import com.google.ads.C0426ab;
import com.google.ads.C0435ai;
import com.google.ads.C0497n;
import com.google.ads.C0498o;
import com.google.ads.C0499p;
import com.google.ads.C0500q;
import com.google.ads.C0501r;
import com.google.ads.C0502s;
import com.google.ads.C0503t;
import com.google.ads.C0504u;
import com.google.ads.C0536v;
import com.google.ads.C0537w;
import com.google.ads.C0538x;
import com.google.ads.C0539y;
import com.google.ads.C0540z;
import com.google.ads.util.AdUtil;
import com.google.ads.util.C0508b;
import com.google.ads.util.C0517f;
import com.google.android.gms.plus.PlusShare;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONObject;

/* renamed from: com.google.ads.internal.a */
public class C0462a {

    /* renamed from: a */
    public static final C0517f<C0462a> f841a = new C0517f<C0462a>() {
        /* renamed from: a */
        public C0462a mo3651b() {
            return C0462a.f844d;
        }
    };

    /* renamed from: b */
    public static final Map<String, C0497n> f842b = Collections.unmodifiableMap(new HashMap<String, C0497n>() {
        {
            put("/invalidRequest", new C0536v());
            put("/loadAdURL", new C0537w());
            put("/loadSdkConstants", new C0538x());
        }
    });

    /* renamed from: c */
    public static final Map<String, C0497n> f843c = Collections.unmodifiableMap(new HashMap<String, C0497n>() {
        {
            put("/open", new C0540z());
            put("/canOpenURLs", new C0499p());
            put("/close", new C0501r());
            put("/customClose", new C0502s());
            put("/appEvent", new C0498o());
            put("/evalInOpener", new C0503t());
            put("/log", new C0539y());
            put("/click", new C0500q());
            put("/httpTrack", new C0504u());
            put("/touch", new C0425aa());
            put("/video", new C0426ab());
            put("/plusOne", new C0435ai());
        }
    });
    /* access modifiers changed from: private */

    /* renamed from: d */
    public static final C0462a f844d = new C0462a();

    /* renamed from: a */
    public String mo3640a(Uri uri, HashMap<String, String> hashMap) {
        if (mo3649c(uri)) {
            String host = uri.getHost();
            if (host == null) {
                C0508b.m1036e("An error occurred while parsing the AMSG parameters.");
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
                C0508b.m1036e("An error occurred while parsing the AMSG: " + uri.toString());
                return null;
            }
        } else if (mo3648b(uri)) {
            return uri.getPath();
        } else {
            C0508b.m1036e("Message was neither a GMSG nor an AMSG.");
            return null;
        }
    }

    /* renamed from: a */
    public void mo3645a(C0475d dVar, Map<String, C0497n> map, Uri uri, WebView webView) {
        HashMap<String, String> b = AdUtil.m1002b(uri);
        if (b == null) {
            C0508b.m1036e("An error occurred while parsing the message parameters.");
            return;
        }
        String a = mo3640a(uri, b);
        if (a == null) {
            C0508b.m1036e("An error occurred while parsing the message.");
            return;
        }
        C0497n nVar = map.get(a);
        if (nVar == null) {
            C0508b.m1036e("No AdResponse found, <message: " + a + ">");
        } else {
            nVar.mo3535a(dVar, b, webView);
        }
    }

    /* renamed from: a */
    public boolean mo3646a(Uri uri) {
        if (uri == null || !uri.isHierarchical()) {
            return false;
        }
        if (mo3648b(uri) || mo3649c(uri)) {
            return true;
        }
        return false;
    }

    /* renamed from: b */
    public boolean mo3648b(Uri uri) {
        String authority;
        String scheme = uri.getScheme();
        if (scheme == null || !scheme.equals("gmsg") || (authority = uri.getAuthority()) == null || !authority.equals("mobileads.google.com")) {
            return false;
        }
        return true;
    }

    /* renamed from: c */
    public boolean mo3649c(Uri uri) {
        String scheme = uri.getScheme();
        if (scheme == null || !scheme.equals("admob")) {
            return false;
        }
        return true;
    }

    /* renamed from: a */
    public void mo3643a(WebView webView, String str, String str2) {
        if (str2 != null) {
            mo3642a(webView, "AFMA_ReceiveMessage" + "('" + str + "', " + str2 + ");");
        } else {
            mo3642a(webView, "AFMA_ReceiveMessage" + "('" + str + "');");
        }
    }

    /* renamed from: a */
    public void mo3642a(WebView webView, String str) {
        C0508b.m1026a("Sending JS to a WebView: " + str);
        webView.loadUrl("javascript:" + str);
    }

    /* renamed from: a */
    public void mo3644a(WebView webView, Map<String, Boolean> map) {
        mo3643a(webView, "openableURLs", new JSONObject(map).toString());
    }

    /* renamed from: a */
    public void mo3641a(WebView webView) {
        mo3643a(webView, "onshow", "{'version': 'afma-sdk-a-v6.2.0'}");
    }

    /* renamed from: b */
    public void mo3647b(WebView webView) {
        mo3643a(webView, "onhide", (String) null);
    }
}
