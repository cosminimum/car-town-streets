package com.getjar.sdk.rewards;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import android.os.ResultReceiver;
import com.getjar.sdk.GetJarException;
import com.getjar.sdk.comm.CommContext;
import com.getjar.sdk.comm.CommManager;
import com.getjar.sdk.comm.LocalizationServiceProxy;
import com.getjar.sdk.comm.Operation;
import com.getjar.sdk.comm.Result;
import com.getjar.sdk.comm.TransactionManager;
import com.getjar.sdk.comm.auth.ApplicationKeyDatabase;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.comm.persistence.DBTransactions;
import com.getjar.sdk.comm.persistence.ManagedOfferBucket;
import com.getjar.sdk.comm.persistence.RelatedManagedOfferData;
import com.getjar.sdk.comm.persistence.TransactionBucket;
import com.getjar.sdk.data.CacheEntry;
import com.getjar.sdk.data.CachingManager;
import com.getjar.sdk.data.GooglePurchaseResponse;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.Base64;
import com.getjar.sdk.utilities.Constants;
import com.getjar.sdk.utilities.NotificationsUtility;
import com.getjar.sdk.utilities.StringUtility;
import com.getjar.sdk.vending.billing.IInAppBillingService;
import com.miniclip.googlebilling.IabHelper;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class InAppPurchaseManager {
    private static final int GOOGLE_ORPHANED_PURCHASE_DELAY = 86400000;
    private static final String RESPONSE_CODE = "RESPONSE_CODE";
    private static final int _BuyingGoldLRUCap = 500;
    private static final String _CacheNamespace = "buyingGoldGoogleResponse";
    private static final String _IABIntentFilter = "com.android.vending.billing.InAppBillingService.BIND";
    private static volatile InAppPurchaseManager _Instance = null;
    private Context _applicationContext;
    private GetJarService _billingService;
    private CachingManager _cachingManager;
    private CommContext _commContext;
    private String _currentClientTransactionId;
    private final Object _googlePlayBindLock;
    private boolean _isBillingSupported;
    private final Object _processOutstandingPurchasesLock;
    private volatile IInAppBillingService googlePlayService;
    private GooglePlayServiceConnection googlePlayServiceConnection;
    private volatile boolean isGooglePlayConnected;

    /* loaded from: classes.dex */
    public enum InAppBillingFailure {
        CANCELLED,
        ITEM_NOT_AVAILABLE,
        GOOGLE_PLAY_BIND_FAILURE,
        GETJAR_SERVICE_FAILURE,
        UNAUTHORIZED,
        BILLING_NOT_SUPPORTED,
        NETWORK_ERROR
    }

    /* loaded from: classes.dex */
    public enum ManagedOfferStatus {
        SUCCESS,
        SDK_INTERNAL_ERROR,
        RESERVATION_TIMED_OUT,
        SERVER_ERROR,
        SERVER_ERROR_RECOVERABLE,
        NOT_AUTHORIZED,
        INVALID_DATA,
        GOOGLE_RELATED_FAILURE,
        GOOGLE_FAILURE_AFTER_PURCHASE,
        ALREADY_RESERVED,
        ALREADY_LICENSED,
        USER_PURCHASE_LIMIT,
        OFFER_PURCHASE_LIMIT
    }

    private InAppPurchaseManager(CommContext commContext) {
        this(commContext.getApplicationContext());
        this._commContext = commContext;
        this._cachingManager = new CachingManager(commContext, _CacheNamespace);
    }

    private InAppPurchaseManager(Context applicationContext) {
        this._isBillingSupported = false;
        this.googlePlayServiceConnection = new GooglePlayServiceConnection();
        this._googlePlayBindLock = new Object();
        this._processOutstandingPurchasesLock = new Object();
        this.isGooglePlayConnected = false;
        if (applicationContext == null) {
            throw new IllegalArgumentException("'applicationContext' cannot be null");
        }
        this._applicationContext = applicationContext;
    }

    private static synchronized void makeTheInstance(CommContext commContext) {
        synchronized (InAppPurchaseManager.class) {
            if (_Instance == null) {
                _Instance = new InAppPurchaseManager(commContext);
            }
        }
    }

    private static CommContext getCommContextInternal(Context context) {
        String applicationKey = ApplicationKeyDatabase.getInstance(context).getApplicationKey();
        if (StringUtility.isNullOrEmpty(applicationKey)) {
            throw new IllegalStateException("Unable to access the application key");
        }
        CommContext commContext = CommManager.createContext(applicationKey, context, new ResultReceiver(null) { // from class: com.getjar.sdk.rewards.InAppPurchaseManager.1
            @Override // android.os.ResultReceiver
            protected void onReceiveResult(int resultCode, Bundle resultData) {
                for (String key : resultData.keySet()) {
                    Logger.d(Area.OS_ENTRY_POINT.value() | Area.BUY_GOLD.value() | Area.AUTH.value() | Area.COMM.value(), String.format(Locale.US, "InAppPurchaseManager: Callback from the GetJar SDK [%1$s]", resultData.get(key).getClass().getName()));
                }
            }
        }, CommManager.LaunchWork.NONE);
        AuthManager.initialize(context);
        AuthManager.getInstance().waitOnAuth();
        return commContext;
    }

    public static InAppPurchaseManager getInstance(Context context) {
        if (context == null) {
            throw new IllegalArgumentException("context cannot be null");
        }
        if (_Instance == null) {
            makeTheInstance(getCommContextInternal(context));
        }
        return _Instance;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static InAppPurchaseManager getBasicInstance(Context applicationContext) {
        return new InAppPurchaseManager(applicationContext);
    }

    public CommContext getCommContext() {
        return this._commContext;
    }

    public void buyGoldOffer(String platformItemId, HashMap<String, String> trackingMetadataMap, Activity activity) {
        if (StringUtility.isNullOrEmpty(platformItemId)) {
            throw new IllegalArgumentException("platformItemId cannot be null or empty");
        }
        if (trackingMetadataMap == null) {
            throw new IllegalArgumentException("trackingMetadataMap cannot be null or empty");
        }
        if (activity == null) {
            throw new IllegalArgumentException("activity cannot be null");
        }
        if (!this._isBillingSupported) {
            SharedPreferences prefs = this._commContext.getApplicationContext().getSharedPreferences("GetJarClientPrefs", 0);
            this._isBillingSupported = prefs.getBoolean(Constants.BILLING_SUPPORTED_PREFS, false);
            if (!this._isBillingSupported) {
                handleFailure(platformItemId, InAppBillingFailure.BILLING_NOT_SUPPORTED, activity);
                return;
            }
        }
        if (AuthManager.getInstance().getClaimsManager(this._commContext.getApplicationContext()).canBuy()) {
            this._billingService = new GetJarService();
            this._billingService.setContext(this._commContext.getApplicationContext());
            if (!this._billingService.requestPurchase(platformItemId)) {
                handleFailure(platformItemId, InAppBillingFailure.GOOGLE_PLAY_BIND_FAILURE, activity);
                return;
            }
            return;
        }
        handleFailure(platformItemId, InAppBillingFailure.UNAUTHORIZED, activity);
    }

    public String getGoldOffers() {
        SharedPreferences prefs = this._commContext.getApplicationContext().getSharedPreferences("GetJarClientPrefs", 0);
        this._isBillingSupported = prefs.getBoolean(Constants.BILLING_SUPPORTED_PREFS, false);
        this._billingService = new GetJarService();
        this._billingService.setContext(this._commContext.getApplicationContext());
        boolean billingSupport = this._billingService.checkBillingSupported();
        Logger.d(Area.BUY_GOLD.value(), "InAppPurchaseManager getGoldOffers -- billingCheckRequestSuccess " + billingSupport);
        Operation operation = LocalizationServiceProxy.getInstance().getGoldOffers(this._commContext);
        try {
            Result result = operation.mo38get();
            if (result != null && result.isSuccessfulResponse()) {
                return result.getResponseJson().getString("return");
            }
        } catch (InterruptedException e) {
            Logger.e(Area.BUY_GOLD.value(), "InAppPurchaseManager getGoldOffers", e);
        } catch (ExecutionException e2) {
            Logger.e(Area.BUY_GOLD.value(), "InAppPurchaseManager getGoldOffers", e2);
        } catch (JSONException e3) {
            Logger.e(Area.BUY_GOLD.value(), "InAppPurchaseManager getGoldOffers", e3);
        }
        try {
            return new JSONObject().put("results", new JSONArray()).toString();
        } catch (JSONException e4) {
            Logger.e(Area.BUY_GOLD.value(), "InAppPurchaseManager getGoldOffers", e4);
            return "{\"results\":[]}";
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:18:0x0068, code lost:
        r1.put(com.getjar.sdk.utilities.Constants.BUY_CURRENCY_PRICE, r4.getString("pricing_amount"));
        r1.put(com.getjar.sdk.utilities.Constants.BUY_CURRENCY_CURRENCY, r4.getString("currency"));
        r1.put(com.getjar.sdk.utilities.Constants.BUY_CURRENCY_GOLD_VALUE, r4.getString("gold_amount"));
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.util.HashMap<java.lang.String, java.lang.String> getGoldBucketDetails(java.lang.String r9, android.content.Context r10) {
        /*
            boolean r5 = com.getjar.sdk.utilities.StringUtility.isNullOrEmpty(r9)
            if (r5 == 0) goto Le
            java.lang.IllegalArgumentException r5 = new java.lang.IllegalArgumentException
            java.lang.String r6 = "'platformItemId' cannot be null or empty"
            r5.<init>(r6)
            throw r5
        Le:
            if (r10 != 0) goto L18
            java.lang.IllegalArgumentException r5 = new java.lang.IllegalArgumentException
            java.lang.String r6 = "'context' cannot be null"
            r5.<init>(r6)
            throw r5
        L18:
            java.util.HashMap r1 = new java.util.HashMap
            r5 = 3
            r1.<init>(r5)
            org.json.JSONObject r5 = new org.json.JSONObject     // Catch: org.json.JSONException -> L8d
            com.getjar.sdk.rewards.InAppPurchaseManager r6 = getInstance(r10)     // Catch: org.json.JSONException -> L8d
            java.lang.String r6 = r6.getGoldOffers()     // Catch: org.json.JSONException -> L8d
            r5.<init>(r6)     // Catch: org.json.JSONException -> L8d
            java.lang.String r6 = "results"
            org.json.JSONArray r0 = r5.getJSONArray(r6)     // Catch: org.json.JSONException -> L8d
            r3 = 0
        L32:
            int r5 = r0.length()     // Catch: org.json.JSONException -> L8d
            if (r3 >= r5) goto L89
            org.json.JSONObject r4 = r0.getJSONObject(r3)     // Catch: org.json.JSONException -> L8d
            com.getjar.sdk.logging.Area r5 = com.getjar.sdk.logging.Area.BUY_GOLD     // Catch: org.json.JSONException -> L8d
            long r5 = r5.value()     // Catch: org.json.JSONException -> L8d
            java.lang.StringBuilder r7 = new java.lang.StringBuilder     // Catch: org.json.JSONException -> L8d
            r7.<init>()     // Catch: org.json.JSONException -> L8d
            java.lang.String r8 = "GooglePurchaseResponse getResponseAsMap "
            java.lang.StringBuilder r7 = r7.append(r8)     // Catch: org.json.JSONException -> L8d
            java.lang.String r8 = r4.toString()     // Catch: org.json.JSONException -> L8d
            java.lang.StringBuilder r7 = r7.append(r8)     // Catch: org.json.JSONException -> L8d
            java.lang.String r7 = r7.toString()     // Catch: org.json.JSONException -> L8d
            com.getjar.sdk.logging.Logger.d(r5, r7)     // Catch: org.json.JSONException -> L8d
            java.lang.String r5 = "platform_item_id"
            java.lang.String r5 = r4.getString(r5)     // Catch: org.json.JSONException -> L8d
            boolean r5 = r5.equals(r9)     // Catch: org.json.JSONException -> L8d
            if (r5 == 0) goto L8a
            java.lang.String r5 = "order.price"
            java.lang.String r6 = "pricing_amount"
            java.lang.String r6 = r4.getString(r6)     // Catch: org.json.JSONException -> L8d
            r1.put(r5, r6)     // Catch: org.json.JSONException -> L8d
            java.lang.String r5 = "order.currency"
            java.lang.String r6 = "currency"
            java.lang.String r6 = r4.getString(r6)     // Catch: org.json.JSONException -> L8d
            r1.put(r5, r6)     // Catch: org.json.JSONException -> L8d
            java.lang.String r5 = "order.gold_value"
            java.lang.String r6 = "gold_amount"
            java.lang.String r6 = r4.getString(r6)     // Catch: org.json.JSONException -> L8d
            r1.put(r5, r6)     // Catch: org.json.JSONException -> L8d
        L89:
            return r1
        L8a:
            int r3 = r3 + 1
            goto L32
        L8d:
            r2 = move-exception
            com.getjar.sdk.logging.Area r5 = com.getjar.sdk.logging.Area.BUY_GOLD
            long r5 = r5.value()
            java.lang.String r7 = "GooglePurchaseReponse getResponseAsMap"
            com.getjar.sdk.logging.Logger.e(r5, r7, r2)
            goto L89
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.rewards.InAppPurchaseManager.getGoldBucketDetails(java.lang.String, android.content.Context):java.util.HashMap");
    }

    public void handleFailure(String platformItemId, InAppBillingFailure reason, Context context) {
        if (StringUtility.isNullOrEmpty(platformItemId)) {
            throw new IllegalArgumentException("platformItemId cannot be null");
        }
        if (reason == null) {
            throw new IllegalArgumentException("reason cannot be null");
        }
        if (context == null) {
            throw new IllegalArgumentException("context cannot be null");
        }
        Logger.e(Area.BUY_GOLD.value() | Area.UI.value(), "InAppPurchaseManager handleFailure Failed: " + reason.name());
        if (reason.equals(InAppBillingFailure.GETJAR_SERVICE_FAILURE) || reason.equals(InAppBillingFailure.NETWORK_ERROR)) {
            NotificationsUtility.pushFailNotification(this._commContext, Constants.NOTIFICATION_BILLING_FAILED_SDK);
        } else if (reason.equals(InAppBillingFailure.UNAUTHORIZED)) {
            NotificationsUtility.pushFailNotification(this._commContext, Constants.NOTIFICATION_BILLING_UNAUTHORIZED);
        }
        HashMap<String, String> map = getGoldBucketDetails(platformItemId, context);
        Intent intent = new Intent(Constants.ACTION_NOTIFY_BUY_GOLD);
        intent.putExtra(Constants.BILLING_FAILURE_REASON, reason.name());
        intent.putExtra(Constants.BUY_CURRENCY_GOLD_VALUE, map.get(Constants.BUY_CURRENCY_GOLD_VALUE));
        intent.putExtra(Constants.BUY_CURRENCY_PRICE, map.get(Constants.BUY_CURRENCY_PRICE));
        context.sendBroadcast(intent);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void storePurchaseResponse(GooglePurchaseResponse purchaseResponse) {
        if (purchaseResponse == null) {
            throw new IllegalArgumentException("purchaseReponse cannot be null");
        }
        try {
            this._cachingManager.updateCache(purchaseResponse.getOrderId(), Base64.encodeObject(purchaseResponse), 86400000L, null, null);
            this._cachingManager.trimLruEntries(500);
        } catch (IOException e) {
            Logger.e(Area.BUY_GOLD.value(), "InAppPurchaseManager storePurchaseResponse -- Problem serializing purchaseResponse", e);
        }
    }

    public void removePurchaseResponse(String orderId) {
        if (StringUtility.isNullOrEmpty(orderId)) {
            throw new IllegalArgumentException("orderId cannot be null");
        }
        this._cachingManager.removeCacheEntry(orderId);
    }

    public List<GooglePurchaseResponse> getAllPurchaseResponses() {
        ArrayList<GooglePurchaseResponse> responseItems = new ArrayList<>();
        try {
            ArrayList<CacheEntry> cacheEntries = this._cachingManager.getAllCacheEntries();
            Iterator i$ = cacheEntries.iterator();
            while (i$.hasNext()) {
                CacheEntry cacheEntry = i$.next();
                try {
                    responseItems.add((GooglePurchaseResponse) Base64.decodeToObject(cacheEntry.getValue()));
                } catch (IOException e) {
                    this._cachingManager.removeCacheEntry(cacheEntry.getName());
                    Logger.e(Area.BUY_GOLD.value(), "InAppPurchaseManager getAllPurchaseResponses", e);
                } catch (ClassNotFoundException e2) {
                    Logger.e(Area.BUY_GOLD.value(), "InAppPurchaseManager getAllPurchaseResponses", e2);
                }
            }
        } catch (URISyntaxException e3) {
            Logger.e(Area.BUY_GOLD.value(), "URI exception", e3);
        }
        return responseItems;
    }

    protected boolean ensureBoundToGooglePlaySvc() {
        Logger.i(Area.OFFER.value() | Area.TRANSACTION.value(), "Binding to google play");
        boolean result = true;
        synchronized (this._googlePlayBindLock) {
            if (!this.isGooglePlayConnected && (result = this._commContext.getApplicationContext().bindService(new Intent(_IABIntentFilter), this.googlePlayServiceConnection, 1))) {
                int i = 0;
                while (true) {
                    if (i >= 3) {
                        break;
                    }
                    try {
                        this._googlePlayBindLock.wait(1000L);
                    } catch (InterruptedException e) {
                        Logger.d(Area.OFFER.value() | Area.TRANSACTION.value(), "isApi3BillingSuported Interrupted", e);
                        result = false;
                    }
                    if (!this.isGooglePlayConnected) {
                        i++;
                    } else {
                        result = true;
                        break;
                    }
                }
            }
        }
        Logger.i(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Binding result to google play: %1$b", Boolean.valueOf(result)));
        return result;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void unBindFromGooglePlaySvc() {
        if (this.googlePlayServiceConnection != null) {
            Logger.i(Area.OFFER.value() | Area.TRANSACTION.value(), "Unbinding from google play");
            try {
                this._applicationContext.unbindService(this.googlePlayServiceConnection);
            } catch (Exception e) {
                Logger.w(Area.OFFER.value() | Area.TRANSACTION.value(), "Exception while unbinding...");
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public JSONArray getLocalizedPrices(String[] productIds) {
        if (productIds == null || productIds.length <= 0) {
            throw new IllegalArgumentException("'productIds' cannot be null or empty");
        }
        ensureBoundToGooglePlaySvc();
        HashMap<String, String> localizedPrices = new HashMap<>(productIds.length);
        if (this.googlePlayService != null) {
            ArrayList<String> productIdList = new ArrayList<>(productIds.length);
            for (String productId : productIds) {
                productIdList.add(productId);
            }
            Bundle querySkus = new Bundle();
            querySkus.putStringArrayList(IabHelper.GET_SKU_DETAILS_ITEM_LIST, productIdList);
            try {
                Bundle skuDetails = this.googlePlayService.getSkuDetails(3, this._commContext.getApplicationContext().getPackageName(), IabHelper.ITEM_TYPE_INAPP, querySkus);
                int response = skuDetails.getInt("RESPONSE_CODE");
                if (skuDetails.containsKey("RESPONSE_CODE") && response == 0) {
                    ArrayList<String> responseList = skuDetails.getStringArrayList(IabHelper.RESPONSE_GET_SKU_DETAILS_LIST);
                    Iterator i$ = responseList.iterator();
                    while (i$.hasNext()) {
                        String thisResponse = i$.next();
                        try {
                            JSONObject object = new JSONObject(thisResponse);
                            String sku = object.getString("productId");
                            String price = object.getString("price");
                            localizedPrices.put(sku, price);
                        } catch (Exception e) {
                            Logger.w(Area.OFFER.value() | Area.LOCALIZATION.value(), "Invalid JSON from Google Play", e);
                        }
                    }
                }
            } catch (RemoteException e1) {
                this.isGooglePlayConnected = false;
                Logger.e(Area.OFFER.value() | Area.LOCALIZATION.value(), "Error connecting to google play service", e1);
            }
        }
        return getJSONArrayFromPriceMap(localizedPrices);
    }

    public boolean isApi3BillingSupported() {
        boolean result = false;
        ensureBoundToGooglePlaySvc();
        if (this.googlePlayService != null) {
            try {
                int resultCode = this.googlePlayService.isBillingSupported(3, this._commContext.getApplicationContext().getPackageName(), IabHelper.ITEM_TYPE_INAPP);
                if (Constants.ResponseCode.valueOf(resultCode).equals(Constants.ResponseCode.RESULT_OK)) {
                    result = true;
                }
            } catch (RemoteException e) {
                this.isGooglePlayConnected = false;
                Logger.d(Area.OFFER.value() | Area.TRANSACTION.value(), "isApi3BillingSuported Remote Exception", e);
            }
        }
        SharedPreferences prefs = this._commContext.getApplicationContext().getSharedPreferences("GetJarClientPrefs", 0);
        SharedPreferences.Editor editor = prefs.edit();
        editor.putBoolean(Constants.BILLING_API3_SUPPORTED_PREFS, result);
        editor.commit();
        Logger.i(Area.OFFER.value(), String.format(Locale.US, "InAppPurchaseManager isApi3BillingSupported returning %1$b", Boolean.valueOf(result)));
        return result;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PendingIntent requestPurchaseIntent(String marketplaceItemId, String clientTransactionId, GetJarWebViewSubActivity activity) {
        if (StringUtility.isNullOrEmpty(marketplaceItemId)) {
            throw new IllegalArgumentException("'marketplaceItemId' cannot be null or empty");
        }
        if (StringUtility.isNullOrEmpty(clientTransactionId)) {
            throw new IllegalArgumentException("'clientTransactionId' cannot be null or empty");
        }
        if (activity == null) {
            throw new IllegalStateException("Please set the activityContext first using setActivityContext");
        }
        if (this.googlePlayService != null && activity._isForeground) {
            try {
                String applicationKey = ApplicationKeyDatabase.getInstance(this._commContext.getApplicationContext()).getApplicationKey();
                AuthManager.initialize(this._commContext.getApplicationContext());
                String deviceId = AuthManager.getInstance().getUserDeviceId();
                Bundle buyIntentBundle = this.googlePlayService.getBuyIntent(3, activity.getParentActivity().getApplicationContext().getPackageName(), marketplaceItemId, IabHelper.ITEM_TYPE_INAPP, String.format(Locale.US, "%1$s,%2$s,%3$s", clientTransactionId, applicationKey, deviceId));
                return (PendingIntent) buyIntentBundle.getParcelable(IabHelper.RESPONSE_BUY_INTENT);
            } catch (RemoteException e) {
                this.isGooglePlayConnected = false;
                Logger.w(Area.TRANSACTION.value() | Area.OFFER.value(), "Purchase failed", e);
            }
        } else {
            new TransactionManager(this._commContext.getApplicationContext()).cancelManagedOfferTransaction(clientTransactionId, this._commContext);
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public ManagedOfferStatus reserveManagedOffer(String clientTransactionId, String offerId, HashMap<String, String> purchaseMetadata, HashMap<String, String> trackingMetadata, GetJarSubActivityBase activity) {
        if (StringUtility.isNullOrEmpty(clientTransactionId)) {
            throw new IllegalArgumentException("'clientTransactionId' cannot be null or empty");
        }
        if (StringUtility.isNullOrEmpty(offerId)) {
            throw new IllegalArgumentException("'offerId' cannot be null or empty");
        }
        if (purchaseMetadata == null || purchaseMetadata.isEmpty()) {
            throw new IllegalArgumentException("'purchaseMetadata' cannot be null");
        }
        if (trackingMetadata == null || trackingMetadata.isEmpty()) {
            throw new IllegalArgumentException("'trackingMetadata' cannot be null");
        }
        if (activity == null) {
            throw new IllegalArgumentException("'activity' cannot be null");
        }
        ManagedOfferStatus result = ManagedOfferStatus.SUCCESS;
        Future<Operation> futureOperation = new TransactionManager(this._commContext.getApplicationContext()).startManagedOfferTransaction(this._commContext, clientTransactionId, offerId, purchaseMetadata, trackingMetadata);
        try {
            if (futureOperation != null) {
                Operation operation = futureOperation.get();
                if (operation != null) {
                    Result operationResult = operation.mo38get();
                    if (operationResult == null) {
                        result = ManagedOfferStatus.SERVER_ERROR;
                    } else if (!operationResult.isSuccessfulResponse()) {
                        try {
                            result = ManagedOfferStatus.valueOf(operationResult.getErrorResponseSubcode());
                        } catch (Exception e) {
                            result = ManagedOfferStatus.SERVER_ERROR;
                        }
                    }
                } else {
                    result = ManagedOfferStatus.SDK_INTERNAL_ERROR;
                }
            } else {
                result = ManagedOfferStatus.NOT_AUTHORIZED;
            }
            return result;
        } catch (InterruptedException e2) {
            Logger.w(Area.OFFER.value() | Area.TRANSACTION.value(), "Interrupted exception occured", e2);
            ManagedOfferStatus result2 = ManagedOfferStatus.SDK_INTERNAL_ERROR;
            return result2;
        } catch (ExecutionException e3) {
            Logger.w(Area.OFFER.value() | Area.TRANSACTION.value(), "Execution exception occured", e3);
            ManagedOfferStatus result3 = ManagedOfferStatus.SDK_INTERNAL_ERROR;
            return result3;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void managedOfferGooglePlayResponse(int requestCode, int resultCode, Intent data) {
        Logger.d(Area.OFFER.value() | Area.TRANSACTION.value(), "Got callback from google");
        if (data == null) {
            throw new IllegalArgumentException("'data' cannot be null");
        }
        if (resultCode == -1 && data.getIntExtra("RESPONSE_CODE", -1) == 0) {
            String purchaseData = data.getStringExtra(IabHelper.RESPONSE_INAPP_PURCHASE_DATA);
            String dataSignature = data.getStringExtra(IabHelper.RESPONSE_INAPP_SIGNATURE);
            try {
                if (!StringUtility.isNullOrEmpty(purchaseData)) {
                    String developerPayload = new JSONObject(purchaseData).getString("developerPayload");
                    if (!StringUtility.isNullOrEmpty(developerPayload) && developerPayload.split(",").length == 3) {
                        String clientTransactionId = developerPayload.split(",")[0];
                        if (!StringUtility.isNullOrEmpty(clientTransactionId)) {
                            ManagedOfferBucket transaction = (ManagedOfferBucket) DBTransactions.getInstance(this._commContext.getApplicationContext()).loadTransaction(clientTransactionId);
                            RelatedManagedOfferData relatedData = transaction.mo46getRelatedObject();
                            relatedData.addGooglePlayTransactionData(purchaseData, dataSignature);
                            DBTransactions.getInstance(this._commContext.getApplicationContext()).updateManagedOfferTransaction(clientTransactionId, relatedData);
                            TransactionManager.updateOfferTransactionState(this._commContext, transaction, DBTransactions.ManagedOfferState.PURCHASED);
                        }
                    }
                } else {
                    Thread.sleep(1000L);
                    if (!processOutstandingPurchases(true)) {
                        TransactionManager.updateOfferTransactionState(this._commContext, (ManagedOfferBucket) DBTransactions.getInstance(this._commContext.getApplicationContext()).loadTransaction(getCurrentClientTransactionId()), DBTransactions.ManagedOfferState.CANCELING);
                        GetJarWebViewSubActivity.updateUIwithOfferResults(this._commContext.getApplicationContext(), ManagedOfferStatus.GOOGLE_FAILURE_AFTER_PURCHASE, new JSONObject());
                    }
                }
                return;
            } catch (Exception e) {
                Logger.e(Area.OFFER.value() | Area.TRANSACTION.value(), "InAppPurchaseManager managedOfferGooglePlayResponse: Google Play Error", e);
                GetJarWebViewSubActivity.updateUIwithOfferResults(this._commContext.getApplicationContext(), ManagedOfferStatus.GOOGLE_FAILURE_AFTER_PURCHASE, new JSONObject());
                return;
            } finally {
                new TransactionManager(this._commContext.getApplicationContext()).runEarnAndManagedOfferTransactions(this._commContext);
            }
        }
        GetJarWebViewSubActivity.updateUIwithOfferResults(this._commContext.getApplicationContext(), ManagedOfferStatus.GOOGLE_RELATED_FAILURE, new JSONObject());
        String clientTransactionId2 = getCurrentClientTransactionId();
        if (!StringUtility.isNullOrEmpty(clientTransactionId2)) {
            new TransactionManager(this._commContext.getApplicationContext()).cancelManagedOfferTransaction(clientTransactionId2, this._commContext);
        } else {
            Logger.e(Area.OFFER.value() | Area.TRANSACTION.value(), "InAppPurchaseManager managedOfferGooglePlayResponse: Unable to Cancel. Could not find current transaction ID.");
        }
    }

    public void cancelOrphanedManagedOffers() {
        String continuationToken;
        Logger.v(Area.OFFER.value() | Area.TRANSACTION.value(), "InAppPurchaseManager cancelOrphanedManagedOffers started");
        ensureBoundToGooglePlaySvc();
        String currentClientTransactionId = getCurrentClientTransactionId();
        if (isGooglePlayConnected()) {
            Logger.v(Area.OFFER.value() | Area.TRANSACTION.value(), "InAppPurchaseManager cancelOrphanedManagedOffers connectedToGooglePlay");
            HashSet<String> googlePendingClientTransactionIds = new HashSet<>();
            do {
                try {
                    Bundle ownedItems = this.googlePlayService.getPurchases(3, this._commContext.getApplicationContext().getPackageName(), IabHelper.ITEM_TYPE_INAPP, null);
                    int response = ownedItems.getInt("RESPONSE_CODE");
                    if (ownedItems.containsKey("RESPONSE_CODE") && Constants.ResponseCode.valueOf(response).equals(Constants.ResponseCode.RESULT_OK)) {
                        ArrayList<String> purchaseDataList = ownedItems.getStringArrayList(IabHelper.RESPONSE_INAPP_PURCHASE_DATA_LIST);
                        Logger.v(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "InAppPurchaseManager cancelOrphanedManagedOffers Got %1$d items", Integer.valueOf(purchaseDataList.size())));
                        continuationToken = ownedItems.getString(IabHelper.INAPP_CONTINUATION_TOKEN);
                        for (int i = 0; i < purchaseDataList.size(); i++) {
                            String purchaseData = purchaseDataList.get(i);
                            if (!StringUtility.isNullOrEmpty(purchaseData)) {
                                String developerPayload = new JSONObject(purchaseData).getString("developerPayload");
                                googlePendingClientTransactionIds.add(developerPayload.split(",")[0]);
                            }
                        }
                    } else {
                        return;
                    }
                } catch (RemoteException e) {
                    this.isGooglePlayConnected = false;
                    Logger.w(Area.OFFER.value() | Area.TRANSACTION.value(), "Error canceling orphaned managed offers", e);
                    return;
                } catch (JSONException e2) {
                    Logger.w(Area.OFFER.value() | Area.TRANSACTION.value(), "Error canceling orphaned managed offers", e2);
                    return;
                }
            } while (continuationToken != null);
            List<TransactionBucket> transactions = DBTransactions.getInstance(this._commContext.getApplicationContext()).loadAllTransactions();
            for (TransactionBucket transaction : transactions) {
                if (transaction.getType().equals(DBTransactions.TransactionType.MANAGED_OFFER) && !transaction.getClientTransactionId().equals(currentClientTransactionId)) {
                    ManagedOfferBucket managedOfferBucket = (ManagedOfferBucket) transaction;
                    if (!googlePendingClientTransactionIds.contains(transaction.getClientTransactionId())) {
                        if (managedOfferBucket.getState().equals(DBTransactions.ManagedOfferState.CREATED) || managedOfferBucket.getState().equals(DBTransactions.ManagedOfferState.RESERVING) || managedOfferBucket.getState().equals(DBTransactions.ManagedOfferState.RESERVED) || managedOfferBucket.getState().equals(DBTransactions.ManagedOfferState.PURCHASING)) {
                            TransactionManager.updateOfferTransactionState(this._commContext, managedOfferBucket, DBTransactions.ManagedOfferState.CANCELING);
                            Logger.v(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "InAppPurchaseManager cancelOrphanedManagedOffers CANCELING [clientTransactionId: %1$s]", transaction.getClientTransactionId()));
                        } else {
                            TransactionManager.updateOfferTransactionState(this._commContext, managedOfferBucket, DBTransactions.ManagedOfferState.DONE);
                            Logger.v(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "InAppPurchaseManager cancelOrphanedManagedOffers DONE [clientTransactionId: %1$s]", transaction.getClientTransactionId()));
                        }
                    } else {
                        Logger.v(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "InAppPurchaseManager cancelOrphanedManagedOffers skipped [clientTransactionId: %1$s]", transaction.getClientTransactionId()));
                    }
                }
            }
        }
    }

    public boolean processOutstandingPurchases(boolean currentOnly) {
        ensureBoundToGooglePlaySvc();
        try {
            if (this.googlePlayService != null) {
                try {
                    synchronized (this._processOutstandingPurchasesLock) {
                        String continuationToken = null;
                        do {
                            Bundle ownedItems = this.googlePlayService.getPurchases(3, this._commContext.getApplicationContext().getPackageName(), IabHelper.ITEM_TYPE_INAPP, null);
                            new Thread(new Runnable() { // from class: com.getjar.sdk.rewards.InAppPurchaseManager.2
                                @Override // java.lang.Runnable
                                public void run() {
                                    InAppPurchaseManager.this.isApi3BillingSupported();
                                }
                            }).start();
                            int response = ownedItems.getInt("RESPONSE_CODE");
                            if (ownedItems.containsKey("RESPONSE_CODE") && Constants.ResponseCode.valueOf(response).equals(Constants.ResponseCode.RESULT_OK)) {
                                ArrayList<String> purchaseDataList = ownedItems.getStringArrayList(IabHelper.RESPONSE_INAPP_PURCHASE_DATA_LIST);
                                ArrayList<String> signatureList = ownedItems.getStringArrayList(IabHelper.RESPONSE_INAPP_SIGNATURE_LIST);
                                continuationToken = ownedItems.getString(IabHelper.INAPP_CONTINUATION_TOKEN);
                                Logger.d(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Got %s items", Integer.valueOf(purchaseDataList.size())));
                                if (purchaseDataList != null) {
                                    for (int i = 0; i < purchaseDataList.size(); i++) {
                                        String purchaseData = purchaseDataList.get(i);
                                        String signature = signatureList.get(i);
                                        try {
                                            JSONObject purchaseJson = new JSONObject(purchaseData);
                                            String developerPayload = purchaseJson.getString("developerPayload");
                                            if (!StringUtility.isNullOrEmpty(developerPayload) && developerPayload.split(",").length == 3) {
                                                String clientTransactionId = developerPayload.split(",")[0];
                                                TransactionBucket transaction = DBTransactions.getInstance(this._commContext.getApplicationContext()).loadTransaction(clientTransactionId);
                                                if (transaction == null) {
                                                    long purchaseTime = purchaseJson.getLong("purchaseTime");
                                                    String deviceId = AuthManager.getInstance().getUserDeviceId();
                                                    if (deviceId.equals(developerPayload.split(",")[2]) || System.currentTimeMillis() - purchaseTime > 86400000) {
                                                        HashMap<String, String> purchaseMetadata = new HashMap<>();
                                                        purchaseMetadata.put(Constants.MARKETPLACE_PRODUCT_ID, purchaseJson.getString("productId"));
                                                        purchaseMetadata.put(Constants.GOOGLE_PLAY_SIGNED_DATA, purchaseData);
                                                        purchaseMetadata.put(Constants.GOOGLE_PLAY_SIGNATURE, signature);
                                                        DBTransactions.getInstance(this._commContext.getApplicationContext()).insertManagedOfferTransaction(clientTransactionId, new RelatedManagedOfferData(purchaseMetadata), DBTransactions.ManagedOfferState.PURCHASED);
                                                    }
                                                } else {
                                                    RelatedManagedOfferData relatedData = ((ManagedOfferBucket) transaction).mo46getRelatedObject();
                                                    relatedData.addGooglePlayTransactionData(purchaseData, signature);
                                                    DBTransactions.getInstance(this._commContext.getApplicationContext()).updateManagedOfferTransaction(clientTransactionId, relatedData);
                                                    TransactionManager.updateOfferTransactionState(this._commContext, (ManagedOfferBucket) transaction, DBTransactions.ManagedOfferState.PURCHASED);
                                                }
                                            } else {
                                                HashMap<String, String> purchaseMetadata2 = new HashMap<>();
                                                purchaseMetadata2.put(Constants.GOOGLE_PLAY_SIGNED_DATA, purchaseData);
                                                DBTransactions.getInstance(this._commContext.getApplicationContext()).insertManagedOfferTransaction(UUID.randomUUID().toString(), new RelatedManagedOfferData(purchaseMetadata2), DBTransactions.ManagedOfferState.CONSUMING);
                                            }
                                        } catch (IOException e) {
                                            Logger.w(Area.OFFER.value() | Area.TRANSACTION.value(), "IOException occured", e);
                                        } catch (ClassNotFoundException e2) {
                                            Logger.e(Area.OFFER.value() | Area.TRANSACTION.value(), "Invalid class cast", e2);
                                        } catch (JSONException e3) {
                                            Logger.w(Area.OFFER.value() | Area.TRANSACTION.value(), "Invalid json", e3);
                                        }
                                    }
                                    continue;
                                } else {
                                    continue;
                                }
                            }
                        } while (continuationToken != null);
                    }
                    String currentClientTransactionId = getCurrentClientTransactionId();
                    if (currentOnly) {
                        if (StringUtility.isNullOrEmpty(currentClientTransactionId)) {
                            return false;
                        }
                        Future<DBTransactions.ManagedOfferState> futureState = new TransactionManager(this._commContext.getApplicationContext()).runManagedOfferTransaction(currentClientTransactionId, this._commContext);
                        try {
                            if (futureState.get() != null) {
                                boolean currentTransactionSucceeded = DBTransactions.ManagedOfferState.DONE.equals(futureState.get());
                                return currentTransactionSucceeded;
                            }
                            return false;
                        } catch (Exception e4) {
                            Logger.w(Area.OFFER.value() | Area.TRANSACTION.value(), "Error getting current transaction state", e4);
                            return false;
                        }
                    }
                    List<TransactionBucket> processedTransactions = new TransactionManager(this._commContext.getApplicationContext()).runEarnAndManagedOfferTransactions(this._commContext);
                    if (StringUtility.isNullOrEmpty(currentClientTransactionId)) {
                        return false;
                    }
                    for (TransactionBucket transaction2 : processedTransactions) {
                        if (transaction2.getClientTransactionId().equals(currentClientTransactionId)) {
                            boolean currentTransactionSucceeded2 = ((ManagedOfferBucket) transaction2).getState().equals(DBTransactions.ManagedOfferState.DONE);
                            return currentTransactionSucceeded2;
                        }
                    }
                    return false;
                } catch (RemoteException e5) {
                    this.isGooglePlayConnected = false;
                    Logger.w(Area.OFFER.value() | Area.TRANSACTION.value(), "Error processing outstanding purchases", e5);
                    String currentClientTransactionId2 = getCurrentClientTransactionId();
                    if (currentOnly) {
                        if (StringUtility.isNullOrEmpty(currentClientTransactionId2)) {
                            return false;
                        }
                        Future<DBTransactions.ManagedOfferState> futureState2 = new TransactionManager(this._commContext.getApplicationContext()).runManagedOfferTransaction(currentClientTransactionId2, this._commContext);
                        try {
                            if (futureState2.get() != null) {
                                boolean currentTransactionSucceeded3 = DBTransactions.ManagedOfferState.DONE.equals(futureState2.get());
                                return currentTransactionSucceeded3;
                            }
                            return false;
                        } catch (Exception e6) {
                            Logger.w(Area.OFFER.value() | Area.TRANSACTION.value(), "Error getting current transaction state", e6);
                            return false;
                        }
                    }
                    List<TransactionBucket> processedTransactions2 = new TransactionManager(this._commContext.getApplicationContext()).runEarnAndManagedOfferTransactions(this._commContext);
                    if (StringUtility.isNullOrEmpty(currentClientTransactionId2)) {
                        return false;
                    }
                    for (TransactionBucket transaction3 : processedTransactions2) {
                        if (transaction3.getClientTransactionId().equals(currentClientTransactionId2)) {
                            boolean currentTransactionSucceeded4 = ((ManagedOfferBucket) transaction3).getState().equals(DBTransactions.ManagedOfferState.DONE);
                            return currentTransactionSucceeded4;
                        }
                    }
                    return false;
                }
            }
            Logger.w(Area.OFFER.value() | Area.TRANSACTION.value(), "Error processing outstanding purchases");
            return false;
        } catch (Throwable th) {
            String currentClientTransactionId3 = getCurrentClientTransactionId();
            if (currentOnly) {
                if (!StringUtility.isNullOrEmpty(currentClientTransactionId3)) {
                    Future<DBTransactions.ManagedOfferState> futureState3 = new TransactionManager(this._commContext.getApplicationContext()).runManagedOfferTransaction(currentClientTransactionId3, this._commContext);
                    try {
                        if (futureState3.get() != null) {
                            DBTransactions.ManagedOfferState.DONE.equals(futureState3.get());
                        }
                    } catch (Exception e7) {
                        Logger.w(Area.OFFER.value() | Area.TRANSACTION.value(), "Error getting current transaction state", e7);
                    }
                }
            } else {
                List<TransactionBucket> processedTransactions3 = new TransactionManager(this._commContext.getApplicationContext()).runEarnAndManagedOfferTransactions(this._commContext);
                if (!StringUtility.isNullOrEmpty(currentClientTransactionId3)) {
                    Iterator i$ = processedTransactions3.iterator();
                    while (true) {
                        if (!i$.hasNext()) {
                            break;
                        }
                        TransactionBucket transaction4 = i$.next();
                        if (transaction4.getClientTransactionId().equals(currentClientTransactionId3)) {
                            ((ManagedOfferBucket) transaction4).getState().equals(DBTransactions.ManagedOfferState.DONE);
                            break;
                        }
                    }
                }
            }
            throw th;
        }
    }

    public boolean consumeManagedOffer(ManagedOfferBucket transaction, boolean isCancelling) {
        if (transaction == null) {
            throw new IllegalArgumentException("'transaction' cannot be null");
        }
        ensureBoundToGooglePlaySvc();
        String currentClientTransactionId = getCurrentClientTransactionId();
        boolean result = false;
        try {
            try {
                String purchaseData = transaction.mo46getRelatedObject().getPurchaseMetadata().get(Constants.GOOGLE_PLAY_SIGNED_DATA);
                Logger.v(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Consuming product: %1$s", purchaseData));
                if (!StringUtility.isNullOrEmpty(purchaseData)) {
                    JSONObject obj = new JSONObject(purchaseData);
                    String purchaseToken = obj.getString("purchaseToken");
                    if (this.isGooglePlayConnected) {
                        Constants.ResponseCode response = Constants.ResponseCode.valueOf(this.googlePlayService.consumePurchase(3, this._commContext.getApplicationContext().getPackageName(), purchaseToken));
                        if (response.equals(Constants.ResponseCode.RESULT_OK)) {
                            if (!isCancelling) {
                                TransactionManager.updateOfferTransactionState(this._commContext, transaction, DBTransactions.ManagedOfferState.CONSUMED);
                                TransactionManager.updateOfferTransactionState(this._commContext, transaction, DBTransactions.ManagedOfferState.DONE);
                            }
                            result = true;
                        } else if (!response.equals(Constants.ResponseCode.RESULT_ERROR)) {
                            TransactionManager.updateOfferTransactionState(this._commContext, transaction, DBTransactions.ManagedOfferState.DONE);
                            result = true;
                            Logger.w(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Unable to consume [marketplaceItemId:%1$s] [reason:%2$s]", transaction.mo46getRelatedObject().getOfferToken(), response));
                        }
                    }
                } else {
                    Logger.w(Area.OFFER.value() | Area.TRANSACTION.value(), "Unable to consume as no purchase data found!");
                }
                return result;
            } catch (Exception e) {
                throw new GetJarException(e);
            }
        } finally {
            if (transaction.getClientTransactionId().equals(currentClientTransactionId)) {
                removeLastClientTransactionId();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setCurrentClientTransactionId(String clientTransactionId) {
        if (StringUtility.isNullOrEmpty(clientTransactionId)) {
            throw new IllegalArgumentException("clientTransactionId cannot be null or empty");
        }
        this._currentClientTransactionId = clientTransactionId;
    }

    public void removeLastClientTransactionId() {
        this._currentClientTransactionId = null;
    }

    public String getCurrentClientTransactionId() {
        return this._currentClientTransactionId;
    }

    private JSONArray getJSONArrayFromPriceMap(HashMap<String, String> prices) {
        if (prices == null) {
            throw new IllegalArgumentException("'prices' cannot be null");
        }
        JSONArray localizedPrices = new JSONArray();
        for (Map.Entry<String, String> entry : prices.entrySet()) {
            try {
                JSONObject obj = new JSONObject();
                obj.put(Constants.MARKETPLACE, "marketplace.google_play");
                obj.put(Constants.MARKETPLACE_PRODUCT_ID, entry.getKey());
                obj.put(Constants.MARKETPLACE_DISPLAY_AMOUNT, entry.getValue());
                localizedPrices.put(obj);
            } catch (JSONException e) {
                Logger.e(Area.OFFER.value() | Area.LOCALIZATION.value(), "Invalid JSON", e);
            }
        }
        return localizedPrices;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class GooglePlayServiceConnection implements ServiceConnection {
        private GooglePlayServiceConnection() {
        }

        @Override // android.content.ServiceConnection
        public void onServiceDisconnected(ComponentName name) {
            InAppPurchaseManager.this.isGooglePlayConnected = false;
        }

        @Override // android.content.ServiceConnection
        public void onServiceConnected(ComponentName name, IBinder service) {
            synchronized (InAppPurchaseManager.this._googlePlayBindLock) {
                InAppPurchaseManager.this.googlePlayService = IInAppBillingService.Stub.asInterface(service);
                InAppPurchaseManager.this.isGooglePlayConnected = true;
                InAppPurchaseManager.this._googlePlayBindLock.notifyAll();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean isGooglePlayConnected() {
        return this.isGooglePlayConnected;
    }
}
