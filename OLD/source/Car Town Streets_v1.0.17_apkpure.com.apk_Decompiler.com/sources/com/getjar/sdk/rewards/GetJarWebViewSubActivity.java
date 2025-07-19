package com.getjar.sdk.rewards;

import android.annotation.SuppressLint;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.IntentSender;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.os.ResultReceiver;
import android.view.MotionEvent;
import android.view.View;
import android.webkit.CookieSyncManager;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import com.getjar.sdk.Product;
import com.getjar.sdk.comm.CommContext;
import com.getjar.sdk.comm.CommFailureCallbackInterface;
import com.getjar.sdk.comm.CommManager;
import com.getjar.sdk.comm.GetJarConfig;
import com.getjar.sdk.comm.Result;
import com.getjar.sdk.comm.StatisticsTracker;
import com.getjar.sdk.comm.TransactionManager;
import com.getjar.sdk.comm.auth.AccountEventType;
import com.getjar.sdk.comm.auth.AccountHistoryManager;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.data.RedemptionEngine;
import com.getjar.sdk.data.earning.EarningMonitor;
import com.getjar.sdk.data.usage.UsageMonitor;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.response.CloseResponse;
import com.getjar.sdk.rewards.InAppPurchaseManager;
import com.getjar.sdk.rewards.JavaScriptAPI;
import com.getjar.sdk.utilities.Constants;
import com.getjar.sdk.utilities.GlobalActivityRegistrar;
import com.getjar.sdk.utilities.RewardUtility;
import com.getjar.sdk.utilities.StringUtility;
import com.getjar.sdk.utilities.Utility;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.json.JSONObject;

