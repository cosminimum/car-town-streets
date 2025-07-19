package com.millennialmedia.android;

import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.millennialmedia.android.MMAdViewSDK;

class MMWebViewClient extends WebViewClient {
    String adUrl;
    boolean hasDoneMraidCalls;
    OverlaySettings settings;

    private MMWebViewClient() {
    }

    MMWebViewClient(OverlaySettings settings2) {
        this.settings = settings2;
    }

    public boolean shouldOverrideUrlLoading(WebView webView, String url) {
        if (!url.substring(0, 6).equalsIgnoreCase("mmsdk:")) {
            return false;
        }
        MMAdViewSDK.Log.v("Running JS bridge command: " + url);
        MMCommand command = new MMCommand(webView, url);
        command.settings = this.settings;
        new Thread(command).start();
        return true;
    }
}
