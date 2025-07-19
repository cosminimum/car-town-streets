package com.getjar.sdk.rewards;

import android.app.Activity;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
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
import java.net.URI;
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
    /* access modifiers changed from: private */
    public final Object _googlePlayBindLock;
    private boolean _isBillingSupported;
    private final Object _processOutstandingPurchasesLock;
    /* access modifiers changed from: private */
    public volatile IInAppBillingService googlePlayService;
    private GooglePlayServiceConnection googlePlayServiceConnection;
    /* access modifiers changed from: private */
    public volatile boolean isGooglePlayConnected;

    public enum InAppBillingFailure {
        CANCELLED,
        ITEM_NOT_AVAILABLE,
        GOOGLE_PLAY_BIND_FAILURE,
        GETJAR_SERVICE_FAILURE,
        UNAUTHORIZED,
        BILLING_NOT_SUPPORTED,
        NETWORK_ERROR
    }

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
        CommContext commContext = CommManager.createContext(applicationKey, context, (ResultReceiver) new ResultReceiver((Handler) null) {
            /* access modifiers changed from: protected */
            public void onReceiveResult(int resultCode, Bundle resultData) {
                for (String key : resultData.keySet()) {
                    Logger.m640d(Area.OS_ENTRY_POINT.value() | Area.BUY_GOLD.value() | Area.AUTH.value() | Area.COMM.value(), String.format(Locale.US, "InAppPurchaseManager: Callback from the GetJar SDK [%1$s]", new Object[]{resultData.get(key).getClass().getName()}));
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

    protected static InAppPurchaseManager getBasicInstance(Context applicationContext) {
        return new InAppPurchaseManager(applicationContext);
    }

    public CommContext getCommContext() {
        return this._commContext;
    }

    public void buyGoldOffer(String platformItemId, HashMap<String, String> trackingMetadataMap, Activity activity) {
        if (StringUtility.isNullOrEmpty(platformItemId)) {
            throw new IllegalArgumentException("platformItemId cannot be null or empty");
        } else if (trackingMetadataMap == null) {
            throw new IllegalArgumentException("trackingMetadataMap cannot be null or empty");
        } else if (activity == null) {
            throw new IllegalArgumentException("activity cannot be null");
        } else {
            if (!this._isBillingSupported) {
                this._isBillingSupported = this._commContext.getApplicationContext().getSharedPreferences("GetJarClientPrefs", 0).getBoolean(Constants.BILLING_SUPPORTED_PREFS, false);
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
    }

    public String getGoldOffers() {
        this._isBillingSupported = this._commContext.getApplicationContext().getSharedPreferences("GetJarClientPrefs", 0).getBoolean(Constants.BILLING_SUPPORTED_PREFS, false);
        this._billingService = new GetJarService();
        this._billingService.setContext(this._commContext.getApplicationContext());
        Logger.m640d(Area.BUY_GOLD.value(), "InAppPurchaseManager getGoldOffers -- billingCheckRequestSuccess " + this._billingService.checkBillingSupported());
        try {
            Result result = LocalizationServiceProxy.getInstance().getGoldOffers(this._commContext).get();
            if (result != null && result.isSuccessfulResponse()) {
                return result.getResponseJson().getString("return");
            }
        } catch (InterruptedException e) {
            Logger.m643e(Area.BUY_GOLD.value(), "InAppPurchaseManager getGoldOffers", e);
        } catch (ExecutionException e2) {
            Logger.m643e(Area.BUY_GOLD.value(), "InAppPurchaseManager getGoldOffers", e2);
        } catch (JSONException e3) {
            Logger.m643e(Area.BUY_GOLD.value(), "InAppPurchaseManager getGoldOffers", e3);
        }
        try {
            return new JSONObject().put("results", new JSONArray()).toString();
        } catch (JSONException e4) {
            Logger.m643e(Area.BUY_GOLD.value(), "InAppPurchaseManager getGoldOffers", e4);
            return "{\"results\":[]}";
        }
    }

    public static HashMap<String, String> getGoldBucketDetails(String platformItemId, Context context) {
        if (StringUtility.isNullOrEmpty(platformItemId)) {
            throw new IllegalArgumentException("'platformItemId' cannot be null or empty");
        } else if (context == null) {
            throw new IllegalArgumentException("'context' cannot be null");
        } else {
            HashMap<String, String> detailsMap = new HashMap<>(3);
            try {
                JSONArray arr = new JSONObject(getInstance(context).getGoldOffers()).getJSONArray("results");
                int i = 0;
                while (true) {
                    if (i >= arr.length()) {
                        break;
                    }
                    JSONObject obj = arr.getJSONObject(i);
                    Logger.m640d(Area.BUY_GOLD.value(), "GooglePurchaseResponse getResponseAsMap " + obj.toString());
                    if (obj.getString("platform_item_id").equals(platformItemId)) {
                        detailsMap.put(Constants.BUY_CURRENCY_PRICE, obj.getString("pricing_amount"));
                        detailsMap.put(Constants.BUY_CURRENCY_CURRENCY, obj.getString("currency"));
                        detailsMap.put(Constants.BUY_CURRENCY_GOLD_VALUE, obj.getString("gold_amount"));
                        break;
                    }
                    i++;
                }
            } catch (JSONException e) {
                Logger.m643e(Area.BUY_GOLD.value(), "GooglePurchaseReponse getResponseAsMap", e);
            }
            return detailsMap;
        }
    }

    public void handleFailure(String platformItemId, InAppBillingFailure reason, Context context) {
        if (StringUtility.isNullOrEmpty(platformItemId)) {
            throw new IllegalArgumentException("platformItemId cannot be null");
        } else if (reason == null) {
            throw new IllegalArgumentException("reason cannot be null");
        } else if (context == null) {
            throw new IllegalArgumentException("context cannot be null");
        } else {
            Logger.m642e(Area.BUY_GOLD.value() | Area.UI.value(), "InAppPurchaseManager handleFailure Failed: " + reason.name());
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
    }

    /* access modifiers changed from: package-private */
    public void storePurchaseResponse(GooglePurchaseResponse purchaseResponse) {
        if (purchaseResponse == null) {
            throw new IllegalArgumentException("purchaseReponse cannot be null");
        }
        try {
            this._cachingManager.updateCache(purchaseResponse.getOrderId(), Base64.encodeObject(purchaseResponse), 86400000L, (String) null, (URI) null);
            this._cachingManager.trimLruEntries(500);
        } catch (IOException e) {
            Logger.m643e(Area.BUY_GOLD.value(), "InAppPurchaseManager storePurchaseResponse -- Problem serializing purchaseResponse", e);
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
            Iterator i$ = this._cachingManager.getAllCacheEntries().iterator();
            while (i$.hasNext()) {
                CacheEntry cacheEntry = i$.next();
                try {
                    responseItems.add((GooglePurchaseResponse) Base64.decodeToObject(cacheEntry.getValue()));
                } catch (IOException e) {
                    this._cachingManager.removeCacheEntry(cacheEntry.getName());
                    Logger.m643e(Area.BUY_GOLD.value(), "InAppPurchaseManager getAllPurchaseResponses", e);
                } catch (ClassNotFoundException e2) {
                    Logger.m643e(Area.BUY_GOLD.value(), "InAppPurchaseManager getAllPurchaseResponses", e2);
                }
            }
        } catch (URISyntaxException e3) {
            Logger.m643e(Area.BUY_GOLD.value(), "URI exception", e3);
        }
        return responseItems;
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Code restructure failed: missing block: B:5:0x001b, code lost:
        r2 = r11._commContext.getApplicationContext().bindService(new android.content.Intent(_IABIntentFilter), r11.googlePlayServiceConnection, 1);
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean ensureBoundToGooglePlaySvc() {
        /*
            r11 = this;
            r10 = 1
            com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.OFFER
            long r4 = r4.value()
            com.getjar.sdk.logging.Area r6 = com.getjar.sdk.logging.Area.TRANSACTION
            long r6 = r6.value()
            long r4 = r4 | r6
            java.lang.String r6 = "Binding to google play"
            com.getjar.sdk.logging.Logger.m644i(r4, r6)
            r2 = 1
            java.lang.Object r5 = r11._googlePlayBindLock
            monitor-enter(r5)
            boolean r4 = r11.isGooglePlayConnected     // Catch:{ all -> 0x007b }
            if (r4 != 0) goto L_0x0041
            com.getjar.sdk.comm.CommContext r4 = r11._commContext     // Catch:{ all -> 0x007b }
            android.content.Context r4 = r4.getApplicationContext()     // Catch:{ all -> 0x007b }
            android.content.Intent r6 = new android.content.Intent     // Catch:{ all -> 0x007b }
            java.lang.String r7 = "com.android.vending.billing.InAppBillingService.BIND"
            r6.<init>(r7)     // Catch:{ all -> 0x007b }
            com.getjar.sdk.rewards.InAppPurchaseManager$GooglePlayServiceConnection r7 = r11.googlePlayServiceConnection     // Catch:{ all -> 0x007b }
            r8 = 1
            boolean r2 = r4.bindService(r6, r7, r8)     // Catch:{ all -> 0x007b }
            if (r2 == 0) goto L_0x0041
            r3 = 3
            r1 = 0
        L_0x0033:
            if (r1 >= r3) goto L_0x0041
            java.lang.Object r4 = r11._googlePlayBindLock     // Catch:{ InterruptedException -> 0x0064 }
            r6 = 1000(0x3e8, double:4.94E-321)
            r4.wait(r6)     // Catch:{ InterruptedException -> 0x0064 }
            boolean r4 = r11.isGooglePlayConnected     // Catch:{ InterruptedException -> 0x0064 }
            if (r4 == 0) goto L_0x0078
            r2 = 1
        L_0x0041:
            monitor-exit(r5)     // Catch:{ all -> 0x007b }
            com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.OFFER
            long r4 = r4.value()
            com.getjar.sdk.logging.Area r6 = com.getjar.sdk.logging.Area.TRANSACTION
            long r6 = r6.value()
            long r4 = r4 | r6
            java.util.Locale r6 = java.util.Locale.US
            java.lang.String r7 = "Binding result to google play: %1$b"
            java.lang.Object[] r8 = new java.lang.Object[r10]
            r9 = 0
            java.lang.Boolean r10 = java.lang.Boolean.valueOf(r2)
            r8[r9] = r10
            java.lang.String r6 = java.lang.String.format(r6, r7, r8)
            com.getjar.sdk.logging.Logger.m644i(r4, r6)
            return r2
        L_0x0064:
            r0 = move-exception
            com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.OFFER     // Catch:{ all -> 0x007b }
            long r6 = r4.value()     // Catch:{ all -> 0x007b }
            com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ all -> 0x007b }
            long r8 = r4.value()     // Catch:{ all -> 0x007b }
            long r6 = r6 | r8
            java.lang.String r4 = "isApi3BillingSuported Interrupted"
            com.getjar.sdk.logging.Logger.m641d(r6, r4, r0)     // Catch:{ all -> 0x007b }
            r2 = 0
        L_0x0078:
            int r1 = r1 + 1
            goto L_0x0033
        L_0x007b:
            r4 = move-exception
            monitor-exit(r5)     // Catch:{ all -> 0x007b }
            throw r4
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.rewards.InAppPurchaseManager.ensureBoundToGooglePlaySvc():boolean");
    }

    /* access modifiers changed from: protected */
    public void unBindFromGooglePlaySvc() {
        if (this.googlePlayServiceConnection != null) {
            Logger.m644i(Area.OFFER.value() | Area.TRANSACTION.value(), "Unbinding from google play");
            try {
                this._applicationContext.unbindService(this.googlePlayServiceConnection);
            } catch (Exception e) {
                Logger.m648w(Area.OFFER.value() | Area.TRANSACTION.value(), "Exception while unbinding...");
            }
        }
    }

    /* access modifiers changed from: protected */
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
                    Iterator i$ = skuDetails.getStringArrayList(IabHelper.RESPONSE_GET_SKU_DETAILS_LIST).iterator();
                    while (i$.hasNext()) {
                        try {
                            JSONObject object = new JSONObject(i$.next());
                            localizedPrices.put(object.getString("productId"), object.getString("price"));
                        } catch (Exception e) {
                            Logger.m649w(Area.OFFER.value() | Area.LOCALIZATION.value(), "Invalid JSON from Google Play", e);
                        }
                    }
                }
            } catch (RemoteException e1) {
                this.isGooglePlayConnected = false;
                Logger.m643e(Area.OFFER.value() | Area.LOCALIZATION.value(), "Error connecting to google play service", e1);
            }
        }
        return getJSONArrayFromPriceMap(localizedPrices);
    }

    public boolean isApi3BillingSupported() {
        boolean result = false;
        ensureBoundToGooglePlaySvc();
        if (this.googlePlayService != null) {
            try {
                if (Constants.ResponseCode.valueOf(this.googlePlayService.isBillingSupported(3, this._commContext.getApplicationContext().getPackageName(), IabHelper.ITEM_TYPE_INAPP)).equals(Constants.ResponseCode.RESULT_OK)) {
                    result = true;
                }
            } catch (RemoteException e) {
                this.isGooglePlayConnected = false;
                Logger.m641d(Area.OFFER.value() | Area.TRANSACTION.value(), "isApi3BillingSuported Remote Exception", e);
            }
        }
        SharedPreferences.Editor editor = this._commContext.getApplicationContext().getSharedPreferences("GetJarClientPrefs", 0).edit();
        editor.putBoolean(Constants.BILLING_API3_SUPPORTED_PREFS, result);
        editor.commit();
        Logger.m644i(Area.OFFER.value(), String.format(Locale.US, "InAppPurchaseManager isApi3BillingSupported returning %1$b", new Object[]{Boolean.valueOf(result)}));
        return result;
    }

    /* access modifiers changed from: protected */
    public PendingIntent requestPurchaseIntent(String marketplaceItemId, String clientTransactionId, GetJarWebViewSubActivity activity) {
        if (StringUtility.isNullOrEmpty(marketplaceItemId)) {
            throw new IllegalArgumentException("'marketplaceItemId' cannot be null or empty");
        } else if (StringUtility.isNullOrEmpty(clientTransactionId)) {
            throw new IllegalArgumentException("'clientTransactionId' cannot be null or empty");
        } else if (activity == null) {
            throw new IllegalStateException("Please set the activityContext first using setActivityContext");
        } else {
            if (this.googlePlayService == null || !activity._isForeground) {
                new TransactionManager(this._commContext.getApplicationContext()).cancelManagedOfferTransaction(clientTransactionId, this._commContext);
            } else {
                try {
                    String applicationKey = ApplicationKeyDatabase.getInstance(this._commContext.getApplicationContext()).getApplicationKey();
                    AuthManager.initialize(this._commContext.getApplicationContext());
                    String deviceId = AuthManager.getInstance().getUserDeviceId();
                    return (PendingIntent) this.googlePlayService.getBuyIntent(3, activity.getParentActivity().getApplicationContext().getPackageName(), marketplaceItemId, IabHelper.ITEM_TYPE_INAPP, String.format(Locale.US, "%1$s,%2$s,%3$s", new Object[]{clientTransactionId, applicationKey, deviceId})).getParcelable(IabHelper.RESPONSE_BUY_INTENT);
                } catch (RemoteException e) {
                    this.isGooglePlayConnected = false;
                    Logger.m649w(Area.TRANSACTION.value() | Area.OFFER.value(), "Purchase failed", e);
                }
            }
            return null;
        }
    }

    /* access modifiers changed from: protected */
    public ManagedOfferStatus reserveManagedOffer(String clientTransactionId, String offerId, HashMap<String, String> purchaseMetadata, HashMap<String, String> trackingMetadata, GetJarSubActivityBase activity) {
        if (StringUtility.isNullOrEmpty(clientTransactionId)) {
            throw new IllegalArgumentException("'clientTransactionId' cannot be null or empty");
        } else if (StringUtility.isNullOrEmpty(offerId)) {
            throw new IllegalArgumentException("'offerId' cannot be null or empty");
        } else if (purchaseMetadata == null || purchaseMetadata.isEmpty()) {
            throw new IllegalArgumentException("'purchaseMetadata' cannot be null");
        } else if (trackingMetadata == null || trackingMetadata.isEmpty()) {
            throw new IllegalArgumentException("'trackingMetadata' cannot be null");
        } else if (activity == null) {
            throw new IllegalArgumentException("'activity' cannot be null");
        } else {
            ManagedOfferStatus result = ManagedOfferStatus.SUCCESS;
            Future<Operation> futureOperation = new TransactionManager(this._commContext.getApplicationContext()).startManagedOfferTransaction(this._commContext, clientTransactionId, offerId, purchaseMetadata, trackingMetadata);
            if (futureOperation == null) {
                return ManagedOfferStatus.NOT_AUTHORIZED;
            }
            try {
                Operation operation = futureOperation.get();
                if (operation == null) {
                    return ManagedOfferStatus.SDK_INTERNAL_ERROR;
                }
                Result operationResult = operation.get();
                if (operationResult == null) {
                    return ManagedOfferStatus.SERVER_ERROR;
                }
                if (operationResult.isSuccessfulResponse()) {
                    return result;
                }
                try {
                    return ManagedOfferStatus.valueOf(operationResult.getErrorResponseSubcode());
                } catch (Exception e) {
                    return ManagedOfferStatus.SERVER_ERROR;
                }
            } catch (InterruptedException e2) {
                Logger.m649w(Area.OFFER.value() | Area.TRANSACTION.value(), "Interrupted exception occured", e2);
                return ManagedOfferStatus.SDK_INTERNAL_ERROR;
            } catch (ExecutionException e3) {
                Logger.m649w(Area.OFFER.value() | Area.TRANSACTION.value(), "Execution exception occured", e3);
                return ManagedOfferStatus.SDK_INTERNAL_ERROR;
            }
        }
    }

    /* access modifiers changed from: protected */
    public void managedOfferGooglePlayResponse(int requestCode, int resultCode, Intent data) {
        Logger.m640d(Area.OFFER.value() | Area.TRANSACTION.value(), "Got callback from google");
        if (data == null) {
            throw new IllegalArgumentException("'data' cannot be null");
        } else if (resultCode == -1 && data.getIntExtra("RESPONSE_CODE", -1) == 0) {
            String purchaseData = data.getStringExtra(IabHelper.RESPONSE_INAPP_PURCHASE_DATA);
            String dataSignature = data.getStringExtra(IabHelper.RESPONSE_INAPP_SIGNATURE);
            try {
                if (!StringUtility.isNullOrEmpty(purchaseData)) {
                    String developerPayload = new JSONObject(purchaseData).getString("developerPayload");
                    if (!StringUtility.isNullOrEmpty(developerPayload) && developerPayload.split(",").length == 3) {
                        String clientTransactionId = developerPayload.split(",")[0];
                        if (!StringUtility.isNullOrEmpty(clientTransactionId)) {
                            ManagedOfferBucket transaction = (ManagedOfferBucket) DBTransactions.getInstance(this._commContext.getApplicationContext()).loadTransaction(clientTransactionId);
                            RelatedManagedOfferData relatedData = transaction.getRelatedObject();
                            relatedData.addGooglePlayTransactionData(purchaseData, dataSignature);
                            DBTransactions.getInstance(this._commContext.getApplicationContext()).updateManagedOfferTransaction(clientTransactionId, relatedData);
                            TransactionManager.updateOfferTransactionState(this._commContext, transaction, DBTransactions.ManagedOfferState.PURCHASED);
                        }
                    }
                } else {
                    Thread.sleep(1000);
                    if (!processOutstandingPurchases(true)) {
                        TransactionManager.updateOfferTransactionState(this._commContext, (ManagedOfferBucket) DBTransactions.getInstance(this._commContext.getApplicationContext()).loadTransaction(getCurrentClientTransactionId()), DBTransactions.ManagedOfferState.CANCELING);
                        GetJarWebViewSubActivity.updateUIwithOfferResults(this._commContext.getApplicationContext(), ManagedOfferStatus.GOOGLE_FAILURE_AFTER_PURCHASE, new JSONObject());
                    }
                }
            } catch (Exception e) {
                Logger.m643e(Area.OFFER.value() | Area.TRANSACTION.value(), "InAppPurchaseManager managedOfferGooglePlayResponse: Google Play Error", e);
                GetJarWebViewSubActivity.updateUIwithOfferResults(this._commContext.getApplicationContext(), ManagedOfferStatus.GOOGLE_FAILURE_AFTER_PURCHASE, new JSONObject());
            } finally {
                new TransactionManager(this._commContext.getApplicationContext()).runEarnAndManagedOfferTransactions(this._commContext);
            }
        } else {
            GetJarWebViewSubActivity.updateUIwithOfferResults(this._commContext.getApplicationContext(), ManagedOfferStatus.GOOGLE_RELATED_FAILURE, new JSONObject());
            String clientTransactionId2 = getCurrentClientTransactionId();
            if (!StringUtility.isNullOrEmpty(clientTransactionId2)) {
                new TransactionManager(this._commContext.getApplicationContext()).cancelManagedOfferTransaction(clientTransactionId2, this._commContext);
            } else {
                Logger.m642e(Area.OFFER.value() | Area.TRANSACTION.value(), "InAppPurchaseManager managedOfferGooglePlayResponse: Unable to Cancel. Could not find current transaction ID.");
            }
        }
    }

    public void cancelOrphanedManagedOffers() {
        String continuationToken;
        Logger.m646v(Area.OFFER.value() | Area.TRANSACTION.value(), "InAppPurchaseManager cancelOrphanedManagedOffers started");
        ensureBoundToGooglePlaySvc();
        String currentClientTransactionId = getCurrentClientTransactionId();
        if (isGooglePlayConnected()) {
            Logger.m646v(Area.OFFER.value() | Area.TRANSACTION.value(), "InAppPurchaseManager cancelOrphanedManagedOffers connectedToGooglePlay");
            HashSet<String> googlePendingClientTransactionIds = new HashSet<>();
            do {
                try {
                    Bundle ownedItems = this.googlePlayService.getPurchases(3, this._commContext.getApplicationContext().getPackageName(), IabHelper.ITEM_TYPE_INAPP, (String) null);
                    int response = ownedItems.getInt("RESPONSE_CODE");
                    if (ownedItems.containsKey("RESPONSE_CODE") && Constants.ResponseCode.valueOf(response).equals(Constants.ResponseCode.RESULT_OK)) {
                        ArrayList<String> purchaseDataList = ownedItems.getStringArrayList(IabHelper.RESPONSE_INAPP_PURCHASE_DATA_LIST);
                        Logger.m646v(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "InAppPurchaseManager cancelOrphanedManagedOffers Got %1$d items", new Object[]{Integer.valueOf(purchaseDataList.size())}));
                        continuationToken = ownedItems.getString(IabHelper.INAPP_CONTINUATION_TOKEN);
                        for (int i = 0; i < purchaseDataList.size(); i++) {
                            String purchaseData = purchaseDataList.get(i);
                            if (!StringUtility.isNullOrEmpty(purchaseData)) {
                                googlePendingClientTransactionIds.add(new JSONObject(purchaseData).getString("developerPayload").split(",")[0]);
                            }
                        }
                    } else {
                        return;
                    }
                } catch (RemoteException e) {
                    this.isGooglePlayConnected = false;
                    Logger.m649w(Area.OFFER.value() | Area.TRANSACTION.value(), "Error canceling orphaned managed offers", e);
                    return;
                } catch (JSONException e2) {
                    Logger.m649w(Area.OFFER.value() | Area.TRANSACTION.value(), "Error canceling orphaned managed offers", e2);
                    return;
                }
            } while (continuationToken != null);
            for (TransactionBucket transaction : DBTransactions.getInstance(this._commContext.getApplicationContext()).loadAllTransactions()) {
                if (transaction.getType().equals(DBTransactions.TransactionType.MANAGED_OFFER) && !transaction.getClientTransactionId().equals(currentClientTransactionId)) {
                    ManagedOfferBucket managedOfferBucket = (ManagedOfferBucket) transaction;
                    if (googlePendingClientTransactionIds.contains(transaction.getClientTransactionId())) {
                        Logger.m646v(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "InAppPurchaseManager cancelOrphanedManagedOffers skipped [clientTransactionId: %1$s]", new Object[]{transaction.getClientTransactionId()}));
                    } else if (managedOfferBucket.getState().equals(DBTransactions.ManagedOfferState.CREATED) || managedOfferBucket.getState().equals(DBTransactions.ManagedOfferState.RESERVING) || managedOfferBucket.getState().equals(DBTransactions.ManagedOfferState.RESERVED) || managedOfferBucket.getState().equals(DBTransactions.ManagedOfferState.PURCHASING)) {
                        TransactionManager.updateOfferTransactionState(this._commContext, managedOfferBucket, DBTransactions.ManagedOfferState.CANCELING);
                        Logger.m646v(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "InAppPurchaseManager cancelOrphanedManagedOffers CANCELING [clientTransactionId: %1$s]", new Object[]{transaction.getClientTransactionId()}));
                    } else {
                        TransactionManager.updateOfferTransactionState(this._commContext, managedOfferBucket, DBTransactions.ManagedOfferState.DONE);
                        Logger.m646v(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "InAppPurchaseManager cancelOrphanedManagedOffers DONE [clientTransactionId: %1$s]", new Object[]{transaction.getClientTransactionId()}));
                    }
                }
            }
        }
    }

    public boolean processOutstandingPurchases(boolean currentOnly) {
        String currentClientTransactionId;
        boolean isNullOrEmpty;
        DBTransactions.ManagedOfferState managedOfferState;
        DBTransactions.ManagedOfferState managedOfferState2;
        DBTransactions.ManagedOfferState managedOfferState3;
        ensureBoundToGooglePlaySvc();
        if (this.googlePlayService != null) {
            try {
                synchronized (this._processOutstandingPurchasesLock) {
                    String continuationToken = null;
                    do {
                        Bundle ownedItems = this.googlePlayService.getPurchases(3, this._commContext.getApplicationContext().getPackageName(), IabHelper.ITEM_TYPE_INAPP, (String) null);
                        new Thread(new Runnable() {
                            public void run() {
                                InAppPurchaseManager.this.isApi3BillingSupported();
                            }
                        }).start();
                        int response = ownedItems.getInt("RESPONSE_CODE");
                        if (ownedItems.containsKey("RESPONSE_CODE")) {
                            if (Constants.ResponseCode.valueOf(response).equals(Constants.ResponseCode.RESULT_OK)) {
                                ArrayList<String> purchaseDataList = ownedItems.getStringArrayList(IabHelper.RESPONSE_INAPP_PURCHASE_DATA_LIST);
                                ArrayList<String> signatureList = ownedItems.getStringArrayList(IabHelper.RESPONSE_INAPP_SIGNATURE_LIST);
                                continuationToken = ownedItems.getString(IabHelper.INAPP_CONTINUATION_TOKEN);
                                Logger.m640d(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Got %s items", new Object[]{Integer.valueOf(purchaseDataList.size())}));
                                if (purchaseDataList != null) {
                                    int i = 0;
                                    while (i < purchaseDataList.size()) {
                                        String purchaseData = purchaseDataList.get(i);
                                        String signature = signatureList.get(i);
                                        try {
                                            JSONObject jSONObject = new JSONObject(purchaseData);
                                            String developerPayload = jSONObject.getString("developerPayload");
                                            if (StringUtility.isNullOrEmpty(developerPayload) || developerPayload.split(",").length != 3) {
                                                HashMap<String, String> purchaseMetadata = new HashMap<>();
                                                purchaseMetadata.put(Constants.GOOGLE_PLAY_SIGNED_DATA, purchaseData);
                                                DBTransactions.getInstance(this._commContext.getApplicationContext()).insertManagedOfferTransaction(UUID.randomUUID().toString(), new RelatedManagedOfferData(purchaseMetadata), DBTransactions.ManagedOfferState.CONSUMING);
                                                i++;
                                            } else {
                                                String clientTransactionId = developerPayload.split(",")[0];
                                                TransactionBucket transaction = DBTransactions.getInstance(this._commContext.getApplicationContext()).loadTransaction(clientTransactionId);
                                                if (transaction == null) {
                                                    long purchaseTime = jSONObject.getLong("purchaseTime");
                                                    if (AuthManager.getInstance().getUserDeviceId().equals(developerPayload.split(",")[2]) || System.currentTimeMillis() - purchaseTime > 86400000) {
                                                        HashMap<String, String> purchaseMetadata2 = new HashMap<>();
                                                        purchaseMetadata2.put(Constants.MARKETPLACE_PRODUCT_ID, jSONObject.getString("productId"));
                                                        purchaseMetadata2.put(Constants.GOOGLE_PLAY_SIGNED_DATA, purchaseData);
                                                        purchaseMetadata2.put(Constants.GOOGLE_PLAY_SIGNATURE, signature);
                                                        DBTransactions.getInstance(this._commContext.getApplicationContext()).insertManagedOfferTransaction(clientTransactionId, new RelatedManagedOfferData(purchaseMetadata2), DBTransactions.ManagedOfferState.PURCHASED);
                                                    }
                                                } else {
                                                    RelatedManagedOfferData relatedData = ((ManagedOfferBucket) transaction).getRelatedObject();
                                                    relatedData.addGooglePlayTransactionData(purchaseData, signature);
                                                    DBTransactions.getInstance(this._commContext.getApplicationContext()).updateManagedOfferTransaction(clientTransactionId, relatedData);
                                                    TransactionManager.updateOfferTransactionState(this._commContext, (ManagedOfferBucket) transaction, DBTransactions.ManagedOfferState.PURCHASED);
                                                }
                                                i++;
                                            }
                                        } catch (JSONException e) {
                                            Logger.m649w(Area.OFFER.value() | Area.TRANSACTION.value(), "Invalid json", e);
                                        } catch (IOException e2) {
                                            Logger.m649w(Area.OFFER.value() | Area.TRANSACTION.value(), "IOException occured", e2);
                                        } catch (ClassNotFoundException e3) {
                                            Logger.m643e(Area.OFFER.value() | Area.TRANSACTION.value(), "Invalid class cast", e3);
                                        }
                                    }
                                    continue;
                                } else {
                                    continue;
                                }
                            } else {
                                continue;
                            }
                        }
                    } while (continuationToken != null);
                }
                String currentClientTransactionId2 = getCurrentClientTransactionId();
                if (!currentOnly) {
                    List<TransactionBucket> processedTransactions = new TransactionManager(this._commContext.getApplicationContext()).runEarnAndManagedOfferTransactions(this._commContext);
                    if (StringUtility.isNullOrEmpty(currentClientTransactionId2)) {
                        return false;
                    }
                    for (TransactionBucket transaction2 : processedTransactions) {
                        if (transaction2.getClientTransactionId().equals(currentClientTransactionId2)) {
                            return ((ManagedOfferBucket) transaction2).getState().equals(DBTransactions.ManagedOfferState.DONE);
                        }
                    }
                    return false;
                } else if (StringUtility.isNullOrEmpty(currentClientTransactionId2)) {
                    return false;
                } else {
                    Future<DBTransactions.ManagedOfferState> futureState = new TransactionManager(this._commContext.getApplicationContext()).runManagedOfferTransaction(currentClientTransactionId2, this._commContext);
                    try {
                        if (futureState.get() != null) {
                            return DBTransactions.ManagedOfferState.DONE.equals(futureState.get());
                        }
                        return false;
                    } catch (Exception e4) {
                        Logger.m649w(Area.OFFER.value() | Area.TRANSACTION.value(), "Error getting current transaction state", e4);
                        return false;
                    }
                }
            } catch (RemoteException e5) {
                try {
                    this.isGooglePlayConnected = false;
                    Logger.m649w(Area.OFFER.value() | Area.TRANSACTION.value(), "Error processing outstanding purchases", e5);
                    if (!currentOnly) {
                        List<TransactionBucket> processedTransactions2 = new TransactionManager(this._commContext.getApplicationContext()).runEarnAndManagedOfferTransactions(this._commContext);
                        if (StringUtility.isNullOrEmpty(currentClientTransactionId)) {
                            return false;
                        }
                        for (TransactionBucket transaction3 : processedTransactions2) {
                            if (transaction3.getClientTransactionId().equals(currentClientTransactionId)) {
                                return ((ManagedOfferBucket) transaction3).getState().equals(DBTransactions.ManagedOfferState.DONE);
                            }
                        }
                        return false;
                    } else if (isNullOrEmpty) {
                        return false;
                    } else {
                        try {
                            if (managedOfferState != null) {
                                return managedOfferState2.equals(managedOfferState3);
                            }
                            return false;
                        } catch (Exception e6) {
                            Logger.m649w(Area.OFFER.value() | Area.TRANSACTION.value(), "Error getting current transaction state", e6);
                            return false;
                        }
                    }
                } finally {
                    currentClientTransactionId = getCurrentClientTransactionId();
                    if (!currentOnly) {
                        List<TransactionBucket> processedTransactions3 = new TransactionManager(this._commContext.getApplicationContext()).runEarnAndManagedOfferTransactions(this._commContext);
                        if (!StringUtility.isNullOrEmpty(currentClientTransactionId)) {
                            Iterator i$ = processedTransactions3.iterator();
                            while (true) {
                                if (!i$.hasNext()) {
                                    break;
                                }
                                TransactionBucket transaction4 = i$.next();
                                if (transaction4.getClientTransactionId().equals(currentClientTransactionId)) {
                                    boolean currentTransactionSucceeded = ((ManagedOfferBucket) transaction4).getState().equals(DBTransactions.ManagedOfferState.DONE);
                                    break;
                                }
                            }
                        }
                    } else if (!StringUtility.isNullOrEmpty(currentClientTransactionId)) {
                        Future<DBTransactions.ManagedOfferState> futureState2 = new TransactionManager(this._commContext.getApplicationContext()).runManagedOfferTransaction(currentClientTransactionId, this._commContext);
                        try {
                            if (futureState2.get() != null) {
                                boolean currentTransactionSucceeded2 = DBTransactions.ManagedOfferState.DONE.equals(futureState2.get());
                            }
                        } catch (Exception e7) {
                            Logger.m649w(Area.OFFER.value() | Area.TRANSACTION.value(), "Error getting current transaction state", e7);
                        }
                    }
                }
            }
        } else {
            Logger.m648w(Area.OFFER.value() | Area.TRANSACTION.value(), "Error processing outstanding purchases");
            return false;
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
            String purchaseData = transaction.getRelatedObject().getPurchaseMetadata().get(Constants.GOOGLE_PLAY_SIGNED_DATA);
            Logger.m646v(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Consuming product: %1$s", new Object[]{purchaseData}));
            if (!StringUtility.isNullOrEmpty(purchaseData)) {
                String purchaseToken = new JSONObject(purchaseData).getString("purchaseToken");
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
                        Logger.m648w(Area.OFFER.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Unable to consume [marketplaceItemId:%1$s] [reason:%2$s]", new Object[]{transaction.getRelatedObject().getOfferToken(), response}));
                    }
                }
            } else {
                Logger.m648w(Area.OFFER.value() | Area.TRANSACTION.value(), "Unable to consume as no purchase data found!");
            }
            if (transaction.getClientTransactionId().equals(currentClientTransactionId)) {
                removeLastClientTransactionId();
            }
            return result;
        } catch (Exception e) {
            throw new GetJarException((Throwable) e);
        } catch (Throwable th) {
            if (transaction.getClientTransactionId().equals(currentClientTransactionId)) {
                removeLastClientTransactionId();
            }
            throw th;
        }
    }

    /* access modifiers changed from: protected */
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
                Logger.m643e(Area.OFFER.value() | Area.LOCALIZATION.value(), "Invalid JSON", e);
            }
        }
        return localizedPrices;
    }

    private class GooglePlayServiceConnection implements ServiceConnection {
        private GooglePlayServiceConnection() {
        }

        public void onServiceDisconnected(ComponentName name) {
            boolean unused = InAppPurchaseManager.this.isGooglePlayConnected = false;
        }

        public void onServiceConnected(ComponentName name, IBinder service) {
            synchronized (InAppPurchaseManager.this._googlePlayBindLock) {
                IInAppBillingService unused = InAppPurchaseManager.this.googlePlayService = IInAppBillingService.Stub.asInterface(service);
                boolean unused2 = InAppPurchaseManager.this.isGooglePlayConnected = true;
                InAppPurchaseManager.this._googlePlayBindLock.notifyAll();
            }
        }
    }

    /* access modifiers changed from: protected */
    public boolean isGooglePlayConnected() {
        return this.isGooglePlayConnected;
    }
}
