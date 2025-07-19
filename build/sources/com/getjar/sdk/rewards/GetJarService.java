package com.getjar.sdk.rewards;

import android.app.PendingIntent;
import android.app.Service;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentSender;
import android.content.ServiceConnection;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import com.getjar.sdk.comm.TransactionManager;
import com.getjar.sdk.data.GooglePurchaseResponse;
import com.getjar.sdk.data.earning.EarningMonitor;
import com.getjar.sdk.data.usage.UsageMonitor;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.rewards.InAppPurchaseManager;
import com.getjar.sdk.utilities.Constants;
import com.getjar.sdk.utilities.Security;
import com.getjar.sdk.vending.billing.IMarketBillingService;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Locale;
import java.util.UUID;

public class GetJarService extends Service implements ServiceConnection {
    private static final Class[] START_INTENT_SENDER_SIG = {IntentSender.class, Intent.class, Integer.TYPE, Integer.TYPE, Integer.TYPE};
    /* access modifiers changed from: private */
    public static IMarketBillingService googlePlayBillingService;
    /* access modifiers changed from: private */
    public static LinkedList<BillingRequest> mPendingRequests = new LinkedList<>();
    /* access modifiers changed from: private */
    public static HashMap<Long, BillingRequest> mSentRequests = new HashMap<>();
    private Method mStartIntentSender;
    private Object[] mStartIntentSenderArgs = new Object[5];

    abstract class BillingRequest {
        protected long mRequestId;
        private final int mStartId;

        /* access modifiers changed from: protected */
        public abstract long run() throws RemoteException;

        public BillingRequest(int startId) {
            this.mStartId = startId;
        }

        public int getStartId() {
            return this.mStartId;
        }

        public boolean runRequest() {
            if (runIfConnected()) {
                return true;
            }
            if (!GetJarService.this.bindToMarketBillingService()) {
                return false;
            }
            GetJarService.mPendingRequests.add(this);
            return true;
        }

        public boolean runIfConnected() {
            if (GetJarService.googlePlayBillingService != null) {
                try {
                    Logger.m640d(Area.BUY_GOLD.value(), "GooglePlayBillingService runIfConnected");
                    this.mRequestId = run();
                    if (this.mRequestId >= 0) {
                        GetJarService.mSentRequests.put(Long.valueOf(this.mRequestId), this);
                    }
                    return true;
                } catch (RemoteException e) {
                    onRemoteException(e);
                }
            }
            return false;
        }

        /* access modifiers changed from: protected */
        public void onRemoteException(RemoteException e) {
            Logger.m648w(Area.BUY_GOLD.value(), "remote billing service crashed");
            IMarketBillingService unused = GetJarService.googlePlayBillingService = null;
        }

        /* access modifiers changed from: protected */
        public void responseCodeReceived(Constants.ResponseCode responseCode) {
        }

        /* access modifiers changed from: protected */
        public Bundle makeRequestBundle(String method) {
            Bundle request = new Bundle();
            request.putString("BILLING_REQUEST", method);
            request.putInt("API_VERSION", 2);
            request.putString("PACKAGE_NAME", GetJarService.this.getPackageName());
            return request;
        }
    }

    class CheckBillingSupported extends BillingRequest {
        public CheckBillingSupported() {
            super(-1);
        }

        /* access modifiers changed from: protected */
        public long run() throws RemoteException {
            boolean billingSupported;
            Bundle request = makeRequestBundle("CHECK_BILLING_SUPPORTED");
            try {
                if (GetJarService.googlePlayBillingService != null) {
                    if (GetJarService.googlePlayBillingService.sendBillingRequest(request).getInt("RESPONSE_CODE") == Constants.ResponseCode.RESULT_OK.ordinal()) {
                        billingSupported = true;
                    } else {
                        billingSupported = false;
                    }
                    GetJarService.this.setBillingSupported(billingSupported);
                    Logger.m644i(Area.BUY_GOLD.value(), "GooglePlayBillingService CheckBillingSupported -- isSupported " + billingSupported);
                    return Constants.BILLING_RESPONSE_VALID_REQUEST_ID;
                }
                boolean unused = GetJarService.this.bindToMarketBillingService();
                return Constants.BILLING_RESPONSE_INVALID_REQUEST_ID;
            } catch (NullPointerException e) {
                Logger.m649w(Area.BUY_GOLD.value(), "GetJarService CheckBillingSupported ", e);
                GetJarService.this.setBillingSupported(false);
                return Constants.BILLING_RESPONSE_INVALID_REQUEST_ID;
            }
        }
    }

