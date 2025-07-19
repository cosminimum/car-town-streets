package com.google.ads;

import android.webkit.WebView;
import com.facebook.internal.ServerProtocol;
import com.google.ads.AdRequest;
import com.google.ads.internal.C0467c;
import com.google.ads.internal.C0475d;
import com.google.ads.util.C0508b;
import java.util.HashMap;

/* renamed from: com.google.ads.v */
public class C0536v implements C0497n {
    /* renamed from: a */
    public void mo3535a(C0475d dVar, HashMap<String, String> hashMap, WebView webView) {
        C0508b.m1036e("Invalid " + hashMap.get(ServerProtocol.DIALOG_PARAM_TYPE) + " request error: " + hashMap.get("errors"));
        C0467c j = dVar.mo3710j();
        if (j != null) {
            j.mo3658a(AdRequest.ErrorCode.INVALID_REQUEST);
        }
    }
}
