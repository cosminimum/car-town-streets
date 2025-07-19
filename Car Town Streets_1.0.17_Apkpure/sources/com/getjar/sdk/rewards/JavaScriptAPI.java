package com.getjar.sdk.rewards;

import android.app.AlertDialog;
import android.app.PendingIntent;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.webkit.JavascriptInterface;
import com.facebook.internal.ServerProtocol;
import com.getjar.sdk.GetJarException;
import com.getjar.sdk.GetJarManager;
import com.getjar.sdk.comm.CommContext;
import com.getjar.sdk.comm.CommManager;
import com.getjar.sdk.comm.GetJarConfig;
import com.getjar.sdk.comm.TransactionManager;
import com.getjar.sdk.comm.auth.AccountHistoryInfo;
import com.getjar.sdk.comm.auth.AccountHistoryManager;
import com.getjar.sdk.comm.auth.AndroidAccountUserAuthProvider;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.comm.auth.ProviderHint;
import com.getjar.sdk.comm.persistence.DBTransactions;
import com.getjar.sdk.comm.persistence.ManagedOfferBucket;
import com.getjar.sdk.data.RedemptionEngine;
import com.getjar.sdk.exceptions.CommunicationException;
import com.getjar.sdk.exceptions.TransactionException;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.rewards.InAppPurchaseManager;
import com.getjar.sdk.utilities.AlarmsUtility;
import com.getjar.sdk.utilities.Constants;
import com.getjar.sdk.utilities.CryptoUtility;
import com.getjar.sdk.utilities.StringUtility;
import com.getjar.sdk.utilities.Utility;
import com.google.analytics.tracking.android.HitTypes;
import com.google.android.gms.drive.DriveFile;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.UUID;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class JavaScriptAPI {
    public static final String EXTRA_MANAGED_CHECKOUT_DATA = "EXTRA_MANAGED_CHECKOUT_DATA";
    private static final String INSTALL_GETJAR_REWARDS = "Install Getjar Rewards to buy these app deals and earn free rewards";
    protected final CommContext _commContext;
    private String _currentManagedOfferDetails = null;
    private final GooglePlayLaunchCachingManager _googlePlayLaunchCache;
    protected final GetJarWebViewSubActivity _parentActivity;
    public static HashMap<String, Long> _callbackToStartTimeMap = new HashMap<>();
    private static final ExecutorService _ExecutorService = Executors.newSingleThreadExecutor();

    /* loaded from: classes.dex */
    public enum AccountStatus {
        CURRENT,
        PREVIOUS,
        UNKNOWN
    }

    /* loaded from: classes.dex */
    public enum JavaScriptCallbackFailureReason {
        NONE,
        MARKETPLACE,
        NETWORK,
        UNKNOWN,
        ALREADY_RESERVED,
        ALREADY_LICENSED,
        USER_PURCHASE_LIMIT,
        OFFER_PURCHASE_LIMIT
    }

    /* loaded from: classes.dex */
    public enum JavaScriptRedeemIntentResult {
        SUCCESS,
        TARGET_DISABLED,
        TARGET_NOT_INSTALLED,
        UNKNOWN_FAILURE
    }

    public JavaScriptAPI(CommContext commContext, GetJarWebViewSubActivity parentActivity) {
        if (commContext == null) {
            throw new IllegalArgumentException("'commContext' cannot be NULL");
        }
        if (parentActivity == null) {
            throw new IllegalArgumentException("'parentActivity' cannot be NULL");
        }
        this._commContext = commContext;
        this._parentActivity = parentActivity;
        this._googlePlayLaunchCache = new GooglePlayLaunchCachingManager(commContext.getApplicationContext());
    }

    protected static void makeJavaScriptCallback(String callbackTarget, String resultJson) {
        Logger.d(Area.JS_API.value(), String.format(Locale.US, "Attempting to callback: %1$s", resultJson));
        try {
            String url = String.format(callbackTarget, URLEncoder.encode(resultJson, "UTF-8"));
            GetJarWebViewSubActivity.loadUrl(url);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    @JavascriptInterface
    public String getAccounts() {
        Logger.v(Area.JS_API.value(), "JavaScriptAPI: getAccounts() START");
        JSONArray accountsJson = new JSONArray();
        try {
            String currentAccount = new AndroidAccountUserAuthProvider().getCachedAccountName(this._commContext.getApplicationContext());
            if (StringUtility.isNullOrEmpty(currentAccount)) {
                currentAccount = AccountHistoryManager.getInstance().getCurrentAccountName();
            }
            List<String> accountNamesFound = new ArrayList<>();
            AccountHistoryManager.initialize(this._commContext.getApplicationContext());
            for (AccountHistoryInfo account : AccountHistoryManager.getInstance().getAccounts()) {
                if (!StringUtility.isNullOrEmpty(account.getAccountName())) {
                    JSONObject accountJson = new JSONObject();
                    accountNamesFound.add(account.getAccountName().toLowerCase());
                    accountJson.put("account_name", account.getAccountName());
                    accountJson.put("provider_filter", account.getProviderFilter());
                    accountJson.put("timestamp_created", account.getTimestampCreated());
                    accountJson.put("timestamp_last_auth", account.getTimestampLastAuth());
                    if (account.getAccountName().equalsIgnoreCase(currentAccount)) {
                        accountJson.put("status", AccountStatus.CURRENT.name());
                    } else {
                        accountJson.put("status", AccountStatus.PREVIOUS.name());
                    }
                    accountsJson.put(accountJson);
                }
            }
            CharSequence[] accountNames = AndroidAccountUserAuthProvider.getAndroidAccountNames(this._commContext.getApplicationContext());
            if (accountNames != null) {
                String providerFilter = new AndroidAccountUserAuthProvider().getProviderFilter();
                for (CharSequence accountName : accountNames) {
                    if (accountName != null && !accountNamesFound.contains(accountName.toString().toLowerCase())) {
                        JSONObject accountJson2 = new JSONObject();
                        accountJson2.put("account_name", accountName.toString());
                        accountJson2.put("provider_filter", providerFilter);
                        if (accountName.toString().equalsIgnoreCase(currentAccount)) {
                            accountJson2.put("status", AccountStatus.CURRENT.name());
                        } else {
                            accountJson2.put("status", AccountStatus.UNKNOWN.name());
                        }
                        accountsJson.put(accountJson2);
                    }
                }
            }
        } catch (Exception e) {
            Logger.e(Area.JS_API.value(), "getAccounts() failed", e);
        } finally {
            Logger.v(Area.JS_API.value(), "JavaScriptAPI: getAccounts() FINISH");
        }
        return accountsJson.toString();
    }

    @JavascriptInterface
    public void setAccount(final String accountName, final String providerFilter) {
        if (StringUtility.isNullOrEmpty(accountName)) {
            Logger.e(Area.JS_API.value(), "'accountName' cannot be null or empty");
        } else if (StringUtility.isNullOrEmpty(providerFilter)) {
            Logger.e(Area.JS_API.value(), "'providerFilter' cannot be null or empty");
        } else if (!providerFilter.equals(new AndroidAccountUserAuthProvider().getProviderFilter())) {
            Logger.e(Area.JS_API.value(), String.format(Locale.US, "Unsupported 'providerFilter' value [%1$s]", providerFilter));
        } else {
            Logger.v(Area.JS_API.value(), "JavaScriptAPI: setAccount() START");
            this._parentActivity.waitDialogShow();
            try {
                _ExecutorService.execute(new Runnable() { // from class: com.getjar.sdk.rewards.JavaScriptAPI.1
                    @Override // java.lang.Runnable
                    public void run() {
                        try {
                            HashMap<String, String> providerData = new HashMap<>(1);
                            providerData.put(AndroidAccountUserAuthProvider.KeySkipCacheFlag, "true");
                            providerData.put("android_account.username_data_hash", CryptoUtility.getSHA256(accountName));
                            ProviderHint providerHint = new ProviderHint(providerFilter, providerData);
                            AuthManager.initialize(JavaScriptAPI.this._commContext.getApplicationContext());
                            AuthManager.getInstance().ensureAuthResetCurrent(providerHint, true);
                            AuthManager.getInstance().waitOnAuth();
                            String url = GetJarConfig.getInstance(JavaScriptAPI.this._commContext, true).getDirectiveValue(GetJarConfig.KEY_DEFAULT_WEBVIEW_URL);
                            GetJarWebViewSubActivity.loadUrl(url);
                        } catch (Exception e) {
                            Logger.e(Area.JS_API.value(), "JavaScriptAPI: setAccount() failed", e);
                        } finally {
                            Logger.v(Area.JS_API.value(), "JavaScriptAPI: setAccount() FINISH");
                            JavaScriptAPI.this._parentActivity.waitDialogHide();
                        }
                    }
                });
            } catch (Exception e) {
                Logger.e(Area.JS_API.value(), "JavaScriptAPI: setAccount() failed", e);
                this._parentActivity.waitDialogHide();
            }
        }
    }

    @JavascriptInterface
    public String getAppDetails(String thePackageName) {
        Logger.v(Area.JS_API.value(), "JavaScriptAPI: getAppDetails() START");
        JSONObject resultJson = new JSONObject();
        PackageInfo packageInfo = null;
        try {
            try {
                packageInfo = this._commContext.getApplicationContext().getPackageManager().getPackageInfo(thePackageName, 0);
            } catch (PackageManager.NameNotFoundException e) {
            }
            if (packageInfo == null) {
                resultJson.put("install_state", "UNINSTALLED");
            } else {
                resultJson.put("install_state", "INSTALLED");
                Long installTime = null;
                try {
                    Field field = PackageInfo.class.getDeclaredField("firstInstallTime");
                    installTime = (Long) field.get(packageInfo);
                } catch (Exception e2) {
                    Logger.w(Area.JS_API.value(), String.format(Locale.US, "getAppDetails() unable to use PackageInfo.firstInstallTime [%1$s]", e2.getMessage()));
                }
                if (installTime == null) {
                    try {
                        File file = new File(packageInfo.applicationInfo.sourceDir);
                        installTime = Long.valueOf(file.lastModified());
                    } catch (Exception e3) {
                        Logger.w(Area.JS_API.value(), String.format(Locale.US, "getAppDetails() unable to use File.lastModified [%1$s]", e3.getMessage()));
                    }
                }
                if (installTime != null) {
                    resultJson.put("install_timestamp", installTime.longValue());
                }
            }
        } catch (Exception e4) {
            Logger.e(Area.JS_API.value(), "getAppDetails() failed", e4);
        } finally {
            Logger.v(Area.JS_API.value(), "JavaScriptAPI: getAppDetails() FINISH");
        }
        return resultJson.toString();
    }

    @JavascriptInterface
    public String redeemVoucher(String packageName, String voucherToken) {
        JavaScriptRedeemIntentResult result;
        Logger.v(Area.JS_API.value(), "JavaScriptAPI: redeemVoucher() START");
        try {
            JavaScriptRedeemIntentResult javaScriptRedeemIntentResult = JavaScriptRedeemIntentResult.UNKNOWN_FAILURE;
            try {
                Intent redeemIntent = RedemptionEngine.buildRedeemVoucherIntent(packageName, voucherToken, this._commContext.getApplicationContext());
                this._commContext.getApplicationContext().startActivity(redeemIntent);
                result = JavaScriptRedeemIntentResult.SUCCESS;
                AlarmsUtility.scheduleVoucherRedemptionCheck(this._commContext.getApplicationContext(), voucherToken);
            } catch (Exception e) {
                PackageInfo packageInfo = null;
                try {
                    packageInfo = this._commContext.getApplicationContext().getPackageManager().getPackageInfo(packageName, 0);
                } catch (PackageManager.NameNotFoundException e2) {
                }
                if (packageInfo == null) {
                    result = JavaScriptRedeemIntentResult.TARGET_NOT_INSTALLED;
                } else {
                    result = JavaScriptRedeemIntentResult.TARGET_DISABLED;
                }
                Logger.e(Area.JS_API.value() | Area.REDEEM.value() | Area.OFFER.value(), "redeemVoucher() failed", e);
            }
            return String.format(Locale.US, "\"%1$s\"", result.name());
        } finally {
            Logger.v(Area.JS_API.value(), "JavaScriptAPI: redeemVoucher() FINISH");
        }
    }

    public void setCurrentManagedOfferDetails(String managedOfferDetails) {
        Logger.v(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "JavaScriptAPI setCurrentManagedOfferDetails [%1$s]", managedOfferDetails));
        this._currentManagedOfferDetails = managedOfferDetails;
    }

    @JavascriptInterface
    public void purchaseManagedOffer(final String offerId, final String purchaseMetadata, final String trackingMetadata, final String callback) {
        if (!StringUtility.isNullOrEmpty(offerId)) {
            if (!StringUtility.isNullOrEmpty(purchaseMetadata)) {
                if (!StringUtility.isNullOrEmpty(trackingMetadata)) {
                    if (!StringUtility.isNullOrEmpty(callback)) {
                        _callbackToStartTimeMap.put(callback, Long.valueOf(System.currentTimeMillis()));
                        _ExecutorService.execute(new Runnable() { // from class: com.getjar.sdk.rewards.JavaScriptAPI.2
                            @Override // java.lang.Runnable
                            public void run() {
                                JavaScriptCallbackFailureReason failureReason;
                                Logger.v(Area.JS_API.value(), "JavaScriptAPI: purchaseManagedOffer() START");
                                try {
                                    Logger.v(Area.OFFER.value() | Area.JS_API.value() | Area.TRANSACTION.value(), String.format(Locale.US, "JavaScriptAPI: purchaseManagedOffer() purchaseMetadata:'%1$s'", purchaseMetadata));
                                    Logger.v(Area.OFFER.value() | Area.JS_API.value() | Area.TRANSACTION.value(), String.format(Locale.US, "JavaScriptAPI: purchaseManagedOffer() trackingMetadata:'%1$s'", trackingMetadata));
                                    HashMap<String, String> purchaseMetadataMap = Utility.jsonArrayStringToMap(purchaseMetadata);
                                    HashMap<String, String> trackingMetadataMap = Utility.jsonArrayStringToMap(trackingMetadata);
                                    String clientTransactionId = UUID.randomUUID().toString();
                                    InAppPurchaseManager.getInstance(JavaScriptAPI.this._parentActivity.getParentActivity()).setCurrentClientTransactionId(clientTransactionId);
                                    InAppPurchaseManager.ManagedOfferStatus status = InAppPurchaseManager.getInstance(JavaScriptAPI.this._parentActivity.getParentActivity()).reserveManagedOffer(clientTransactionId, offerId, purchaseMetadataMap, trackingMetadataMap, JavaScriptAPI.this._parentActivity);
                                    if (InAppPurchaseManager.ManagedOfferStatus.SUCCESS.equals(status)) {
                                        String marketplaceItemId = purchaseMetadataMap.get(Constants.MARKETPLACE_PRODUCT_ID);
                                        InAppPurchaseManager.getInstance(JavaScriptAPI.this._parentActivity.getParentActivity()).processOutstandingPurchases(true);
                                        if (InAppPurchaseManager.getInstance(JavaScriptAPI.this._parentActivity.getParentActivity()).isGooglePlayConnected()) {
                                            ManagedOfferBucket transaction = (ManagedOfferBucket) DBTransactions.getInstance(JavaScriptAPI.this._commContext.getApplicationContext()).loadTransaction(clientTransactionId);
                                            if (transaction != null && transaction.getState().equals(DBTransactions.ManagedOfferState.RESERVED)) {
                                                if (StringUtility.isNullOrEmpty(marketplaceItemId)) {
                                                    Logger.w(Area.OFFER.value() | Area.TRANSACTION.value(), "JavaScriptAPI: purchaseManagedOffer() 'marketplace_product_id' not found in purchaseMetadata");
                                                    GetJarWebViewSubActivity.saveCallback(callback, JavaScriptAPI.this._parentActivity.getParentActivity());
                                                    TransactionManager.updateOfferTransactionState(JavaScriptAPI.this._commContext, transaction, DBTransactions.ManagedOfferState.PURCHASED);
                                                    new TransactionManager(JavaScriptAPI.this._parentActivity.getParentActivity()).runEarnAndManagedOfferTransactions(JavaScriptAPI.this._commContext);
                                                } else {
                                                    PendingIntent pendingIntent = InAppPurchaseManager.getInstance(JavaScriptAPI.this._parentActivity.getParentActivity()).requestPurchaseIntent(marketplaceItemId, clientTransactionId, JavaScriptAPI.this._parentActivity);
                                                    if (pendingIntent != null) {
                                                        TransactionManager.updateOfferTransactionState(JavaScriptAPI.this._commContext, transaction, DBTransactions.ManagedOfferState.PURCHASING);
                                                        JavaScriptAPI.this._parentActivity.startGooglePlayForPurchase(pendingIntent, callback, JavaScriptAPI.this._commContext, clientTransactionId);
                                                    } else {
                                                        JavaScriptAPI.addDataAndMakeJSCallback(callback, new JSONObject(), false, false, true, JavaScriptCallbackFailureReason.MARKETPLACE, new CommunicationException("Null pending intent. Couldn't connect to google play or google play returned null pending intent"));
                                                        InAppPurchaseManager.getInstance(JavaScriptAPI.this._parentActivity.getParentActivity()).removeLastClientTransactionId();
                                                    }
                                                }
                                            } else {
                                                JavaScriptAPI.addDataAndMakeJSCallback(callback, new JSONObject(), false, false, false, JavaScriptCallbackFailureReason.UNKNOWN, new TransactionException("Entered into some weird state. Transaction is null when trying to Buy. Reserved transaction must have been canceled somehow."));
                                                new TransactionManager(JavaScriptAPI.this._parentActivity.getParentActivity()).cancelManagedOfferTransaction(clientTransactionId, JavaScriptAPI.this._commContext);
                                                InAppPurchaseManager.getInstance(JavaScriptAPI.this._parentActivity.getParentActivity()).removeLastClientTransactionId();
                                            }
                                        } else {
                                            Logger.e(Area.OFFER.value() | Area.JS_API.value() | Area.TRANSACTION.value(), "JavaScriptAPI: purchaseManagedOffer() Couldn't connect to google play");
                                            JavaScriptAPI.addDataAndMakeJSCallback(callback, new JSONObject(), false, false, true, JavaScriptCallbackFailureReason.MARKETPLACE, new CommunicationException("Couldn't connect to google play"));
                                            InAppPurchaseManager.getInstance(JavaScriptAPI.this._parentActivity.getParentActivity()).removeLastClientTransactionId();
                                        }
                                    } else {
                                        JavaScriptCallbackFailureReason javaScriptCallbackFailureReason = JavaScriptCallbackFailureReason.UNKNOWN;
                                        try {
                                            failureReason = JavaScriptCallbackFailureReason.valueOf(status.name());
                                        } catch (Exception e) {
                                        }
                                        Logger.e(Area.OFFER.value() | Area.JS_API.value() | Area.TRANSACTION.value(), "JavaScriptAPI: purchaseManagedOffer() Reserve failed");
                                        JavaScriptAPI.addDataAndMakeJSCallback(callback, new JSONObject(), false, false, false, failureReason, new GetJarException("Reserve failed"));
                                        InAppPurchaseManager.getInstance(JavaScriptAPI.this._parentActivity.getParentActivity()).removeLastClientTransactionId();
                                    }
                                } catch (Exception e2) {
                                    Logger.e(Area.OFFER.value(), "JavaScriptAPI: purchaseManagedOffer() Unknown failure", e2);
                                    JavaScriptAPI.addDataAndMakeJSCallback(callback, new JSONObject(), false, false, false, JavaScriptCallbackFailureReason.UNKNOWN, e2);
                                    InAppPurchaseManager.getInstance(JavaScriptAPI.this._parentActivity.getParentActivity()).removeLastClientTransactionId();
                                } finally {
                                    Logger.v(Area.JS_API.value(), "JavaScriptAPI: purchaseManagedOffer() FINISH");
                                }
                            }
                        });
                        return;
                    }
                    Logger.e(Area.TRANSACTION.value() | Area.OFFER.value() | Area.JS_API.value(), "'callback' cannot be null or empty");
                    return;
                }
                Logger.e(Area.TRANSACTION.value() | Area.OFFER.value() | Area.JS_API.value(), "'trackingMetadata' cannot be null or empty");
                return;
            }
            Logger.e(Area.TRANSACTION.value() | Area.OFFER.value() | Area.JS_API.value(), "'purchaseMetadata' cannot be null or empty");
            return;
        }
        Logger.e(Area.TRANSACTION.value() | Area.OFFER.value() | Area.JS_API.value(), "'offerId' cannot be null or empty");
    }

    @JavascriptInterface
    public String getManagedOffer() {
        Logger.v(Area.JS_API.value(), "JavaScriptAPI: getManagedOffer() START");
        try {
            return this._currentManagedOfferDetails;
        } finally {
            Logger.v(Area.JS_API.value(), "JavaScriptAPI: getManagedOffer() FINISH");
        }
    }

    @JavascriptInterface
    public void performManagedCheckout(String managedOfferDetails) {
        Logger.v(Area.JS_API.value(), "JavaScriptAPI: performManagedCheckout() START");
        try {
            this._currentManagedOfferDetails = managedOfferDetails;
            AuthManager.initialize(this._commContext.getApplicationContext());
            if (this._commContext.getApplicationContext().getPackageName().equals(Constants.GREENJAR_PACKAGE)) {
                if (AuthManager.getInstance().getClaimsManager(this._commContext.getApplicationContext()).canPurchaseManagedProducts()) {
                    String url = GetJarConfig.getInstance(this._commContext, true).getDirectiveValue(GetJarConfig.KEY_MANAGED_CHECKOUT_URL);
                    GetJarWebViewSubActivity.loadUrl(url);
                } else {
                    showMessageDialog("Could not perform checkout.", false);
                }
            } else if (Utility.isExistApp(this._commContext.getApplicationContext(), Constants.GREENJAR_PACKAGE)) {
                launch(Constants.GREENJAR_PACKAGE, managedOfferDetails);
            } else {
                showMessageDialog(INSTALL_GETJAR_REWARDS, true);
            }
        } finally {
            Logger.v(Area.JS_API.value(), "JavaScriptAPI: performManagedCheckout() FINISH");
        }
    }

    private void showMessageDialog(String message, boolean showInstallButton) {
        AlertDialog.Builder builder = new AlertDialog.Builder(this._parentActivity.getParentActivity());
        builder.setTitle("Requires Getjar");
        builder.setMessage(message);
        if (showInstallButton) {
            builder.setNegativeButton("Cancel", (DialogInterface.OnClickListener) null);
            builder.setPositiveButton("Install Getjar", new DialogInterface.OnClickListener() { // from class: com.getjar.sdk.rewards.JavaScriptAPI.3
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int which) {
                    JavaScriptAPI.this.launchGooglePlay(Constants.GREENJAR_PACKAGE, GooglePlayLaunchReason.CHECKOUT.name());
                }
            });
        } else {
            builder.setPositiveButton("OK", (DialogInterface.OnClickListener) null);
        }
        builder.show();
    }

    @JavascriptInterface
    public void getLocalizedPriceBuckets(final String priceBuckets, final String callback) {
        if (StringUtility.isNullOrEmpty(priceBuckets)) {
            Logger.e(Area.JS_API.value() | Area.LOCALIZATION.value(), "JavaScriptAPI: getLocalizedPriceBuckets() received null or empty 'priceBuckets'");
        }
        if (StringUtility.isNullOrEmpty(callback)) {
            Logger.e(Area.JS_API.value() | Area.LOCALIZATION.value(), "JavaScriptAPI: getLocalizedPriceBuckets() received null or empty 'callback'");
        }
        _callbackToStartTimeMap.put(callback, Long.valueOf(System.currentTimeMillis()));
        _ExecutorService.execute(new Runnable() { // from class: com.getjar.sdk.rewards.JavaScriptAPI.4
            @Override // java.lang.Runnable
            public void run() {
                Logger.v(Area.JS_API.value(), "JavaScriptAPI: getLocalizedPriceBuckets() START");
                try {
                    JSONArray priceBucketJsonArray = new JSONObject(priceBuckets).getJSONArray("price_buckets");
                    String[] priceBucketArray = new String[priceBucketJsonArray.length()];
                    for (int i = 0; i < priceBucketJsonArray.length(); i++) {
                        priceBucketArray[i] = priceBucketJsonArray.getJSONObject(i).getString(Constants.MARKETPLACE_PRODUCT_ID);
                    }
                    JSONArray localizedPrices = InAppPurchaseManager.getInstance(JavaScriptAPI.this._parentActivity.getParentActivity()).getLocalizedPrices(priceBucketArray);
                    if (!InAppPurchaseManager.getInstance(JavaScriptAPI.this._parentActivity.getParentActivity()).isGooglePlayConnected()) {
                        Logger.e(Area.OFFER.value() | Area.JS_API.value() | Area.TRANSACTION.value(), "JavaScriptAPI: getLocalizedPriceBuckets() Unable to connect to Google play");
                        JavaScriptAPI.addDataAndMakeJSCallback(callback, new JSONObject(), false, false, true, JavaScriptCallbackFailureReason.MARKETPLACE, new CommunicationException("Unable to connect to Google play"));
                    } else {
                        JSONObject obj = new JSONObject();
                        obj.put("price_buckets", localizedPrices);
                        Logger.d(Area.OFFER.value(), String.format(Locale.US, "JavaScriptAPI: getLocalizedPriceBuckets() Price buckets: %1$s", localizedPrices));
                        JavaScriptAPI.addDataAndMakeJSCallback(callback, obj, true, false, true, JavaScriptCallbackFailureReason.NONE, null);
                    }
                } catch (Exception e) {
                    Logger.e(Area.OFFER.value() | Area.JS_API.value() | Area.TRANSACTION.value(), "JavaScriptAPI: getLocalizedPriceBuckets() Unknown failure", e);
                    JavaScriptAPI.addDataAndMakeJSCallback(callback, new JSONObject(), false, false, true, JavaScriptCallbackFailureReason.UNKNOWN, e);
                } catch (JSONException e2) {
                    Logger.e(Area.OFFER.value() | Area.JS_API.value() | Area.TRANSACTION.value(), "JavaScriptAPI: getLocalizedPriceBuckets() Invalid JSON", e2);
                    JavaScriptAPI.addDataAndMakeJSCallback(callback, new JSONObject(), false, false, true, JavaScriptCallbackFailureReason.UNKNOWN, e2);
                } finally {
                    Logger.v(Area.JS_API.value(), "JavaScriptAPI: getLocalizedPriceBuckets() FINISH");
                }
            }
        });
    }

    @JavascriptInterface
    public boolean canViewManagedProducts() {
        Logger.v(Area.JS_API.value(), "JavaScriptAPI: canViewManagedProducts() START");
        try {
            try {
                boolean canViewManagedProducts = AuthManager.getInstance().getClaimsManager(this._commContext.getApplicationContext()).canViewManagedProducts();
                Logger.v(Area.JS_API.value(), "JavaScriptAPI: canViewManagedProducts() FINISH");
                return canViewManagedProducts;
            } catch (Exception e) {
                Logger.e(Area.JS_API.value() | Area.PURCHASE.value() | Area.CONFIG.value() | Area.TRANSACTION.value(), "canViewManagedProducts() failed", e);
                Logger.v(Area.JS_API.value(), "JavaScriptAPI: canViewManagedProducts() FINISH");
                return false;
            }
        } catch (Throwable th) {
            Logger.v(Area.JS_API.value(), "JavaScriptAPI: canViewManagedProducts() FINISH");
            throw th;
        }
    }

    @JavascriptInterface
    public boolean canPurchaseManagedProducts() {
        Logger.v(Area.JS_API.value(), "JavaScriptAPI: canPurchaseManagedProducts() START");
        try {
            try {
                boolean canPurchaseManagedProducts = AuthManager.getInstance().getClaimsManager(this._commContext.getApplicationContext()).canPurchaseManagedProducts();
                Logger.v(Area.JS_API.value(), "JavaScriptAPI: canPurchaseManagedProducts() FINISH");
                return canPurchaseManagedProducts;
            } catch (Exception e) {
                Logger.e(Area.JS_API.value() | Area.TRANSACTION.value() | Area.CONFIG.value() | Area.OFFER.value(), "ClaimsManager.canBuy() failed", e);
                Logger.v(Area.JS_API.value(), "JavaScriptAPI: canPurchaseManagedProducts() FINISH");
                return false;
            }
        } catch (Throwable th) {
            Logger.v(Area.JS_API.value(), "JavaScriptAPI: canPurchaseManagedProducts() FINISH");
            throw th;
        }
    }

    @JavascriptInterface
    public void launchGooglePlay(String packageName, String reason) {
        Logger.v(Area.JS_API.value(), "JavaScriptAPI: launchGooglePlay() START");
        try {
            if (StringUtility.isNullOrEmpty(packageName)) {
                Logger.e(Area.JS_API.value() | Area.UI.value(), "launchGooglePlay(): Null or empty packageName provided by javascript");
                return;
            }
            GooglePlayLaunchReason reasonObj = GooglePlayLaunchReason.valueOf(reason);
            this._googlePlayLaunchCache.update(packageName, reasonObj);
            Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(String.format(Locale.US, "market://details?id=%1$s", packageName)));
            intent.addFlags(DriveFile.MODE_READ_ONLY);
            intent.addFlags(134217728);
            intent.addFlags(1073741824);
            this._parentActivity.getParentActivity().startActivity(intent);
        } catch (Exception e) {
            Logger.e(Area.JS_API.value() | Area.UI.value(), String.format(Locale.US, "launchGooglePlay(): Unsupported reason value '%1$s', must be one of: %2$s", reason, GooglePlayLaunchReason.getSupportedReasons()));
        } finally {
            Logger.v(Area.JS_API.value(), "JavaScriptAPI: launchGooglePlay() FINISH");
        }
    }

    public static void addDataAndMakeJSCallback(String callback, JSONObject resultJson, boolean success, boolean moneyTaken, boolean recoverable, JavaScriptCallbackFailureReason reason, Throwable throwable) {
        Long time;
        if (!StringUtility.isNullOrEmpty(callback)) {
            if (reason != null) {
                JSONObject returnObj = new JSONObject();
                try {
                    returnObj.put("return", resultJson);
                    Long time2 = _callbackToStartTimeMap.remove(callback);
                    if (time2 == null) {
                        time = 0L;
                    } else {
                        time = Long.valueOf(System.currentTimeMillis() - time2.longValue());
                    }
                    JSONObject operationObj = new JSONObject();
                    operationObj.put("elapsed_time", time.longValue() / 1000000.0d);
                    JSONObject statusObj = new JSONObject();
                    statusObj.put("succeeded", success);
                    statusObj.put("moneyTaken", moneyTaken);
                    statusObj.put("recoverable", recoverable);
                    statusObj.put("reason", reason.name());
                    if (throwable != null) {
                        JSONObject exceptionObj = new JSONObject();
                        exceptionObj.put(ServerProtocol.DIALOG_PARAM_TYPE, throwable.getClass().getSimpleName());
                        exceptionObj.put("message", throwable.getMessage());
                        exceptionObj.put("stack_trace", Logger.getStackTrace(throwable.getStackTrace()));
                        statusObj.put(HitTypes.EXCEPTION, exceptionObj);
                    }
                    operationObj.put("status", statusObj);
                    returnObj.put("operation", operationObj);
                } catch (JSONException e) {
                    Logger.d(Area.JS_API.value(), "JSON error", e);
                }
                makeJavaScriptCallback(callback, returnObj.toString());
                return;
            }
            Logger.e(Area.JS_API.value(), "'reason' is null. Unable to make callback");
            return;
        }
        Logger.e(Area.JS_API.value(), "'callback' is null. Unable to make callback");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void launch(String thePackageName, String additionalData) {
        try {
            Logger.d(Area.JS_API.value() | Area.UI.value(), String.format(Locale.US, "JavaScriptAPI: package name:'%1$s' additiona data:'%2$s'", thePackageName, additionalData));
            new Intent("android.intent.action.MAIN");
            Intent i = this._commContext.getApplicationContext().getPackageManager().getLaunchIntentForPackage(thePackageName);
            if (i != null) {
                i.addCategory("android.intent.category.LAUNCHER");
                i.setFlags(270532608);
                if (!StringUtility.isNullOrEmpty(additionalData) && thePackageName.equals(Constants.GREENJAR_PACKAGE)) {
                    i.putExtra(EXTRA_MANAGED_CHECKOUT_DATA, additionalData);
                    i.putExtra(GetJarManager.GetjarIntentKey, true);
                    i.addCategory("android.intent.category.LAUNCHER");
                    i.putExtra(CommManager.AuthProviderFilterDataKey, RedemptionEngine.getProviderFilterJson(this._commContext.getApplicationContext()).toString());
                    i.putExtra(RedemptionEngine.IntentTypeKey, RedemptionEngine.IntentTypeShowCheckout);
                    i.setFlags(882900992);
                }
                this._commContext.getApplicationContext().startActivity(i);
                return;
            }
            showMessageDialog("App not found", false);
        } catch (Exception e) {
            Logger.e(Area.JS_API.value() | Area.UI.value(), String.format(Locale.US, "JavaScriptAPI: launch(%1$s) failed", thePackageName), e);
        }
    }
}
