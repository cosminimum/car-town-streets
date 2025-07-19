package com.tapjoy;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.AttributeSet;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;

public class TapjoyFeaturedAppWebView extends Activity {
    final String TAPJOY_FEATURED_APP = "Full Screen Ad";
    private String fullScreenAdURL = "";
    /* access modifiers changed from: private */
    public ProgressBar progressBar;
    private boolean resumeCalled = false;
    private String urlParams = "";
    private String userID = "";
    /* access modifiers changed from: private */
    public WebView webView = null;

    /* access modifiers changed from: protected */
    public void onCreate(Bundle savedInstanceState) {
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
        this.webView.getSettings().setJavaScriptEnabled(true);
        this.progressBar = new ProgressBar(this, (AttributeSet) null, 16842874);
        this.progressBar.setVisibility(0);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.addRule(13);
        this.progressBar.setLayoutParams(layoutParams);
        layout.addView(this.webView, -1, -1);
        layout.addView(this.progressBar);
        setContentView(layout);
        this.webView.loadUrl(this.fullScreenAdURL);
        TapjoyLog.m4436i("Full Screen Ad", "Opening Full Screen AD URL = [" + this.fullScreenAdURL + "]");
    }

    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        if (this.webView != null) {
            new RefreshTask().execute(new Void[0]);
        }
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        super.onResume();
        if (this.resumeCalled && TapjoyConnectCore.getInstance() != null) {
            TapjoyLog.m4436i("Full Screen Ad", "call connect");
            TapjoyConnectCore.getInstance().callConnect();
        }
        this.resumeCalled = true;
    }

    private class RefreshTask extends AsyncTask<Void, Void, Boolean> {
        private RefreshTask() {
        }

        /* access modifiers changed from: protected */
        public Boolean doInBackground(Void... params) {
            try {
                Thread.sleep(200);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            return true;
        }

        /* access modifiers changed from: protected */
        public void onPostExecute(Boolean result) {
            if (TapjoyFeaturedAppWebView.this.webView != null) {
                TapjoyFeaturedAppWebView.this.webView.loadUrl("javascript:window.onorientationchange();");
            }
        }
    }

    private class TapjoyWebViewClient extends WebViewClient {
        private TapjoyWebViewClient() {
        }

        public void onPageStarted(WebView view, String url, Bitmap favicon) {
            TapjoyFeaturedAppWebView.this.progressBar.setVisibility(0);
            TapjoyFeaturedAppWebView.this.progressBar.bringToFront();
        }

        public void onPageFinished(WebView view, String url) {
            TapjoyFeaturedAppWebView.this.progressBar.setVisibility(8);
        }

        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            TapjoyLog.m4436i("Full Screen Ad", "URL = [" + url + "]");
            if (url.contains("showOffers")) {
                TapjoyLog.m4436i("Full Screen Ad", "show offers");
                TapjoyFeaturedAppWebView.this.showOffers();
                return true;
            } else if (url.contains("dismiss")) {
                TapjoyLog.m4436i("Full Screen Ad", "dismiss");
                TapjoyFeaturedAppWebView.this.finishActivity();
                return true;
            } else if (url.contains(TapjoyConstants.TJC_BASE_REDIRECT_DOMAIN)) {
                TapjoyLog.m4436i("Full Screen Ad", "Open redirecting URL = [" + url + "]");
                view.loadUrl(url);
                return true;
            } else {
                TapjoyLog.m4436i("Full Screen Ad", "Opening URL in new browser = [" + url + "]");
                TapjoyFeaturedAppWebView.this.startActivity(new Intent("android.intent.action.VIEW", Uri.parse(url)));
                return true;
            }
        }
    }

    /* access modifiers changed from: private */
    public void showOffers() {
        TapjoyLog.m4436i("Full Screen Ad", "Showing offers, userID: " + this.userID);
        TapjoyLog.m4436i("Full Screen Ad", "Showing offers, URL PARAMS: " + this.urlParams);
        Intent offersIntent = new Intent(this, TJCOffersWebView.class);
        offersIntent.putExtra(TapjoyConstants.EXTRA_USER_ID, this.userID);
        offersIntent.putExtra(TapjoyConstants.EXTRA_URL_PARAMS, this.urlParams);
        startActivity(offersIntent);
    }

    /* access modifiers changed from: private */
    public void finishActivity() {
        finish();
    }
}
