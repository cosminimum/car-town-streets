package com.google.ads;

import android.webkit.WebView;
import com.facebook.internal.ServerProtocol;
import com.google.ads.internal.C0467c;
import com.google.ads.internal.C0475d;
import com.google.ads.util.C0508b;
import com.google.android.gms.plus.PlusShare;
import java.util.HashMap;

/* renamed from: com.google.ads.w */
public class C0537w implements C0497n {
    /* renamed from: a */
    public void mo3535a(C0475d dVar, HashMap<String, String> hashMap, WebView webView) {
        C0467c.C0473d dVar2;
        String str = hashMap.get(PlusShare.KEY_CALL_TO_ACTION_URL);
        String str2 = hashMap.get(ServerProtocol.DIALOG_PARAM_TYPE);
        String str3 = hashMap.get("afma_notify_dt");
        boolean equals = "1".equals(hashMap.get("drt_include"));
        String str4 = hashMap.get("request_scenario");
        boolean equals2 = "1".equals(hashMap.get("use_webview_loadurl"));
        if (C0467c.C0473d.OFFLINE_EMPTY.f886e.equals(str4)) {
            dVar2 = C0467c.C0473d.OFFLINE_EMPTY;
        } else if (C0467c.C0473d.OFFLINE_USING_BUFFERED_ADS.f886e.equals(str4)) {
            dVar2 = C0467c.C0473d.OFFLINE_USING_BUFFERED_ADS;
        } else if (C0467c.C0473d.ONLINE_USING_BUFFERED_ADS.f886e.equals(str4)) {
            dVar2 = C0467c.C0473d.ONLINE_USING_BUFFERED_ADS;
        } else {
            dVar2 = C0467c.C0473d.ONLINE_SERVER_REQUEST;
        }
        C0508b.m1032c("Received ad url: <url: \"" + str + "\" type: \"" + str2 + "\" afmaNotifyDt: \"" + str3 + "\" useWebViewLoadUrl: \"" + equals2 + "\">");
        C0467c j = dVar.mo3710j();
        if (j != null) {
            j.mo3671c(equals);
            j.mo3662a(dVar2);
            j.mo3673d(equals2);
            j.mo3672d(str);
        }
    }
}
