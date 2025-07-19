package com.google.android.gms.internal;

import android.content.Context;
import android.webkit.WebSettings;

/* renamed from: com.google.android.gms.internal.cq */
public final class C1001cq {
    /* renamed from: a */
    public static void m2200a(Context context, WebSettings webSettings) {
        C1000cp.m2194a(context, webSettings);
        webSettings.setMediaPlaybackRequiresUserGesture(false);
    }

    public static String getDefaultUserAgent(Context context) {
        return WebSettings.getDefaultUserAgent(context);
    }
}