public class GetJarWebViewSubActivity extends GetJarSubActivityBase implements SharedPreferences.OnSharedPreferenceChangeListener, View.OnTouchListener {
    protected static final int GOOGLE_PLAY_PURCHASE_REQUEST = 101;
    private static final String GooglePlayResponseCallback = "GooglePlayResponseCallback";
    private static String Language = Constants.DEFAULT_LANGUAGE;
    private static final int TOUCH_DRAG_LENGTH = 200;
    private static final ExecutorService _ExecutorServiceForGooglePlayResultWork = Executors.newSingleThreadExecutor();
    private static final ExecutorService _ExecutorServiceUIWork = Executors.newSingleThreadExecutor();
    private static volatile BroadcastReceiver _ScreenWakeupReceiver = null;
    /* access modifiers changed from: private */
    public static WebView mWebView = null;
    public static ErrorSource sErrorSource;
    public static Object waitObject = new Object();
    private CommFailureCallback _commFailureCallback = new CommFailureCallback();
    private String _currentPurchaseClientTransactionId = null;
    private List<Dialog> _dialogsToManage = null;
    private boolean _loadCheckoutPage = false;
    private boolean _loadWalletPage = false;
    /* access modifiers changed from: private */
    public boolean _shouldShowLoadingUI = true;
    private int downX;
    private int downY;
    private InAppBillingNotifier inAppBillingJSNotifier;
    private StringBuilder konamiCode;
    /* access modifiers changed from: private */
    public boolean mCatchByMonitor = false;
    /* access modifiers changed from: private */
    public CommContext mCommContext;
    ResultReceiver mDismissReceiver = new ResultReceiver((Handler) null) {
        /* access modifiers changed from: protected */
        public void onReceiveResult(int resultCode, Bundle resultData) {
            Logger.d(Area.UI.value() | Area.OS_ENTRY_POINT.value(), "onReceiveResult:" + resultCode);
            super.onReceiveResult(resultCode, resultData);
            switch (resultCode) {
                case 1:
                    GetJarWebViewSubActivity.this.mHandler.sendEmptyMessage(1);
                    return;
                case 2:
                    GetJarWebViewSubActivity.this.mHandler.sendEmptyMessage(2);
                    return;
                default:
                    return;
            }
        }
    };
    Handler mHandler = new Handler() {
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case 1:
                    GetJarWebViewSubActivity.this.loadPostAuthUI();
                    return;
                case 2:
                    GetJarWebViewSubActivity.loadErrorPage(ErrorType.NETWORK, "", GetJarWebViewSubActivity.mWebView);
                    return;
                default:
                    return;
            }
        }
    };
    GetJarJavaScriptInterface mJavaScriptInterface = null;
    private ArrayList<ProductWithClientTransactionID> mOffers = new ArrayList<>();
    private BroadcastReceiver mPackageReceiver = new BroadcastReceiver() {
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            Logger.d(Area.USAGE.value() | Area.OS_ENTRY_POINT.value(), String.format(Locale.US, "** PackageReceiver: %1$s [%2$s]", new Object[]{action, Utility.getPackageNameFromBroadcastIntent(intent)}));
            if ("android.intent.action.PACKAGE_ADDED".equals(action) && !intent.getBooleanExtra("android.intent.extra.REPLACING", false)) {
                boolean unused = GetJarWebViewSubActivity.this.mCatchByMonitor = true;
                new Thread(new newPackageReceived(GetJarWebViewSubActivity.this.mReceiver)).start();
            }
        }
    };
    ResultReceiver mReceiver = new ResultReceiver((Handler) null) {
        /* access modifiers changed from: protected */
        public void onReceiveResult(int resultCode, Bundle resultData) {
            Logger.d(Area.UI.value() | Area.OS_ENTRY_POINT.value(), "onReceiveResult:" + resultCode);
            super.onReceiveResult(resultCode, resultData);
            switch (resultCode) {
                case 0:
                    GetJarWebViewSubActivity.this.close();
                    return;
                case 3:
                    GetJarWebViewSubActivity.this.serviceFail(resultData);
                    return;
                case 4:
                    boolean unused = GetJarWebViewSubActivity.this.mCatchByMonitor = false;
                    GetJarWebViewSubActivity.this.reload();
                    return;
                case 5:
                    GetJarWebViewSubActivity.this.purchaseSuccess(resultData);
                    return;
                case 6:
                    GetJarWebViewSubActivity.this.purchaseFail(resultData);
                    return;
                case 9:
                    GetJarWebViewSubActivity.this.setAuthToken(resultData);
                    return;
                case 10:
                    GetJarWebViewSubActivity.this.simpleReload();
                    return;
                default:
                    return;
            }
        }
    };
    private String mUrl = null;
    private String mUserAgent = "";
    private int subResult;

    protected enum DialogType {
        WAIT,
        UNABLE_TO_DOWNLOAD
    }

    public enum ErrorType {
        AUTH,
        SERVICE,
        NETWORK
    }

    GetJarWebViewSubActivity(GetJarActivity getJarActivity) {
        super(getJarActivity);
    }

    public class ErrorSource {
        public ErrorType mErrorType;
        public String mSubCode;

        public ErrorSource(ErrorType errorType, String subCode) {
            this.mErrorType = errorType;
            this.mSubCode = subCode;
        }
    }

    private BroadcastReceiver getScreenWakeupReceiver() {
        if (_ScreenWakeupReceiver == null) {
            _ScreenWakeupReceiver = new ScreenWakeupReceiver();
        }
        return _ScreenWakeupReceiver;
    }

    /* access modifiers changed from: protected */
    public boolean getShouldShowLoadingUI() {
        return this._shouldShowLoadingUI;
    }

    /* access modifiers changed from: protected */
    public String getDisplayLanguageTag() {
        return Language;
    }

    /* access modifiers changed from: protected */
    public void setShouldShowLoadingUI(boolean shouldShowLoadingUI) {
        this._shouldShowLoadingUI = shouldShowLoadingUI;
    }

    public void setCurrentPurchaseClientTransactionId(String currentPurchaseClientTransactionId) {
        Logger.v(Area.PURCHASE.value() | Area.TRANSACTION.value(), String.format(Locale.US, "setCurrentPurchaseClientTransactionId(%1$s) called from '%2$s'", new Object[]{currentPurchaseClientTransactionId, Thread.currentThread().getStackTrace()[3].getMethodName()}));
        this._currentPurchaseClientTransactionId = currentPurchaseClientTransactionId;
    }

    public String getCurrentPurchaseClientTransactionId() {
        Logger.v(Area.PURCHASE.value() | Area.TRANSACTION.value(), String.format(Locale.US, "getCurrentPurchaseClientTransactionId() called from '%1$s' returning '%2$s'", new Object[]{Thread.currentThread().getStackTrace()[3].getMethodName(), this._currentPurchaseClientTransactionId}));
        return this._currentPurchaseClientTransactionId;
    }

    public void setAuthToken(Bundle theBundle) {
        loadUrlInWebView(mWebView, "javascript:GJ.setAuthToken(" + theBundle.getString(Constants.AUTH_TOKEN_KEY) + ")");
    }

    private void RegisterPackageReceiver() {
        IntentFilter actions = new IntentFilter();
        actions.addAction("android.intent.action.PACKAGE_ADDED");
        actions.addDataScheme("package");
        this.getJarActivity.registerReceiver(this.mPackageReceiver, new IntentFilter(actions));
    }

    private void UnRegisterPackageReceiver() {
        this.getJarActivity.unregisterReceiver(this.mPackageReceiver);
    }

    private class newPackageReceived implements Runnable {
        ResultReceiver mReceiver;

        public newPackageReceived(ResultReceiver receiver) {
            this.mReceiver = receiver;
        }

        public void run() {
            try {
                Logger.d(Area.USAGE.value(), "waiting...");
                Thread.sleep(10000);
                Logger.d(Area.USAGE.value(), "finish waiting...");
                this.mReceiver.send(4, (Bundle) null);
            } catch (Exception e) {
                Logger.e(Area.USAGE.value(), "newPackageReceived() failed", e);
            }
        }
    }

    /* access modifiers changed from: protected */
    public void waitForAuthorization() {
        Logger.d(Area.AUTH.value() | Area.UI.value(), "Waiting for UserAuth is called");
        waitDialogShow();
        try {
            new Thread(new waitForAuth(this.mCommContext, this.mDismissReceiver)).start();
        } catch (Throwable t) {
            waitDialogHide();
            Logger.e(Area.AUTH.value() | Area.UI.value(), "newPackageReceived() failed", t);
        }
    }

    /* access modifiers changed from: protected */
    public void startGooglePlayForPurchase(PendingIntent pendingIntent, String callback, CommContext commContext, String clientTransactionId) {
        if (pendingIntent == null) {
            throw new IllegalArgumentException("'pendingIntent' cannot be NULL");
        } else if (StringUtility.isNullOrEmpty(callback)) {
            throw new IllegalArgumentException("'callback' cannot be NULL or empty");
        } else if (commContext == null) {
            throw new IllegalArgumentException("'commContext' cannot be NULL");
        } else if (StringUtility.isNullOrEmpty(clientTransactionId)) {
            throw new IllegalArgumentException("'clientTransactionId' cannot be NULL or empty");
        } else {
            try {
                saveCallback(callback, getParentActivity());
                Integer num = 0;
                Integer num2 = 0;
                Integer num3 = 0;
                getParentActivity().startIntentSenderForResult(pendingIntent.getIntentSender(), 101, new Intent(), num.intValue(), num2.intValue(), num3.intValue());
            } catch (IntentSender.SendIntentException e) {
                Logger.e(Area.TRANSACTION.value() | Area.OFFER.value(), "Purchase failed", e);
                new TransactionManager(commContext.getApplicationContext()).cancelManagedOfferTransaction(clientTransactionId, commContext);
                JavaScriptAPI.addDataAndMakeJSCallback(callback, new JSONObject(), false, false, false, JavaScriptAPI.JavaScriptCallbackFailureReason.MARKETPLACE, e);
            }
        }
    }

    private class waitForAuth implements Runnable {
        CommContext mContext;
        ResultReceiver mReceiver;

        public waitForAuth(CommContext c, ResultReceiver receiver) {
            this.mContext = c;
            this.mReceiver = receiver;
        }

        public void run() {
            try {
                AuthManager.initialize(this.mContext.getApplicationContext());
                AuthManager.getInstance().waitOnAuth();
                this.mReceiver.send(1, (Bundle) null);
                if (GetJarWebViewSubActivity.this._shouldShowLoadingUI) {
                    GetJarWebViewSubActivity.this.waitDialogHide();
                }
            } catch (Exception e) {
                try {
                    e.printStackTrace();
                    for (Throwable exc : this.mContext.getExceptions().values()) {
                        exc.printStackTrace();
                    }
                } catch (Exception e2) {
                    e2.printStackTrace();
                } catch (Throwable th) {
                    if (GetJarWebViewSubActivity.this._shouldShowLoadingUI) {
                        GetJarWebViewSubActivity.this.waitDialogHide();
                    }
                    throw th;
                }
                try {
                    this.mReceiver.send(2, (Bundle) null);
                } catch (Exception e3) {
                    e3.printStackTrace();
                }
                if (GetJarWebViewSubActivity.this._shouldShowLoadingUI) {
                    GetJarWebViewSubActivity.this.waitDialogHide();
                }
            }
        }
    }

    private boolean isUrlExpired() {
        Long age = Long.valueOf(System.currentTimeMillis() - ((Long) RewardUtility.getWebSharedPrefsMap(this.getJarActivity.getApplicationContext()).get(Constants.WEB_TIMESTAMP)).longValue());
        Logger.v(Area.CONFIG.value() | Area.UI.value(), String.format(Locale.US, "isUrlExpired(): URL cache age: %1$d", new Object[]{age}));
        try {
            long cachedUrlTtl = Utility.convertMillSec(Long.parseLong(GetJarConfig.getInstance(this.mCommContext, true).getDirectiveValue(GetJarConfig.KEY_WEBVIEW_SAVED_URL_TTL)));
            if (age.longValue() >= cachedUrlTtl) {
                Logger.v(Area.CONFIG.value() | Area.UI.value(), String.format(Locale.US, "isUrlExpired(): AGE:%1$d >= TTL:%2$d  [Returning:TRUE]", new Object[]{age, Long.valueOf(cachedUrlTtl)}));
                return true;
            }
            Logger.v(Area.CONFIG.value() | Area.UI.value(), String.format(Locale.US, "isUrlExpired(): AGE:%1$d < TTL:%2$d  [Returning:FALSE]", new Object[]{age, Long.valueOf(cachedUrlTtl)}));
            return false;
        } catch (Exception e) {
            Logger.e(Area.CONFIG.value() | Area.UI.value(), "isUrlExpired(): failed", e);
            return false;
        }
    }

    public static void loadErrorPage(ErrorType type, String subCode, WebView view) {
        Logger.d(Area.UI.value(), "loadErrorPage: ErrorType:" + type.toString());
        sErrorSource.mErrorType = type;
        sErrorSource.mSubCode = subCode;
        loadUrlInWebView(view, Constants.DEFAULT_ERROR_PAGE);
    }

    private String getHomeUrl() {
        Logger.d(Area.CONFIG.value(), String.format(Locale.US, "getHomeUrl(): current '%1$s'", new Object[]{this.mUrl}));
        Map<String, ?> rewardsPrefsMap = RewardUtility.getWebSharedPrefsMap(this.getJarActivity.getApplicationContext());
        if (rewardsPrefsMap.containsKey(Constants.WEB_LAST_KNOWN)) {
            String historyUrl = (String) rewardsPrefsMap.get(Constants.WEB_LAST_KNOWN);
            if (!StringUtility.isNullOrEmpty(historyUrl)) {
                Logger.d(Area.CONFIG.value(), String.format(Locale.US, "getHomeUrl(): Last known url: %1$s", new Object[]{historyUrl}));
                if (!isUrlExpired()) {
                    try {
                        new URI(historyUrl);
                        Logger.d(Area.CONFIG.value(), String.format(Locale.US, "getHomeUrl(): Selecting unexpired URL from cache: '%1$s'", new Object[]{historyUrl}));
                        this.mUrl = historyUrl;
                    } catch (URISyntaxException e) {
                        Logger.e(Area.CONFIG.value(), String.format(Locale.US, "getHomeUrl(): Bad URL value found in cache: '%1$s'", new Object[]{historyUrl}));
                        this.mUrl = GetJarConfig.getInstance(this.mCommContext, true).getDirectiveValue(GetJarConfig.KEY_DEFAULT_WEBVIEW_URL);
                    }
                }
            }
        }
        if (StringUtility.isNullOrEmpty(this.mUrl)) {
            if (checkIfAlreadyShowingError()) {
                return null;
            }
            this.mUrl = Constants.DEFAULT_ERROR_PAGE;
            sErrorSource.mErrorType = ErrorType.NETWORK;
        }
        Logger.d(Area.CONFIG.value(), String.format(Locale.US, "getHomeUrl(): returning '%1$s'", new Object[]{this.mUrl}));
        return this.mUrl;
    }

    private boolean checkIfAlreadyShowingError() {
        if (mWebView == null || !Constants.DEFAULT_ERROR_PAGE.equalsIgnoreCase(mWebView.getUrl())) {
            return false;
        }
        return true;
    }

    private void initWebView() {
        Logger.w(Area.UI.value(), "initWebView()");
        this.mJavaScriptInterface = new GetJarJavaScriptInterface(this.mCommContext, this, this.mReceiver, this.mOffers);
        mWebView.addJavascriptInterface(this.mJavaScriptInterface, Constants.USER_AGENT_APP);
        mWebView.setScrollBarStyle(33554432);
        WebSettings webSettings = mWebView.getSettings();
        webSettings.setJavaScriptEnabled(true);
        webSettings.setRenderPriority(WebSettings.RenderPriority.HIGH);
        webSettings.setUserAgentString(this.mUserAgent);
        webSettings.setCacheMode(2);
        mWebView.setOnTouchListener(this);
        mWebView.setWebViewClient(new GetJarWebViewClient(this, this.mCommContext));
        mWebView.setWebChromeClient(new WebChromeClient() {
            public void onConsoleMessage(String message, int lineNumber, String sourceID) {
                Logger.d(Area.UI.value(), String.format(Locale.US, "%1$s -- From line %2$d of %3$s", new Object[]{message, Integer.valueOf(lineNumber), sourceID}));
            }
        });
    }

    /* access modifiers changed from: protected */
    public void simpleReload() {
        Logger.d(Area.UI.value(), "Telling the WebView to reload the current URL");
        String url = getHomeUrl();
        if (!StringUtility.isNullOrEmpty(url)) {
            loadUrlInWebView(mWebView, url);
        }
    }

    public static void updateUIWithEarnResults(String earnState, String earnSubstate, String friendlyName, long amount, String packageName, String legacyItemId) {
        String str;
        String urlFormat;
        if (StringUtility.isNullOrEmpty(packageName)) {
            throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
        }
        Logger.i(Area.EARN.value() | Area.TRANSACTION.value() | Area.UI.value(), String.format(Locale.US, "GetJarActivity: updateUIWithEarnResults() started [earnState:%1$s earnSubstate:%2$s friendlyName:%3$s amount:%4$d packageName:%5$s legacyItemId:%6$s]", new Object[]{earnState, earnSubstate, friendlyName, Long.valueOf(amount), packageName, legacyItemId}));
        try {
            if (mWebView == null) {
                Logger.i(Area.EARN.value() | Area.TRANSACTION.value() | Area.UI.value(), String.format(Locale.US, "GetJarActivity: updateUIWithEarnResults() not refreshing, WebView is NULL", new Object[0]));
                return;
            }
            if ("SUCCESS".equals(earnState)) {
                Logger.i(Area.EARN.value() | Area.TRANSACTION.value() | Area.UI.value(), "GetJarActivity: updateUIWithEarnResults() calling javascript:GJ.successfulEarnInstall()");
                urlFormat = "javascript:GJ.successfulEarnInstall(\"%1$s\",\"%2$s\",\"%3$s\",\"%4$s\",%5$d)";
            } else {
                Logger.i(Area.EARN.value() | Area.TRANSACTION.value() | Area.UI.value(), "GetJarActivity: updateUIWithEarnResults() calling javascript:GJ.failedEarnInstall()");
                urlFormat = "javascript:GJ.failedEarnInstall(\"%1$s\",\"%2$s\",\"%3$s\",\"%4$s\",%5$d)";
            }
            loadUrlInWebView(mWebView, String.format(Locale.US, urlFormat, new Object[]{legacyItemId, packageName, friendlyName, earnSubstate, Long.valueOf(amount)}));
            Logger.i(Area.EARN.value() | Area.TRANSACTION.value() | Area.UI.value(), "GetJarActivity: updateUIWithEarnResults() finished");
        } finally {
            str = "GetJarActivity: updateUIWithEarnResults() finished";
            Logger.i(Area.EARN.value() | Area.TRANSACTION.value() | Area.UI.value(), str);
        }
    }

    public static void updateUIwithOfferResults(Context context, InAppPurchaseManager.ManagedOfferStatus managedOfferStatus, JSONObject resultJson) {
        boolean success;
        boolean moneyTaken;
        boolean recoverable;
        if (context == null) {
            throw new IllegalArgumentException("'context' cannot be null");
        } else if (managedOfferStatus == null) {
            throw new IllegalArgumentException("'managedOfferStatus' cannot be null");
        } else {
            String callbackString = getCallbackString(context);
            JavaScriptAPI.JavaScriptCallbackFailureReason reason = JavaScriptAPI.JavaScriptCallbackFailureReason.NONE;
            switch (managedOfferStatus) {
                case SUCCESS:
                    success = true;
                    moneyTaken = true;
                    recoverable = true;
                    break;
                case SERVER_ERROR_RECOVERABLE:
                    success = false;
                    moneyTaken = true;
                    recoverable = true;
                    reason = JavaScriptAPI.JavaScriptCallbackFailureReason.NETWORK;
                    break;
                case SERVER_ERROR:
                    success = false;
                    moneyTaken = true;
                    recoverable = false;
                    reason = JavaScriptAPI.JavaScriptCallbackFailureReason.UNKNOWN;
                    break;
                case GOOGLE_RELATED_FAILURE:
                    success = false;
                    moneyTaken = false;
                    recoverable = false;
                    reason = JavaScriptAPI.JavaScriptCallbackFailureReason.MARKETPLACE;
                    break;
                case GOOGLE_FAILURE_AFTER_PURCHASE:
                    success = false;
                    moneyTaken = true;
                    recoverable = false;
                    reason = JavaScriptAPI.JavaScriptCallbackFailureReason.MARKETPLACE;
                    break;
                default:
                    success = false;
                    moneyTaken = false;
                    recoverable = false;
                    reason = JavaScriptAPI.JavaScriptCallbackFailureReason.UNKNOWN;
                    break;
            }
            JavaScriptAPI.addDataAndMakeJSCallback(callbackString, resultJson, success, moneyTaken, recoverable, reason, (Throwable) null);
        }
    }

    protected static void saveCallback(String callback, Context context) {
        if (StringUtility.isNullOrEmpty(callback)) {
            throw new IllegalArgumentException("'callback' cannot be null or empty");
        }
        SharedPreferences.Editor editor = context.getSharedPreferences("GetJarClientPrefs", 0).edit();
        editor.putString(String.format(Locale.US, "%1$d.%2$s", new Object[]{101, GooglePlayResponseCallback}), callback);
        editor.commit();
    }

    protected static String getCallbackString(Context context) {
        if (context == null) {
            throw new IllegalArgumentException("'context' cannot be null");
        }
        return context.getSharedPreferences("GetJarClientPrefs", 0).getString(String.format(Locale.US, "%1$d.%2$s", new Object[]{101, GooglePlayResponseCallback}), (String) null);
    }

    public void reload() {
        boolean z;
        try {
            Logger.d(Area.UI.value(), "GetJarActivity: reload()");
            if (mWebView != null) {
                Logger.d(Area.UI.value(), "GetJarActivity: reload() calling javascript:GJ.onFocus()");
                loadUrlInWebView(mWebView, "javascript:GJ.onFocus()");
            } else {
                Logger.d(Area.UI.value(), "GetJarActivity: reload() WebView is null");
            }
            if (!z) {
                waitDialogHide();
            }
        } finally {
            if (this._shouldShowLoadingUI) {
                waitDialogShow();
            } else {
                waitDialogHide();
            }
        }
    }

    public void close() {
        try {
            hideManagedDialogs();
            waitDialogHide();
            this.mCommContext.postResponse(new CloseResponse());
            String clientTransactionId = getCurrentPurchaseClientTransactionId();
            if (clientTransactionId != null) {
                Logger.d(Area.PURCHASE.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Cancelling clientTransactionId %1$s", new Object[]{clientTransactionId}));
                new TransactionManager(this.getJarActivity.getApplicationContext()).cancelPurchaseTransaction(clientTransactionId, this.mCommContext);
            }
        } finally {
            this.getJarActivity.finish();
        }
    }

    public static void loadUrl(String url) {
        if (mWebView != null) {
            try {
                new URI(url);
                loadUrlInWebView(mWebView, url);
            } catch (URISyntaxException e) {
                Logger.e(Area.UI.value(), String.format("loadUrl() failed [url:%1$s]", new Object[]{url}), e);
            }
        }
    }

    protected static void loadUrlInWebView(WebView webView, String url) {
        loadUrlInWebView(webView, url, false);
    }

    protected static void loadUrlInWebView(final WebView webView, final String url, final boolean clearHistory) {
        Logger.d(Area.UI.value(), String.format(Locale.US, "Loading URL '%1$s' from '%2$s'", new Object[]{url, Thread.currentThread().getStackTrace()[3].getMethodName()}));
        if (webView == null) {
            Logger.e(Area.UI.value(), "loadUrlInWebView() called with NULL WebView");
        } else if (StringUtility.isNullOrEmpty(url)) {
            Logger.e(Area.UI.value(), "loadUrlInWebView() called with NULL or empty url");
        } else if (!Utility.isCurrentThreadTheUIThread()) {
            Logger.w(Area.UI.value(), String.format(Locale.US, "Loading URL '%1$s' from non-UI thread! Posting back to UI thread.", new Object[]{url}));
            new Handler(Looper.getMainLooper()).post(new Runnable() {
                public void run() {
                    try {
                        webView.loadUrl(url);
                        if (clearHistory) {
                            try {
                                webView.clearHistory();
                            } catch (Exception e) {
                                Logger.e(Area.UI.value(), "WebView.clearHistory() failed", e);
                            }
                        }
                    } catch (Exception e2) {
                        Logger.e(Area.UI.value(), "loadUrlInWebView() failed", e2);
                    }
                }
            });
        } else {
            webView.loadUrl(url);
            if (clearHistory) {
                try {
                    webView.clearHistory();
                } catch (Exception e) {
                    Logger.e(Area.UI.value(), "WebView.clearHistory() failed", e);
                }
            }
        }
    }

    public void loadPostAuthUI() {
        String url;
        Logger.d(Area.UI.value(), "Waiting for UserAuth is dismissed");
        if (!this._shouldShowLoadingUI) {
            waitDialogHide();
        }
        boolean clearHistory = false;
        Logger.v(Area.UI.value(), String.format(Locale.US, "GetJarWebViewSubActivity: dismiss() loadWalletPage=%1$s", new Object[]{Boolean.valueOf(this._loadWalletPage)}));
        Logger.v(Area.UI.value(), String.format(Locale.US, "GetJarWebViewSubActivity: dismiss() loadManagedCheckoutPage=%1$s", new Object[]{Boolean.valueOf(this._loadCheckoutPage)}));
        if (this._loadWalletPage) {
            this._loadWalletPage = false;
            url = GetJarConfig.getInstance(this.mCommContext, true).getDirectiveValue(GetJarConfig.KEY_WALLET_URL);
        } else if (this._loadCheckoutPage) {
            this._loadCheckoutPage = false;
            url = GetJarConfig.getInstance(this.mCommContext, true).getDirectiveValue(GetJarConfig.KEY_MANAGED_CHECKOUT_URL);
            clearHistory = true;
        } else {
            url = getHomeUrl();
        }
        if (!StringUtility.isNullOrEmpty(url)) {
            Logger.v(Area.UI.value(), String.format(Locale.US, "dismiss() Loading '%1$s'", new Object[]{url}));
            loadUrlInWebView(mWebView, url, clearHistory);
        }
        _ExecutorServiceUIWork.execute(new Runnable() {
            public void run() {
                GetJarWebViewSubActivity.this.showUserSwitchedUIAsNeeded();
            }
        });
    }

    /* access modifiers changed from: private */
    @SuppressLint({"InlinedApi"})
    public void showUserSwitchedUIAsNeeded() {
        try {
            if (this.getJarActivity.getPackageName().equals(Constants.GREENJAR_PACKAGE)) {
                Logger.v(Area.UI.value(), "USER_SWITCHED_UI: We are Rewards");
                AuthManager.initialize(this.getJarActivity);
                AuthManager.getInstance().waitOnAuth();
                AccountHistoryManager.initialize(this.getJarActivity);
                if (AccountHistoryManager.getInstance().isUserSwitchedUINeeded(AuthManager.getInstance().getUserAccessId())) {
                    Logger.v(Area.UI.value(), "USER_SWITCHED_UI: isUserSwitchedUINeeded() == true");
                    String currentAccountName = AccountHistoryManager.getInstance().getCurrentAccountName();
                    if (!StringUtility.isNullOrEmpty(currentAccountName)) {
                        String previousAccountName = AccountHistoryManager.getInstance().getPreviousAccountName();
                        if (!StringUtility.isNullOrEmpty(previousAccountName)) {
                            Logger.v(Area.UI.value(), String.format(Locale.US, "USER_SWITCHED_UI: currentAccountName:%1$s previousAccountName:%2$s", new Object[]{currentAccountName, previousAccountName}));
                            if (!currentAccountName.equalsIgnoreCase(previousAccountName)) {
                                Logger.v(Area.UI.value(), "USER_SWITCHED_UI: Showing UI...");
                                final AlertDialog.Builder builder = new AlertDialog.Builder(this.getJarActivity);
                                LinearLayout main = new LinearLayout(this.getJarActivity);
                                main.setOrientation(1);
                                LinearLayout.LayoutParams textViewParams = new LinearLayout.LayoutParams(-1, -2);
                                textViewParams.setMargins(6, 6, 6, 6);
                                main.addView(getUserSwitchedTextElement("You have multiple accounts with Getjar. You are now logged in as:", textViewParams, false));
                                main.addView(getUserSwitchedTextElement(currentAccountName, textViewParams, true));
                                main.addView(getUserSwitchedTextElement("You were previously logged in as:", textViewParams, false));
                                main.addView(getUserSwitchedTextElement(previousAccountName, textViewParams, true));
                                builder.setView(main);
                                getParentActivity().runOnUiThread(new Runnable() {
                                    public void run() {
                                        try {
                                            AlertDialog alertDialog = builder.create();
                                            alertDialog.setTitle("Account Changed");
                                            alertDialog.setButton(-1, "OK", new DialogInterface.OnClickListener() {
                                                public void onClick(DialogInterface dialog, int which) {
                                                    try {
                                                        AccountHistoryManager.getInstance().addEvent(AuthManager.getInstance().getUserAccessId(), AccountEventType.USER_SWITCHED_UI_COMPLETED);
                                                        try {
                                                            dialog.dismiss();
                                                        } catch (Exception e) {
                                                            Logger.e(Area.UI.value(), "USER_SWITCHED_UI: dialog.dismiss() failed", e);
                                                        }
                                                    } catch (Exception e2) {
                                                        Logger.e(Area.UI.value(), "USER_SWITCHED_UI: Work for 'user switched' UI failed", e2);
                                                        try {
                                                            dialog.dismiss();
                                                        } catch (Exception e3) {
                                                            Logger.e(Area.UI.value(), "USER_SWITCHED_UI: dialog.dismiss() failed", e3);
                                                        }
                                                    } catch (Throwable th) {
                                                        try {
                                                            dialog.dismiss();
                                                        } catch (Exception e4) {
                                                            Logger.e(Area.UI.value(), "USER_SWITCHED_UI: dialog.dismiss() failed", e4);
                                                        }
                                                        throw th;
                                                    }
                                                }
                                            });
                                            try {
                                                alertDialog.setIconAttribute(16843605);
                                            } catch (NoSuchMethodError e) {
                                                alertDialog.setIcon(Drawable.createFromStream(GetJarWebViewSubActivity.this.getJarActivity.getAssets().open("alertIcon.png"), (String) null));
                                            }
                                            alertDialog.setCancelable(false);
                                            alertDialog.setCanceledOnTouchOutside(false);
                                            alertDialog.show();
                                        } catch (Exception e2) {
                                            Logger.e(Area.UI.value(), "USER_SWITCHED_UI: Work for 'user switched' UI failed", e2);
                                        }
                                    }
                                });
                            }
                        }
                    }
                }
            }
        } catch (Exception e) {
            Logger.e(Area.UI.value(), "USER_SWITCHED_UI: Work for 'user switched' UI failed", e);
        }
    }

    private TextView getUserSwitchedTextElement(String text, LinearLayout.LayoutParams textViewParams, boolean isAccountName) {
        TextView message = new TextView(this.getJarActivity);
        message.setLayoutParams(textViewParams);
        message.setText(text);
        message.setGravity(1);
        if (isAccountName) {
            message.setTypeface((Typeface) null, 1);
            message.setPadding(0, 10, 0, 10);
        }
        return message;
    }

    /* access modifiers changed from: private */
    public void purchaseSuccess(Bundle bundle) {
        waitDialogHide();
        String productId = bundle.getString(Constants.APP_ID);
        String productName = bundle.getString("name");
        Long productCost = Long.valueOf(bundle.getLong("price"));
        if (productCost == null) {
            throw new IllegalStateException("Product cost cannot be null");
        }
        loadUrlInWebView(mWebView, "javascript:GJ.successfulPurchaseUnmanagedOffer(\"" + productId + "\",\"" + productName + "\",\"" + bundle.getString(Constants.RequestInstallSubState.KEY()) + "\"," + productCost + ")");
        Intent intent = new Intent();
        intent.putExtras(bundle);
        this.getJarActivity.setResult(-1, intent);
        this.getJarActivity.finish();
    }

    /* access modifiers changed from: private */
    public void purchaseFail(Bundle bundle) {
        waitDialogHide();
        String productId = bundle.getString(Constants.APP_ID);
        String productName = bundle.getString("name");
        loadUrlInWebView(mWebView, "javascript:GJ.failedPurchaseUnmanagedOffer(\"" + productId + "\",\"" + productName + "\",\"" + bundle.getString(Constants.RequestInstallSubState.KEY()) + "\"," + Long.valueOf(bundle.getLong("price")) + ")");
        Intent intent = new Intent();
        intent.putExtras(bundle);
        this.getJarActivity.setResult(0, intent);
        this.getJarActivity.finish();
    }

    /* access modifiers changed from: private */
    public void serviceFail(Bundle bundle) {
        waitDialogHide();
        loadErrorPage(ErrorType.SERVICE, "", mWebView);
    }

    /* access modifiers changed from: protected */
    public void hideManagedDialogs() {
        Logger.v(Area.UI.value(), "AuthFlow: hideManagedDialogs() START");
        synchronized (this._dialogsToManageLock) {
            if (this._dialogsToManage != null) {
                for (Dialog dlg : this._dialogsToManage) {
                    try {
                        dlg.cancel();
                    } catch (Exception e) {
                    }
                }
            }
        }
        Logger.v(Area.UI.value(), "AuthFlow: hideManagedDialogs() FINISH");
    }

    public void onSaveInstanceState(Bundle outState) {
        Logger.d(Area.OS_ENTRY_POINT.value(), "onSaveInstanceState()");
        super.onSaveInstanceState(outState);
        mWebView.saveState(outState);
        outState.putString(Constants.SDK_URL, this.mUrl);
        outState.putString(Constants.GETJAR_CONTEXT_ID_KEY, this.mCommContext.getCommContextId());
    }

    public void onCreate(Bundle savedInstanceState) {
        Logger.d(Area.OS_ENTRY_POINT.value(), "GetJarActivity.onCreate()");
        super.onCreate(savedInstanceState);
        GlobalActivityRegistrar.getInstance().registerActivity(this.getJarActivity);
        String commContextId = null;
        ArrayList<Product> products = null;
        Bundle extras = this.getJarActivity.getIntent().getExtras();
        if (extras != null) {
            products = extras.getParcelableArrayList(Constants.PRODUCT_LIST);
            commContextId = extras.getString(Constants.GETJAR_CONTEXT_ID_KEY);
            String language = extras.getString(Constants.KEY_LANGUAGE);
            if (!StringUtility.isNullOrEmpty(language)) {
                Language = language;
                Logger.d(Area.UI.value() | Area.OS_ENTRY_POINT.value(), "GetJarActivity.onCreate() -- setting language to " + language);
            }
        }
        if (products == null || products.size() <= 0) {
            Logger.e(Area.PURCHASE.value() | Area.OS_ENTRY_POINT.value() | Area.TRANSACTION.value(), String.format(Locale.US, "The Intent used to start the GetJarWebViewSubActivity must contain a Product list value for '%1$s' in its Extras", new Object[]{Constants.PRODUCT_LIST}));
            this.getJarActivity.finish();
            return;
        }
        this.mOffers.clear();
        Iterator i$ = products.iterator();
        while (i$.hasNext()) {
            this.mOffers.add(new ProductWithClientTransactionID(i$.next()));
        }
        if (StringUtility.isNullOrEmpty(commContextId)) {
            Logger.e(Area.COMM.value() | Area.OS_ENTRY_POINT.value(), String.format(Locale.US, "The Intent used to start the GetJarActivity must contain a value for '%1$s' in its Extras", new Object[]{Constants.GETJAR_CONTEXT_ID_KEY}));
            this.getJarActivity.finish();
            return;
        }
        CommManager.initialize(this.getJarActivity);
        this.mCommContext = CommManager.retrieveContext(commContextId);
        if (this.mCommContext == null) {
            Logger.e(Area.COMM.value() | Area.OS_ENTRY_POINT.value(), String.format(Locale.US, "No CommContext instance found for the ID '%1$s'", new Object[]{commContextId}));
            this.getJarActivity.finish();
            return;
        }
        this._waitDialogWasShowing = true;
        AuthManager.initialize(this.mCommContext.getApplicationContext());
        AuthManager.getInstance().ensureAuthWithUI(this);
        Utility.previousVersionCleanUp(this.getJarActivity.getApplicationContext());
        sErrorSource = new ErrorSource(ErrorType.NETWORK, "");
        this.mCommContext.registerFailureCallback(this._commFailureCallback);
        try {
            this.mUrl = GetJarConfig.getInstance(this.mCommContext, true).getDirectiveValue(GetJarConfig.KEY_DEFAULT_WEBVIEW_URL);
            Logger.d(Area.CONFIG.value() | Area.OS_ENTRY_POINT.value(), "onCreate() -- using mUrl=" + this.mUrl);
            this.mUserAgent = this.mCommContext.getSdkUserAgent();
            CookieSyncManager.createInstance(this.getJarActivity.getApplicationContext());
            mWebView = new WebView(this.getJarActivity);
            if (savedInstanceState != null) {
                mWebView.restoreState(savedInstanceState);
            }
            if (this.getJarActivity.getPackageName().equals(Constants.GREENJAR_PACKAGE)) {
                this.getJarActivity.requestWindowFeature(7);
            } else {
                this.getJarActivity.requestWindowFeature(1);
            }
            this.getJarActivity.setContentView(mWebView);
            initWebView();
            if (RedemptionEngine.IntentTypeShowWallet.equals(this.getJarActivity.getIntent().getStringExtra(RedemptionEngine.IntentTypeKey))) {
                Logger.v(Area.UI.value() | Area.OS_ENTRY_POINT.value() | Area.REDEEM.value(), "GetJarWebViewSubActivity: onCreate() setting loadWalletPage flag");
                this._loadWalletPage = true;
            } else if (RedemptionEngine.IntentTypeShowCheckout.equals(this.getJarActivity.getIntent().getStringExtra(RedemptionEngine.IntentTypeKey))) {
                Logger.v(Area.UI.value() | Area.OS_ENTRY_POINT.value() | Area.OFFER.value(), "GetJarWebViewSubActivity: onCreate() setting loadCheckoutPage flag");
                this._loadCheckoutPage = true;
                this.mJavaScriptInterface.setCurrentManagedOfferDetails(this.getJarActivity.getIntent().getStringExtra(JavaScriptAPI.EXTRA_MANAGED_CHECKOUT_DATA));
            }
            waitForAuthorization();
            this.inAppBillingJSNotifier = new InAppBillingNotifier();
            this.getJarActivity.registerReceiver(getScreenWakeupReceiver(), new IntentFilter("android.intent.action.SCREEN_ON"));
            this._shouldShowLoadingUI = true;
        } catch (Exception e) {
            Logger.e(Area.CONFIG.value() | Area.OS_ENTRY_POINT.value(), "GetJarActivity.onCreate() failed", e);
            throw new IllegalStateException("Failed to determine default webview url, unable to create webview");
        }
    }

    public void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        Logger.v(Area.UI.value() | Area.OS_ENTRY_POINT.value(), "GetJarWebViewSubActivity: onNewIntent()");
        if (RedemptionEngine.IntentTypeShowWallet.equals(intent.getStringExtra(RedemptionEngine.IntentTypeKey))) {
            this._loadWalletPage = true;
        } else if (RedemptionEngine.IntentTypeShowCheckout.equals(intent.getStringExtra(RedemptionEngine.IntentTypeKey))) {
            this._loadCheckoutPage = true;
            this.mJavaScriptInterface.setCurrentManagedOfferDetails(intent.getStringExtra(JavaScriptAPI.EXTRA_MANAGED_CHECKOUT_DATA));
        }
        loadPostAuthUI();
    }

    public void onConfigurationChanged(Configuration newConfig) {
        String orientation = Constants.PORTRAIT;
        if (newConfig.orientation == 2) {
            orientation = Constants.LANDSCAPE;
        } else if (newConfig.orientation == 1) {
            orientation = Constants.PORTRAIT;
        }
        Logger.d(Area.UI.value() | Area.OS_ENTRY_POINT.value() | Area.CONFIG.value(), "GetJarActivity -- onConfigurationChanged new orientation =" + orientation);
        mWebView.loadUrl(String.format(Locale.US, "javascript:GJ.orientationChangeHandler(\"%s\")", new Object[]{orientation}));
        super.onConfigurationChanged(newConfig);
    }

    public void onPause() {
        Logger.v(Area.UI.value() | Area.OS_ENTRY_POINT.value(), "GetJarActivity: onPause() START");
        super.onPause();
        this._isForeground = false;
        hideManagedDialogs();
        waitDialogHide();
        CookieSyncManager.getInstance().stopSync();
        UnRegisterPackageReceiver();
        this.getJarActivity.unregisterReceiver(this.inAppBillingJSNotifier);
    }

    public void onResume() {
        String str;
        String str2;
        Logger.v(Area.UI.value() | Area.OS_ENTRY_POINT.value(), "GetJarActivity: onResume() START");
        try {
            super.onResume();
            this._isForeground = true;
            waitDialogHide();
            RewardUtility.saveGetJarTimestamp(this.getJarActivity.getApplicationContext());
            CookieSyncManager.getInstance().startSync();
            RegisterPackageReceiver();
            IntentFilter filter = new IntentFilter();
            filter.addAction(Constants.ACTION_NOTIFY_BUY_GOLD);
            this.getJarActivity.registerReceiver(this.inAppBillingJSNotifier, filter);
            this._waitDialogWasShowing = true;
            AuthManager.initialize(this.mCommContext.getApplicationContext());
            AuthManager.getInstance().ensureAuthWithUI(this);
            reload();
        } finally {
            str = "GetJarActivity: onResume() starting earning monitoring thread";
            Logger.v(Area.EARN.value() | Area.OS_ENTRY_POINT.value(), str);
            EarningMonitor.getInstance(this.mCommContext.getApplicationContext()).startMonitoring();
            str2 = "GetJarActivity: onResume() starting usage monitoring thread";
            Logger.v(Area.USAGE.value() | Area.OS_ENTRY_POINT.value(), str2);
            UsageMonitor.getInstance(this.mCommContext.getApplicationContext()).startMonitoring();
        }
    }

    public class InAppBillingNotifier extends BroadcastReceiver {
        public InAppBillingNotifier() {
        }

        public void onReceive(Context context, Intent intent) {
            if (intent != null && intent.getAction().equals(Constants.ACTION_NOTIFY_BUY_GOLD)) {
                if (!intent.hasExtra(Constants.BILLING_FAILURE_REASON)) {
                    GetJarWebViewSubActivity.mWebView.loadUrl(String.format(Locale.US, "javascript:GJ.successfulBuyGold(\"%s\",%s)", new Object[]{intent.getStringExtra("ITEM_ID"), intent.getStringExtra(Constants.BUY_CURRENCY_GOLD_VALUE)}));
                    Logger.d(Area.BUY_GOLD.value() | Area.OS_ENTRY_POINT.value(), "GetJarActivity BuyingGoldJavascriptNotifier success ");
                    return;
                }
                Logger.d(Area.BUY_GOLD.value() | Area.OS_ENTRY_POINT.value(), "GetJarActivity BuyingGoldJavascriptNotifier failure");
                GetJarWebViewSubActivity.mWebView.loadUrl(String.format(Locale.US, "javascript:GJ.failedBuyGold(\"%s\",%s,\"%s\")", new Object[]{intent.getStringExtra("ITEM_ID"), intent.getStringExtra(Constants.BUY_CURRENCY_GOLD_VALUE), intent.getStringExtra(Constants.BILLING_FAILURE_REASON)}));
            }
        }
    }

    public void onDestroy() {
        try {
            if (this.mCommContext != null) {
                this.mCommContext.postResponse(new CloseResponse());
            }
            InAppPurchaseManager.getBasicInstance(getParentActivity().getApplicationContext()).unBindFromGooglePlaySvc();
            this.getJarActivity.unregisterReceiver(getScreenWakeupReceiver());
            StatisticsTracker.dumpAllStatsToLogCat(this.getJarActivity);
        } catch (Throwable t) {
            Logger.w(Area.UI.value() | Area.USAGE.value() | Area.OS_ENTRY_POINT.value(), t.getMessage());
        } finally {
            hideManagedDialogs();
            waitDialogHide();
            super.onDestroy();
        }
    }

    public void onBackPressed() {
        try {
            if (!mWebView.canGoBack()) {
                Logger.d(Area.UI.value(), "onBackPressed() -- on last page, exiting..");
                GlobalActivityRegistrar.getInstance().finishAllActivities();
                close();
                return;
            }
            mWebView.goBack();
            Logger.d(Area.UI.value(), "onBackPressed() -- going back..");
        } catch (Throwable t) {
            Logger.e(Area.UI.value(), "GetJarActivity.onBackPressed() failed", t);
        }
    }

    public void onSharedPreferenceChanged(SharedPreferences sharedPreferences, String key) {
        try {
            String state = sharedPreferences.getString(key, "null");
            if ((!this.mCatchByMonitor && state.equalsIgnoreCase("SUCCESS")) || state.equalsIgnoreCase("FAIL")) {
                reload();
            }
        } catch (Exception e) {
        }
    }

    private class ScreenWakeupReceiver extends BroadcastReceiver {
        private ScreenWakeupReceiver() {
        }

        public void onReceive(Context context, Intent intent) {
            try {
                Logger.v(Area.USAGE.value() | Area.OS_ENTRY_POINT.value(), "Reloading the WebView due to screen wake-up");
                long webviewSleepReloadInterval = Long.valueOf(GetJarConfig.getInstance(GetJarWebViewSubActivity.this.mCommContext, false).getDirectiveValue(GetJarConfig.KEY_WEBVIEW_SLEEP_RELOAD_INTERVAL)).longValue();
                Logger.d(Area.USAGE.value() | Area.OS_ENTRY_POINT.value(), "GetJarJavaScriptInterface ScreenWakeupReceiver sleepReloadInterval=" + webviewSleepReloadInterval);
                if ((System.currentTimeMillis() / 1000) - GetJarWebViewSubActivity.this.mJavaScriptInterface.getLastReloadTime() > webviewSleepReloadInterval) {
                    Logger.d(Area.USAGE.value() | Area.OS_ENTRY_POINT.value(), "GetJarJavaScriptInterface ScreenWakeupReceiver reloading...");
                    GetJarWebViewSubActivity.mWebView.reload();
                    GetJarWebViewSubActivity.this.mJavaScriptInterface.setLastReloadTime();
                }
            } catch (Exception e) {
                Logger.e(Area.USAGE.value() | Area.OS_ENTRY_POINT.value(), "WebView reload failed", e);
            }
        }
    }

    private class CommFailureCallback implements CommFailureCallbackInterface {
        private CommFailureCallback() {
        }

        public void networkFailure() {
            GetJarWebViewSubActivity.this.waitDialogHide();
            GetJarWebViewSubActivity.loadErrorPage(ErrorType.NETWORK, "", GetJarWebViewSubActivity.mWebView);
        }

        public void authorizationFailure(String subcode) {
            GetJarWebViewSubActivity.this.waitDialogHide();
            GetJarWebViewSubActivity.loadErrorPage(ErrorType.AUTH, subcode, GetJarWebViewSubActivity.mWebView);
        }

        public void serviceFailure(Result result) {
            GetJarWebViewSubActivity.this.waitDialogHide();
            if (result.getResponseCode() >= 500 && result.getResponseCode() < 600) {
                String subcode = result.getErrorResponseSubcode();
                if (StringUtility.isNullOrEmpty(subcode)) {
                    subcode = "";
                }
                GetJarWebViewSubActivity.loadErrorPage(ErrorType.SERVICE, subcode, GetJarWebViewSubActivity.mWebView);
            }
        }
    }

    static class ManagedPurchase {
        public String description;
        public String name;
        public float price;
        public String token;

        ManagedPurchase() {
        }
    }

    protected class ManagedPurchaseWithClientTransactionID {
        private String _clientTransactionId = null;
        private final ManagedPurchase _managedPurchase;

        public ManagedPurchase getManagedPurchase() {
            return this._managedPurchase;
        }

        public String getClientTransactionId() {
            return this._clientTransactionId;
        }

        protected ManagedPurchaseWithClientTransactionID(ManagedPurchase managedPurchase) {
            if (managedPurchase == null) {
                throw new IllegalArgumentException("managedPurchase cannot be null");
            }
            this._managedPurchase = managedPurchase;
            this._clientTransactionId = UUID.randomUUID().toString();
            Logger.v(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Generated a new client transaction ID: '%1$s' [thread:%2$d]", new Object[]{this._clientTransactionId, Long.valueOf(Thread.currentThread().getId())}));
        }
    }

    protected class ProductWithClientTransactionID {
        private String _clientTransactionId = null;
        private final Product _product;

        public Product getProduct() {
            return this._product;
        }

        public String getClientTransactionId() {
            return this._clientTransactionId;
        }

        protected ProductWithClientTransactionID(Product product) {
            if (product == null) {
                throw new IllegalArgumentException("product cannot be null");
            }
            this._product = product;
            this._clientTransactionId = UUID.randomUUID().toString();
            Logger.v(Area.PURCHASE.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Generated a new client transaction ID: '%1$s' [thread:%2$d]", new Object[]{this._clientTransactionId, Long.valueOf(Thread.currentThread().getId())}));
        }
    }

    public boolean onTouch(View v, MotionEvent event) {
        switch (event.getAction()) {
            case 0:
                this.downX = (int) event.getX();
                this.downY = (int) event.getY();
                if (this.konamiCode == null) {
                    this.konamiCode = new StringBuilder(30);
                }
                if (this.konamiCode.length() <= 30) {
                    return false;
                }
                this.konamiCode.delete(0, 10);
                return false;
            case 1:
                if (this.downX != 0) {
                    this.subResult = (int) (event.getY() - ((float) this.downY));
                    if (this.subResult > TOUCH_DRAG_LENGTH) {
                        this.konamiCode.append(1);
                    } else if (this.subResult < -200) {
                        this.konamiCode.append(2);
                    }
                    this.subResult = (int) (event.getX() - ((float) this.downX));
                    if (this.subResult > TOUCH_DRAG_LENGTH) {
                        this.konamiCode.append(3);
                    } else if (this.subResult < -200) {
                        this.konamiCode.append(4);
                    }
                }
                this.downX = 0;
                this.downY = 0;
                return executeKonami(this.konamiCode.toString());
            default:
                return false;
        }
    }

    private boolean executeKonami(String code) {
        if (!code.contains("2314314231")) {
            return false;
        }
        new TransactionManager(this.getJarActivity).recoverOrphanedTransactions(this.mCommContext);
        Toast.makeText(this.getJarActivity, "Processing Orphaned Transactions!", 0).show();
        this.konamiCode = null;
        return true;
    }

    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode == 101) {
            final int requestCodeFinal = requestCode;
            final int resultCodeFinal = resultCode;
            final Intent dataFinal = data;
            _ExecutorServiceForGooglePlayResultWork.execute(new Runnable() {
                public void run() {
                    try {
                        InAppPurchaseManager.getInstance(GetJarWebViewSubActivity.this.getParentActivity()).managedOfferGooglePlayResponse(requestCodeFinal, resultCodeFinal, dataFinal);
                    } catch (Exception e) {
                        Logger.e(Area.OFFER.value() | Area.TRANSACTION.value(), "InAppPurchaseManager.managedOfferGooglePlayResponse() failed", e);
                    }
                }
            });
        }
    }
}
