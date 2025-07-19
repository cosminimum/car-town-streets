package com.mopub.mobileads;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.webkit.CookieSyncManager;
import android.webkit.WebChromeClient;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ImageButton;
import android.widget.Toast;
/* loaded from: classes.dex */
public class MraidBrowser extends Activity {
    public static final String URL_EXTRA = "extra_url";

    @Override // android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getWindow().requestFeature(2);
        getWindow().setFeatureInt(2, -1);
        setContentView(R.layout.mraid_browser);
        Intent intent = getIntent();
        initializeWebView(intent);
        initializeButtons(intent);
        enableCookies();
    }

    private void initializeWebView(Intent intent) {
        WebView webView = (WebView) findViewById(R.id.webView);
        webView.getSettings().setJavaScriptEnabled(true);
        webView.loadUrl(intent.getStringExtra(URL_EXTRA));
        webView.setWebViewClient(new WebViewClient() { // from class: com.mopub.mobileads.MraidBrowser.1
            @Override // android.webkit.WebViewClient
            public void onReceivedError(WebView view, int errorCode, String description, String failingUrl) {
                Activity a = (Activity) view.getContext();
                Toast.makeText(a, "MRAID error: " + description, 0).show();
            }

            @Override // android.webkit.WebViewClient
            public boolean shouldOverrideUrlLoading(WebView view, String url) {
                if (url == null) {
                    return false;
                }
                if (!url.startsWith("market:") && !url.startsWith("tel:") && !url.startsWith("voicemail:") && !url.startsWith("sms:") && !url.startsWith("mailto:") && !url.startsWith("geo:") && !url.startsWith("google.streetview:")) {
                    return false;
                }
                MraidBrowser.this.startActivity(new Intent("android.intent.action.VIEW", Uri.parse(url)));
                return true;
            }

            @Override // android.webkit.WebViewClient
            public void onPageStarted(WebView view, String url, Bitmap favicon) {
                super.onPageStarted(view, url, favicon);
                ImageButton forwardButton = (ImageButton) MraidBrowser.this.findViewById(R.id.browserForwardButton);
                forwardButton.setImageResource(R.drawable.unrightarrow);
            }

            @Override // android.webkit.WebViewClient
            public void onPageFinished(WebView view, String url) {
                super.onPageFinished(view, url);
                ImageButton backButton = (ImageButton) MraidBrowser.this.findViewById(R.id.browserBackButton);
                int backImageResource = view.canGoBack() ? R.drawable.leftarrow : R.drawable.unleftarrow;
                backButton.setImageResource(backImageResource);
                ImageButton forwardButton = (ImageButton) MraidBrowser.this.findViewById(R.id.browserForwardButton);
                int fwdImageResource = view.canGoForward() ? R.drawable.rightarrow : R.drawable.unrightarrow;
                forwardButton.setImageResource(fwdImageResource);
            }
        });
        webView.setWebChromeClient(new WebChromeClient() { // from class: com.mopub.mobileads.MraidBrowser.2
            @Override // android.webkit.WebChromeClient
            public void onProgressChanged(WebView view, int progress) {
                Activity a = (Activity) view.getContext();
                a.setTitle("Loading...");
                a.setProgress(progress * 100);
                if (progress == 100) {
                    a.setTitle(view.getUrl());
                }
            }
        });
    }

    private void initializeButtons(Intent intent) {
        ImageButton backButton = (ImageButton) findViewById(R.id.browserBackButton);
        backButton.setBackgroundColor(0);
        backButton.setOnClickListener(new View.OnClickListener() { // from class: com.mopub.mobileads.MraidBrowser.3
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                WebView webView = (WebView) MraidBrowser.this.findViewById(R.id.webView);
                if (webView.canGoBack()) {
                    webView.goBack();
                }
            }
        });
        ImageButton forwardButton = (ImageButton) findViewById(R.id.browserForwardButton);
        forwardButton.setBackgroundColor(0);
        forwardButton.setOnClickListener(new View.OnClickListener() { // from class: com.mopub.mobileads.MraidBrowser.4
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                WebView webView = (WebView) MraidBrowser.this.findViewById(R.id.webView);
                if (webView.canGoForward()) {
                    webView.goForward();
                }
            }
        });
        ImageButton refreshButton = (ImageButton) findViewById(R.id.browserRefreshButton);
        refreshButton.setBackgroundColor(0);
        refreshButton.setOnClickListener(new View.OnClickListener() { // from class: com.mopub.mobileads.MraidBrowser.5
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                WebView webView = (WebView) MraidBrowser.this.findViewById(R.id.webView);
                webView.reload();
            }
        });
        ImageButton closeButton = (ImageButton) findViewById(R.id.browserCloseButton);
        closeButton.setBackgroundColor(0);
        closeButton.setOnClickListener(new View.OnClickListener() { // from class: com.mopub.mobileads.MraidBrowser.6
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                MraidBrowser.this.finish();
            }
        });
    }

    private void enableCookies() {
        CookieSyncManager.createInstance(this);
        CookieSyncManager.getInstance().startSync();
    }

    @Override // android.app.Activity
    protected void onPause() {
        super.onPause();
        CookieSyncManager.getInstance().stopSync();
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        CookieSyncManager.getInstance().startSync();
    }
}
