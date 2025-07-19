package com.getjar.sdk.data.metadata;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.os.ResultReceiver;
import com.getjar.sdk.comm.CommContext;
import com.getjar.sdk.comm.CommManager;
import com.getjar.sdk.comm.GetJarConfig;
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

public class PackageMonitor extends BroadcastReceiver {
    public static final int MAX_EARN_RETRIES = 3;
    public static final String OPERATION_KEY_USAGE_TRACKING = "usageAndEventTracking";
    public static final String OPERATION_KEY_VOUCHER_REDEMPTION_CHECK = "voucherRedemptionCheck";
    public static int mEarnRetries = 0;
    private GooglePlayLaunchCachingManager _googlePlayLaunchCache = null;
    private Context mContext;

    public void onReceive(Context context, Intent intent) {
        Logger.m640d(Area.OS_ENTRY_POINT.value(), "PackageMonitor: onReceive(): START");
        final Context finalContext = context;
        final Intent finalIntent = intent;
        try {
            new Thread(new Runnable() {
                public void run() {
                    try {
                        PackageMonitor.this.doOnReceive(finalContext, finalIntent);
                    } catch (Exception e) {
                        Logger.m643e(Area.OS_ENTRY_POINT.value(), "PackageMonitor: onReceive() failed", e);
                    }
                }
            }, "PackageMonitor Worker Thread").start();
        } catch (Exception e) {
            Logger.m643e(Area.OS_ENTRY_POINT.value(), "PackageMonitor: onReceive() failed", e);
        }
    }

