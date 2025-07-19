package com.google.ads.util;

import android.annotation.TargetApi;
import android.view.View;
import android.webkit.WebChromeClient;
import com.google.ads.C0491m;
import com.google.ads.util.C0518g;

@TargetApi(14)
/* renamed from: com.google.ads.util.h */
public class C0528h {

    /* renamed from: com.google.ads.util.h$a */
    public static class C0529a extends C0518g.C0520a {
        public C0529a(C0491m mVar) {
            super(mVar);
        }

        public void onShowCustomView(View view, int requestedOrientation, WebChromeClient.CustomViewCallback callback) {
            callback.onCustomViewHidden();
        }
    }
}
