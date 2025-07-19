package com.getjar.sdk.rewards;

import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.os.ResultReceiver;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.JavascriptInterface;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.widget.FrameLayout;
import com.getjar.sdk.LicensableProduct;
import com.getjar.sdk.Product;
import com.getjar.sdk.comm.CallbackInterface;
import com.getjar.sdk.comm.CommContext;
import com.getjar.sdk.comm.Operation;
import com.getjar.sdk.comm.Result;
import com.getjar.sdk.comm.TransactionManager;
import com.getjar.sdk.comm.UserAgentValuesManager;
import com.getjar.sdk.comm.auth.ApplicationKeyDatabase;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.data.DeviceMetadata;
import com.getjar.sdk.data.earning.EarnStateDatabase;
import com.getjar.sdk.data.earning.EarningMonitor;
import com.getjar.sdk.data.usage.AggregateUsageRecord;
import com.getjar.sdk.data.usage.AggregateUsageReport;
import com.getjar.sdk.data.usage.UsageManager;
import com.getjar.sdk.exceptions.ServiceException;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.rewards.GetJarWebViewSubActivity;
import com.getjar.sdk.rewards.WebSettingsEx;
import com.getjar.sdk.utilities.Constants;
import com.getjar.sdk.utilities.RewardUtility;
import com.getjar.sdk.utilities.ScreenUtility;
import com.getjar.sdk.utilities.StringUtility;
import com.getjar.sdk.utilities.SystemUtility;
import com.getjar.sdk.utilities.Utility;
import com.google.android.gms.drive.DriveFile;
import com.tapjoy.TapjoyConstants;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.Future;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class GetJarJavaScriptInterface extends JavaScriptAPI {
    /* access modifiers changed from: private */
    public Bundle _failBundle;
    private boolean _isExist = false;
    private long _lastReload = 0;
    private final ResultReceiver _messenger;
    private Map<String, GetJarWebViewSubActivity.ProductWithClientTransactionID> _productIdToProduct;
    /* access modifiers changed from: private */
    public Handler _purchaseResultHandler = new Handler() {
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case 0:
                    GetJarJavaScriptInterface.this.purchaseSuccess(GetJarJavaScriptInterface.this._successBundle);
                    return;
                case 1:
                    GetJarJavaScriptInterface.this.purchaseFail(GetJarJavaScriptInterface.this._failBundle);
                    return;
                default:
                    return;
            }
        }
    };
    /* access modifiers changed from: private */
    public Bundle _successBundle;

    public GetJarJavaScriptInterface(CommContext gContext, GetJarWebViewSubActivity parentActivity, ResultReceiver receiver, List<GetJarWebViewSubActivity.ProductWithClientTransactionID> theOffers) {
        super(gContext, parentActivity);
        if (gContext == null) {
            throw new IllegalArgumentException("Must have a valid context.");
        } else if (parentActivity == null) {
            throw new IllegalArgumentException("Must have a valid parent Activity.");
        } else if (theOffers == null || theOffers.size() <= 0) {
            throw new IllegalArgumentException("Must provide a non-empty list of offers.");
        } else {
            this._productIdToProduct = new HashMap();
            for (GetJarWebViewSubActivity.ProductWithClientTransactionID offer : theOffers) {
                this._productIdToProduct.put(offer.getProduct().getProductId(), offer);
            }
            this._isExist = false;
            this._messenger = receiver;
        }
    }

    @JavascriptInterface
    public void purchaseUnmanagedOffer(String theProductId, String theTrackingMetadata) {
        if (!this._isExist) {
            Logger.d(Area.JS_API.value() | Area.PURCHASE.value() | Area.TRANSACTION.value() | Area.UI.value(), "JavaScriptAPI: purchaseUnmanagedOffer() -- theProductId=" + theProductId);
            GetJarWebViewSubActivity.ProductWithClientTransactionID offer = this._productIdToProduct.get(theProductId);
            if (offer != null) {
                this._parentActivity.waitDialogShow();
                try {
                    final PurchaseCallback callback = new PurchaseCallback(offer);
                    AuthManager.initialize(this._commContext.getApplicationContext());
                    HashMap<String, String> trackingMetadataMap = Utility.jsonArrayStringToMap(theTrackingMetadata);
                    trackingMetadataMap.put(Constants.META_CLIENT_APP_TOKEN, ApplicationKeyDatabase.getInstance(this._commContext.getApplicationContext()).getApplicationKey());
                    trackingMetadataMap.put(Constants.TRACKING_USER_ACCESS_ID, AuthManager.getInstance().getUserAccessId());
                    trackingMetadataMap.put(Constants.META_LEGACY_UA, UserAgentValuesManager.getInstance().getWebKitUserAgent(this._commContext.getApplicationContext()));
                    if (trackingMetadataMap.size() > 0) {
                        Logger.v(Area.JS_API.value() | Area.PURCHASE.value() | Area.TRANSACTION.value() | Area.AUTH.value(), String.format(Locale.US, "JavaScriptAPI: Making a purchase with client transaction ID: '%1$s' [thread:%2$d]", new Object[]{offer.getClientTransactionId(), Long.valueOf(Thread.currentThread().getId())}));
                        TransactionManager transactionManager = new TransactionManager(this._commContext.getApplicationContext());
                        this._parentActivity.setCurrentPurchaseClientTransactionId(offer.getClientTransactionId());
                        Product product = offer.getProduct();
                        final Future<Operation> reserveFuture = transactionManager.startPurchaseTransaction(offer.getClientTransactionId(), this._commContext, product.getProductId(), product.getProductName(), product.getProductDescription(), Integer.valueOf((int) product.getAmount()), product.getDeveloperPayload(), LicensableProduct.class.isAssignableFrom(product.getClass()) ? ((LicensableProduct) product).getLicenseScope() : null, trackingMetadataMap);
                        new Thread(new Runnable() {
                            public void run() {
                                boolean callbackMade = false;
                                try {
                                    Logger.v(Area.JS_API.value() | Area.PURCHASE.value() | Area.TRANSACTION.value(), "JavaScriptAPI: Waiting on purchase reserve future");
                                    if (!(reserveFuture == null || reserveFuture.get() == null)) {
                                        ((Operation) reserveFuture.get()).mapResultToCallbacks(callback);
                                        callbackMade = true;
                                    }
                                    Logger.v(Area.JS_API.value() | Area.PURCHASE.value() | Area.TRANSACTION.value(), "JavaScriptAPI: Done waiting on purchase reserve future");
                                    GetJarJavaScriptInterface.this._parentActivity.waitDialogHide();
                                    if (!callbackMade) {
                                        callback.serviceRequestFailed((Result) null, (Exception) null, "unknown", GetJarJavaScriptInterface.this._commContext);
                                    }
                                } catch (Exception e) {
                                    Logger.e(Area.JS_API.value() | Area.PURCHASE.value() | Area.TRANSACTION.value(), "JavaScriptAPI: Purchase call-back thread failed", e);
                                    Logger.v(Area.JS_API.value() | Area.PURCHASE.value() | Area.TRANSACTION.value(), "JavaScriptAPI: Done waiting on purchase reserve future");
                                    GetJarJavaScriptInterface.this._parentActivity.waitDialogHide();
                                    if (0 == 0) {
                                        callback.serviceRequestFailed((Result) null, (Exception) null, "unknown", GetJarJavaScriptInterface.this._commContext);
                                    }
                                } catch (Throwable th) {
                                    Logger.v(Area.JS_API.value() | Area.PURCHASE.value() | Area.TRANSACTION.value(), "JavaScriptAPI: Done waiting on purchase reserve future");
                                    GetJarJavaScriptInterface.this._parentActivity.waitDialogHide();
                                    if (0 == 0) {
                                        callback.serviceRequestFailed((Result) null, (Exception) null, "unknown", GetJarJavaScriptInterface.this._commContext);
                                    }
                                    throw th;
                                }
                            }
                        }, "Purchase call-back thread").start();
                        return;
                    }
                    Logger.e(Area.JS_API.value() | Area.PURCHASE.value() | Area.TRANSACTION.value(), "JavaScriptAPI: ERROR: unable to send purchaseOffer transaction, empty tracking data.");
                    this._parentActivity.waitDialogHide();
                } catch (Exception exc) {
                    Logger.e(Area.JS_API.value() | Area.PURCHASE.value() | Area.TRANSACTION.value(), "JavaScriptAPI: purchaseUnmanagedOffer() failed", exc);
                    this._parentActivity.waitDialogHide();
                }
            } else {
                Logger.d(Area.JS_API.value() | Area.PURCHASE.value() | Area.TRANSACTION.value(), "JavaScriptAPI: purchaseUnmanagedOffer() -- offer with theProductId=" + theProductId + " was not found..");
            }
        }
    }

    @JavascriptInterface
    public void requestEarnInstall(String thePackageName, String theFriendlyName, String theDownloadUrl, String theAppMetadata, String theTrackingMetadata) {
        if (!this._isExist) {
            try {
                _requestInstall(thePackageName, theFriendlyName, theDownloadUrl, theAppMetadata, theTrackingMetadata, Constants.RequestInstallType.EARN);
            } catch (Exception e) {
                try {
                    Logger.e(Area.JS_API.value() | Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "JavaScriptAPI: requestEarnInstall() failed [thread:%1$d]", new Object[]{Long.valueOf(Thread.currentThread().getId())}), e);
                    this._parentActivity.unableToDownloadDialogShow();
                } catch (Exception exc) {
                    Logger.e(Area.JS_API.value() | Area.EARN.value() | Area.TRANSACTION.value(), "JavaScriptAPI: failure", exc);
                }
            }
        }
    }

    @JavascriptInterface
    public void requestPurchaseInstall(String thePackageName, String theFriendlyName, String theDownloadUrl, String theAppMetadata, String theTrackingMetadata) {
        if (!this._isExist) {
            try {
                _requestInstall(thePackageName, theFriendlyName, theDownloadUrl, theAppMetadata, theTrackingMetadata, Constants.RequestInstallType.PURCHASE);
            } catch (Exception e) {
                try {
                    Logger.e(Area.JS_API.value() | Area.PURCHASE.value() | Area.TRANSACTION.value(), String.format(Locale.US, "JavaScriptAPI: requestPurchaseInstall() failed [thread:%1$d]", new Object[]{Long.valueOf(Thread.currentThread().getId())}), e);
                    this._parentActivity.unableToDownloadDialogShow();
                } catch (Exception exc) {
                    Logger.e(Area.JS_API.value() | Area.PURCHASE.value() | Area.TRANSACTION.value(), "JavaScriptAPI: failure", exc);
                }
            }
        }
    }

    @JavascriptInterface
    public void closeView() {
        Logger.d(Area.JS_API.value() | Area.UI.value(), "JavaScriptAPI: closeView is called");
        this._isExist = true;
        this._messenger.send(0, (Bundle) null);
    }

    @JavascriptInterface
    public String getUserAccessId() {
        AuthManager.initialize(this._commContext.getApplicationContext());
        AuthManager.getInstance().waitOnAuth();
        return AuthManager.getInstance().getUserAccessId();
    }

    @JavascriptInterface
    public String getUserDeviceId() {
        AuthManager.initialize(this._commContext.getApplicationContext());
        AuthManager.getInstance().waitOnAuth();
        return AuthManager.getInstance().getUserDeviceId();
    }

    @JavascriptInterface
    public void reloadViewNoSafety(boolean reauth) {
        Logger.d(Area.JS_API.value() | Area.UI.value(), String.format(Locale.US, "JavaScriptAPI: reloadViewNoSafety(%1$s)", new Object[]{Boolean.toString(reauth)}));
        reloadViewInternal(reauth, false);
    }

    @JavascriptInterface
    public void reloadView(boolean reauth) {
        Logger.d(Area.JS_API.value() | Area.UI.value(), String.format(Locale.US, "JavaScriptAPI: reloadView(%1$s)", new Object[]{Boolean.toString(reauth)}));
        reloadViewInternal(reauth, true);
    }

    @JavascriptInterface
    public long getLastReloadTime() {
        return this._lastReload;
    }

    @JavascriptInterface
    public void setLastReloadTime() {
        this._lastReload = System.currentTimeMillis() / 1000;
    }

    @JavascriptInterface
    public String getAppState(String thePackageName) {
        Constants.AppState appState = Constants.AppState.UNINSTALLED;
        try {
            this._commContext.getApplicationContext().getPackageManager().getApplicationInfo(thePackageName, 0);
            appState = Constants.AppState.INSTALLED;
        } catch (PackageManager.NameNotFoundException e) {
        }
        switch (appState) {
            case INSTALLED:
                return "INSTALLED";
            default:
                return "UNINSTALLED";
        }
    }

    @JavascriptInterface
    public void launchGetJarRewardsApp() {
        if (!this._isExist) {
            launch(Constants.GREENJAR_PACKAGE, (String) null);
        }
    }

    @JavascriptInterface
    public String getUnmanagedOffers() {
        JSONArray jsonOffers = new JSONArray();
        for (Map.Entry<String, GetJarWebViewSubActivity.ProductWithClientTransactionID> offerRecord : this._productIdToProduct.entrySet()) {
            try {
                jsonOffers.put(offerRecord.getValue().getProduct().toJSONObject());
            } catch (JSONException je) {
                Logger.e(Area.JS_API.value() | Area.PURCHASE.value() | Area.TRANSACTION.value(), "JavaScriptAPI: productId=" + offerRecord.getValue().getProduct().getProductId(), je);
            }
        }
        return jsonOffers.toString();
    }

    @JavascriptInterface
    public String getProductThumbnailString(String productId, String boundWidth, String boundHeight) {
        if (StringUtility.isNullOrEmpty(productId)) {
            throw new IllegalArgumentException("productId cannot be null or empty");
        }
        try {
            Logger.d(Area.JS_API.value() | Area.PURCHASE.value(), "JavaScriptAPI: getProductThumbnailString() loading resource ID");
            Integer resourceId = Integer.valueOf(this._productIdToProduct.get(productId).getProduct().getImageResourceId());
            if (resourceId == null || resourceId.intValue() <= 0) {
                Logger.d(Area.JS_API.value() | Area.PURCHASE.value(), String.format(Locale.US, "JavaScriptAPI: getProductThumbnailString() no resource ID found for product '%1$s', returning null", new Object[]{productId}));
                return null;
            }
            Logger.d(Area.JS_API.value() | Area.PURCHASE.value(), "JavaScriptAPI: getProductThumbnailString() loading resource");
            String image = Utility.getImageDataFromResource(this._parentActivity.getParentActivity(), resourceId, Integer.parseInt(boundWidth), Integer.parseInt(boundHeight));
            Logger.d(Area.JS_API.value() | Area.PURCHASE.value(), "JavaScriptAPI: getProductThumbnailString() resource found");
            return image;
        } catch (Exception e) {
            Logger.d(Area.JS_API.value() | Area.PURCHASE.value(), "JavaScriptAPI: getProductThumbnailString() failed to load resource, returning null");
            return null;
        }
    }

    @JavascriptInterface
    public void requestGoldOffers() {
        new Thread(new Runnable() {
            public void run() {
                try {
                    final String offers = InAppPurchaseManager.getInstance(GetJarJavaScriptInterface.this._commContext.getApplicationContext()).getGoldOffers();
                    GetJarJavaScriptInterface.this._parentActivity.getParentActivity().runOnUiThread(new Runnable() {
                        public void run() {
                            try {
                                ((WebView) ((FrameLayout) GetJarJavaScriptInterface.this._parentActivity.getParentActivity().findViewById(16908290)).getChildAt(0)).loadUrl(String.format(Locale.US, "javascript:GJ.receivedGoldOffers(%s)", new Object[]{offers}));
                            } catch (Exception e) {
                                Logger.e(Area.JS_API.value() | Area.TRANSACTION.value() | Area.BUY_GOLD.value(), "JavaScriptAPI: requestGoldOffers() failed", e);
                            }
                        }
                    });
                } catch (Exception e) {
                    Logger.e(Area.JS_API.value() | Area.TRANSACTION.value() | Area.BUY_GOLD.value(), "JavaScriptAPI: requestGoldOffers() failed", e);
                }
            }
        }).start();
    }

    @JavascriptInterface
    public void buyGold(String platformItemId, String trackingMetadata) {
        HashMap<String, String> trackingMetadataMap;
        if (StringUtility.isNullOrEmpty(platformItemId)) {
            throw new IllegalArgumentException("'platformItemId' cannot be null or empty");
        }
        try {
            trackingMetadataMap = Utility.jsonArrayStringToMap(trackingMetadata);
        } catch (JSONException e) {
            Logger.w(Area.JS_API.value() | Area.TRANSACTION.value() | Area.BUY_GOLD.value(), "JavaScriptAPI: ERROR: Invalid tracking data.");
            trackingMetadataMap = new HashMap<>(3);
        }
        AuthManager.initialize(this._commContext.getApplicationContext());
        trackingMetadataMap.put(Constants.META_CLIENT_APP_TOKEN, ApplicationKeyDatabase.getInstance(this._commContext.getApplicationContext()).getApplicationKey());
        trackingMetadataMap.put(Constants.TRACKING_USER_ACCESS_ID, AuthManager.getInstance().getUserAccessId());
        trackingMetadataMap.put(Constants.META_LEGACY_UA, UserAgentValuesManager.getInstance().getWebKitUserAgent(this._commContext.getApplicationContext()));
        InAppPurchaseManager.getInstance(this._commContext.getApplicationContext()).buyGoldOffer(platformItemId, trackingMetadataMap, this._parentActivity.getParentActivity());
    }

    @JavascriptInterface
    public String getUnmanagedOffer(String theProductId) {
        if (StringUtility.isNullOrEmpty(theProductId)) {
            throw new IllegalArgumentException("Must provide a non-null, non-empty product ID.");
        }
        JSONObject jo = new JSONObject();
        Product offer = this._productIdToProduct.get(theProductId).getProduct();
        if (offer != null) {
            try {
                jo = offer.toJSONObject();
            } catch (JSONException je) {
                Logger.e(Area.JS_API.value() | Area.PURCHASE.value() | Area.TRANSACTION.value(), "JavaScriptAPI: productId=" + theProductId, je);
            }
        }
        return jo.toString();
    }

    @JavascriptInterface
    public String getDisplayMetrics() {
        if (this._parentActivity != null) {
            return ScreenUtility.getDisplayMetrics(this._parentActivity.getParentActivity()).toString();
        }
        Logger.i(Area.JS_API.value() | Area.UI.value(), "JavaScriptAPI: getDisplayMetrics() -- _parentActivity cannot be null.");
        return new JSONObject().toString();
    }

    @JavascriptInterface
    public void configureWebView(final Boolean builtInZoom, final Boolean supportZoom, final String zoomDensity) {
        if (this._parentActivity == null) {
            Logger.i(Area.JS_API.value() | Area.UI.value(), "JavaScriptAPI: getDisplayMetrics() -- _parentActivity cannot be null.");
        } else if (Utility.isCurrentThreadTheUIThread()) {
            configureWebViewOnUIThread(builtInZoom, supportZoom, zoomDensity);
        } else {
            this._parentActivity.getParentActivity().runOnUiThread(new Runnable() {
                public void run() {
                    try {
                        GetJarJavaScriptInterface.this.configureWebViewOnUIThread(builtInZoom, supportZoom, zoomDensity);
                    } catch (Exception e) {
                        Logger.e(Area.JS_API.value() | Area.UI.value(), "JavaScriptAPI: configureWebView() failed", e);
                    }
                }
            });
        }
    }

    @JavascriptInterface
    public String getCapabilities() {
        Map<String, String> caps = new HashMap<>();
        try {
            caps = AuthManager.getInstance().getClaimsManager(this._commContext.getApplicationContext()).getCapabilities();
        } catch (Exception e) {
            Logger.e(Area.JS_API.value() | Area.AUTH.value(), "ClaimsManager.getCapabilities() failed", e);
        }
        JSONObject output = new JSONObject();
        for (Map.Entry<String, String> entry : caps.entrySet()) {
            try {
                output.put(entry.getKey(), entry.getValue());
            } catch (JSONException e2) {
                Logger.e(Area.JS_API.value() | Area.AUTH.value(), "JavaScriptAPI: getCapabilities() failed", e2);
            }
        }
        return output.toString();
    }

    @JavascriptInterface
    public String getAuthToken() {
        String result = "";
        try {
            AuthManager.initialize(this._commContext.getApplicationContext());
            result = AuthManager.getInstance().getAuthToken();
            Logger.d(Area.JS_API.value() | Area.AUTH.value(), String.format(Locale.US, "JavaScriptAPI: getAuthToken() returning: '%1$s'", new Object[]{result}));
            return result;
        } catch (Exception e) {
            Logger.e(Area.JS_API.value() | Area.AUTH.value(), "JavaScriptAPI: getAuthToken() failed", e);
            return result;
        }
    }

    @JavascriptInterface
    public String getDisplayLanguageTag() {
        String result = Constants.DEFAULT_LANGUAGE;
        try {
            result = this._parentActivity.getDisplayLanguageTag();
            Logger.d(Area.JS_API.value() | Area.UI.value() | Area.LOCALIZATION.value(), String.format(Locale.US, "JavaScriptAPI: getDisplayLanguageTag() returning: '%1$s'", new Object[]{result}));
            return result;
        } catch (Exception e) {
            Logger.e(Area.JS_API.value() | Area.UI.value() | Area.LOCALIZATION.value(), "JavaScriptAPI: getDisplayLanguageTag() failed", e);
            return result;
        }
    }

    @JavascriptInterface
    public String getDeviceDetails() {
        JSONObject deviceDetailsJson = new JSONObject();
        try {
            String deviceFilterValue = this._commContext.getWebKitUserAgent();
            String deviceId = this._commContext.getDeviceMetadata().getMetadataValue(DeviceMetadata.KEY_ANDROID_DEVICE_DEVICE_ID);
            String androidId = this._commContext.getDeviceMetadata().getMetadataValue(DeviceMetadata.KEY_ANDROID_DEVICE_ANDROID_ID);
            String serialNumber = this._commContext.getDeviceMetadata().getMetadataValue(DeviceMetadata.KEY_ANDROID_DEVICE_SERIAL_NUMBER);
            if (StringUtility.isNullOrEmpty(deviceFilterValue)) {
                deviceFilterValue = "";
            }
            if (StringUtility.isNullOrEmpty(deviceId)) {
                deviceId = "";
            }
            if (StringUtility.isNullOrEmpty(androidId)) {
                androidId = "";
            }
            if (StringUtility.isNullOrEmpty(serialNumber)) {
                serialNumber = "";
            }
            boolean hasReadPhoneStatePermission = RewardUtility.checkPermission(this._commContext.getApplicationContext(), Utility.READ_PHONE_STATE_PERMISSION);
            boolean hasAccessWifiStatePermission = RewardUtility.checkPermission(this._commContext.getApplicationContext(), Utility.ACCESS_WIFI_STATE_PERMISSION);
            deviceDetailsJson.put("device_filter", deviceFilterValue);
            deviceDetailsJson.put("android.device.device_id", deviceId);
            deviceDetailsJson.put("android.device.serial_number", serialNumber);
            deviceDetailsJson.put("android.device.android_id", androidId);
            deviceDetailsJson.put("android.package.permission.read_phone_state", hasReadPhoneStatePermission);
            deviceDetailsJson.put("android.package.permission.access_wifi_state", hasAccessWifiStatePermission);
            Logger.d(Area.JS_API.value() | Area.CONFIG.value(), String.format(Locale.US, "JavaScriptAPI: getDeviceDetails() returning:\r\n%1$s", new Object[]{deviceDetailsJson.toString(4)}));
        } catch (Exception e) {
            Logger.e(Area.JS_API.value() | Area.CONFIG.value(), "JavaScriptAPI: getDeviceDetails() failed", e);
        }
        return deviceDetailsJson.toString();
    }

    @JavascriptInterface
    public String getRecentlyUsedApps() {
        JSONArray appArray = new JSONArray();
        try {
            if (UsageManager.getInstance(this._commContext.getApplicationContext()).isRequestSendEnabled()) {
                List<String> recentPackageNames = SystemUtility.getRecentlyRunAppsFromOS(this._commContext.getApplicationContext());
                Logger.d(Area.JS_API.value() | Area.USAGE.value(), String.format(Locale.US, "JavaScriptAPI: getRecentlyUsedApps() %d recent apps", new Object[]{Integer.valueOf(recentPackageNames.size())}));
                for (String packageName : recentPackageNames) {
                    appArray.put(packageName);
                }
            }
            Logger.d(Area.JS_API.value() | Area.USAGE.value(), String.format(Locale.US, "JavaScriptAPI: getRecentlyUsedApps() returning:\r\n%1$s", new Object[]{appArray.toString(4)}));
        } catch (Exception e) {
            Logger.e(Area.JS_API.value() | Area.USAGE.value(), "JavaScriptAPI: getRecentlyUsedApps() failed", e);
        }
        return appArray.toString();
    }

    @JavascriptInterface
    public String getUsageSessionRecords() {
        String str;
        Logger.v(Area.JS_API.value() | Area.USAGE.value(), "JavaScriptAPI: getUsageSessionRecords() START");
        JSONObject jsonRoot = new JSONObject();
        try {
            AggregateUsageReport report = UsageManager.getInstance(this._commContext.getApplicationContext()).getAggregateSessionsForReporting();
            if (report != null) {
                jsonRoot.put("start_timestamp", report.getTimestampStart());
                jsonRoot.put("stop_timestamp", report.getTimestampStop());
                jsonRoot.put(Constants.MARKETPLACE, "marketplace.google_play");
                JSONArray jsonRecords = new JSONArray();
                if (report.getRecords().size() > 0) {
                    Logger.v(Area.JS_API.value() | Area.USAGE.value(), String.format(Locale.US, "JavaScriptAPI: getUsageSessionRecords() reporting on %1$d aggregated usage session records", new Object[]{Integer.valueOf(report.getRecords().size())}));
                    for (AggregateUsageRecord record : report.getRecords()) {
                        JSONObject jsonRecord = new JSONObject();
                        jsonRecord.put(Constants.BUY_CURRENCY_MARKETPLACE_ITEM_ID, record.getPackageName());
                        jsonRecord.put("start_timestamp", record.getTimestampStart());
                        jsonRecord.put("stop_timestamp", record.getTimestampStop());
                        jsonRecord.put("duration", record.getTotalUseDuration());
                        jsonRecord.put("sessions", record.getTotalSessionsCount());
                        jsonRecords.put(jsonRecord);
                    }
                }
                jsonRoot.put("records", jsonRecords);
            }
        } catch (Exception e) {
            Logger.e(Area.JS_API.value() | Area.USAGE.value(), "JavaScriptAPI: getUsageSessionRecords() failed", e);
        } finally {
            str = "JavaScriptAPI: getUsageSessionRecords() FINISH";
            Logger.v(Area.JS_API.value() | Area.USAGE.value(), str);
        }
        return jsonRoot.toString();
    }

    @JavascriptInterface
    public void log(String message, String level) {
        if (StringUtility.isNullOrEmpty(message)) {
            Logger.d(Area.JS_API.value() | Area.UI.value(), "No message provided to log by javascript");
            return;
        }
        String message2 = String.format("JavaScript: %s", new Object[]{message});
        if (StringUtility.isNullOrEmpty(level)) {
            level = "DEBUG";
        }
        if (level.equalsIgnoreCase("VERBOSE")) {
            Logger.v(Area.JS_API.value() | Area.UI.value(), message2);
        } else if (level.equalsIgnoreCase("DEBUG")) {
            Logger.d(Area.JS_API.value() | Area.UI.value(), message2);
        } else if (level.equalsIgnoreCase("INFO")) {
            Logger.i(Area.JS_API.value() | Area.UI.value(), message2);
        } else if (level.equalsIgnoreCase("WARN")) {
            Logger.w(Area.JS_API.value() | Area.UI.value(), message2);
        } else if (level.equalsIgnoreCase("ERROR")) {
            Logger.e(Area.JS_API.value() | Area.UI.value(), message2);
        } else {
            Logger.d(Area.JS_API.value() | Area.UI.value(), message2);
        }
    }

    @JavascriptInterface
    public boolean canBuy() {
        try {
            return AuthManager.getInstance().getClaimsManager(this._commContext.getApplicationContext()).canBuy();
        } catch (Exception e) {
            Logger.e(Area.JS_API.value() | Area.TRANSACTION.value() | Area.CONFIG.value() | Area.BUY_GOLD.value(), "ClaimsManager.canBuy() failed", e);
            return false;
        }
    }

    @JavascriptInterface
    public boolean canEarn() {
        try {
            return AuthManager.getInstance().getClaimsManager(this._commContext.getApplicationContext()).canEarn();
        } catch (Exception e) {
            Logger.e(Area.JS_API.value() | Area.EARN.value() | Area.TRANSACTION.value() | Area.CONFIG.value(), "ClaimsManager.canEarn() failed", e);
            return false;
        }
    }

    @JavascriptInterface
    public boolean canPurchaseUnmanagedProducts() {
        try {
            return AuthManager.getInstance().getClaimsManager(this._commContext.getApplicationContext()).canPurchaseUnmanagedProducts();
        } catch (Exception e) {
            Logger.e(Area.JS_API.value() | Area.PURCHASE.value() | Area.CONFIG.value() | Area.TRANSACTION.value(), "ClaimsManager.canPurchaseUnmanagedProducts() failed", e);
            return false;
        }
    }

    /* access modifiers changed from: private */
    public void configureWebViewOnUIThread(Boolean builtInZoom, Boolean supportZoom, String zoomDensity) {
        if (Utility.isCurrentThreadTheUIThread()) {
            WebView webView = findWebViewInUILayout((ViewGroup) this._parentActivity.getParentActivity().getWindow().getDecorView());
            if (webView == null) {
                throw new IllegalStateException("Unable to find the WebView in the UI layout!");
            }
            WebSettings webSettings = webView.getSettings();
            if (zoomDensity != null) {
                WebSettingsEx.setDefaultZoom(webSettings, getZoomDensity(zoomDensity));
            }
            if (builtInZoom != null) {
                webSettings.setBuiltInZoomControls(builtInZoom.booleanValue());
            }
            if (supportZoom != null) {
                webSettings.setSupportZoom(supportZoom.booleanValue());
                return;
            }
            return;
        }
        throw new IllegalStateException("configureWebViewOnUIThread -- Not called from a UI thread.");
    }

    private WebView findWebViewInUILayout(ViewGroup parent) {
        WebView webView = null;
        for (int i = 0; i < parent.getChildCount(); i++) {
            View child = parent.getChildAt(i);
            if (child != null) {
                if (WebView.class.isAssignableFrom(child.getClass())) {
                    return (WebView) child;
                }
                if (ViewGroup.class.isAssignableFrom(child.getClass()) && (webView = findWebViewInUILayout((ViewGroup) child)) != null) {
                    return webView;
                }
            }
        }
        return webView;
    }

    private Object getZoomDensity(String zoomDensityString) {
        if (StringUtility.isNullOrEmpty(zoomDensityString)) {
            throw new IllegalArgumentException("zoomDensityString cannot be empty or null");
        } else if (zoomDensityString.equals("FAR")) {
            return WebSettingsEx.ZoomDensity.FAR;
        } else {
            if (zoomDensityString.equals("MEDIUM")) {
                return WebSettingsEx.ZoomDensity.MEDIUM;
            }
            if (zoomDensityString.equals("CLOSE")) {
                return WebSettingsEx.ZoomDensity.CLOSE;
            }
            throw new IllegalArgumentException("Invalid value for zoomDensity");
        }
    }

    /* access modifiers changed from: private */
    public void purchaseSuccess(Bundle b) {
        this._messenger.send(5, b);
    }

    /* access modifiers changed from: private */
    public void purchaseFail(Bundle b) {
        this._messenger.send(6, b);
    }

    private void _requestInstall(String thePackageName, String theFriendlyName, String theDownloadUrl, String theAppMetadata, String theTrackingMetadata, Constants.RequestInstallType theRequestType) {
        if (StringUtility.isNullOrEmpty(thePackageName)) {
            throw new IllegalArgumentException("'thePackageName' cannot be NULL or empty");
        } else if (StringUtility.isNullOrEmpty(theFriendlyName)) {
            throw new IllegalArgumentException("'theFriendlyName' cannot be NULL or empty");
        } else if (StringUtility.isNullOrEmpty(theDownloadUrl)) {
            throw new IllegalArgumentException("'theDownloadUrl' cannot be NULL or empty");
        } else if (StringUtility.isNullOrEmpty(theAppMetadata)) {
            throw new IllegalArgumentException("'theAppMetadata' cannot be NULL or empty");
        } else if (StringUtility.isNullOrEmpty(theTrackingMetadata)) {
            throw new IllegalArgumentException("'theTrackingMetadata' cannot be NULL or empty");
        } else if (theRequestType == null) {
            throw new IllegalArgumentException("'theRequestType' cannot be NULL");
        } else {
            try {
                Logger.d(Area.JS_API.value() | Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "JavaScriptAPI: _requestInstall(packageName:%1$s, friendlyName:%2$s, downloadUrl:%3$s, requestType:%4$s)", new Object[]{thePackageName, theFriendlyName, theDownloadUrl, theRequestType.name()}));
                Logger.v(Area.JS_API.value() | Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "JavaScriptAPI: _requestInstall() applicationMetadata: %1$s", new Object[]{theAppMetadata}));
                Logger.v(Area.JS_API.value() | Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "JavaScriptAPI: _requestInstall() trackingMetadata: %1$s", new Object[]{theTrackingMetadata}));
                Map<String, String> trackingMetaMap = Utility.jsonArrayStringToMap(theTrackingMetadata);
                if (trackingMetaMap.size() > 0) {
                    trackingMetaMap.put(Constants.META_CLIENT_APP_TOKEN, ApplicationKeyDatabase.getInstance(this._commContext.getApplicationContext()).getApplicationKey());
                    trackingMetaMap.put(Constants.META_LEGACY_UA, UserAgentValuesManager.getInstance().getWebKitUserAgent(this._commContext.getApplicationContext()));
                    JSONObject appMetaJson = new JSONObject(trackingMetaMap);
                    if (appMetaJson.length() > 0) {
                        JSONArray arrayMeta = new JSONArray();
                        arrayMeta.put(appMetaJson);
                        theTrackingMetadata = arrayMeta.toString();
                    }
                }
                if (Constants.RequestInstallType.EARN.equals(theRequestType)) {
                    EarnStateDatabase.getInstance(this._commContext.getApplicationContext()).addAppState(thePackageName, theFriendlyName, theAppMetadata, theTrackingMetadata);
                    Logger.v(Area.JS_API.value() | Area.EARN.value() | Area.TRANSACTION.value() | Area.STORAGE.value(), "JavaScriptAPI: _requestInstall() starting usage monitoring thread");
                    EarningMonitor.getInstance(this._commContext.getApplicationContext()).startMonitoring();
                }
                Logger.d(Area.JS_API.value() | Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "JavaScriptAPI: Pushing download URL to the Android OS [downloadURl: %1$s]", new Object[]{theDownloadUrl}));
                Intent googPlayIntent = new Intent("android.intent.action.VIEW", Uri.parse(theDownloadUrl));
                googPlayIntent.addFlags(DriveFile.MODE_READ_ONLY);
                googPlayIntent.addFlags(134217728);
                googPlayIntent.addFlags(1073741824);
                this._commContext.getApplicationContext().startActivity(googPlayIntent);
            } catch (Exception e) {
                Logger.e(Area.JS_API.value() | Area.EARN.value() | Area.TRANSACTION.value(), "JavaScriptAPI: _requestInstall() failed", e);
            }
        }
    }

    private class ReauthThread implements Runnable {
        private ReauthThread() {
        }

        public void run() {
            try {
                AuthManager.initialize(GetJarJavaScriptInterface.this._commContext.getApplicationContext());
                AuthManager.getInstance().reAuthWithUI(GetJarJavaScriptInterface.this._parentActivity);
                GetJarJavaScriptInterface.this._parentActivity.waitForAuthorization();
            } catch (Exception e) {
                Logger.e(Area.JS_API.value() | Area.AUTH.value(), "JavaScriptAPI: ReauthThread.run() failed", e);
            } finally {
                GetJarJavaScriptInterface.this._parentActivity.waitDialogHide();
            }
        }
    }

    private void reloadViewInternal(boolean reauth, boolean doSafety) {
        this._parentActivity.waitDialogShow();
        Logger.d(Area.JS_API.value() | Area.UI.value(), String.format(Locale.US, "JavaScriptAPI: reloadView called from thread.id:%1$d thread.name:%2$s", new Object[]{Long.valueOf(Thread.currentThread().getId()), Thread.currentThread().getName()}));
        if (!this._isExist) {
            Logger.d(Area.JS_API.value() | Area.UI.value(), "JavaScriptAPI: reloadView past isExist");
            if (reauth) {
                long lastAttemptDelta = System.currentTimeMillis() - this._lastReload;
                this._lastReload = System.currentTimeMillis();
                if (!doSafety || lastAttemptDelta >= TapjoyConstants.THROTTLE_GET_TAP_POINTS_INTERVAL) {
                    Logger.d(Area.JS_API.value() | Area.AUTH.value(), "JavaScriptAPI: reloadView is re-authorizing");
                    try {
                        new Thread(new ReauthThread()).start();
                    } catch (Exception e) {
                        Logger.e(Area.JS_API.value() | Area.AUTH.value(), "JavaScriptAPI: reloadViewInternal() failed", e);
                    }
                } else {
                    Logger.w(Area.JS_API.value() | Area.UI.value(), String.format(Locale.US, "JavaScriptAPI: A re-authorization/reload attempt was made %1$d milliseconds ago, skipping this attempt request", new Object[]{Long.valueOf(lastAttemptDelta)}));
                    this._messenger.send(3, (Bundle) null);
                }
            } else {
                this._messenger.send(10, (Bundle) null);
            }
        }
    }

    private class PurchaseCallback implements CallbackInterface {
        private GetJarWebViewSubActivity.ProductWithClientTransactionID _offer = null;

        protected PurchaseCallback(GetJarWebViewSubActivity.ProductWithClientTransactionID offer) {
            this._offer = offer;
        }

        public void serviceRequestSucceeded(Result result, String requestId, CommContext commContext) {
            try {
                String substate = TransactionManager.getTransactionSubstate(result, Constants.RequestInstallSubState.NONE.toString());
                if (!substate.equals(Constants.RequestInstallSubState.FUNDS_INSUFFICIENT_FAILURE.name())) {
                    GetJarJavaScriptInterface.this._parentActivity.setCurrentPurchaseClientTransactionId((String) null);
                    GetJarJavaScriptInterface.this._parentActivity.waitDialogHide();
                    Bundle b = new Bundle();
                    b.putString(Constants.APP_ID, this._offer.getProduct().getProductId());
                    b.putString(Constants.TRANSACTION_ID, this._offer.getClientTransactionId());
                    b.putLong("price", this._offer.getProduct().getAmount());
                    b.putString("name", this._offer.getProduct().getProductName());
                    b.putString(Constants.RequestInstallSubState.KEY(), substate);
                    long value = Area.JS_API.value() | Area.PURCHASE.value() | Area.TRANSACTION.value();
                    Locale locale = Locale.US;
                    Object[] objArr = new Object[2];
                    objArr[0] = requestId;
                    objArr[1] = commContext == null ? "" : commContext.getCommContextId();
                    Logger.d(value, String.format(locale, "JavaScriptAPI: PurchaseCallback: Request %1$s on CommContext %2$s resulted in a call to serviceRequestSucceeded()", objArr));
                    Bundle unused = GetJarJavaScriptInterface.this._successBundle = b;
                    Message msg = new Message();
                    msg.what = 0;
                    GetJarJavaScriptInterface.this._purchaseResultHandler.sendMessage(msg);
                } else {
                    serviceRequestFailed(result, new ServiceException(substate, result), requestId, commContext);
                }
                try {
                    GetJarJavaScriptInterface.this._parentActivity.waitDialogHide();
                } catch (Exception e) {
                    Logger.e(Area.JS_API.value() | Area.PURCHASE.value() | Area.TRANSACTION.value(), "JavaScriptAPI: failure", e);
                    commContext.addException(e);
                }
            } catch (Exception e2) {
                Logger.e(Area.JS_API.value() | Area.PURCHASE.value() | Area.TRANSACTION.value(), "JavaScriptAPI: failure", e2);
                commContext.addException(e2);
                try {
                    GetJarJavaScriptInterface.this._parentActivity.waitDialogHide();
                } catch (Exception e3) {
                    Logger.e(Area.JS_API.value() | Area.PURCHASE.value() | Area.TRANSACTION.value(), "JavaScriptAPI: failure", e3);
                    commContext.addException(e3);
                }
            } catch (Throwable th) {
                try {
                    GetJarJavaScriptInterface.this._parentActivity.waitDialogHide();
                } catch (Exception e4) {
                    Logger.e(Area.JS_API.value() | Area.PURCHASE.value() | Area.TRANSACTION.value(), "JavaScriptAPI: failure", e4);
                    commContext.addException(e4);
                }
                throw th;
            }
        }

        public void serviceRequestFailed(Result result, Exception cause, String requestId, CommContext commContext) {
            String message;
            try {
                GetJarJavaScriptInterface.this._parentActivity.waitDialogHide();
                Bundle b = new Bundle();
                b.putString(Constants.APP_ID, this._offer.getProduct().getProductId());
                b.putString(Constants.TRANSACTION_ID, this._offer.getClientTransactionId());
                b.putLong("price", this._offer.getProduct().getAmount());
                b.putString("name", this._offer.getProduct().getProductName());
                b.putString(Constants.RequestInstallSubState.KEY(), Utility.getResponseSubstate(cause, Constants.RequestInstallSubState.NONE.toString()));
                long value = Area.JS_API.value() | Area.PURCHASE.value() | Area.TRANSACTION.value();
                Locale locale = Locale.US;
                Object[] objArr = new Object[3];
                objArr[0] = requestId;
                objArr[1] = commContext == null ? "" : commContext.getCommContextId();
                if (cause == null) {
                    message = "";
                } else {
                    message = cause.getMessage();
                }
                objArr[2] = message;
                Logger.d(value, String.format(locale, "JavaScriptAPI: PurchaseCallback: Request %1$s on CommContext %2$s resulted in a call to serviceRequestFailed(). %3$s", objArr));
                if (cause != null) {
                    Logger.e(Area.JS_API.value() | Area.PURCHASE.value() | Area.TRANSACTION.value(), "JavaScriptAPI: purchase failed", cause);
                }
                Bundle unused = GetJarJavaScriptInterface.this._failBundle = b;
                Message msg = new Message();
                msg.what = 1;
                GetJarJavaScriptInterface.this._purchaseResultHandler.sendMessage(msg);
                try {
                    GetJarJavaScriptInterface.this._parentActivity.waitDialogHide();
                } catch (Exception e) {
                    Logger.e(Area.JS_API.value() | Area.PURCHASE.value() | Area.TRANSACTION.value(), "JavaScriptAPI: failure", e);
                    commContext.addException(e);
                }
            } catch (Exception e2) {
                Logger.e(Area.JS_API.value() | Area.PURCHASE.value() | Area.TRANSACTION.value(), "JavaScriptAPI: failure", e2);
                commContext.addException(e2);
                try {
                    GetJarJavaScriptInterface.this._parentActivity.waitDialogHide();
                } catch (Exception e3) {
                    Logger.e(Area.JS_API.value() | Area.PURCHASE.value() | Area.TRANSACTION.value(), "JavaScriptAPI: failure", e3);
                    commContext.addException(e3);
                }
            } catch (Throwable th) {
                try {
                    GetJarJavaScriptInterface.this._parentActivity.waitDialogHide();
                } catch (Exception e4) {
                    Logger.e(Area.JS_API.value() | Area.PURCHASE.value() | Area.TRANSACTION.value(), "JavaScriptAPI: failure", e4);
                    commContext.addException(e4);
                }
                throw th;
            }
        }

        public void serviceRequestRetry(Exception cause, String requestId, CommContext commContext, int retryCount) {
        }
    }
}