    /* access modifiers changed from: private */
    public void doOnReceive(Context context, Intent intent) {
        String str;
        try {
            Logger.m640d(Area.OS_ENTRY_POINT.value(), "PackageMonitor: doOnReceive(): START");
            if (context == null) {
                throw new IllegalArgumentException("'context' cannot be null");
            } else if (intent == null) {
                throw new IllegalArgumentException("'intent' cannot be null");
            } else {
                this.mContext = context;
                if (this._googlePlayLaunchCache == null) {
                    this._googlePlayLaunchCache = new GooglePlayLaunchCachingManager(context);
                }
                Utility.previousVersionCleanUp(context);
                String applicationKey = ApplicationKeyDatabase.getInstance(context).getApplicationKey();
                if (StringUtility.isNullOrEmpty(applicationKey)) {
                    Logger.m648w(Area.OS_ENTRY_POINT.value() | Area.EARN.value() | Area.USAGE.value(), "PackageMonitor: doOnReceive(): Unable to access the application key");
                    return;
                }
                CommContext commContext = CommManager.createContext(applicationKey, context, (ResultReceiver) new ResultReceiver((Handler) null) {
                    /* access modifiers changed from: protected */
                    public void onReceiveResult(int resultCode, Bundle resultData) {
                        for (String key : resultData.keySet()) {
                            Logger.m640d(Area.OS_ENTRY_POINT.value(), String.format(Locale.US, "PackageMonitor: Callback from the GetJar SDK [%1$s]", new Object[]{resultData.get(key).getClass().getName()}));
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
                            Logger.m640d(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "PackageMonitor: doOnReceive(): voucher redemption [token:'%1$s']", new Object[]{voucherToken}));
                            if (!StringUtility.isNullOrEmpty(voucherToken)) {
                                boolean isRedeemed = false;
                                Result result = VoucherServiceProxy.getInstance().getVoucher(commContext, voucherToken, true).get();
                                if (result != null && result.isSuccessfulResponse() && result.getResponseJson() != null && result.getResponseJson().has("return") && result.getResponseJson().getJSONObject("return").has("state") && "REDEEMED".equals(result.getResponseJson().getJSONObject("return").getString("state"))) {
                                    isRedeemed = true;
                                }
                                if (!isRedeemed) {
                                    NotificationsUtility.showRedeemReminderNotification(context);
                                    Logger.m640d(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "PackageMonitor: doOnReceive(): voucher not redeemed, notification sent [token:'%1$s']", new Object[]{voucherToken}));
                                } else {
                                    Logger.m640d(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "PackageMonitor: doOnReceive(): voucher in redeemed state, no work to do [token:'%1$s']", new Object[]{voucherToken}));
                                }
                            }
                        } else if (bundle == null || StringUtility.isNullOrEmpty(bundle.getString(OPERATION_KEY_USAGE_TRACKING))) {
                            String action = intent.getAction();
                            if (!intent.getBooleanExtra("android.intent.extra.REPLACING", false) && action != null && ("android.intent.action.PACKAGE_ADDED".equals(action) || "android.intent.action.PACKAGE_REMOVED".equals(action))) {
                                String packageName = Utility.getPackageNameFromBroadcastIntent(intent);
                                Logger.m640d(Area.EARN.value(), String.format(Locale.US, "PackageMonitor: doOnReceive(): [packageName:%1$s action:%2$s]", new Object[]{packageName, action}));
                                if ("android.intent.action.PACKAGE_ADDED".equals(action)) {
                                    checkForAndHandleManagedInstalls(context, packageName);
                                    if (UsageManager.getInstance(context).isBackgroundSendEnabled()) {
                                        PackageEventManager.getInstance(context).logEvent(packageName, PackageEventManager.EventType.INSTALLED);
                                        PackageEventManager.getInstance(context).sendUnsyncedEvents(commContext);
                                        Logger.m640d(Area.USAGE.value(), "PackageMonitor: doOnReceive(): *** SENT APP EVENT DATA (INSTALLED) ***");
                                    }
                                } else if ("android.intent.action.PACKAGE_REMOVED".equals(action) && UsageManager.getInstance(context).isBackgroundSendEnabled()) {
                                    PackageEventManager.getInstance(context).logEvent(packageName, PackageEventManager.EventType.UNINSTALLED);
                                    PackageEventManager.getInstance(context).sendUnsyncedEvents(commContext);
                                    Logger.m640d(Area.USAGE.value(), "PackageMonitor: doOnReceive(): *** SENT APP EVENT DATA (UNINSTALLED) ***");
                                }
                            }
                        } else if (UsageManager.getInstance(context).isBackgroundSendEnabled()) {
                            AlarmsUtility.updateLastRunTimestampUsageReporting(context);
                            UsageReporter.getInstance(commContext).sendUnsyncedData();
                            PackageEventManager.getInstance(context).sendUnsyncedEvents(commContext);
                            InstallStateManager.getInstance(context).updateCurrentState();
                            InstallStateManager.getInstance(context).sendCurrentStateDeltas(commContext);
                            Logger.m640d(Area.USAGE.value(), "PackageMonitor: doOnReceive(): *** SENT USAGE AND STATE DATA ***");
                        }
                    } catch (Exception e) {
                        Logger.m643e(Area.REDEEM.value() | Area.OFFER.value(), "PackageMonitor: doOnReceive(): VoucherServiceProxy.getVoucher() failed", e);
                    } catch (Throwable th) {
                        EarningMonitor.getInstance(context).startMonitoring();
                        UsageMonitor.getInstance(context).startMonitoring();
                        throw th;
                    }
                    EarningMonitor.getInstance(context).startMonitoring();
                    UsageMonitor.getInstance(context).startMonitoring();
                    Logger.m640d(Area.OS_ENTRY_POINT.value() | Area.EARN.value() | Area.USAGE.value(), "PackageMonitor: doOnReceive(): FINISHED");
                } catch (AuthException e2) {
                    Logger.m642e(Area.OS_ENTRY_POINT.value(), String.format(Locale.US, "PackageMonitor: doOnReceive() %1$s", new Object[]{e2.getMessage()}));
                    Logger.m640d(Area.OS_ENTRY_POINT.value() | Area.EARN.value() | Area.USAGE.value(), "PackageMonitor: doOnReceive(): FINISHED");
                }
            }
        } catch (Exception e3) {
            Logger.m643e(Area.OS_ENTRY_POINT.value() | Area.EARN.value() | Area.USAGE.value(), "PackageMonitor: doOnReceive(): failed", e3);
        } finally {
            str = "PackageMonitor: doOnReceive(): FINISHED";
            Logger.m640d(Area.OS_ENTRY_POINT.value() | Area.EARN.value() | Area.USAGE.value(), str);
        }
    }

    private void checkForAndHandleManagedInstalls(Context context, String packageName) {
        String str;
        if (context == null) {
            throw new IllegalArgumentException("'context' cannot be NULL");
        } else if (StringUtility.isNullOrEmpty(packageName)) {
            throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
        } else {
            Logger.m640d(Area.OS_ENTRY_POINT.value(), "PackageMonitor: checkForAndHandleManagedInstalls() START");
            try {
                EarnStateRecord appState = EarnStateDatabase.getInstance(context).getAppState(packageName);
                if (appState != null) {
                    Logger.m640d(Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "PackageMonitor: checkForAndHandleManagedInstalls() Host app %1$s is managing an EARN related event for %2$s", new Object[]{context.getPackageName(), packageName}));
                    EarnStateDatabase.getInstance(context).updateStatus(packageName, EarnStateDatabase.Status.INSTALLED);
                    EarningMonitor.getInstance(context).startMonitoring();
                    EarnStateRecord appState2 = EarningMonitor.getInstance(context).ensureAppMetadataOnEarnStateRecord(appState);
                }
                GooglePlayLaunchReason installReason = this._googlePlayLaunchCache.get(packageName);
                if (installReason != null && GooglePlayLaunchReason.REDEEM.equals(installReason)) {
                    Logger.m640d(Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "PackageMonitor: checkForAndHandleManagedInstalls() Host app %1$s is managing a REDEEM related event for %2$s", new Object[]{context.getPackageName(), packageName}));
                    NotificationsUtility.showRedeemReminderNotification(context);
                    this._googlePlayLaunchCache.remove(packageName);
                }
            } catch (Exception e) {
                Logger.m643e(Area.OS_ENTRY_POINT.value(), "PackageMonitor: checkForAndHandleManagedInstalls() failed", e);
            } finally {
                str = "PackageMonitor: checkForAndHandleManagedInstalls() DONE";
                Logger.m640d(Area.OS_ENTRY_POINT.value(), str);
            }
        }
    }

    private void runPendingEarnTransactionsAndCleanup(CommContext commContext) throws Exception {
        Logger.m640d(Area.EARN.value() | Area.TRANSACTION.value(), "PackageMonitor: runPendingEarnTransactionsAndCleanup()");
        new TransactionManager(this.mContext).runEarnAndManagedOfferTransactions(commContext);
        EarnStateDatabase.getInstance(commContext.getApplicationContext()).deleteOldRecords(Utility.convertMillSec(Long.parseLong(GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_DOWNLOAD_MATCH_TTL))));
    }

    private boolean shouldRetryTransactions(Context context, CommContext commContext) {
        Logger.m640d(Area.EARN.value() | Area.TRANSACTION.value(), "PackageMonitor: shouldRetryTransactions()");
        if (commContext == null) {
            return false;
        }
        try {
            SharedPreferences prefs = context.getSharedPreferences("timestamp", 0);
            long currentTime = System.currentTimeMillis();
            long lastRetryTime = prefs.getLong(Constants.TRANSACTIONTIME, 0);
            long delta = currentTime - lastRetryTime;
            long minimumDelta = Utility.convertMillSec(Long.parseLong(GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_TRANSACTION_FAIL_RETRY_INTERVAL)));
            Logger.m640d(Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "PackageMonitor: shouldRetryTransactions: [lastRetryTime: %1$d] [currentTime: %2$d] [delta: %3$d] [minimumDelta: %4$d]", new Object[]{Long.valueOf(lastRetryTime), Long.valueOf(currentTime), Long.valueOf(delta), Long.valueOf(minimumDelta)}));
            if (delta < minimumDelta) {
                return false;
            }
            prefs.edit().putLong(Constants.TRANSACTIONTIME, System.currentTimeMillis()).commit();
            return true;
        } catch (Exception e) {
            Logger.m643e(Area.EARN.value() | Area.TRANSACTION.value(), "PackageMonitor: shouldRetryTransactions() failed", e);
            return false;
        }
    }
}