    /* access modifiers changed from: private */
    public void setBillingSupported(boolean billingSupported) {
        SharedPreferences.Editor editor = getApplicationContext().getSharedPreferences("GetJarClientPrefs", 0).edit();
        editor.putBoolean(Constants.BILLING_SUPPORTED_PREFS, billingSupported);
        editor.commit();
    }

    class RequestPurchase extends BillingRequest {
        public final String mProductId;

        public RequestPurchase(String itemId) {
            super(-1);
            this.mProductId = itemId;
        }

        /* access modifiers changed from: protected */
        public long run() throws RemoteException {
            Logger.m640d(Area.BUY_GOLD.value(), String.format(Locale.US, "GooglePlayBillingService RequestPurchase run mProductId %s", new Object[]{this.mProductId}));
            Bundle request = makeRequestBundle("REQUEST_PURCHASE");
            request.putString("ITEM_ID", this.mProductId);
            request.putString("DEVELOPER_PAYLOAD", String.format(Locale.US, "%s%s", new Object[]{Constants.BUYING_GOLD_PAYLOAD_PREFIX, UUID.randomUUID().toString()}));
            Logger.m640d(Area.BUY_GOLD.value(), String.format(Locale.US, "GetJarService requestBundle: %s", new Object[]{request}));
            if (GetJarService.googlePlayBillingService != null) {
                Bundle response = GetJarService.googlePlayBillingService.sendBillingRequest(request);
                PendingIntent pendingIntent = (PendingIntent) response.getParcelable("PURCHASE_INTENT");
                if (pendingIntent == null) {
                    Logger.m642e(Area.BUY_GOLD.value(), "Error with requestPurchase");
                    return Constants.BILLING_RESPONSE_INVALID_REQUEST_ID;
                }
                GetJarService.this.startBuyPageActivity(pendingIntent, new Intent());
                return response.getLong("REQUEST_ID", Constants.BILLING_RESPONSE_INVALID_REQUEST_ID);
            }
            boolean unused = GetJarService.this.bindToMarketBillingService();
            return Constants.BILLING_RESPONSE_INVALID_REQUEST_ID;
        }

        /* access modifiers changed from: protected */
        public void responseCodeReceived(Constants.ResponseCode responseCode) {
            if (Constants.ResponseCode.RESULT_OK.equals(responseCode)) {
                return;
            }
            if (responseCode.equals(Constants.ResponseCode.RESULT_ITEM_UNAVAILABLE)) {
                InAppPurchaseManager.getInstance(GetJarService.this.getApplicationContext()).handleFailure(this.mProductId, InAppPurchaseManager.InAppBillingFailure.ITEM_NOT_AVAILABLE, GetJarService.this.getApplicationContext());
            } else if (responseCode.equals(Constants.ResponseCode.RESULT_USER_CANCELED)) {
                InAppPurchaseManager.getInstance(GetJarService.this.getApplicationContext()).handleFailure(this.mProductId, InAppPurchaseManager.InAppBillingFailure.CANCELLED, GetJarService.this.getApplicationContext());
            } else {
                InAppPurchaseManager.getInstance(GetJarService.this.getApplicationContext()).handleFailure(this.mProductId, InAppPurchaseManager.InAppBillingFailure.GOOGLE_PLAY_BIND_FAILURE, GetJarService.this.getApplicationContext());
            }
        }
    }

