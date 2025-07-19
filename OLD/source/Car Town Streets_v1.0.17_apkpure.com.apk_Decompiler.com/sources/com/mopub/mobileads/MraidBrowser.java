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

public class MraidBrowser extends Activity {
    public static final String URL_EXTRA = "extra_url";

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
        webView.setWebViewClient(new WebViewClient() {
            public void onReceivedError(WebView view, int errorCode, String description, String failingUrl) {
                Toast.makeText((Activity) view.getContext(), "MRAID error: " + description, 0).show();
            }

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

            public void onPageStarted(WebView view, String url, Bitmap favicon) {
                super.onPageStarted(view, url, favicon);
                ((ImageButton) MraidBrowser.this.findViewById(R.id.browserForwardButton)).setImageResource(R.drawable.unrightarrow);
            }

            public void onPageFinished(WebView view, String url) {
                super.onPageFinished(view, url);
                ((ImageButton) MraidBrowser.this.findViewById(R.id.browserBackButton)).setImageResource(view.canGoBack() ? R.drawable.leftarrow : R.drawable.unleftarrow);
                ((ImageButton) MraidBrowser.this.findViewById(R.id.browserForwardButton)).setImageResource(view.canGoForward() ? R.drawable.rightarrow : R.drawable.unrightarrow);
            }
        });
        webView.setWebChromeClient(new WebChromeClient() {
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
        backButton.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                WebView webView = (WebView) MraidBrowser.this.findViewById(R.id.webView);
                if (webView.canGoBack()) {
                    webView.goBack();
                }
            }
        });
        ImageButton forwardButton = (ImageButton) findViewById(R.id.browserForwardButton);
        forwardButton.setBackgroundColor(0);
        forwardButton.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                WebView webView = (WebView) MraidBrowser.this.findViewById(R.id.webView);
                if (webView.canGoForward()) {
                    webView.goForward();
                }
            }
        });
        ImageButton refreshButton = (ImageButton) findViewById(R.id.browserRefreshButton);
        refreshButton.setBackgroundColor(0);
        refreshButton.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                ((WebView) MraidBrowser.this.findViewById(R.id.webView)).reload();
            }
        });
        ImageButton closeButton = (ImageButton) findViewById(R.id.browserCloseButton);
        closeButton.setBackgroundColor(0);
        closeButton.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                MraidBrowser.this.finish();
            }
        });
    }

    private void enableCookies() {
        CookieSyncManager.createInstance(this);
        CookieSyncManager.getInstance().startSync();
    }

    /* access modifiers changed from: protected */
    public void onPause() {
        super.onPause();
        CookieSyncManager.getInstance().stopSync();
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        super.onResume();
        CookieSyncManager.getInstance().startSync();
    }
}
