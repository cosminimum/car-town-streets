package com.getjar.sdk.rewards;

import android.content.Context;
import android.graphics.Bitmap;
import android.os.Message;
import android.webkit.CookieSyncManager;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import com.getjar.sdk.comm.CommContext;
import com.getjar.sdk.comm.GetJarConfig;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.rewards.GetJarWebViewSubActivity;
import com.getjar.sdk.utilities.Constants;
import com.getjar.sdk.utilities.RewardUtility;
import com.getjar.sdk.utilities.StringUtility;
import com.getjar.sdk.utilities.Utility;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Locale;
/* loaded from: classes.dex */
public class GetJarWebViewClient extends WebViewClient {
    private GetJarWebViewSubActivity _parentActivity;
    CommContext mCommContext;
    Context mContext;

    public GetJarWebViewClient(GetJarWebViewSubActivity parentActivity, CommContext commContext) {
        this._parentActivity = null;
        this.mContext = parentActivity.getParentActivity();
        this.mCommContext = commContext;
        this._parentActivity = parentActivity;
    }

    @Override // android.webkit.WebViewClient
    public boolean shouldOverrideUrlLoading(WebView view, String url) {
        try {
            Logger.d(Area.UI.value() | Area.OS_ENTRY_POINT.value(), String.format(Locale.US, "GetJarWebViewClient: shouldOverrideUrlLoading() OverrideURl: %1$s", url));
            if (!url.equals(Constants.DEFAULT_ERROR_PAGE)) {
                saveUrl(url, this.mCommContext, this.mContext);
            }
            GetJarWebViewSubActivity.loadUrlInWebView(view, url);
        } catch (Exception e) {
            Logger.e(Area.UI.value() | Area.OS_ENTRY_POINT.value(), "GetJarWebViewClient: shouldOverrideUrlLoading() failed", e);
        }
        return true;
    }

    @Override // android.webkit.WebViewClient
    public void onPageStarted(WebView view, String url, Bitmap favicon) {
        try {
            Logger.d(Area.UI.value() | Area.OS_ENTRY_POINT.value(), "GetJarWebViewClient: onPageStarted()");
            this._parentActivity.waitDialogHide();
        } catch (Exception e) {
            Logger.e(Area.UI.value() | Area.OS_ENTRY_POINT.value(), "GetJarWebViewClient: onPageStarted() failed", e);
        }
    }

    @Override // android.webkit.WebViewClient
    public void onPageFinished(WebView view, String url) {
        try {
            Logger.d(Area.UI.value() | Area.OS_ENTRY_POINT.value(), String.format(Locale.US, "GetJarWebViewClient: onPageFinished() URL:%1$s", url));
            if (this._parentActivity.getShouldShowLoadingUI()) {
                Logger.d(Area.UI.value() | Area.OS_ENTRY_POINT.value(), "GetJarWebViewClient: onPageFinished() Setting ShouldShowLoadingUI to FALSE");
                this._parentActivity.setShouldShowLoadingUI(false);
            }
            this._parentActivity.waitDialogHide();
            this._parentActivity.mJavaScriptInterface.setLastReloadTime();
            CookieSyncManager.getInstance().sync();
            if (url.equals(Constants.DEFAULT_ERROR_PAGE)) {
                if (GetJarWebViewSubActivity.sErrorSource.mErrorType == GetJarWebViewSubActivity.ErrorType.NETWORK) {
                    GetJarWebViewSubActivity.loadUrlInWebView(view, "javascript:GJ.onError(\"NETWORK\",\"" + GetJarWebViewSubActivity.sErrorSource.mSubCode + "\")");
                } else if (GetJarWebViewSubActivity.sErrorSource.mErrorType == GetJarWebViewSubActivity.ErrorType.AUTH) {
                    GetJarWebViewSubActivity.loadUrlInWebView(view, "javascript:GJ.onError(\"AUTH\",\"" + GetJarWebViewSubActivity.sErrorSource.mSubCode + "\")");
                } else if (GetJarWebViewSubActivity.sErrorSource.mErrorType == GetJarWebViewSubActivity.ErrorType.SERVICE) {
                    GetJarWebViewSubActivity.loadUrlInWebView(view, "javascript:GJ.onError(\"SERVICE\",\"" + GetJarWebViewSubActivity.sErrorSource.mSubCode + "\")");
                }
            }
        } catch (Exception e) {
            Logger.e(Area.UI.value() | Area.OS_ENTRY_POINT.value(), "GetJarWebViewClient: onPageFinished() failed", e);
        }
    }

