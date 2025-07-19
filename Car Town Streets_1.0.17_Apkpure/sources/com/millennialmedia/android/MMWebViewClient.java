package com.millennialmedia.android;

import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.millennialmedia.android.MMAdViewSDK;
/* loaded from: classes.dex */
class MMWebViewClient extends WebViewClient {
    String adUrl;
    boolean hasDoneMraidCalls;
    OverlaySettings settings;

    private MMWebViewClient() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public MMWebViewClient(OverlaySettings settings) {
        this.settings = settings;
    }

    @Override // android.webkit.WebViewClient
    public boolean shouldOverrideUrlLoading(WebView webView, String url) {
        if (url.substring(0, 6).equalsIgnoreCase("mmsdk:")) {
            MMAdViewSDK.Log.v("Running JS bridge command: " + url);
            MMCommand command = new MMCommand(webView, url);
            command.settings = this.settings;
            Thread thread = new Thread(command);
            thread.start();
            return true;
        }
        return false;
    }
}