    /* access modifiers changed from: private */
    public void initCompatibilityLayer() {
        try {
            this.mStartIntentSender = getApplicationContext().getClass().getMethod("startIntentSender", START_INTENT_SENDER_SIG);
        } catch (SecurityException e) {
            Logger.m643e(Area.BUY_GOLD.value() | Area.UI.value(), "GooglePlayBillingService initCompatibilityLayer", e);
            this.mStartIntentSender = null;
        } catch (NoSuchMethodException e2) {
            Logger.m643e(Area.BUY_GOLD.value() | Area.UI.value(), "GooglePlayBillingService initCompatibilityLayer", e2);
            this.mStartIntentSender = null;
        }
    }

    /* access modifiers changed from: package-private */
    public void startBuyPageActivity(PendingIntent pendingIntent, Intent intent) {
        if (this.mStartIntentSender != null) {
            try {
                this.mStartIntentSenderArgs[0] = pendingIntent.getIntentSender();
                this.mStartIntentSenderArgs[1] = intent;
                this.mStartIntentSenderArgs[2] = 0;
                this.mStartIntentSenderArgs[3] = 0;
                this.mStartIntentSenderArgs[4] = 0;
                this.mStartIntentSender.invoke(getApplicationContext(), this.mStartIntentSenderArgs);
            } catch (Exception e) {
                Logger.m643e(Area.BUY_GOLD.value() | Area.UI.value(), "error starting activity", e);
            }
        } else {
            try {
                pendingIntent.send(getApplicationContext(), 0, intent);
            } catch (PendingIntent.CanceledException e2) {
                Logger.m643e(Area.BUY_GOLD.value() | Area.UI.value(), "error starting activity", e2);
            }
        }
    }

    class ConfirmNotifications extends BillingRequest {
        final String[] mNotifyIds;

        public ConfirmNotifications(int startId, String[] notifyIds) {
            super(startId);
            this.mNotifyIds = notifyIds;
        }

        /* access modifiers changed from: protected */
        public long run() throws RemoteException {
            Logger.m640d(Area.BUY_GOLD.value(), "GooglePlayBillingService ConfirmNotifications");
            Bundle request = makeRequestBundle("CONFIRM_NOTIFICATIONS");
            request.putStringArray("NOTIFY_IDS", this.mNotifyIds);
            if (GetJarService.googlePlayBillingService != null) {
                return GetJarService.googlePlayBillingService.sendBillingRequest(request).getLong("REQUEST_ID", Constants.BILLING_RESPONSE_INVALID_REQUEST_ID);
            }
            return Constants.BILLING_RESPONSE_INVALID_REQUEST_ID;
        }
    }

    class GetPurchaseInformation extends BillingRequest {
        long mNonce;
        final String[] mNotifyIds;

        public GetPurchaseInformation(int startId, String[] notifyIds) {
            super(startId);
            this.mNotifyIds = notifyIds;
        }

        /* access modifiers changed from: protected */
        public long run() throws RemoteException {
            this.mNonce = Security.generateNonce();
            Bundle request = makeRequestBundle("GET_PURCHASE_INFORMATION");
            request.putLong("NONCE", this.mNonce);
            request.putStringArray("NOTIFY_IDS", this.mNotifyIds);
            try {
                if (GetJarService.googlePlayBillingService != null) {
                    return GetJarService.googlePlayBillingService.sendBillingRequest(request).getLong("REQUEST_ID", Constants.BILLING_RESPONSE_INVALID_REQUEST_ID);
                }
            } catch (Exception e) {
            }
            return Constants.BILLING_RESPONSE_INVALID_REQUEST_ID;
        }

        /* access modifiers changed from: protected */
        public void onRemoteException(RemoteException e) {
            super.onRemoteException(e);
        }
    }

    public void setContext(Context context) {
        attachBaseContext(context);
    }

    public IBinder onBind(Intent intent) {
        return null;
    }

