package com.google.ads;

import android.app.Activity;
import android.os.SystemClock;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.MotionEvent;
import android.webkit.WebView;
import com.getjar.sdk.utilities.Constants;
import com.google.ads.internal.AdVideoView;
import com.google.ads.internal.AdWebView;
import com.google.ads.internal.C0462a;
import com.google.ads.internal.C0475d;
import com.google.ads.util.AdUtil;
import com.google.ads.util.C0508b;
import java.util.HashMap;

/* renamed from: com.google.ads.ab */
public class C0426ab implements C0497n {

    /* renamed from: a */
    private static final C0462a f729a = C0462a.f841a.mo3651b();

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public int mo3536a(HashMap<String, String> hashMap, String str, int i, DisplayMetrics displayMetrics) {
        String str2 = hashMap.get(str);
        if (str2 == null) {
            return i;
        }
        try {
            return (int) TypedValue.applyDimension(1, (float) Integer.parseInt(str2), displayMetrics);
        } catch (NumberFormatException e) {
            C0508b.m1026a("Could not parse \"" + str + "\" in a video gmsg: " + str2);
            return i;
        }
    }

    /* renamed from: a */
    public void mo3535a(C0475d dVar, HashMap<String, String> hashMap, WebView webView) {
        String str = hashMap.get("action");
        if (str == null) {
            C0508b.m1026a("No \"action\" parameter in a video gmsg.");
        } else if (webView instanceof AdWebView) {
            AdWebView adWebView = (AdWebView) webView;
            AdActivity d = adWebView.mo3627d();
            if (d == null) {
                C0508b.m1026a("Could not get adActivity for a video gmsg.");
                return;
            }
            boolean equals = str.equals("new");
            boolean equals2 = str.equals("position");
            if (equals || equals2) {
                DisplayMetrics a = AdUtil.m985a((Activity) d);
                int a2 = mo3536a(hashMap, Constants.f677X, 0, a);
                int a3 = mo3536a(hashMap, Constants.f678Y, 0, a);
                int a4 = mo3536a(hashMap, "w", -1, a);
                int a5 = mo3536a(hashMap, "h", -1, a);
                if (!equals || d.getAdVideoView() != null) {
                    d.moveAdVideoView(a2, a3, a4, a5);
                } else {
                    d.newAdVideoView(a2, a3, a4, a5);
                }
            } else {
                AdVideoView adVideoView = d.getAdVideoView();
                if (adVideoView == null) {
                    f729a.mo3643a(adWebView, "onVideoEvent", "{'event': 'error', 'what': 'no_video_view'}");
                } else if (str.equals("click")) {
                    DisplayMetrics a6 = AdUtil.m985a((Activity) d);
                    int a7 = mo3536a(hashMap, Constants.f677X, 0, a6);
                    int a8 = mo3536a(hashMap, Constants.f678Y, 0, a6);
                    long uptimeMillis = SystemClock.uptimeMillis();
                    adVideoView.mo3611a(MotionEvent.obtain(uptimeMillis, uptimeMillis, 0, (float) a7, (float) a8, 0));
                } else if (str.equals("controls")) {
                    String str2 = hashMap.get("enabled");
                    if (str2 == null) {
                        C0508b.m1026a("No \"enabled\" parameter in a controls video gmsg.");
                    } else if (str2.equals("true")) {
                        adVideoView.setMediaControllerEnabled(true);
                    } else {
                        adVideoView.setMediaControllerEnabled(false);
                    }
                } else if (str.equals("currentTime")) {
                    String str3 = hashMap.get("time");
                    if (str3 == null) {
                        C0508b.m1026a("No \"time\" parameter in a currentTime video gmsg.");
                        return;
                    }
                    try {
                        adVideoView.mo3610a((int) (Float.parseFloat(str3) * 1000.0f));
                    } catch (NumberFormatException e) {
                        C0508b.m1026a("Could not parse \"time\" parameter: " + str3);
                    }
                } else if (str.equals("hide")) {
                    adVideoView.setVisibility(4);
                } else if (str.equals("load")) {
                    adVideoView.mo3612b();
                } else if (str.equals("pause")) {
                    adVideoView.mo3613c();
                } else if (str.equals("play")) {
                    adVideoView.mo3614d();
                } else if (str.equals("show")) {
                    adVideoView.setVisibility(0);
                } else if (str.equals("src")) {
                    adVideoView.setSrc(hashMap.get("src"));
                } else {
                    C0508b.m1026a("Unknown video action: " + str);
                }
            }
        } else {
            C0508b.m1026a("Could not get adWebView for a video gmsg.");
        }
    }
}
