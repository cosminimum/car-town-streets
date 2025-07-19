package tapjoy;

import android.app.Activity;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.AttributeSet;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;

public class TapjoyReEngagementAdWebView extends Activity {
    final String TAPJOY_RE_ENGAGEMENT_AD = "Re-engagement Ad";
    private String htmlRawData = "";
    /* access modifiers changed from: private */
    public ProgressBar progressBar;
    /* access modifiers changed from: private */
    public WebView webView = null;

    /* access modifiers changed from: protected */
    public void onCreate(Bundle savedInstanceState) {
        this.htmlRawData = getIntent().getExtras().getString(TapjoyConstants.EXTRA_RE_ENGAGEMENT_HTML_DATA);
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
        this.webView.loadDataWithBaseURL(TapjoyConstants.TJC_SERVICE_URL, this.htmlRawData, "text/html", "utf-8", (String) null);
        TapjoyLog.i("Re-engagement Ad", "Opening Re-engagement ad = [" + this.htmlRawData + "]");
    }

    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        if (this.webView != null) {
            new RefreshTask().execute(new Void[0]);
        }
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
            if (TapjoyReEngagementAdWebView.this.webView != null) {
                TapjoyReEngagementAdWebView.this.webView.loadUrl("javascript:window.onorientationchange();");
            }
        }
    }

    private class TapjoyWebViewClient extends WebViewClient {
        private TapjoyWebViewClient() {
        }

        public void onPageStarted(WebView view, String url, Bitmap favicon) {
            TapjoyReEngagementAdWebView.this.progressBar.setVisibility(0);
            TapjoyReEngagementAdWebView.this.progressBar.bringToFront();
        }

        public void onPageFinished(WebView view, String url) {
            TapjoyReEngagementAdWebView.this.progressBar.setVisibility(8);
        }

        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            TapjoyLog.i("Re-engagement Ad", "URL = [" + url + "]");
            if (!url.startsWith(TapjoyConstants.TJC_REENGAGEMENT_DISMISS_URL)) {
                return true;
            }
            TapjoyLog.i("Re-engagement Ad", "dismiss");
            TapjoyReEngagementAdWebView.this.finishActivity();
            return true;
        }
    }

    /* access modifiers changed from: private */
    public void finishActivity() {
        finish();
    }
}
