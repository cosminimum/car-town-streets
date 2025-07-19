package com.tapjoy;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
/* loaded from: classes.dex */
public class TapjoyFeaturedAppWebView extends Activity {
    private ProgressBar progressBar;
    private WebView webView = null;
    private String fullScreenAdURL = "";
    private String userID = "";
    private String urlParams = "";
    private boolean resumeCalled = false;
    final String TAPJOY_FEATURED_APP = "Full Screen Ad";

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        Bundle extras = getIntent().getExtras();
        this.userID = extras.getString(TapjoyConstants.EXTRA_USER_ID);
        this.urlParams = extras.getString(TapjoyConstants.EXTRA_URL_PARAMS);
        this.fullScreenAdURL = extras.getString(TapjoyConstants.EXTRA_FEATURED_APP_FULLSCREEN_AD_URL);
        this.fullScreenAdURL = this.fullScreenAdURL.replaceAll(" ", "%20");
        super.onCreate(savedInstanceState);
        requestWindowFeature(1);
        RelativeLayout layout = new RelativeLayout(this);
        this.webView = new WebView(this);
        this.webView.setWebViewClient(new TapjoyWebViewClient());
        WebSettings webSettings = this.webView.getSettings();
        webSettings.setJavaScriptEnabled(true);
        this.progressBar = new ProgressBar(this, null, 16842874);
        this.progressBar.setVisibility(0);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.addRule(13);
        this.progressBar.setLayoutParams(layoutParams);
        layout.addView(this.webView, -1, -1);
        layout.addView(this.progressBar);
        setContentView(layout);
        this.webView.loadUrl(this.fullScreenAdURL);
        TapjoyLog.i("Full Screen Ad", "Opening Full Screen AD URL = [" + this.fullScreenAdURL + "]");
    }

    @Override // android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        if (this.webView != null) {
            RefreshTask refreshTask = new RefreshTask();
            refreshTask.execute(new Void[0]);
        }
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        if (this.resumeCalled && TapjoyConnectCore.getInstance() != null) {
            TapjoyLog.i("Full Screen Ad", "call connect");
            TapjoyConnectCore.getInstance().callConnect();
        }
        this.resumeCalled = true;
    }

    /* loaded from: classes.dex */
    private class RefreshTask extends AsyncTask<Void, Void, Boolean> {
        private RefreshTask() {
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public Boolean doInBackground(Void... params) {
            try {
                Thread.sleep(200L);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            return true;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public void onPostExecute(Boolean result) {
            if (TapjoyFeaturedAppWebView.this.webView != null) {
                TapjoyFeaturedAppWebView.this.webView.loadUrl("javascript:window.onorientationchange();");
            }
        }
    }

    /* loaded from: classes.dex */
    private class TapjoyWebViewClient extends WebViewClient {
        private TapjoyWebViewClient() {
        }

        @Override // android.webkit.WebViewClient
        public void onPageStarted(WebView view, String url, Bitmap favicon) {
            TapjoyFeaturedAppWebView.this.progressBar.setVisibility(0);
            TapjoyFeaturedAppWebView.this.progressBar.bringToFront();
        }

        @Override // android.webkit.WebViewClient
        public void onPageFinished(WebView view, String url) {
            TapjoyFeaturedAppWebView.this.progressBar.setVisibility(8);
        }

        @Override // android.webkit.WebViewClient
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            TapjoyLog.i("Full Screen Ad", "URL = [" + url + "]");
            if (url.contains("showOffers")) {
                TapjoyLog.i("Full Screen Ad", "show offers");
                TapjoyFeaturedAppWebView.this.showOffers();
                return true;
            } else if (url.contains("dismiss")) {
                TapjoyLog.i("Full Screen Ad", "dismiss");
                TapjoyFeaturedAppWebView.this.finishActivity();
                return true;
            } else if (url.contains(TapjoyConstants.TJC_BASE_REDIRECT_DOMAIN)) {
                TapjoyLog.i("Full Screen Ad", "Open redirecting URL = [" + url + "]");
                view.loadUrl(url);
                return true;
            } else {
                TapjoyLog.i("Full Screen Ad", "Opening URL in new browser = [" + url + "]");
                Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(url));
                TapjoyFeaturedAppWebView.this.startActivity(intent);
                return true;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showOffers() {
        TapjoyLog.i("Full Screen Ad", "Showing offers, userID: " + this.userID);
        TapjoyLog.i("Full Screen Ad", "Showing offers, URL PARAMS: " + this.urlParams);
        Intent offersIntent = new Intent(this, TJCOffersWebView.class);
        offersIntent.putExtra(TapjoyConstants.EXTRA_USER_ID, this.userID);
        offersIntent.putExtra(TapjoyConstants.EXTRA_URL_PARAMS, this.urlParams);
        startActivity(offersIntent);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void finishActivity() {
        finish();
    }
}