    public int onStartCommand(final Intent intent, int flags, final int startId) {
        Logger.m640d(Area.BUY_GOLD.value() | Area.OS_ENTRY_POINT.value(), "GetJarService onStartCommand");
        try {
            new Thread(new Runnable() {
                public void run() {
                    try {
                        GetJarService.this.handleCommand(intent, startId);
                        if (!GetJarService.this.getApplicationContext().getSharedPreferences("GetJarClientPrefs", 0).getBoolean(Constants.BILLING_SUPPORTED_PREFS, false)) {
                            GetJarService.this.checkBillingSupported();
                        }
                    } catch (Exception ex) {
                        Logger.m649w(Area.BUY_GOLD.value() | Area.OS_ENTRY_POINT.value(), "GetJarService onStart", ex);
                    }
                }
            }).start();
            return 1;
        } catch (Exception e) {
            Logger.m649w(Area.BUY_GOLD.value() | Area.OS_ENTRY_POINT.value(), "GetJarService onStart", e);
            return 1;
        }
    }

    public void handleCommand(Intent intent, int startId) {
        String action = intent.getAction();
        Logger.m640d(Area.BUY_GOLD.value(), "GooglePlayBillingService handleCommand - action " + action);
        if (Constants.ACTION_CONFIRM_NOTIFICATION.equals(action)) {
            confirmNotifications(startId, intent.getStringArrayExtra("notification_id"));
        } else if (Constants.ACTION_GET_PURCHASE_INFORMATION.equals(action)) {
            getPurchaseInformation(startId, new String[]{intent.getStringExtra("notification_id")});
        } else if ("com.android.vending.billing.PURCHASE_STATE_CHANGED".equals(action)) {
            purchaseStateChanged(startId, intent.getStringExtra("inapp_signed_data"), intent.getStringExtra("inapp_signature"));
        } else if ("com.android.vending.billing.RESPONSE_CODE".equals(action)) {
            checkResponseCode(intent.getLongExtra("request_id", -1), Constants.ResponseCode.valueOf(intent.getIntExtra("response_code", Constants.ResponseCode.RESULT_ERROR.ordinal())));
        }
    }

    /* access modifiers changed from: private */
    public boolean bindToMarketBillingService() {
        try {
            if (bindService(new Intent("com.android.vending.billing.MarketBillingService.BIND"), this, 1)) {
                Logger.m644i(Area.BUY_GOLD.value(), "Bound to Google Play billing service.");
                return true;
            }
            Logger.m642e(Area.BUY_GOLD.value(), "Could not bind to service.");
            return false;
        } catch (SecurityException e) {
            Logger.m642e(Area.BUY_GOLD.value(), "Security exception: " + e);
        }
    }

    public boolean checkBillingSupported() {
        return new CheckBillingSupported().runRequest();
    }

    public boolean requestPurchase(String productId) {
        return new RequestPurchase(productId).runRequest();
    }

    private boolean confirmNotifications(int startId, String[] notifyIds) {
        return new ConfirmNotifications(startId, notifyIds).runRequest();
    }

    private boolean getPurchaseInformation(int startId, String[] notifyIds) {
        return new GetPurchaseInformation(startId, notifyIds).runRequest();
    }

    private void purchaseStateChanged(int startId, String signedData, String signature) {
        Logger.m640d(Area.BUY_GOLD.value() | Area.STORAGE.value(), "GooglePlayBillingService purchaseStateChanged started");
        ArrayList<GooglePurchaseResponse> purchases = Security.getPurchaseDetails(signedData, signature, getApplicationContext());
        if (purchases == null) {
            Logger.m640d(Area.BUY_GOLD.value() | Area.STORAGE.value(), "GooglePlayBillingService purchases null");
            return;
        }
        ArrayList<String> notifyList = new ArrayList<>();
        Iterator i$ = purchases.iterator();
        while (i$.hasNext()) {
            GooglePurchaseResponse purchase = i$.next();
            if (purchase.getNotificationId() != null) {
                notifyList.add(purchase.getNotificationId());
            }
            if (purchase.getPurchaseState() == Constants.PurchaseState.PURCHASED.ordinal()) {
                InAppPurchaseManager.getInstance(getApplicationContext()).storePurchaseResponse(purchase);
                new TransactionManager(getApplicationContext()).buyCurrencyForGoogleTransactions(InAppPurchaseManager.getInstance(getApplicationContext()).getCommContext());
            }
        }
        if (!notifyList.isEmpty()) {
            confirmNotifications(startId, (String[]) notifyList.toArray(new String[notifyList.size()]));
        }
    }

