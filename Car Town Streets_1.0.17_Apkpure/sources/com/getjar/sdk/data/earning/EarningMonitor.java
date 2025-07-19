package com.getjar.sdk.data.earning;

import android.app.ActivityManager;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.os.ResultReceiver;
import com.getjar.sdk.comm.CommContext;
import com.getjar.sdk.comm.CommManager;
import com.getjar.sdk.comm.GetJarConfig;
import com.getjar.sdk.comm.Operation;
import com.getjar.sdk.comm.TransactionManager;
import com.getjar.sdk.comm.auth.ApplicationKeyDatabase;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.data.earning.EarnStateDatabase;
import com.getjar.sdk.exceptions.AuthException;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.rewards.GetJarService;
import com.getjar.sdk.utilities.Constants;
import com.getjar.sdk.utilities.NotificationsUtility;
import com.getjar.sdk.utilities.RewardUtility;
import com.getjar.sdk.utilities.StringUtility;
import com.getjar.sdk.utilities.SystemUtility;
import com.getjar.sdk.utilities.Utility;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.Future;
/* loaded from: classes.dex */
public class EarningMonitor {
    private static final long _EARNING_APP_INSTALL_NOTIFY_MILLISECONDS = 300000;
    private static final long _EARNING_APP_OPEN_NOTIFY_MILLISECONDS = 60000;
    private static final long _EARNING_APP_OPEN_TIMEOUT_MILLISECONDS = 86400000;
    private static volatile EarningMonitor _Instance = null;
    private final CommContext _commContext;
    private final Context _context;
    private final long _monitorIntervalInMilliseconds;
    private volatile EarningMonitoringThread _monitoringThread = null;
    private volatile boolean _exitMonitoringThread = false;
    private volatile Object _monitoringThreadLock = new Object();
    private volatile Object _startStopLock = new Object();
    private final Object _intervalWaitMonitor = new Object();

    private EarningMonitor(Context context) {
        this._context = context.getApplicationContext();
        this._commContext = getCommContext(context);
        this._monitorIntervalInMilliseconds = Utility.convertMillSec(Long.parseLong(GetJarConfig.getInstance(this._commContext, true).getDirectiveValue(GetJarConfig.KEY_EARN_ON_OPEN_MONITORING_INTERVAL)));
    }

    public static synchronized EarningMonitor getInstance(Context context) {
        EarningMonitor earningMonitor;
        synchronized (EarningMonitor.class) {
            if (_Instance == null) {
                _Instance = new EarningMonitor(context);
            }
            earningMonitor = _Instance;
        }
        return earningMonitor;
    }

    public boolean isMonitoring() {
        boolean z = false;
        synchronized (this._monitoringThreadLock) {
            if (this._monitoringThread != null) {
                if (!this._exitMonitoringThread) {
                    z = true;
                }
            }
        }
        return z;
    }

