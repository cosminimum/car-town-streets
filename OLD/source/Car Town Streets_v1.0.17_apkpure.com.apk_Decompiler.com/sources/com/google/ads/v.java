package com.google.ads;

import android.webkit.WebView;
import com.facebook.internal.ServerProtocol;
import com.google.ads.AdRequest;
import com.google.ads.internal.c;
import com.google.ads.internal.d;
import com.google.ads.util.b;
import java.util.HashMap;

public class v implements n {
    public void a(d dVar, HashMap<String, String> hashMap, WebView webView) {
        b.e("Invalid " + hashMap.get(ServerProtocol.DIALOG_PARAM_TYPE) + " request error: " + hashMap.get("errors"));
        c j = dVar.j();
        if (j != null) {
            j.a(AdRequest.ErrorCode.INVALID_REQUEST);
        }
    }
}
