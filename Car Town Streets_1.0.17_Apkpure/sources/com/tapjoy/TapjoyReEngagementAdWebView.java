package com.tapjoy;

import android.app.Activity;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.os.AsyncTask;
import android.os.Bundle;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
/* loaded from: classes.dex */
public class TapjoyReEngagementAdWebView extends Activity {
    private ProgressBar progressBar;
    private WebView webView = null;
    private String htmlRawData = "";
    final String TAPJOY_RE_ENGAGEMENT_AD = "Re-engagement Ad";

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        Bundle extras = getIntent().getExtras();
        this.htmlRawData = extras.getString(TapjoyConstants.EXTRA_RE_ENGAGEMENT_HTML_DATA);
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
        this.webView.loadDataWithBaseURL(TapjoyConstants.TJC_SERVICE_URL, this.htmlRawData, "text/html", "utf-8", null);
        TapjoyLog.i("Re-engagement Ad", "Opening Re-engagement ad = [" + this.htmlRawData + "]");
    }

    @Override // android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        if (this.webView != null) {
            RefreshTask refreshTask = new RefreshTask();
            refreshTask.execute(new Void[0]);
        }
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
            if (TapjoyReEngagementAdWebView.this.webView != null) {
                TapjoyReEngagementAdWebView.this.webView.loadUrl("javascript:window.onorientationchange();");
            }
        }
    }

    /* loaded from: classes.dex */
    private class TapjoyWebViewClient extends WebViewClient {
        private TapjoyWebViewClient() {
        }

        @Override // android.webkit.WebViewClient
        public void onPageStarted(WebView view, String url, Bitmap favicon) {
            TapjoyReEngagementAdWebView.this.progressBar.setVisibility(0);
            TapjoyReEngagementAdWebView.this.progressBar.bringToFront();
        }

        @Override // android.webkit.WebViewClient
        public void onPageFinished(WebView view, String url) {
            TapjoyReEngagementAdWebView.this.progressBar.setVisibility(8);
        }

        @Override // android.webkit.WebViewClient
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            TapjoyLog.i("Re-engagement Ad", "URL = [" + url + "]");
            if (url.startsWith(TapjoyConstants.TJC_REENGAGEMENT_DISMISS_URL)) {
                TapjoyLog.i("Re-engagement Ad", "dismiss");
                TapjoyReEngagementAdWebView.this.finishActivity();
                return true;
            }
            return true;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void finishActivity() {
        finish();
    }
}
