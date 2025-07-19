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
/* loaded from: classes.dex */
public class GetJarService extends Service implements ServiceConnection {
    private static IMarketBillingService googlePlayBillingService;
    private Method mStartIntentSender;
    private Object[] mStartIntentSenderArgs = new Object[5];
    private static LinkedList<BillingRequest> mPendingRequests = new LinkedList<>();
    private static HashMap<Long, BillingRequest> mSentRequests = new HashMap<>();
    private static final Class[] START_INTENT_SENDER_SIG = {IntentSender.class, Intent.class, Integer.TYPE, Integer.TYPE, Integer.TYPE};

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public abstract class BillingRequest {
        protected long mRequestId;
        private final int mStartId;

        protected abstract long run() throws RemoteException;

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
            if (GetJarService.this.bindToMarketBillingService()) {
                GetJarService.mPendingRequests.add(this);
                return true;
            }
            return false;
        }

        public boolean runIfConnected() {
            if (GetJarService.googlePlayBillingService != null) {
                try {
                    Logger.d(Area.BUY_GOLD.value(), "GooglePlayBillingService runIfConnected");
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

        protected void onRemoteException(RemoteException e) {
            Logger.w(Area.BUY_GOLD.value(), "remote billing service crashed");
            IMarketBillingService unused = GetJarService.googlePlayBillingService = null;
        }

        protected void responseCodeReceived(Constants.ResponseCode responseCode) {
        }

        protected Bundle makeRequestBundle(String method) {
            Bundle request = new Bundle();
            request.putString("BILLING_REQUEST", method);
            request.putInt("API_VERSION", 2);
            request.putString("PACKAGE_NAME", GetJarService.this.getPackageName());
            return request;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public class CheckBillingSupported extends BillingRequest {
        public CheckBillingSupported() {
            super(-1);
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // com.getjar.sdk.rewards.GetJarService.BillingRequest
        protected long run() throws RemoteException {
            boolean z = false;
            Bundle request = makeRequestBundle("CHECK_BILLING_SUPPORTED");
            try {
                if (GetJarService.googlePlayBillingService != null) {
                    Bundle response = GetJarService.googlePlayBillingService.sendBillingRequest(request);
                    int responseCode = response.getInt("RESPONSE_CODE");
                    boolean billingSupported = responseCode == Constants.ResponseCode.RESULT_OK.ordinal();
                    GetJarService.this.setBillingSupported(billingSupported);
                    Logger.i(Area.BUY_GOLD.value(), "GooglePlayBillingService CheckBillingSupported -- isSupported " + billingSupported);
                    z = Constants.BILLING_RESPONSE_VALID_REQUEST_ID;
                } else {
                    GetJarService.this.bindToMarketBillingService();
                    z = Constants.BILLING_RESPONSE_INVALID_REQUEST_ID;
                }
                long j = z ? 1L : 0L;
                long j2 = z ? 1L : 0L;
                return j;
            } catch (NullPointerException e) {
                Logger.w(Area.BUY_GOLD.value(), "GetJarService CheckBillingSupported ", e);
                GetJarService.this.setBillingSupported(z);
                return Constants.BILLING_RESPONSE_INVALID_REQUEST_ID;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setBillingSupported(boolean billingSupported) {
        SharedPreferences prefs = getApplicationContext().getSharedPreferences("GetJarClientPrefs", 0);
        SharedPreferences.Editor editor = prefs.edit();
        editor.putBoolean(Constants.BILLING_SUPPORTED_PREFS, billingSupported);
        editor.commit();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public class RequestPurchase extends BillingRequest {
        public final String mProductId;

        public RequestPurchase(String itemId) {
            super(-1);
            this.mProductId = itemId;
        }

        @Override // com.getjar.sdk.rewards.GetJarService.BillingRequest
        protected long run() throws RemoteException {
            Logger.d(Area.BUY_GOLD.value(), String.format(Locale.US, "GooglePlayBillingService RequestPurchase run mProductId %s", this.mProductId));
            Bundle request = makeRequestBundle("REQUEST_PURCHASE");
            request.putString("ITEM_ID", this.mProductId);
            request.putString("DEVELOPER_PAYLOAD", String.format(Locale.US, "%s%s", Constants.BUYING_GOLD_PAYLOAD_PREFIX, UUID.randomUUID().toString()));
            Logger.d(Area.BUY_GOLD.value(), String.format(Locale.US, "GetJarService requestBundle: %s", request));
            if (GetJarService.googlePlayBillingService != null) {
                Bundle response = GetJarService.googlePlayBillingService.sendBillingRequest(request);
                PendingIntent pendingIntent = (PendingIntent) response.getParcelable("PURCHASE_INTENT");
                if (pendingIntent == null) {
                    Logger.e(Area.BUY_GOLD.value(), "Error with requestPurchase");
                    return Constants.BILLING_RESPONSE_INVALID_REQUEST_ID;
                }
                Intent intent = new Intent();
                GetJarService.this.startBuyPageActivity(pendingIntent, intent);
                return response.getLong("REQUEST_ID", Constants.BILLING_RESPONSE_INVALID_REQUEST_ID);
            }
            GetJarService.this.bindToMarketBillingService();
            return Constants.BILLING_RESPONSE_INVALID_REQUEST_ID;
        }

        @Override // com.getjar.sdk.rewards.GetJarService.BillingRequest
        protected void responseCodeReceived(Constants.ResponseCode responseCode) {
            if (!Constants.ResponseCode.RESULT_OK.equals(responseCode)) {
                if (responseCode.equals(Constants.ResponseCode.RESULT_ITEM_UNAVAILABLE)) {
                    InAppPurchaseManager.getInstance(GetJarService.this.getApplicationContext()).handleFailure(this.mProductId, InAppPurchaseManager.InAppBillingFailure.ITEM_NOT_AVAILABLE, GetJarService.this.getApplicationContext());
                } else if (responseCode.equals(Constants.ResponseCode.RESULT_USER_CANCELED)) {
                    InAppPurchaseManager.getInstance(GetJarService.this.getApplicationContext()).handleFailure(this.mProductId, InAppPurchaseManager.InAppBillingFailure.CANCELLED, GetJarService.this.getApplicationContext());
                } else {
                    InAppPurchaseManager.getInstance(GetJarService.this.getApplicationContext()).handleFailure(this.mProductId, InAppPurchaseManager.InAppBillingFailure.GOOGLE_PLAY_BIND_FAILURE, GetJarService.this.getApplicationContext());
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void initCompatibilityLayer() {
        try {
            this.mStartIntentSender = getApplicationContext().getClass().getMethod("startIntentSender", START_INTENT_SENDER_SIG);
        } catch (NoSuchMethodException e) {
            Logger.e(Area.BUY_GOLD.value() | Area.UI.value(), "GooglePlayBillingService initCompatibilityLayer", e);
            this.mStartIntentSender = null;
        } catch (SecurityException e2) {
            Logger.e(Area.BUY_GOLD.value() | Area.UI.value(), "GooglePlayBillingService initCompatibilityLayer", e2);
            this.mStartIntentSender = null;
        }
    }

    void startBuyPageActivity(PendingIntent pendingIntent, Intent intent) {
        if (this.mStartIntentSender != null) {
            try {
                this.mStartIntentSenderArgs[0] = pendingIntent.getIntentSender();
                this.mStartIntentSenderArgs[1] = intent;
                this.mStartIntentSenderArgs[2] = 0;
                this.mStartIntentSenderArgs[3] = 0;
                this.mStartIntentSenderArgs[4] = 0;
                this.mStartIntentSender.invoke(getApplicationContext(), this.mStartIntentSenderArgs);
                return;
            } catch (Exception e) {
                Logger.e(Area.BUY_GOLD.value() | Area.UI.value(), "error starting activity", e);
                return;
            }
        }
        try {
            pendingIntent.send(getApplicationContext(), 0, intent);
        } catch (PendingIntent.CanceledException e2) {
            Logger.e(Area.BUY_GOLD.value() | Area.UI.value(), "error starting activity", e2);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public class ConfirmNotifications extends BillingRequest {
        final String[] mNotifyIds;

        public ConfirmNotifications(int startId, String[] notifyIds) {
            super(startId);
            this.mNotifyIds = notifyIds;
        }

        @Override // com.getjar.sdk.rewards.GetJarService.BillingRequest
        protected long run() throws RemoteException {
            Logger.d(Area.BUY_GOLD.value(), "GooglePlayBillingService ConfirmNotifications");
            Bundle request = makeRequestBundle("CONFIRM_NOTIFICATIONS");
            request.putStringArray("NOTIFY_IDS", this.mNotifyIds);
            if (GetJarService.googlePlayBillingService != null) {
                Bundle response = GetJarService.googlePlayBillingService.sendBillingRequest(request);
                return response.getLong("REQUEST_ID", Constants.BILLING_RESPONSE_INVALID_REQUEST_ID);
            }
            return Constants.BILLING_RESPONSE_INVALID_REQUEST_ID;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public class GetPurchaseInformation extends BillingRequest {
        long mNonce;
        final String[] mNotifyIds;

        public GetPurchaseInformation(int startId, String[] notifyIds) {
            super(startId);
            this.mNotifyIds = notifyIds;
        }

        @Override // com.getjar.sdk.rewards.GetJarService.BillingRequest
        protected long run() throws RemoteException {
            this.mNonce = Security.generateNonce();
            Bundle request = makeRequestBundle("GET_PURCHASE_INFORMATION");
            request.putLong("NONCE", this.mNonce);
            request.putStringArray("NOTIFY_IDS", this.mNotifyIds);
            try {
                if (GetJarService.googlePlayBillingService != null) {
                    Bundle response = GetJarService.googlePlayBillingService.sendBillingRequest(request);
                    return response.getLong("REQUEST_ID", Constants.BILLING_RESPONSE_INVALID_REQUEST_ID);
                }
            } catch (Exception e) {
            }
            return Constants.BILLING_RESPONSE_INVALID_REQUEST_ID;
        }

        @Override // com.getjar.sdk.rewards.GetJarService.BillingRequest
        protected void onRemoteException(RemoteException e) {
            super.onRemoteException(e);
        }
    }

    public void setContext(Context context) {
        attachBaseContext(context);
    }

    @Override // android.app.Service
    public IBinder onBind(Intent intent) {
        return null;
    }

    @Override // android.app.Service
    public int onStartCommand(final Intent intent, int flags, final int startId) {
        Logger.d(Area.BUY_GOLD.value() | Area.OS_ENTRY_POINT.value(), "GetJarService onStartCommand");
        try {
            new Thread(new Runnable() { // from class: com.getjar.sdk.rewards.GetJarService.1
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        GetJarService.this.handleCommand(intent, startId);
                        SharedPreferences prefs = GetJarService.this.getApplicationContext().getSharedPreferences("GetJarClientPrefs", 0);
                        if (!prefs.getBoolean(Constants.BILLING_SUPPORTED_PREFS, false)) {
                            GetJarService.this.checkBillingSupported();
                        }
                    } catch (Exception ex) {
                        Logger.w(Area.BUY_GOLD.value() | Area.OS_ENTRY_POINT.value(), "GetJarService onStart", ex);
                    }
                }
            }).start();
            return 1;
        } catch (Exception e) {
            Logger.w(Area.BUY_GOLD.value() | Area.OS_ENTRY_POINT.value(), "GetJarService onStart", e);
            return 1;
        }
    }

    public void handleCommand(Intent intent, int startId) {
        String action = intent.getAction();
        Logger.d(Area.BUY_GOLD.value(), "GooglePlayBillingService handleCommand - action " + action);
        if (Constants.ACTION_CONFIRM_NOTIFICATION.equals(action)) {
            String[] notifyIds = intent.getStringArrayExtra("notification_id");
            confirmNotifications(startId, notifyIds);
        } else if (Constants.ACTION_GET_PURCHASE_INFORMATION.equals(action)) {
            String notifyId = intent.getStringExtra("notification_id");
            getPurchaseInformation(startId, new String[]{notifyId});
        } else if ("com.android.vending.billing.PURCHASE_STATE_CHANGED".equals(action)) {
            String signedData = intent.getStringExtra("inapp_signed_data");
            String signature = intent.getStringExtra("inapp_signature");
            purchaseStateChanged(startId, signedData, signature);
        } else if ("com.android.vending.billing.RESPONSE_CODE".equals(action)) {
            long requestId = intent.getLongExtra("request_id", -1L);
            int responseCodeIndex = intent.getIntExtra("response_code", Constants.ResponseCode.RESULT_ERROR.ordinal());
            Constants.ResponseCode responseCode = Constants.ResponseCode.valueOf(responseCodeIndex);
            checkResponseCode(requestId, responseCode);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean bindToMarketBillingService() {
        boolean bindResult;
        try {
            bindResult = bindService(new Intent("com.android.vending.billing.MarketBillingService.BIND"), this, 1);
        } catch (SecurityException e) {
            Logger.e(Area.BUY_GOLD.value(), "Security exception: " + e);
        }
        if (bindResult) {
            Logger.i(Area.BUY_GOLD.value(), "Bound to Google Play billing service.");
            return true;
        }
        Logger.e(Area.BUY_GOLD.value(), "Could not bind to service.");
        return false;
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
        Logger.d(Area.BUY_GOLD.value() | Area.STORAGE.value(), "GooglePlayBillingService purchaseStateChanged started");
        ArrayList<GooglePurchaseResponse> purchases = Security.getPurchaseDetails(signedData, signature, getApplicationContext());
        if (purchases == null) {
            Logger.d(Area.BUY_GOLD.value() | Area.STORAGE.value(), "GooglePlayBillingService purchases null");
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
                TransactionManager transactionManager = new TransactionManager(getApplicationContext());
                transactionManager.buyCurrencyForGoogleTransactions(InAppPurchaseManager.getInstance(getApplicationContext()).getCommContext());
            }
        }
        if (!notifyList.isEmpty()) {
            String[] notifyIds = (String[]) notifyList.toArray(new String[notifyList.size()]);
            confirmNotifications(startId, notifyIds);
        }
    }

    private void checkResponseCode(long requestId, Constants.ResponseCode responseCode) {
        BillingRequest request = mSentRequests.get(Long.valueOf(requestId));
        if (request != null) {
            request.responseCodeReceived(responseCode);
        }
        mSentRequests.remove(Long.valueOf(requestId));
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void runPendingRequests() {
        Logger.d(Area.BUY_GOLD.value(), "GooglePlayBillingService runPendingRequests mPendingRequests size " + mPendingRequests.size());
        int maxStartId = -1;
        while (true) {
            BillingRequest request = mPendingRequests.peek();
            if (request != null) {
                if (request.runIfConnected()) {
                    Logger.d(Area.BUY_GOLD.value(), "GooglePlayBillingService runPendingRequests runIfConnected");
                    mPendingRequests.remove();
                    if (maxStartId < request.getStartId()) {
                        maxStartId = request.getStartId();
                    }
                } else {
                    Logger.d(Area.BUY_GOLD.value(), "GooglePlayBillingService runPendingRequests bind");
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

    @Override // android.content.ServiceConnection
    public void onServiceConnected(ComponentName name, IBinder service) {
        Logger.d(Area.OS_ENTRY_POINT.value() | Area.BUY_GOLD.value(), "GooglePlayBillingService onServiceConnected");
        try {
            googlePlayBillingService = IMarketBillingService.Stub.asInterface(service);
            new Thread(new Runnable() { // from class: com.getjar.sdk.rewards.GetJarService.2
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        GetJarService.this.initCompatibilityLayer();
                        GetJarService.this.runPendingRequests();
                    } catch (Exception e) {
                        Logger.e(Area.BUY_GOLD.value(), "GetjarService onServiceConnected", e);
                    }
                }
            }, "GooglePlayRequestThread").start();
        } catch (Exception e) {
            Logger.w(Area.BUY_GOLD.value(), "GetJarService onServiceConnected", e);
        }
    }

    @Override // android.content.ServiceConnection
    public void onServiceDisconnected(ComponentName name) {
        Logger.w(Area.BUY_GOLD.value(), "GooglePlayBillingService onServiceDisconnected");
        googlePlayBillingService = null;
    }

    public void unbind() {
        try {
            unbindService(this);
        } catch (IllegalArgumentException e) {
        }
    }

    @Override // android.app.Service
    public void onCreate() {
        super.onCreate();
        try {
            new Thread(new Runnable() { // from class: com.getjar.sdk.rewards.GetJarService.3
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        Logger.v(Area.OS_ENTRY_POINT.value(), "GetJarService: onCreate()");
                        if (!EarningMonitor.getInstance(GetJarService.this.getApplicationContext()).isMonitoring()) {
                            Logger.v(Area.EARN.value() | Area.OS_ENTRY_POINT.value(), "GetJarService: onCreate() starting earning monitoring thread");
                            EarningMonitor.getInstance(GetJarService.this.getApplicationContext()).startMonitoring();
                        }
                        if (!UsageMonitor.getInstance(GetJarService.this.getApplicationContext()).isMonitoring()) {
                            Logger.v(Area.USAGE.value() | Area.OS_ENTRY_POINT.value(), "GetJarService: onCreate() starting usage monitoring thread");
                            UsageMonitor.getInstance(GetJarService.this.getApplicationContext()).startMonitoring();
                        }
                    } catch (Exception e) {
                        Logger.e(Area.OS_ENTRY_POINT.value(), "GetJarService: onCreate() failed", e);
                    }
                }
            }).start();
        } catch (Exception e) {
            Logger.w(Area.OS_ENTRY_POINT.value(), "GetJarService onStart", e);
        }
    }
}
