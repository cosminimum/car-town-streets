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
import java.io.UnsupportedEncodingException;
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

public class JavaScriptAPI {
    public static final String EXTRA_MANAGED_CHECKOUT_DATA = "EXTRA_MANAGED_CHECKOUT_DATA";
    private static final String INSTALL_GETJAR_REWARDS = "Install Getjar Rewards to buy these app deals and earn free rewards";
    private static final ExecutorService _ExecutorService = Executors.newSingleThreadExecutor();
    public static HashMap<String, Long> _callbackToStartTimeMap = new HashMap<>();
    protected final CommContext _commContext;
    private String _currentManagedOfferDetails = null;
    private final GooglePlayLaunchCachingManager _googlePlayLaunchCache;
    protected final GetJarWebViewSubActivity _parentActivity;

    public enum AccountStatus {
        CURRENT,
        PREVIOUS,
        UNKNOWN
    }

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

    public enum JavaScriptRedeemIntentResult {
        SUCCESS,
        TARGET_DISABLED,
        TARGET_NOT_INSTALLED,
        UNKNOWN_FAILURE
    }

    public JavaScriptAPI(CommContext commContext, GetJarWebViewSubActivity parentActivity) {
        if (commContext == null) {
            throw new IllegalArgumentException("'commContext' cannot be NULL");
        } else if (parentActivity == null) {
            throw new IllegalArgumentException("'parentActivity' cannot be NULL");
        } else {
            this._commContext = commContext;
            this._parentActivity = parentActivity;
            this._googlePlayLaunchCache = new GooglePlayLaunchCachingManager(commContext.getApplicationContext());
        }
    }

