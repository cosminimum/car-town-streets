package com.getjar.sdk.data.metadata;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.ResultReceiver;
import com.getjar.sdk.comm.CommContext;
import com.getjar.sdk.comm.CommManager;
import com.getjar.sdk.comm.GetJarConfig;
import com.getjar.sdk.comm.Operation;
import com.getjar.sdk.comm.Result;
import com.getjar.sdk.comm.TransactionManager;
import com.getjar.sdk.comm.VoucherServiceProxy;
import com.getjar.sdk.comm.auth.ApplicationKeyDatabase;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.data.RedemptionEngine;
import com.getjar.sdk.data.earning.EarnStateDatabase;
import com.getjar.sdk.data.earning.EarnStateRecord;
import com.getjar.sdk.data.earning.EarningMonitor;
import com.getjar.sdk.data.install_state.InstallStateManager;
import com.getjar.sdk.data.package_events.PackageEventManager;
import com.getjar.sdk.data.usage.UsageManager;
import com.getjar.sdk.data.usage.UsageMonitor;
import com.getjar.sdk.data.usage.UsageReporter;
import com.getjar.sdk.exceptions.AuthException;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.rewards.GooglePlayLaunchCachingManager;
import com.getjar.sdk.rewards.GooglePlayLaunchReason;
import com.getjar.sdk.utilities.AlarmsUtility;
import com.getjar.sdk.utilities.Constants;
import com.getjar.sdk.utilities.NotificationsUtility;
import com.getjar.sdk.utilities.StringUtility;
import com.getjar.sdk.utilities.Utility;
import java.util.Locale;
/* loaded from: classes.dex */
public class PackageMonitor extends BroadcastReceiver {
    public static final int MAX_EARN_RETRIES = 3;
    public static final String OPERATION_KEY_USAGE_TRACKING = "usageAndEventTracking";
    public static final String OPERATION_KEY_VOUCHER_REDEMPTION_CHECK = "voucherRedemptionCheck";
    public static int mEarnRetries = 0;
    private GooglePlayLaunchCachingManager _googlePlayLaunchCache = null;
    private Context mContext;

