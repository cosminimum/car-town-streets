package com.google.ads;

import android.webkit.WebView;
import com.facebook.internal.ServerProtocol;
import com.google.ads.internal.c;
import com.google.ads.internal.d;
import com.google.ads.util.b;
import com.google.android.gms.plus.PlusShare;
import java.util.HashMap;

public class w implements n {
    public void a(d dVar, HashMap<String, String> hashMap, WebView webView) {
        c.d dVar2;
        String str = hashMap.get(PlusShare.KEY_CALL_TO_ACTION_URL);
        String str2 = hashMap.get(ServerProtocol.DIALOG_PARAM_TYPE);
        String str3 = hashMap.get("afma_notify_dt");
        boolean equals = "1".equals(hashMap.get("drt_include"));
        String str4 = hashMap.get("request_scenario");
        boolean equals2 = "1".equals(hashMap.get("use_webview_loadurl"));
        if (c.d.OFFLINE_EMPTY.e.equals(str4)) {
            dVar2 = c.d.OFFLINE_EMPTY;
        } else if (c.d.OFFLINE_USING_BUFFERED_ADS.e.equals(str4)) {
            dVar2 = c.d.OFFLINE_USING_BUFFERED_ADS;
        } else if (c.d.ONLINE_USING_BUFFERED_ADS.e.equals(str4)) {
            dVar2 = c.d.ONLINE_USING_BUFFERED_ADS;
        } else {
            dVar2 = c.d.ONLINE_SERVER_REQUEST;
        }
        b.c("Received ad url: <url: \"" + str + "\" type: \"" + str2 + "\" afmaNotifyDt: \"" + str3 + "\" useWebViewLoadUrl: \"" + equals2 + "\">");
        c j = dVar.j();
        if (j != null) {
            j.c(equals);
            j.a(dVar2);
            j.d(equals2);
            j.d(str);
        }
    }
}