    protected static void makeJavaScriptCallback(String callbackTarget, String resultJson) {
        Logger.d(Area.JS_API.value(), String.format(Locale.US, "Attempting to callback: %1$s", new Object[]{resultJson}));
        try {
            GetJarWebViewSubActivity.loadUrl(String.format(callbackTarget, new Object[]{URLEncoder.encode(resultJson, "UTF-8")}));
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    @JavascriptInterface
    public String getAccounts() {
        String str;
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
            str = "JavaScriptAPI: getAccounts() FINISH";
            Logger.v(Area.JS_API.value(), str);
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
            Logger.e(Area.JS_API.value(), String.format(Locale.US, "Unsupported 'providerFilter' value [%1$s]", new Object[]{providerFilter}));
        } else {
            Logger.v(Area.JS_API.value(), "JavaScriptAPI: setAccount() START");
            this._parentActivity.waitDialogShow();
            try {
                _ExecutorService.execute(new Runnable() {
                    public void run() {
                        String str;
                        try {
                            HashMap<String, String> providerData = new HashMap<>(1);
                            providerData.put(AndroidAccountUserAuthProvider.KeySkipCacheFlag, "true");
                            providerData.put("android_account.username_data_hash", CryptoUtility.getSHA256(accountName));
                            ProviderHint providerHint = new ProviderHint(providerFilter, providerData);
                            AuthManager.initialize(JavaScriptAPI.this._commContext.getApplicationContext());
                            AuthManager.getInstance().ensureAuthResetCurrent(providerHint, true);
                            AuthManager.getInstance().waitOnAuth();
                            GetJarWebViewSubActivity.loadUrl(GetJarConfig.getInstance(JavaScriptAPI.this._commContext, true).getDirectiveValue(GetJarConfig.KEY_DEFAULT_WEBVIEW_URL));
                        } catch (Exception e) {
                            Logger.e(Area.JS_API.value(), "JavaScriptAPI: setAccount() failed", e);
                        } finally {
                            str = "JavaScriptAPI: setAccount() FINISH";
                            Logger.v(Area.JS_API.value(), str);
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

    /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r7v18, resolved type: java.lang.Object} */
    /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r0v0, resolved type: java.lang.Long} */
    /* JADX WARNING: Multi-variable type inference failed */
    @android.webkit.JavascriptInterface
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public java.lang.String getAppDetails(java.lang.String r15) {
        /*
            r14 = this;
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.JS_API
            long r7 = r7.value()
            java.lang.String r9 = "JavaScriptAPI: getAppDetails() START"
            com.getjar.sdk.logging.Logger.v(r7, r9)
            org.json.JSONObject r6 = new org.json.JSONObject
            r6.<init>()
            r5 = 0
            com.getjar.sdk.comm.CommContext r7 = r14._commContext     // Catch:{ NameNotFoundException -> 0x00cf }
            android.content.Context r7 = r7.getApplicationContext()     // Catch:{ NameNotFoundException -> 0x00cf }
            android.content.pm.PackageManager r7 = r7.getPackageManager()     // Catch:{ NameNotFoundException -> 0x00cf }
            r8 = 0
            android.content.pm.PackageInfo r5 = r7.getPackageInfo(r15, r8)     // Catch:{ NameNotFoundException -> 0x00cf }
        L_0x0020:
            if (r5 != 0) goto L_0x0039
            java.lang.String r7 = "install_state"
            java.lang.String r8 = "UNINSTALLED"
            r6.put(r7, r8)     // Catch:{ Exception -> 0x0070 }
        L_0x0029:
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.JS_API
            long r7 = r7.value()
            java.lang.String r9 = "JavaScriptAPI: getAppDetails() FINISH"
            com.getjar.sdk.logging.Logger.v(r7, r9)
        L_0x0034:
            java.lang.String r7 = r6.toString()
            return r7
        L_0x0039:
            java.lang.String r7 = "install_state"
            java.lang.String r8 = "INSTALLED"
            r6.put(r7, r8)     // Catch:{ Exception -> 0x0070 }
            r4 = 0
            java.lang.Class<android.content.pm.PackageInfo> r7 = android.content.pm.PackageInfo.class
            java.lang.String r8 = "firstInstallTime"
            java.lang.reflect.Field r2 = r7.getDeclaredField(r8)     // Catch:{ Exception -> 0x0088 }
            java.lang.Object r7 = r2.get(r5)     // Catch:{ Exception -> 0x0088 }
            r0 = r7
            java.lang.Long r0 = (java.lang.Long) r0     // Catch:{ Exception -> 0x0088 }
            r4 = r0
        L_0x0051:
            if (r4 != 0) goto L_0x0064
            java.io.File r3 = new java.io.File     // Catch:{ Exception -> 0x00b2 }
            android.content.pm.ApplicationInfo r7 = r5.applicationInfo     // Catch:{ Exception -> 0x00b2 }
            java.lang.String r7 = r7.sourceDir     // Catch:{ Exception -> 0x00b2 }
            r3.<init>(r7)     // Catch:{ Exception -> 0x00b2 }
            long r7 = r3.lastModified()     // Catch:{ Exception -> 0x00b2 }
            java.lang.Long r4 = java.lang.Long.valueOf(r7)     // Catch:{ Exception -> 0x00b2 }
        L_0x0064:
            if (r4 == 0) goto L_0x0029
            java.lang.String r7 = "install_timestamp"
            long r8 = r4.longValue()     // Catch:{ Exception -> 0x0070 }
            r6.put(r7, r8)     // Catch:{ Exception -> 0x0070 }
            goto L_0x0029
        L_0x0070:
            r1 = move-exception
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.JS_API     // Catch:{ all -> 0x00a5 }
            long r7 = r7.value()     // Catch:{ all -> 0x00a5 }
            java.lang.String r9 = "getAppDetails() failed"
            com.getjar.sdk.logging.Logger.e(r7, r9, r1)     // Catch:{ all -> 0x00a5 }
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.JS_API
            long r7 = r7.value()
            java.lang.String r9 = "JavaScriptAPI: getAppDetails() FINISH"
            com.getjar.sdk.logging.Logger.v(r7, r9)
            goto L_0x0034
        L_0x0088:
            r1 = move-exception
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.JS_API     // Catch:{ Exception -> 0x0070 }
            long r7 = r7.value()     // Catch:{ Exception -> 0x0070 }
            java.util.Locale r9 = java.util.Locale.US     // Catch:{ Exception -> 0x0070 }
            java.lang.String r10 = "getAppDetails() unable to use PackageInfo.firstInstallTime [%1$s]"
            r11 = 1
            java.lang.Object[] r11 = new java.lang.Object[r11]     // Catch:{ Exception -> 0x0070 }
            r12 = 0
            java.lang.String r13 = r1.getMessage()     // Catch:{ Exception -> 0x0070 }
            r11[r12] = r13     // Catch:{ Exception -> 0x0070 }
            java.lang.String r9 = java.lang.String.format(r9, r10, r11)     // Catch:{ Exception -> 0x0070 }
            com.getjar.sdk.logging.Logger.w(r7, r9)     // Catch:{ Exception -> 0x0070 }
            goto L_0x0051
        L_0x00a5:
            r7 = move-exception
            com.getjar.sdk.logging.Area r8 = com.getjar.sdk.logging.Area.JS_API
            long r8 = r8.value()
            java.lang.String r10 = "JavaScriptAPI: getAppDetails() FINISH"
            com.getjar.sdk.logging.Logger.v(r8, r10)
            throw r7
        L_0x00b2:
            r1 = move-exception
            com.getjar.sdk.logging.Area r7 = com.getjar.sdk.logging.Area.JS_API     // Catch:{ Exception -> 0x0070 }
            long r7 = r7.value()     // Catch:{ Exception -> 0x0070 }
            java.util.Locale r9 = java.util.Locale.US     // Catch:{ Exception -> 0x0070 }
            java.lang.String r10 = "getAppDetails() unable to use File.lastModified [%1$s]"
            r11 = 1
            java.lang.Object[] r11 = new java.lang.Object[r11]     // Catch:{ Exception -> 0x0070 }
            r12 = 0
            java.lang.String r13 = r1.getMessage()     // Catch:{ Exception -> 0x0070 }
            r11[r12] = r13     // Catch:{ Exception -> 0x0070 }
            java.lang.String r9 = java.lang.String.format(r9, r10, r11)     // Catch:{ Exception -> 0x0070 }
            com.getjar.sdk.logging.Logger.w(r7, r9)     // Catch:{ Exception -> 0x0070 }
            goto L_0x0064
        L_0x00cf:
            r7 = move-exception
            goto L_0x0020
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.rewards.JavaScriptAPI.getAppDetails(java.lang.String):java.lang.String");
    }

    @JavascriptInterface
    public String redeemVoucher(String packageName, String voucherToken) {
        JavaScriptRedeemIntentResult result;
        Logger.v(Area.JS_API.value(), "JavaScriptAPI: redeemVoucher() START");
        try {
            JavaScriptRedeemIntentResult javaScriptRedeemIntentResult = JavaScriptRedeemIntentResult.UNKNOWN_FAILURE;
            this._commContext.getApplicationContext().startActivity(RedemptionEngine.buildRedeemVoucherIntent(packageName, voucherToken, this._commContext.getApplicationContext()));
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
        } catch (Throwable th) {
            Logger.v(Area.JS_API.value(), "JavaScriptAPI: redeemVoucher() FINISH");
            throw th;
        }
        String format = String.format(Locale.US, "\"%1$s\"", new Object[]{result.name()});
        Logger.v(Area.JS_API.value(), "JavaScriptAPI: redeemVoucher() FINISH");
        return format;
    }

    public void setCurrentManagedOfferDetails(String managedOfferDetails) {
        Logger.v(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "JavaScriptAPI setCurrentManagedOfferDetails [%1$s]", new Object[]{managedOfferDetails}));
        this._currentManagedOfferDetails = managedOfferDetails;
    }

    @JavascriptInterface
    public void purchaseManagedOffer(String offerId, String purchaseMetadata, String trackingMetadata, String callback) {
        if (StringUtility.isNullOrEmpty(offerId)) {
            Logger.e(Area.TRANSACTION.value() | Area.OFFER.value() | Area.JS_API.value(), "'offerId' cannot be null or empty");
        } else if (StringUtility.isNullOrEmpty(purchaseMetadata)) {
            Logger.e(Area.TRANSACTION.value() | Area.OFFER.value() | Area.JS_API.value(), "'purchaseMetadata' cannot be null or empty");
        } else if (StringUtility.isNullOrEmpty(trackingMetadata)) {
            Logger.e(Area.TRANSACTION.value() | Area.OFFER.value() | Area.JS_API.value(), "'trackingMetadata' cannot be null or empty");
        } else if (StringUtility.isNullOrEmpty(callback)) {
            Logger.e(Area.TRANSACTION.value() | Area.OFFER.value() | Area.JS_API.value(), "'callback' cannot be null or empty");
        } else {
            _callbackToStartTimeMap.put(callback, Long.valueOf(System.currentTimeMillis()));
            final String str = purchaseMetadata;
            final String str2 = trackingMetadata;
            final String str3 = offerId;
            final String str4 = callback;
            _ExecutorService.execute(new Runnable() {
                public void run() {
                    String str;
                    JavaScriptCallbackFailureReason failureReason;
                    Logger.v(Area.JS_API.value(), "JavaScriptAPI: purchaseManagedOffer() START");
                    try {
                        Logger.v(Area.OFFER.value() | Area.JS_API.value() | Area.TRANSACTION.value(), String.format(Locale.US, "JavaScriptAPI: purchaseManagedOffer() purchaseMetadata:'%1$s'", new Object[]{str}));
                        Logger.v(Area.OFFER.value() | Area.JS_API.value() | Area.TRANSACTION.value(), String.format(Locale.US, "JavaScriptAPI: purchaseManagedOffer() trackingMetadata:'%1$s'", new Object[]{str2}));
                        HashMap<String, String> purchaseMetadataMap = Utility.jsonArrayStringToMap(str);
                        HashMap<String, String> trackingMetadataMap = Utility.jsonArrayStringToMap(str2);
                        String clientTransactionId = UUID.randomUUID().toString();
                        InAppPurchaseManager.getInstance(JavaScriptAPI.this._parentActivity.getParentActivity()).setCurrentClientTransactionId(clientTransactionId);
                        InAppPurchaseManager.ManagedOfferStatus status = InAppPurchaseManager.getInstance(JavaScriptAPI.this._parentActivity.getParentActivity()).reserveManagedOffer(clientTransactionId, str3, purchaseMetadataMap, trackingMetadataMap, JavaScriptAPI.this._parentActivity);
                        if (InAppPurchaseManager.ManagedOfferStatus.SUCCESS.equals(status)) {
                            String marketplaceItemId = purchaseMetadataMap.get(Constants.MARKETPLACE_PRODUCT_ID);
                            InAppPurchaseManager.getInstance(JavaScriptAPI.this._parentActivity.getParentActivity()).processOutstandingPurchases(true);
                            if (InAppPurchaseManager.getInstance(JavaScriptAPI.this._parentActivity.getParentActivity()).isGooglePlayConnected()) {
                                ManagedOfferBucket transaction = (ManagedOfferBucket) DBTransactions.getInstance(JavaScriptAPI.this._commContext.getApplicationContext()).loadTransaction(clientTransactionId);
                                if (transaction == null || !transaction.getState().equals(DBTransactions.ManagedOfferState.RESERVED)) {
                                    JavaScriptAPI.addDataAndMakeJSCallback(str4, new JSONObject(), false, false, false, JavaScriptCallbackFailureReason.UNKNOWN, new TransactionException("Entered into some weird state. Transaction is null when trying to Buy. Reserved transaction must have been canceled somehow."));
                                    new TransactionManager(JavaScriptAPI.this._parentActivity.getParentActivity()).cancelManagedOfferTransaction(clientTransactionId, JavaScriptAPI.this._commContext);
                                    InAppPurchaseManager.getInstance(JavaScriptAPI.this._parentActivity.getParentActivity()).removeLastClientTransactionId();
                                } else if (StringUtility.isNullOrEmpty(marketplaceItemId)) {
                                    Logger.w(Area.OFFER.value() | Area.TRANSACTION.value(), "JavaScriptAPI: purchaseManagedOffer() 'marketplace_product_id' not found in purchaseMetadata");
                                    GetJarWebViewSubActivity.saveCallback(str4, JavaScriptAPI.this._parentActivity.getParentActivity());
                                    TransactionManager.updateOfferTransactionState(JavaScriptAPI.this._commContext, transaction, DBTransactions.ManagedOfferState.PURCHASED);
                                    new TransactionManager(JavaScriptAPI.this._parentActivity.getParentActivity()).runEarnAndManagedOfferTransactions(JavaScriptAPI.this._commContext);
                                } else {
                                    PendingIntent pendingIntent = InAppPurchaseManager.getInstance(JavaScriptAPI.this._parentActivity.getParentActivity()).requestPurchaseIntent(marketplaceItemId, clientTransactionId, JavaScriptAPI.this._parentActivity);
                                    if (pendingIntent != null) {
                                        TransactionManager.updateOfferTransactionState(JavaScriptAPI.this._commContext, transaction, DBTransactions.ManagedOfferState.PURCHASING);
                                        JavaScriptAPI.this._parentActivity.startGooglePlayForPurchase(pendingIntent, str4, JavaScriptAPI.this._commContext, clientTransactionId);
                                    } else {
                                        JavaScriptAPI.addDataAndMakeJSCallback(str4, new JSONObject(), false, false, true, JavaScriptCallbackFailureReason.MARKETPLACE, new CommunicationException("Null pending intent. Couldn't connect to google play or google play returned null pending intent"));
                                        InAppPurchaseManager.getInstance(JavaScriptAPI.this._parentActivity.getParentActivity()).removeLastClientTransactionId();
                                    }
                                }
                            } else {
                                Logger.e(Area.OFFER.value() | Area.JS_API.value() | Area.TRANSACTION.value(), "JavaScriptAPI: purchaseManagedOffer() Couldn't connect to google play");
                                JavaScriptAPI.addDataAndMakeJSCallback(str4, new JSONObject(), false, false, true, JavaScriptCallbackFailureReason.MARKETPLACE, new CommunicationException("Couldn't connect to google play"));
                                InAppPurchaseManager.getInstance(JavaScriptAPI.this._parentActivity.getParentActivity()).removeLastClientTransactionId();
                            }
                        } else {
                            JavaScriptCallbackFailureReason javaScriptCallbackFailureReason = JavaScriptCallbackFailureReason.UNKNOWN;
                            try {
                                failureReason = JavaScriptCallbackFailureReason.valueOf(status.name());
                            } catch (Exception e) {
                            }
                            Logger.e(Area.OFFER.value() | Area.JS_API.value() | Area.TRANSACTION.value(), "JavaScriptAPI: purchaseManagedOffer() Reserve failed");
                            JavaScriptAPI.addDataAndMakeJSCallback(str4, new JSONObject(), false, false, false, failureReason, new GetJarException("Reserve failed"));
                            InAppPurchaseManager.getInstance(JavaScriptAPI.this._parentActivity.getParentActivity()).removeLastClientTransactionId();
                        }
                    } catch (Exception e2) {
                        Logger.e(Area.OFFER.value(), "JavaScriptAPI: purchaseManagedOffer() Unknown failure", e2);
                        JavaScriptAPI.addDataAndMakeJSCallback(str4, new JSONObject(), false, false, false, JavaScriptCallbackFailureReason.UNKNOWN, e2);
                        InAppPurchaseManager.getInstance(JavaScriptAPI.this._parentActivity.getParentActivity()).removeLastClientTransactionId();
                    } finally {
                        str = "JavaScriptAPI: purchaseManagedOffer() FINISH";
                        Logger.v(Area.JS_API.value(), str);
                    }
                }
            });
        }
    }

    @JavascriptInterface
    public String getManagedOffer() {
        String str;
        Logger.v(Area.JS_API.value(), "JavaScriptAPI: getManagedOffer() START");
        try {
            return this._currentManagedOfferDetails;
        } finally {
            str = "JavaScriptAPI: getManagedOffer() FINISH";
            Logger.v(Area.JS_API.value(), str);
        }
    }

    @JavascriptInterface
    public void performManagedCheckout(String managedOfferDetails) {
        String str;
        Logger.v(Area.JS_API.value(), "JavaScriptAPI: performManagedCheckout() START");
        try {
            this._currentManagedOfferDetails = managedOfferDetails;
            AuthManager.initialize(this._commContext.getApplicationContext());
            if (this._commContext.getApplicationContext().getPackageName().equals(Constants.GREENJAR_PACKAGE)) {
                if (AuthManager.getInstance().getClaimsManager(this._commContext.getApplicationContext()).canPurchaseManagedProducts()) {
                    GetJarWebViewSubActivity.loadUrl(GetJarConfig.getInstance(this._commContext, true).getDirectiveValue(GetJarConfig.KEY_MANAGED_CHECKOUT_URL));
                } else {
                    showMessageDialog("Could not perform checkout.", false);
                }
            } else if (Utility.isExistApp(this._commContext.getApplicationContext(), Constants.GREENJAR_PACKAGE)) {
                launch(Constants.GREENJAR_PACKAGE, managedOfferDetails);
            } else {
                showMessageDialog(INSTALL_GETJAR_REWARDS, true);
            }
        } finally {
            str = "JavaScriptAPI: performManagedCheckout() FINISH";
            Logger.v(Area.JS_API.value(), str);
        }
    }

    private void showMessageDialog(String message, boolean showInstallButton) {
        AlertDialog.Builder builder = new AlertDialog.Builder(this._parentActivity.getParentActivity());
        builder.setTitle("Requires Getjar");
        builder.setMessage(message);
        if (showInstallButton) {
            builder.setNegativeButton("Cancel", (DialogInterface.OnClickListener) null);
            builder.setPositiveButton("Install Getjar", new DialogInterface.OnClickListener() {
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
        _ExecutorService.execute(new Runnable() {
            public void run() {
                String str;
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
                        Logger.d(Area.OFFER.value(), String.format(Locale.US, "JavaScriptAPI: getLocalizedPriceBuckets() Price buckets: %1$s", new Object[]{localizedPrices}));
                        JavaScriptAPI.addDataAndMakeJSCallback(callback, obj, true, false, true, JavaScriptCallbackFailureReason.NONE, (Throwable) null);
                    }
                } catch (JSONException e) {
                    Logger.e(Area.OFFER.value() | Area.JS_API.value() | Area.TRANSACTION.value(), "JavaScriptAPI: getLocalizedPriceBuckets() Invalid JSON", e);
                    JavaScriptAPI.addDataAndMakeJSCallback(callback, new JSONObject(), false, false, true, JavaScriptCallbackFailureReason.UNKNOWN, e);
                } catch (Exception e2) {
                    Logger.e(Area.OFFER.value() | Area.JS_API.value() | Area.TRANSACTION.value(), "JavaScriptAPI: getLocalizedPriceBuckets() Unknown failure", e2);
                    JavaScriptAPI.addDataAndMakeJSCallback(callback, new JSONObject(), false, false, true, JavaScriptCallbackFailureReason.UNKNOWN, e2);
                } finally {
                    str = "JavaScriptAPI: getLocalizedPriceBuckets() FINISH";
                    Logger.v(Area.JS_API.value(), str);
                }
            }
        });
    }

    /* JADX INFO: finally extract failed */
    @JavascriptInterface
    public boolean canViewManagedProducts() {
        Logger.v(Area.JS_API.value(), "JavaScriptAPI: canViewManagedProducts() START");
        try {
            boolean canViewManagedProducts = AuthManager.getInstance().getClaimsManager(this._commContext.getApplicationContext()).canViewManagedProducts();
            Logger.v(Area.JS_API.value(), "JavaScriptAPI: canViewManagedProducts() FINISH");
            return canViewManagedProducts;
        } catch (Exception e) {
            Logger.e(Area.JS_API.value() | Area.PURCHASE.value() | Area.CONFIG.value() | Area.TRANSACTION.value(), "canViewManagedProducts() failed", e);
            Logger.v(Area.JS_API.value(), "JavaScriptAPI: canViewManagedProducts() FINISH");
            return false;
        } catch (Throwable th) {
            Logger.v(Area.JS_API.value(), "JavaScriptAPI: canViewManagedProducts() FINISH");
            throw th;
        }
    }

    @JavascriptInterface
    public boolean canPurchaseManagedProducts() {
        String str;
        Logger.v(Area.JS_API.value(), "JavaScriptAPI: canPurchaseManagedProducts() START");
        try {
            return AuthManager.getInstance().getClaimsManager(this._commContext.getApplicationContext()).canPurchaseManagedProducts();
        } catch (Exception e) {
            Logger.e(Area.JS_API.value() | Area.TRANSACTION.value() | Area.CONFIG.value() | Area.OFFER.value(), "ClaimsManager.canBuy() failed", e);
            return false;
        } finally {
            str = "JavaScriptAPI: canPurchaseManagedProducts() FINISH";
            Logger.v(Area.JS_API.value(), str);
        }
    }

    @JavascriptInterface
    public void launchGooglePlay(String packageName, String reason) {
        String str;
        Logger.v(Area.JS_API.value(), "JavaScriptAPI: launchGooglePlay() START");
        try {
            if (StringUtility.isNullOrEmpty(packageName)) {
                Logger.e(Area.JS_API.value() | Area.UI.value(), "launchGooglePlay(): Null or empty packageName provided by javascript");
                return;
            }
            this._googlePlayLaunchCache.update(packageName, GooglePlayLaunchReason.valueOf(reason));
            Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(String.format(Locale.US, "market://details?id=%1$s", new Object[]{packageName})));
            intent.addFlags(DriveFile.MODE_READ_ONLY);
            intent.addFlags(134217728);
            intent.addFlags(1073741824);
            this._parentActivity.getParentActivity().startActivity(intent);
        } catch (Exception e) {
            Logger.e(Area.JS_API.value() | Area.UI.value(), String.format(Locale.US, "launchGooglePlay(): Unsupported reason value '%1$s', must be one of: %2$s", new Object[]{reason, GooglePlayLaunchReason.getSupportedReasons()}));
        } finally {
            str = "JavaScriptAPI: launchGooglePlay() FINISH";
            Logger.v(Area.JS_API.value(), str);
        }
    }

    public static void addDataAndMakeJSCallback(String callback, JSONObject resultJson, boolean success, boolean moneyTaken, boolean recoverable, JavaScriptCallbackFailureReason reason, Throwable throwable) {
        Long time;
        if (StringUtility.isNullOrEmpty(callback)) {
            Logger.e(Area.JS_API.value(), "'callback' is null. Unable to make callback");
        } else if (reason == null) {
            Logger.e(Area.JS_API.value(), "'reason' is null. Unable to make callback");
        } else {
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
                operationObj.put("elapsed_time", ((double) time.longValue()) / 1000000.0d);
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
        }
    }

    /* access modifiers changed from: protected */
    public void launch(String thePackageName, String additionalData) {
        try {
            Logger.d(Area.JS_API.value() | Area.UI.value(), String.format(Locale.US, "JavaScriptAPI: package name:'%1$s' additiona data:'%2$s'", new Object[]{thePackageName, additionalData}));
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
            Logger.e(Area.JS_API.value() | Area.UI.value(), String.format(Locale.US, "JavaScriptAPI: launch(%1$s) failed", new Object[]{thePackageName}), e);
        }
    }
}
