package com.tapjoy;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.view.KeyEvent;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;
import com.getjar.sdk.utilities.Utility;
import com.tapjoy.easyAppConnectOffers.EasyAppConnectOffers;
import java.util.Hashtable;
/* loaded from: classes.dex */
public class TJCOffersWebView extends Activity {
    private ProgressBar progressBar;
    private WebView webView = null;
    private String offersURL = null;
    private Dialog dialog = null;
    private String clientPackage = "";
    private String urlParams = "";
    private String userID = "";
    final String TAPJOY_OFFERS = "Offers";
    private boolean skipOfferWall = false;
    private boolean resumeCalled = false;

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        Bundle extras = getIntent().getExtras();
        if (extras != null) {
            if (extras.getString(TapjoyConstants.EXTRA_DISPLAY_AD_URL) != null) {
                this.skipOfferWall = true;
                this.offersURL = extras.getString(TapjoyConstants.EXTRA_DISPLAY_AD_URL);
            } else {
                this.skipOfferWall = false;
                this.urlParams = extras.getString(TapjoyConstants.EXTRA_URL_PARAMS);
                this.userID = extras.getString(TapjoyConstants.EXTRA_USER_ID);
                this.urlParams += "&publisher_user_id=" + this.userID;
                if (TapjoyConnectCore.getVideoParams().length() > 0) {
                    this.urlParams += Utility.QUERY_APPENDIX + TapjoyConnectCore.getVideoParams();
                }
                TapjoyLog.i("Offers", "urlParams: [" + this.urlParams + "]");
                this.offersURL = "https://ws.tapjoyads.com/get_offers/webpage?" + this.urlParams;
            }
        } else {
            TapjoyLog.e("Offers", "Tapjoy offers meta data initialization fail.");
        }
        this.offersURL = this.offersURL.replaceAll(" ", "%20");
        this.clientPackage = TapjoyConnectCore.getClientPackage();
        TapjoyLog.i("Offers", "clientPackage: [" + this.clientPackage + "]");
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
        this.webView.loadUrl(this.offersURL);
        TapjoyLog.i("Offers", "Opening URL = [" + this.offersURL + "]");
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        if (this.offersURL != null && this.webView != null) {
            this.webView.loadUrl(this.offersURL);
        }
        if (this.resumeCalled && TapjoyConnectCore.getInstance() != null) {
            TapjoyLog.i("Offers", "call connect");
            TapjoyConnectCore.getInstance().callConnect();
        }
        this.resumeCalled = true;
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        if (this.webView != null) {
            this.webView.clearCache(true);
            this.webView.destroyDrawingCache();
            this.webView.destroy();
        }
    }

    /* loaded from: classes.dex */
    private class TapjoyWebViewClient extends WebViewClient {
        private TapjoyWebViewClient() {
        }

        @Override // android.webkit.WebViewClient
        public void onPageStarted(WebView view, String url, Bitmap favicon) {
            TJCOffersWebView.this.progressBar.setVisibility(0);
            TJCOffersWebView.this.progressBar.bringToFront();
        }

        @Override // android.webkit.WebViewClient
        public void onPageFinished(WebView view, String url) {
            TJCOffersWebView.this.progressBar.setVisibility(8);
        }

        @Override // android.webkit.WebViewClient
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            TapjoyLog.i("Offers", "URL = [" + url + "]");
            if (url.startsWith("tjvideo://")) {
                Hashtable<String, String> params = new Hashtable<>();
                int mode = 0;
                String word = "";
                String key = "";
                for (int index = url.indexOf("://") + "://".length(); index < url.length() && index != -1; index++) {
                    char c = url.charAt(index);
                    if (mode == 0) {
                        if (c == '=') {
                            mode = 1;
                            key = Uri.decode(word);
                            word = "";
                        } else {
                            word = word + c;
                        }
                    } else if (mode == 1) {
                        if (c == '&') {
                            mode = 0;
                            String value = Uri.decode(word);
                            word = "";
                            TapjoyLog.i("Offers", "k:v: " + key + ", " + value);
                            params.put(key, value);
                        } else {
                            word = word + c;
                        }
                    }
                }
                if (mode == 1 && word.length() > 0) {
                    String value2 = Uri.decode(word);
                    TapjoyLog.i("Offers", "k:v: " + key + ", " + value2);
                    params.put(key, value2);
                }
                String videoID = params.get("video_id");
                String currencyAmount = params.get("amount");
                String currencyName = params.get(EasyAppConnectOffers.TAPJOY_INFO_CURRENCY_NAME);
                String clickURL = params.get("click_url");
                String webviewURL = params.get("video_complete_url");
                String videoURL = params.get("video_url");
                TapjoyLog.i("Offers", "videoID: " + videoID);
                TapjoyLog.i("Offers", "currencyAmount: " + currencyAmount);
                TapjoyLog.i("Offers", "currencyName: " + currencyName);
                TapjoyLog.i("Offers", "clickURL: " + clickURL);
                TapjoyLog.i("Offers", "webviewURL: " + webviewURL);
                TapjoyLog.i("Offers", "videoURL: " + videoURL);
                if (TapjoyVideo.getInstance().startVideo(videoID, currencyName, currencyAmount, clickURL, webviewURL, videoURL)) {
                    TapjoyLog.i("Offers", "VIDEO");
                    return true;
                }
                TapjoyLog.e("Offers", "Unable to play video: " + videoID);
                TJCOffersWebView.this.dialog = new AlertDialog.Builder(TJCOffersWebView.this).setTitle("").setMessage("Unable to play video.").setPositiveButton("OK", new DialogInterface.OnClickListener() { // from class: com.tapjoy.TJCOffersWebView.TapjoyWebViewClient.1
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int whichButton) {
                        dialog.dismiss();
                    }
                }).create();
                try {
                    TJCOffersWebView.this.dialog.show();
                    return true;
                } catch (Exception e) {
                    TapjoyLog.e("Offers", "e: " + e.toString());
                    return true;
                }
            } else if (url.contains(TapjoyConstants.TJC_BASE_REDIRECT_DOMAIN)) {
                TapjoyLog.i("Offers", "Open redirecting URL = [" + url + "]");
                view.loadUrl(url);
                return true;
            } else {
                TapjoyLog.i("Offers", "Opening URL in new browser = [" + url + "]");
                Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(url));
                TJCOffersWebView.this.startActivity(intent);
                TapjoyLog.i("Offers", "skipOfferWall: " + TJCOffersWebView.this.skipOfferWall);
                if (TJCOffersWebView.this.skipOfferWall) {
                    TJCOffersWebView.this.finish();
                    return true;
                }
                return true;
            }
        }
    }

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode != 4 || !this.webView.canGoBack()) {
            return super.onKeyDown(keyCode, event);
        }
        this.webView.goBack();
        return true;
    }
}
