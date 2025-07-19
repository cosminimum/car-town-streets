package tapjoy;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
import android.os.Bundle;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ProgressBar;
import android.widget.RelativeLayout;

import com.getjar.sdk.utilities.Utility;
import com.tapjoy.easyAppConnectOffers.EasyAppConnectOffers;

import java.util.Hashtable;

public class TJCOffersWebView extends Activity {
    final String TAPJOY_OFFERS = "Offers";
    private String clientPackage = "";
    /* access modifiers changed from: private */
    public Dialog dialog = null;
    private String offersURL = null;
    /* access modifiers changed from: private */
    public ProgressBar progressBar;
    private boolean resumeCalled = false;
    /* access modifiers changed from: private */
    public boolean skipOfferWall = false;
    private String urlParams = "";
    private String userID = "";
    private WebView webView = null;

    /* access modifiers changed from: protected */
    public void onCreate(Bundle savedInstanceState) {
        Bundle extras = getIntent().getExtras();
        if (extras == null) {
            TapjoyLog.e("Offers", "Tapjoy offers meta data initialization fail.");
        } else if (extras.getString(TapjoyConstants.EXTRA_DISPLAY_AD_URL) != null) {
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
        this.offersURL = this.offersURL.replaceAll(" ", "%20");
        this.clientPackage = TapjoyConnectCore.getClientPackage();
        TapjoyLog.i("Offers", "clientPackage: [" + this.clientPackage + "]");
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
        this.webView.loadUrl(this.offersURL);
        TapjoyLog.i("Offers", "Opening URL = [" + this.offersURL + "]");
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        super.onResume();
        if (!(this.offersURL == null || this.webView == null)) {
            this.webView.loadUrl(this.offersURL);
        }
        if (this.resumeCalled && TapjoyConnectCore.getInstance() != null) {
            TapjoyLog.i("Offers", "call connect");
            TapjoyConnectCore.getInstance().callConnect();
        }
        this.resumeCalled = true;
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        super.onDestroy();
        if (this.webView != null) {
            this.webView.clearCache(true);
            this.webView.destroyDrawingCache();
            this.webView.destroy();
        }
    }

    private class TapjoyWebViewClient extends WebViewClient {
        private TapjoyWebViewClient() {
        }

        public void onPageStarted(WebView view, String url, Bitmap favicon) {
            TJCOffersWebView.this.progressBar.setVisibility(0);
            TJCOffersWebView.this.progressBar.bringToFront();
        }

        public void onPageFinished(WebView view, String url) {
            TJCOffersWebView.this.progressBar.setVisibility(8);
        }

        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            TapjoyLog.i("Offers", "URL = [" + url + "]");
            if (url.startsWith("tjvideo://")) {
                Hashtable<String, String> params = new Hashtable<>();
                int index = url.indexOf("://") + "://".length();
                int mode = 0;
                String word = "";
                String key = "";
                while (index < url.length() && index != -1) {
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
                    index++;
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
                Dialog unused = TJCOffersWebView.this.dialog = new AlertDialog.Builder(TJCOffersWebView.this).setTitle("").setMessage("Unable to play video.").setPositiveButton("OK", new DialogInterface.OnClickListener() {
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
                TJCOffersWebView.this.startActivity(new Intent("android.intent.action.VIEW", Uri.parse(url)));
                TapjoyLog.i("Offers", "skipOfferWall: " + TJCOffersWebView.this.skipOfferWall);
                if (!TJCOffersWebView.this.skipOfferWall) {
                    return true;
                }
                TJCOffersWebView.this.finish();
                return true;
            }
        }
    }

    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode != 4 || !this.webView.canGoBack()) {
            return super.onKeyDown(keyCode, event);
        }
        this.webView.goBack();
        return true;
    }
}