    @Override // android.webkit.WebViewClient
    public void onReceivedError(WebView view, int errorCode, String description, String failingUrl) {
        try {
            Logger.d(Area.UI.value() | Area.OS_ENTRY_POINT.value(), String.format(Locale.US, "GetJarWebViewClient: onReceivedError() Error while loading URL '%1$s' [errorCode:%2$d description:%3$s]", failingUrl, Integer.valueOf(errorCode), description));
            super.onReceivedError(view, errorCode, description, failingUrl);
            this._parentActivity.setShouldShowLoadingUI(false);
            this._parentActivity.waitDialogHide();
            GetJarWebViewSubActivity.loadUrlInWebView(view, Constants.DEFAULT_ERROR_PAGE);
        } catch (Exception e) {
            Logger.e(Area.UI.value() | Area.OS_ENTRY_POINT.value(), "GetJarWebViewClient: onReceivedError() failed", e);
        }
    }

    @Override // android.webkit.WebViewClient
    public void onLoadResource(WebView view, String url) {
        try {
            Logger.v(Area.UI.value() | Area.OS_ENTRY_POINT.value(), String.format(Locale.US, "GetJarWebViewClient: onLoadResource() Loading Resource '%1$s'", url));
        } catch (Exception e) {
            Logger.e(Area.UI.value() | Area.OS_ENTRY_POINT.value(), "GetJarWebViewClient: onLoadResource() failed", e);
        }
    }

    @Override // android.webkit.WebViewClient
    public void onFormResubmission(WebView view, Message dontResend, Message resend) {
        try {
            Logger.d(Area.UI.value() | Area.OS_ENTRY_POINT.value(), "GetJarWebViewClient: onFormResubmission()");
            resend.sendToTarget();
        } catch (Exception e) {
            Logger.e(Area.UI.value() | Area.OS_ENTRY_POINT.value(), "GetJarWebViewClient: onFormResubmission() failed", e);
        }
    }

    public static void saveUrl(String url, CommContext commContext, Context androidContext) {
        try {
            if (!shouldFilterUrl(url)) {
                String webViewSavedUrlTtlStr = GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_WEBVIEW_SAVED_URL_TTL);
                long webViewSavedUrlTtl = Utility.convertMillSec(Long.parseLong(webViewSavedUrlTtlStr));
                if (webViewSavedUrlTtl > 0) {
                    RewardUtility.saveWebUrlData(androidContext, url);
                }
            }
        } catch (Exception e) {
            Logger.e(Area.STORAGE.value(), String.format(Locale.US, "saveUrl(%1$s) failed", url), e);
        }
    }

    private static boolean shouldFilterUrl(String url) {
        try {
            URL urlclass = new URL(url);
            String query = urlclass.getQuery();
            url = String.format(Locale.US, "%1$s://%2$s%3$s", urlclass.getProtocol(), urlclass.getAuthority(), urlclass.getPath());
            Logger.d(Area.CONFIG.value(), String.format(Locale.US, "shouldFilterUrl(%1$s)", url));
            if (!StringUtility.isNullOrEmpty(query)) {
                String[] pairs = query.split(Utility.QUERY_APPENDIX);
                for (String pair : pairs) {
                    String[] nameValue = pair.split("=");
                    if (nameValue.length >= 2 && nameValue[0].equalsIgnoreCase("override.header.Cache-Control") && nameValue[1].equalsIgnoreCase("no-cache")) {
                        return true;
                    }
                }
            }
            return false;
        } catch (MalformedURLException e) {
            Logger.e(Area.CONFIG.value(), String.format(Locale.US, "shouldFilterUrl(%1$s) failed", url), e);
            return false;
        }
    }
}