    public void startMonitoring() {
        synchronized (this._startStopLock) {
            if (this._monitorIntervalInMilliseconds <= 0) {
                Logger.v(Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Earning: EarningMonitor: skipping earning monitoring thread start due to a monitoring interval of %1$d", Long.valueOf(this._monitorIntervalInMilliseconds)));
                return;
            }
            Logger.v(Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Earning: EarningMonitor: starting earning monitoring thread with a monitoring interval of %1$d", Long.valueOf(this._monitorIntervalInMilliseconds)));
            synchronized (this._monitoringThreadLock) {
                if (this._monitoringThread == null) {
                    this._monitoringThread = new EarningMonitoringThread();
                    Logger.v(Area.EARN.value() | Area.TRANSACTION.value(), "Earning: EarningMonitor: earning monitoring thread [instantiated]");
                }
                this._exitMonitoringThread = false;
                try {
                    this._monitoringThread.start();
                    Logger.v(Area.EARN.value() | Area.TRANSACTION.value(), "Earning: EarningMonitor: earning monitoring thread [start() called]");
                } catch (IllegalThreadStateException e) {
                }
                EarningScreenReceiver.getInstance().registerReceiver(this._context);
                this._context.startService(new Intent(this._context, GetJarService.class));
                Logger.v(Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Earning: EarningMonitor: earning monitoring thread started [thread id: %1$d]", Long.valueOf(this._monitoringThread.getId())));
            }
        }
    }

    public void stopMonitoring() {
        EarningMonitoringThread threadReferenceCache;
        synchronized (this._startStopLock) {
            EarningMonitoringThread threadReferenceCache2 = null;
            try {
                synchronized (this._monitoringThreadLock) {
                    threadReferenceCache = this._monitoringThread;
                    this._exitMonitoringThread = true;
                    this._monitoringThread = null;
                }
                synchronized (this._intervalWaitMonitor) {
                    this._intervalWaitMonitor.notify();
                }
                if (threadReferenceCache != null) {
                    try {
                        threadReferenceCache.join(2000L);
                    } catch (Exception e) {
                        Logger.e(Area.EARN.value() | Area.TRANSACTION.value(), "Earning: EarningMonitor: join() failed", e);
                    }
                    threadReferenceCache.interrupt();
                }
                long value = Area.TRANSACTION.value() | Area.EARN.value();
                Locale locale = Locale.US;
                Object[] objArr = new Object[1];
                objArr[0] = threadReferenceCache != null ? Long.toString(threadReferenceCache.getId()) : "null";
                Logger.v(value, String.format(locale, "Earning: EarningMonitor: earning monitoring thread stopped [thread id: %1$s]", objArr));
            } catch (Exception e2) {
                Logger.e(Area.EARN.value() | Area.TRANSACTION.value(), "Earning: EarningMonitor: stopMonitoring() failed", e2);
                long value2 = Area.TRANSACTION.value() | Area.EARN.value();
                Locale locale2 = Locale.US;
                Object[] objArr2 = new Object[1];
                objArr2[0] = 0 != 0 ? Long.toString(threadReferenceCache2.getId()) : "null";
                Logger.v(value2, String.format(locale2, "Earning: EarningMonitor: earning monitoring thread stopped [thread id: %1$s]", objArr2));
            }
        }
    }

    public EarnStateRecord ensureAppMetadataOnEarnStateRecord(EarnStateRecord appState) {
        if (appState == null) {
            throw new IllegalArgumentException("'appState' cannot be NULL");
        }
        boolean doUpdate = false;
        Map<String, String> appMetaMap = null;
        EarnStateRecord returnRecord = appState;
        try {
            try {
                Map<String, String> appMetaMap2 = Utility.jsonArrayStringToMap(appState.getApplicationMetadata());
                Logger.d(Area.EARN.value(), String.format(Locale.US, "Earning: EarningMonitor: ensureAppMetadataOnEarnStateRecord() [packageName:'%1$s' metadataCount:%2$d]", appState.getPackageName(), Integer.valueOf(appMetaMap2.size())));
                if (!appMetaMap2.containsKey(Constants.META_DEVICE_PLATFORM) || !appMetaMap2.containsKey(Constants.META_DEVICE_PLATFORM_VERSION)) {
                    appMetaMap2.put(Constants.META_DEVICE_PLATFORM, "android");
                    appMetaMap2.put(Constants.META_DEVICE_PLATFORM_VERSION, Build.VERSION.RELEASE);
                    doUpdate = true;
                }
                if (!appMetaMap2.containsKey(Constants.META_PACKAGE_VERSION_CODE) || !appMetaMap2.containsKey(Constants.META_PACKAGE_VERSION_NAME)) {
                    PackageInfo packageInfo = null;
                    int tryCount = 0;
                    while (tryCount <= 3) {
                        try {
                            packageInfo = this._context.getPackageManager().getPackageInfo(appState.getPackageName(), 128);
                            break;
                        } catch (PackageManager.NameNotFoundException e) {
                            tryCount++;
                            if (tryCount <= 3) {
                                Thread.sleep(333L);
                            }
                        }
                    }
                    if (packageInfo == null) {
                        Logger.w(Area.EARN.value(), String.format(Locale.US, "Earning: EarningMonitor: ensureAppMetadataOnEarnStateRecord() [packageName: %1$s] Failed to get PackageInfo", appState.getPackageName()));
                    } else {
                        appMetaMap2.put(Constants.META_PACKAGE_VERSION_CODE, Integer.toString(packageInfo.versionCode));
                        appMetaMap2.put(Constants.META_PACKAGE_VERSION_NAME, packageInfo.versionName);
                        doUpdate = true;
                    }
                }
                if (doUpdate && appMetaMap2 != null) {
                    try {
                        if (appMetaMap2.size() > 0) {
                            String theAppMetadata = Utility.mapToJsonString(appMetaMap2);
                            if (!StringUtility.isNullOrEmpty(theAppMetadata)) {
                                EarnStateDatabase.getInstance(this._context).updateApplicationMetadata(appState.getPackageName(), theAppMetadata);
                                EarnStateRecord loadedRecord = EarnStateDatabase.getInstance(this._context).getAppState(appState.getPackageName());
                                if (loadedRecord != null) {
                                    returnRecord = loadedRecord;
                                }
                                Logger.d(Area.EARN.value(), String.format(Locale.US, "Earning: EarningMonitor: ensureAppMetadataOnEarnStateRecord() Application metadata update [packageName:'%1$s' metadata:'%2$s']", appState.getPackageName(), theAppMetadata));
                            }
                        }
                    } catch (Exception e2) {
                        Logger.e(Area.EARN.value(), "Earning: EarningMonitor: ensureAppMetadataOnEarnStateRecord() failed", e2);
                    }
                }
            } catch (Throwable th) {
                if (0 != 0 && 0 != 0) {
                    try {
                        if (appMetaMap.size() > 0) {
                            String theAppMetadata2 = Utility.mapToJsonString(null);
                            if (!StringUtility.isNullOrEmpty(theAppMetadata2)) {
                                EarnStateDatabase.getInstance(this._context).updateApplicationMetadata(appState.getPackageName(), theAppMetadata2);
                                if (EarnStateDatabase.getInstance(this._context).getAppState(appState.getPackageName()) != null) {
                                }
                                Logger.d(Area.EARN.value(), String.format(Locale.US, "Earning: EarningMonitor: ensureAppMetadataOnEarnStateRecord() Application metadata update [packageName:'%1$s' metadata:'%2$s']", appState.getPackageName(), theAppMetadata2));
                            }
                        }
                    } catch (Exception e3) {
                        Logger.e(Area.EARN.value(), "Earning: EarningMonitor: ensureAppMetadataOnEarnStateRecord() failed", e3);
                    }
                }
                throw th;
            }
        } catch (Exception e4) {
            Logger.e(Area.EARN.value(), "Earning: EarningMonitor: ensureAppMetadataOnEarnStateRecord() failed", e4);
            if (0 != 0 && 0 != 0) {
                try {
                    if (appMetaMap.size() > 0) {
                        String theAppMetadata3 = Utility.mapToJsonString(null);
                        if (!StringUtility.isNullOrEmpty(theAppMetadata3)) {
                            EarnStateDatabase.getInstance(this._context).updateApplicationMetadata(appState.getPackageName(), theAppMetadata3);
                            EarnStateRecord loadedRecord2 = EarnStateDatabase.getInstance(this._context).getAppState(appState.getPackageName());
                            if (loadedRecord2 != null) {
                                returnRecord = loadedRecord2;
                            }
                            Logger.d(Area.EARN.value(), String.format(Locale.US, "Earning: EarningMonitor: ensureAppMetadataOnEarnStateRecord() Application metadata update [packageName:'%1$s' metadata:'%2$s']", appState.getPackageName(), theAppMetadata3));
                        }
                    }
                } catch (Exception e5) {
                    Logger.e(Area.EARN.value(), "Earning: EarningMonitor: ensureAppMetadataOnEarnStateRecord() failed", e5);
                }
            }
        }
        return returnRecord;
    }

    /* loaded from: classes.dex */
    private class EarningMonitoringThread extends Thread {
        private EarningMonitoringThread() {
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            try {
                try {
                    Logger.d(Area.EARN.value() | Area.TRANSACTION.value() | Area.AUTH.value(), String.format(Locale.US, "Earning: EarningMonitor: EarningMonitoringThread: started [thread:%1$d]", Long.valueOf(Thread.currentThread().getId())));
                    List<ActivityManager.RunningTaskInfo> runningTasks = null;
                    List<String> openedPackageNames = new ArrayList<>();
                    AuthManager.initialize(EarningMonitor.this._context);
                    AuthManager.getInstance().waitOnAuth();
                    while (!EarningMonitor.this._exitMonitoringThread) {
                        try {
                            List<EarnStateRecord> appStates = EarnStateDatabase.getInstance(EarningMonitor.this._context).getAllDownloadedOrInstalledAppStates();
                            long recordCount = appStates.size();
                            if (recordCount <= 0) {
                                EarningMonitor.this._exitMonitoringThread = true;
                            } else {
                                Logger.d(Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Earning: EarningMonitor: EarningMonitoringThread: found %d packages", Integer.valueOf(appStates.size())));
                                openedPackageNames.clear();
                                long now = System.currentTimeMillis();
                                for (EarnStateRecord appState : appStates) {
                                    try {
                                        long age = now - appState.getTimestampCreated();
                                        long changeDelta = now - appState.getTimestampModified();
                                        if (age > 86400000) {
                                            Logger.d(Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Earning: EarningMonitor: EarningMonitoringThread: %s timed out", appState.getPackageName()));
                                            NotificationsUtility.clearInstallNotification(EarningMonitor.this._context, appState.getPackageName());
                                            NotificationsUtility.clearOpenNotification(EarningMonitor.this._context, appState.getPackageName());
                                            EarnStateDatabase.getInstance(EarningMonitor.this._context).updateNotificationState(appState.getPackageName(), EarnStateDatabase.NotificationState.DONE);
                                        } else if (changeDelta > 60000 && EarnStateDatabase.Status.INSTALLED.equals(appState.getStatus()) && appState.canShowOpenReminder()) {
                                            Logger.d(Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Earning: EarningMonitor: EarningMonitoringThread: %s showing open reminder notification", appState.getPackageName()));
                                            if (!NotificationsUtility.showOpenNotification(EarningMonitor.this._context, appState.getPackageName(), appState.getFriendlyName())) {
                                                Logger.d(Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Earning: EarningMonitor: EarningMonitoringThread: %s no-longer installed, push the install notification instead", appState.getPackageName()));
                                                NotificationsUtility.showInstallNotification(EarningMonitor.this._context, appState.getPackageName(), appState.getFriendlyName());
                                                EarnStateDatabase.getInstance(EarningMonitor.this._context).updateNotificationState(appState.getPackageName(), EarnStateDatabase.NotificationState.OPEN_REMINDER);
                                                NotificationsUtility.clearOpenNotification(EarningMonitor.this._context, appState.getPackageName());
                                            } else {
                                                EarnStateDatabase.getInstance(EarningMonitor.this._context).updateNotificationState(appState.getPackageName(), EarnStateDatabase.NotificationState.OPEN_REMINDER);
                                                NotificationsUtility.clearInstallNotification(EarningMonitor.this._context, appState.getPackageName());
                                            }
                                        } else if (changeDelta > EarningMonitor._EARNING_APP_INSTALL_NOTIFY_MILLISECONDS && EarnStateDatabase.Status.DOWNLOADED.equals(appState.getStatus()) && appState.canShowInstallReminder()) {
                                            Logger.d(Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Earning: EarningMonitor: EarningMonitoringThread: %s showing install reminder notification", appState.getPackageName()));
                                            NotificationsUtility.showInstallNotification(EarningMonitor.this._context, appState.getPackageName(), appState.getFriendlyName());
                                            EarnStateDatabase.getInstance(EarningMonitor.this._context).updateNotificationState(appState.getPackageName(), EarnStateDatabase.NotificationState.INSTALL_REMINDER);
                                            NotificationsUtility.clearOpenNotification(EarningMonitor.this._context, appState.getPackageName());
                                        }
                                    } catch (Exception e) {
                                        Logger.e(Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Earning: EarningMonitor: EarningMonitoringThread: failed timeout and notification processing for %1$s", appState.getPackageName()), e);
                                    }
                                }
                                EarnStateDatabase.getInstance(EarningMonitor.this._context).deleteOldRecords(86400000L);
                                List<EarnStateRecord> appStates2 = EarnStateDatabase.getInstance(EarningMonitor.this._context).getAllDownloadedOrInstalledAppStates();
                                Logger.d(Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Earning: EarningMonitor: EarningMonitoringThread: found %d packages after removing old records", Integer.valueOf(appStates2.size())));
                                openedPackageNames.addAll(SystemUtility.getRecentlyRunAppsFromOS(EarningMonitor.this._context));
                                if (RewardUtility.checkPermission(EarningMonitor.this._context, "android.permission.GET_TASKS")) {
                                    runningTasks = ((ActivityManager) EarningMonitor.this._context.getSystemService("activity")).getRunningTasks(100);
                                }
                                if (runningTasks != null) {
                                    for (ActivityManager.RunningTaskInfo taskInfo : runningTasks) {
                                        if (!openedPackageNames.contains(taskInfo.topActivity.getPackageName())) {
                                            openedPackageNames.add(taskInfo.topActivity.getPackageName());
                                        }
                                    }
                                }
                                if (openedPackageNames.size() > 0) {
                                    for (EarnStateRecord appState2 : appStates2) {
                                        try {
                                            String packageName = appState2.getPackageName();
                                            if (openedPackageNames.contains(packageName)) {
                                                Logger.d(Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Earning: EarningMonitor: EarningMonitoringThread: %s match found, processing OPEN", packageName));
                                                processOpenEvent(EarningMonitor.this._commContext, appState2);
                                            }
                                        } catch (Exception e2) {
                                            Logger.e(Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Earning: EarningMonitor: EarningMonitoringThread: failed OPEN processing for %1$s", appState2.getPackageName()), e2);
                                        }
                                    }
                                }
                                runningTasks = null;
                                if (!EarningMonitor.this._exitMonitoringThread) {
                                    synchronized (EarningMonitor.this._intervalWaitMonitor) {
                                        EarningMonitor.this._intervalWaitMonitor.wait(EarningMonitor.this._monitorIntervalInMilliseconds);
                                    }
                                } else {
                                    continue;
                                }
                            }
                        } catch (AuthException e3) {
                            Logger.w(Area.EARN.value() | Area.TRANSACTION.value(), "Earning: EarningMonitor: EarningMonitoringThread: not yet authed");
                            try {
                                AuthManager.getInstance().reAuth();
                            } catch (AuthException e4) {
                            }
                        } catch (InterruptedException e5) {
                            Logger.d(Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Usage: UsageMonitor: UsageMonitoringThread: Received an InterruptedException [_exitMonitoringThread = %1$s]", Boolean.valueOf(EarningMonitor.this._exitMonitoringThread)));
                        }
                    }
                    synchronized (EarningMonitor.this._monitoringThreadLock) {
                        EarningMonitor.this._monitoringThread = null;
                    }
                    Logger.d(Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Earning: EarningMonitor: EarningMonitoringThread: exiting [thread:%1$d]", Long.valueOf(Thread.currentThread().getId())));
                } catch (Exception e6) {
                    Logger.e(Area.EARN.value() | Area.TRANSACTION.value(), "Earning: EarningMonitor: EarningMonitoringThread: run() failed", e6);
                    synchronized (EarningMonitor.this._monitoringThreadLock) {
                        EarningMonitor.this._monitoringThread = null;
                        Logger.d(Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Earning: EarningMonitor: EarningMonitoringThread: exiting [thread:%1$d]", Long.valueOf(Thread.currentThread().getId())));
                    }
                }
            } catch (Throwable th) {
                synchronized (EarningMonitor.this._monitoringThreadLock) {
                    EarningMonitor.this._monitoringThread = null;
                    Logger.d(Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Earning: EarningMonitor: EarningMonitoringThread: exiting [thread:%1$d]", Long.valueOf(Thread.currentThread().getId())));
                    throw th;
                }
            }
        }

        private boolean processOpenEvent(CommContext commContext, EarnStateRecord appState) {
            if (commContext == null) {
                throw new IllegalArgumentException("commContext cannot be null");
            }
            if (appState == null) {
                throw new IllegalArgumentException("appState cannot be null");
            }
            boolean result = false;
            try {
                EarnStateRecord appState2 = EarningMonitor.this.ensureAppMetadataOnEarnStateRecord(appState);
                Future<Operation> operation = EarningMonitor.this.earn(EarningMonitor.this._context, commContext, appState2);
                if (operation == null || operation.get() == null || operation.get().getResult() == null || !operation.get().getResult().isSuccessfulResponse()) {
                    Logger.w(Area.EARN.value() | Area.TRANSACTION.value(), "Earning: EarningMonitor: EarningMonitoringThread: processOpenEvent() earn operation failed");
                }
                result = true;
                EarnStateDatabase.getInstance(EarningMonitor.this._context).updateStatus(appState2.getPackageName(), EarnStateDatabase.Status.OPENED);
                return true;
            } catch (Exception e) {
                Logger.e(Area.EARN.value() | Area.TRANSACTION.value(), "Earning: EarningMonitor: EarningMonitoringThread: processOpenEvent() failed", e);
                return result;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Future<Operation> earn(Context context, CommContext commContext, EarnStateRecord appState) throws Exception {
        HashMap<String, String> trackingMetadata;
        HashMap<String, String> appMetadata;
        if (context == null) {
            throw new IllegalArgumentException("'context' cannot be NULL");
        }
        if (commContext == null) {
            throw new IllegalArgumentException("'commContext' cannot be NULL");
        }
        if (appState == null) {
            throw new IllegalArgumentException("'appState' cannot be NULL");
        }
        Logger.d(Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Earning: EarningMonitor: earn() for: %1$s", appState.toString()));
        new HashMap();
        new HashMap();
        if (!StringUtility.isNullOrEmpty(appState.getTrackingMetadata()) && (appState.getTrackingMetadata().startsWith("[{\"key\":") || appState.getTrackingMetadata().startsWith("[{\"value\":"))) {
            trackingMetadata = Utility.jsonArrayStringToMap(appState.getTrackingMetadata());
        } else {
            trackingMetadata = Utility.jsonArrayStringToMapUnchange(appState.getTrackingMetadata());
        }
        if (!StringUtility.isNullOrEmpty(appState.getApplicationMetadata()) && (appState.getApplicationMetadata().startsWith("[{\"key\":") || appState.getApplicationMetadata().startsWith("[{\"value\":"))) {
            appMetadata = Utility.jsonArrayStringToMap(appState.getApplicationMetadata());
        } else {
            appMetadata = Utility.jsonArrayStringToMapUnchange(appState.getApplicationMetadata());
        }
        String itemId = appMetadata.get(Constants.META_ITEM_ID);
        String clientTransactionId = appState.getClientTransactionId();
        Logger.d(Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Earning: EarningMonitor: earn() Sending Earn transaction for %1$s [clientTransactionId: %2$s]", appState.getPackageName(), clientTransactionId));
        TransactionManager transactionManager = new TransactionManager(context);
        Future<Operation> operation = transactionManager.runEarnTransaction(clientTransactionId, commContext, itemId, appState.getPackageName(), appMetadata, trackingMetadata);
        operation.get();
        return operation;
    }

    private CommContext getCommContext(Context context) {
        if (context == null) {
            throw new IllegalArgumentException("context cannot be null");
        }
        String applicationKey = ApplicationKeyDatabase.getInstance(context).getApplicationKey();
        if (StringUtility.isNullOrEmpty(applicationKey)) {
            throw new IllegalStateException("Unable to access the application key");
        }
        CommContext commContext = CommManager.createContext(applicationKey, context, new ResultReceiver(null) { // from class: com.getjar.sdk.data.earning.EarningMonitor.1
            @Override // android.os.ResultReceiver
            protected void onReceiveResult(int resultCode, Bundle resultData) {
                for (String key : resultData.keySet()) {
                    Logger.d(Area.EARN.value() | Area.AUTH.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Earning: EarningMonitor: Callback from the GetJar SDK [%1$s]", resultData.get(key).getClass().getName()));
                }
            }
        }, CommManager.LaunchWork.NONE);
        return commContext;
    }
}
