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

public class GetJarWebViewClient extends WebViewClient {
    private GetJarWebViewSubActivity _parentActivity = null;
    CommContext mCommContext;
    Context mContext;

    public GetJarWebViewClient(GetJarWebViewSubActivity parentActivity, CommContext commContext) {
        this.mContext = parentActivity.getParentActivity();
        this.mCommContext = commContext;
        this._parentActivity = parentActivity;
    }

    public boolean shouldOverrideUrlLoading(WebView view, String url) {
        try {
            Logger.d(Area.UI.value() | Area.OS_ENTRY_POINT.value(), String.format(Locale.US, "GetJarWebViewClient: shouldOverrideUrlLoading() OverrideURl: %1$s", new Object[]{url}));
            if (!url.equals(Constants.DEFAULT_ERROR_PAGE)) {
                saveUrl(url, this.mCommContext, this.mContext);
            }
            GetJarWebViewSubActivity.loadUrlInWebView(view, url);
        } catch (Exception e) {
            Logger.e(Area.UI.value() | Area.OS_ENTRY_POINT.value(), "GetJarWebViewClient: shouldOverrideUrlLoading() failed", e);
        }
        return true;
    }

    public void onPageStarted(WebView view, String url, Bitmap favicon) {
        try {
            Logger.d(Area.UI.value() | Area.OS_ENTRY_POINT.value(), "GetJarWebViewClient: onPageStarted()");
            this._parentActivity.waitDialogHide();
        } catch (Exception e) {
            Logger.e(Area.UI.value() | Area.OS_ENTRY_POINT.value(), "GetJarWebViewClient: onPageStarted() failed", e);
        }
    }

    public void onPageFinished(WebView view, String url) {
        try {
            Logger.d(Area.UI.value() | Area.OS_ENTRY_POINT.value(), String.format(Locale.US, "GetJarWebViewClient: onPageFinished() URL:%1$s", new Object[]{url}));
            if (this._parentActivity.getShouldShowLoadingUI()) {
                Logger.d(Area.UI.value() | Area.OS_ENTRY_POINT.value(), "GetJarWebViewClient: onPageFinished() Setting ShouldShowLoadingUI to FALSE");
                this._parentActivity.setShouldShowLoadingUI(false);
            }
            this._parentActivity.waitDialogHide();
            this._parentActivity.mJavaScriptInterface.setLastReloadTime();
            CookieSyncManager.getInstance().sync();
            if (!url.equals(Constants.DEFAULT_ERROR_PAGE)) {
                return;
            }
            if (GetJarWebViewSubActivity.sErrorSource.mErrorType == GetJarWebViewSubActivity.ErrorType.NETWORK) {
                GetJarWebViewSubActivity.loadUrlInWebView(view, "javascript:GJ.onError(\"NETWORK\",\"" + GetJarWebViewSubActivity.sErrorSource.mSubCode + "\")");
            } else if (GetJarWebViewSubActivity.sErrorSource.mErrorType == GetJarWebViewSubActivity.ErrorType.AUTH) {
                GetJarWebViewSubActivity.loadUrlInWebView(view, "javascript:GJ.onError(\"AUTH\",\"" + GetJarWebViewSubActivity.sErrorSource.mSubCode + "\")");
            } else if (GetJarWebViewSubActivity.sErrorSource.mErrorType == GetJarWebViewSubActivity.ErrorType.SERVICE) {
                GetJarWebViewSubActivity.loadUrlInWebView(view, "javascript:GJ.onError(\"SERVICE\",\"" + GetJarWebViewSubActivity.sErrorSource.mSubCode + "\")");
            }
        } catch (Exception e) {
            Logger.e(Area.UI.value() | Area.OS_ENTRY_POINT.value(), "GetJarWebViewClient: onPageFinished() failed", e);
        }
    }

    public void onReceivedError(WebView view, int errorCode, String description, String failingUrl) {
        try {
            Logger.d(Area.UI.value() | Area.OS_ENTRY_POINT.value(), String.format(Locale.US, "GetJarWebViewClient: onReceivedError() Error while loading URL '%1$s' [errorCode:%2$d description:%3$s]", new Object[]{failingUrl, Integer.valueOf(errorCode), description}));
            super.onReceivedError(view, errorCode, description, failingUrl);
            this._parentActivity.setShouldShowLoadingUI(false);
            this._parentActivity.waitDialogHide();
            GetJarWebViewSubActivity.loadUrlInWebView(view, Constants.DEFAULT_ERROR_PAGE);
        } catch (Exception e) {
            Logger.e(Area.UI.value() | Area.OS_ENTRY_POINT.value(), "GetJarWebViewClient: onReceivedError() failed", e);
        }
    }

    public void onLoadResource(WebView view, String url) {
        try {
            Logger.v(Area.UI.value() | Area.OS_ENTRY_POINT.value(), String.format(Locale.US, "GetJarWebViewClient: onLoadResource() Loading Resource '%1$s'", new Object[]{url}));
        } catch (Exception e) {
            Logger.e(Area.UI.value() | Area.OS_ENTRY_POINT.value(), "GetJarWebViewClient: onLoadResource() failed", e);
        }
    }

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
            if (!shouldFilterUrl(url) && Utility.convertMillSec(Long.parseLong(GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_WEBVIEW_SAVED_URL_TTL))) > 0) {
                RewardUtility.saveWebUrlData(androidContext, url);
            }
        } catch (Exception e) {
            Logger.e(Area.STORAGE.value(), String.format(Locale.US, "saveUrl(%1$s) failed", new Object[]{url}), e);
        }
    }

    private static boolean shouldFilterUrl(String url) {
        try {
            URL urlclass = new URL(url);
            String query = urlclass.getQuery();
            Logger.d(Area.CONFIG.value(), String.format(Locale.US, "shouldFilterUrl(%1$s)", new Object[]{String.format(Locale.US, "%1$s://%2$s%3$s", new Object[]{urlclass.getProtocol(), urlclass.getAuthority(), urlclass.getPath()})}));
            if (!StringUtility.isNullOrEmpty(query)) {
                for (String pair : query.split(Utility.QUERY_APPENDIX)) {
                    String[] nameValue = pair.split("=");
                    if (nameValue.length >= 2 && nameValue[0].equalsIgnoreCase("override.header.Cache-Control") && nameValue[1].equalsIgnoreCase("no-cache")) {
                        return true;
                    }
                }
            }
            return false;
        } catch (MalformedURLException e) {
            Logger.e(Area.CONFIG.value(), String.format(Locale.US, "shouldFilterUrl(%1$s) failed", new Object[]{url}), e);
            return false;
        }
    }
}