    private void checkResponseCode(long requestId, Constants.ResponseCode responseCode) {
        BillingRequest request = mSentRequests.get(Long.valueOf(requestId));
        if (request != null) {
            request.responseCodeReceived(responseCode);
        }
        mSentRequests.remove(Long.valueOf(requestId));
    }

    /* access modifiers changed from: private */
    public void runPendingRequests() {
        Logger.m640d(Area.BUY_GOLD.value(), "GooglePlayBillingService runPendingRequests mPendingRequests size " + mPendingRequests.size());
        int maxStartId = -1;
        while (true) {
            BillingRequest request = mPendingRequests.peek();
            if (request != null) {
                if (request.runIfConnected()) {
                    Logger.m640d(Area.BUY_GOLD.value(), "GooglePlayBillingService runPendingRequests runIfConnected");
                    mPendingRequests.remove();
                    if (maxStartId < request.getStartId()) {
                        maxStartId = request.getStartId();
                    }
                } else {
                    Logger.m640d(Area.BUY_GOLD.value(), "GooglePlayBillingService runPendingRequests bind");
                    bindToMarketBillingService();
                    return;
                }
            } else if (maxStartId >= 0) {
                stopSelf(maxStartId);
                return;
            } else {
                return;
            }
        }
    }

    public void onServiceConnected(ComponentName name, IBinder service) {
        Logger.m640d(Area.OS_ENTRY_POINT.value() | Area.BUY_GOLD.value(), "GooglePlayBillingService onServiceConnected");
        try {
            googlePlayBillingService = IMarketBillingService.Stub.asInterface(service);
            new Thread(new Runnable() {
                public void run() {
                    try {
                        GetJarService.this.initCompatibilityLayer();
                        GetJarService.this.runPendingRequests();
                    } catch (Exception e) {
                        Logger.m643e(Area.BUY_GOLD.value(), "GetjarService onServiceConnected", e);
                    }
                }
            }, "GooglePlayRequestThread").start();
        } catch (Exception e) {
            Logger.m649w(Area.BUY_GOLD.value(), "GetJarService onServiceConnected", e);
        }
    }

    public void onServiceDisconnected(ComponentName name) {
        Logger.m648w(Area.BUY_GOLD.value(), "GooglePlayBillingService onServiceDisconnected");
        googlePlayBillingService = null;
    }

    public void unbind() {
        try {
            unbindService(this);
        } catch (IllegalArgumentException e) {
        }
    }

    public void onCreate() {
        super.onCreate();
        try {
            new Thread(new Runnable() {
                public void run() {
                    try {
                        Logger.m646v(Area.OS_ENTRY_POINT.value(), "GetJarService: onCreate()");
                        if (!EarningMonitor.getInstance(GetJarService.this.getApplicationContext()).isMonitoring()) {
                            Logger.m646v(Area.EARN.value() | Area.OS_ENTRY_POINT.value(), "GetJarService: onCreate() starting earning monitoring thread");
                            EarningMonitor.getInstance(GetJarService.this.getApplicationContext()).startMonitoring();
                        }
                        if (!UsageMonitor.getInstance(GetJarService.this.getApplicationContext()).isMonitoring()) {
                            Logger.m646v(Area.USAGE.value() | Area.OS_ENTRY_POINT.value(), "GetJarService: onCreate() starting usage monitoring thread");
                            UsageMonitor.getInstance(GetJarService.this.getApplicationContext()).startMonitoring();
                        }
                    } catch (Exception e) {
                        Logger.m643e(Area.OS_ENTRY_POINT.value(), "GetJarService: onCreate() failed", e);
                    }
                }
            }).start();
        } catch (Exception e) {
            Logger.m649w(Area.OS_ENTRY_POINT.value(), "GetJarService onStart", e);
        }
    }
}