    @Override // android.content.BroadcastReceiver
    public void onReceive(final Context context, final Intent intent) {
        Logger.d(Area.OS_ENTRY_POINT.value(), "PackageMonitor: onReceive(): START");
        try {
            new Thread(new Runnable() { // from class: com.getjar.sdk.data.metadata.PackageMonitor.1
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        PackageMonitor.this.doOnReceive(context, intent);
                    } catch (Exception e) {
                        Logger.e(Area.OS_ENTRY_POINT.value(), "PackageMonitor: onReceive() failed", e);
                    }
                }
            }, "PackageMonitor Worker Thread").start();
        } catch (Exception e) {
            Logger.e(Area.OS_ENTRY_POINT.value(), "PackageMonitor: onReceive() failed", e);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void doOnReceive(Context context, Intent intent) {
        try {
            Logger.d(Area.OS_ENTRY_POINT.value(), "PackageMonitor: doOnReceive(): START");
            if (context == null) {
                throw new IllegalArgumentException("'context' cannot be null");
            }
            if (intent == null) {
                throw new IllegalArgumentException("'intent' cannot be null");
            }
            this.mContext = context;
            if (this._googlePlayLaunchCache == null) {
                this._googlePlayLaunchCache = new GooglePlayLaunchCachingManager(context);
            }
            Utility.previousVersionCleanUp(context);
            String applicationKey = ApplicationKeyDatabase.getInstance(context).getApplicationKey();
            if (StringUtility.isNullOrEmpty(applicationKey)) {
                Logger.w(Area.OS_ENTRY_POINT.value() | Area.EARN.value() | Area.USAGE.value(), "PackageMonitor: doOnReceive(): Unable to access the application key");
                return;
            }
            CommContext commContext = CommManager.createContext(applicationKey, context, new ResultReceiver(null) { // from class: com.getjar.sdk.data.metadata.PackageMonitor.2
                @Override // android.os.ResultReceiver
                protected void onReceiveResult(int resultCode, Bundle resultData) {
                    for (String key : resultData.keySet()) {
                        Logger.d(Area.OS_ENTRY_POINT.value(), String.format(Locale.US, "PackageMonitor: Callback from the GetJar SDK [%1$s]", resultData.get(key).getClass().getName()));
                    }
                }
            }, CommManager.LaunchWork.NONE);
            try {
                AuthManager.initialize(context);
                AuthManager.getInstance().waitOnAuth();
                try {
                    Bundle bundle = intent.getExtras();
                    String authToken = AuthManager.getInstance().getAuthToken();
                    if (commContext != null && !StringUtility.isNullOrEmpty(authToken) && shouldRetryTransactions(context, commContext)) {
                        runPendingEarnTransactionsAndCleanup(commContext);
                    }
                    if (bundle != null && !StringUtility.isNullOrEmpty(bundle.getString(OPERATION_KEY_VOUCHER_REDEMPTION_CHECK))) {
                        String voucherToken = bundle.getString(RedemptionEngine.IntentVoucherTokenKey);
                        Logger.d(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "PackageMonitor: doOnReceive(): voucher redemption [token:'%1$s']", voucherToken));
                        if (!StringUtility.isNullOrEmpty(voucherToken)) {
                            boolean isRedeemed = false;
                            try {
                                Operation operation = VoucherServiceProxy.getInstance().getVoucher(commContext, voucherToken, true);
                                Result result = operation.mo38get();
                                if (result != null && result.isSuccessfulResponse() && result.getResponseJson() != null && result.getResponseJson().has("return") && result.getResponseJson().getJSONObject("return").has("state")) {
                                    if ("REDEEMED".equals(result.getResponseJson().getJSONObject("return").getString("state"))) {
                                        isRedeemed = true;
                                    }
                                }
                            } catch (Exception e) {
                                Logger.e(Area.REDEEM.value() | Area.OFFER.value(), "PackageMonitor: doOnReceive(): VoucherServiceProxy.getVoucher() failed", e);
                            }
                            if (!isRedeemed) {
                                NotificationsUtility.showRedeemReminderNotification(context);
                                Logger.d(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "PackageMonitor: doOnReceive(): voucher not redeemed, notification sent [token:'%1$s']", voucherToken));
                            } else {
                                Logger.d(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "PackageMonitor: doOnReceive(): voucher in redeemed state, no work to do [token:'%1$s']", voucherToken));
                            }
                        }
                    } else if (bundle == null || StringUtility.isNullOrEmpty(bundle.getString(OPERATION_KEY_USAGE_TRACKING))) {
                        String action = intent.getAction();
                        boolean replacing = intent.getBooleanExtra("android.intent.extra.REPLACING", false);
                        if (!replacing && action != null && ("android.intent.action.PACKAGE_ADDED".equals(action) || "android.intent.action.PACKAGE_REMOVED".equals(action))) {
                            String packageName = Utility.getPackageNameFromBroadcastIntent(intent);
                            Logger.d(Area.EARN.value(), String.format(Locale.US, "PackageMonitor: doOnReceive(): [packageName:%1$s action:%2$s]", packageName, action));
                            if ("android.intent.action.PACKAGE_ADDED".equals(action)) {
                                checkForAndHandleManagedInstalls(context, packageName);
                                if (UsageManager.getInstance(context).isBackgroundSendEnabled()) {
                                    PackageEventManager.getInstance(context).logEvent(packageName, PackageEventManager.EventType.INSTALLED);
                                    PackageEventManager.getInstance(context).sendUnsyncedEvents(commContext);
                                    Logger.d(Area.USAGE.value(), "PackageMonitor: doOnReceive(): *** SENT APP EVENT DATA (INSTALLED) ***");
                                }
                            } else if ("android.intent.action.PACKAGE_REMOVED".equals(action) && UsageManager.getInstance(context).isBackgroundSendEnabled()) {
                                PackageEventManager.getInstance(context).logEvent(packageName, PackageEventManager.EventType.UNINSTALLED);
                                PackageEventManager.getInstance(context).sendUnsyncedEvents(commContext);
                                Logger.d(Area.USAGE.value(), "PackageMonitor: doOnReceive(): *** SENT APP EVENT DATA (UNINSTALLED) ***");
                            }
                        }
                    } else if (UsageManager.getInstance(context).isBackgroundSendEnabled()) {
                        AlarmsUtility.updateLastRunTimestampUsageReporting(context);
                        UsageReporter.getInstance(commContext).sendUnsyncedData();
                        PackageEventManager.getInstance(context).sendUnsyncedEvents(commContext);
                        InstallStateManager.getInstance(context).updateCurrentState();
                        InstallStateManager.getInstance(context).sendCurrentStateDeltas(commContext);
                        Logger.d(Area.USAGE.value(), "PackageMonitor: doOnReceive(): *** SENT USAGE AND STATE DATA ***");
                    }
                } finally {
                    EarningMonitor.getInstance(context).startMonitoring();
                    UsageMonitor.getInstance(context).startMonitoring();
                }
            } catch (AuthException e2) {
                Logger.e(Area.OS_ENTRY_POINT.value(), String.format(Locale.US, "PackageMonitor: doOnReceive() %1$s", e2.getMessage()));
            }
        } catch (Exception e3) {
            Logger.e(Area.OS_ENTRY_POINT.value() | Area.EARN.value() | Area.USAGE.value(), "PackageMonitor: doOnReceive(): failed", e3);
        } finally {
            Logger.d(Area.OS_ENTRY_POINT.value() | Area.EARN.value() | Area.USAGE.value(), "PackageMonitor: doOnReceive(): FINISHED");
        }
    }

    private void checkForAndHandleManagedInstalls(Context context, String packageName) {
        if (context == null) {
            throw new IllegalArgumentException("'context' cannot be NULL");
        }
        if (StringUtility.isNullOrEmpty(packageName)) {
            throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
        }
        Logger.d(Area.OS_ENTRY_POINT.value(), "PackageMonitor: checkForAndHandleManagedInstalls() START");
        try {
            EarnStateRecord appState = EarnStateDatabase.getInstance(context).getAppState(packageName);
            if (appState != null) {
                Logger.d(Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "PackageMonitor: checkForAndHandleManagedInstalls() Host app %1$s is managing an EARN related event for %2$s", context.getPackageName(), packageName));
                EarnStateDatabase.getInstance(context).updateStatus(packageName, EarnStateDatabase.Status.INSTALLED);
                EarningMonitor.getInstance(context).startMonitoring();
                EarningMonitor.getInstance(context).ensureAppMetadataOnEarnStateRecord(appState);
            }
            GooglePlayLaunchReason installReason = this._googlePlayLaunchCache.get(packageName);
            if (installReason != null && GooglePlayLaunchReason.REDEEM.equals(installReason)) {
                Logger.d(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "PackageMonitor: checkForAndHandleManagedInstalls() Host app %1$s is managing a REDEEM related event for %2$s", context.getPackageName(), packageName));
                NotificationsUtility.showRedeemReminderNotification(context);
                this._googlePlayLaunchCache.remove(packageName);
            }
        } catch (Exception e) {
            Logger.e(Area.OS_ENTRY_POINT.value(), "PackageMonitor: checkForAndHandleManagedInstalls() failed", e);
        } finally {
            Logger.d(Area.OS_ENTRY_POINT.value(), "PackageMonitor: checkForAndHandleManagedInstalls() DONE");
        }
    }

    private void runPendingEarnTransactionsAndCleanup(CommContext commContext) throws Exception {
        Logger.d(Area.EARN.value() | Area.TRANSACTION.value(), "PackageMonitor: runPendingEarnTransactionsAndCleanup()");
        TransactionManager transactionManager = new TransactionManager(this.mContext);
        transactionManager.runEarnAndManagedOfferTransactions(commContext);
        long timeoutInterval = Utility.convertMillSec(Long.parseLong(GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_DOWNLOAD_MATCH_TTL)));
        EarnStateDatabase.getInstance(commContext.getApplicationContext()).deleteOldRecords(timeoutInterval);
    }

    private boolean shouldRetryTransactions(Context context, CommContext commContext) {
        Logger.d(Area.EARN.value() | Area.TRANSACTION.value(), "PackageMonitor: shouldRetryTransactions()");
        if (commContext == null) {
            return false;
        }
        try {
            SharedPreferences prefs = context.getSharedPreferences("timestamp", 0);
            long currentTime = System.currentTimeMillis();
            long lastRetryTime = prefs.getLong(Constants.TRANSACTIONTIME, 0L);
            long delta = currentTime - lastRetryTime;
            long minimumDelta = Utility.convertMillSec(Long.parseLong(GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_TRANSACTION_FAIL_RETRY_INTERVAL)));
            Logger.d(Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "PackageMonitor: shouldRetryTransactions: [lastRetryTime: %1$d] [currentTime: %2$d] [delta: %3$d] [minimumDelta: %4$d]", Long.valueOf(lastRetryTime), Long.valueOf(currentTime), Long.valueOf(delta), Long.valueOf(minimumDelta)));
            if (delta >= minimumDelta) {
                prefs.edit().putLong(Constants.TRANSACTIONTIME, System.currentTimeMillis()).commit();
                return true;
            }
            return false;
        } catch (Exception e) {
            Logger.e(Area.EARN.value() | Area.TRANSACTION.value(), "PackageMonitor: shouldRetryTransactions() failed", e);
            return false;
        }
    }
}
