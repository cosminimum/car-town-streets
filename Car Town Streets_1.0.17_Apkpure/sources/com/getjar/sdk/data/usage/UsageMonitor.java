package com.getjar.sdk.data.usage;

import android.app.ActivityManager;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.ResultReceiver;
import com.getjar.sdk.comm.CommContext;
import com.getjar.sdk.comm.CommManager;
import com.getjar.sdk.comm.GetJarConfig;
import com.getjar.sdk.comm.auth.ApplicationKeyDatabase;
import com.getjar.sdk.data.usage.SessionEvent;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.rewards.GetJarService;
import com.getjar.sdk.utilities.AlarmsUtility;
import com.getjar.sdk.utilities.RewardUtility;
import com.getjar.sdk.utilities.StringUtility;
import com.getjar.sdk.utilities.Utility;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
/* loaded from: classes.dex */
public class UsageMonitor {
    private static final String _LAST_CHECK_TIME_FILE = "lastUsageCheckFile";
    private static final String _LAST_CHECK_TIME_KEY = "lastUsageCheckTime";
    private final CommContext _commContext;
    private final Context _context;
    private final long _monitorIntervalInMilliseconds;
    private final long _monitorTrackingIntervalInMilliseconds;
    private static volatile UsageMonitor _Instance = null;
    private static boolean _DebugHookSuppressMonitoring = false;
    private volatile UsageMonitoringThread _monitoringThread = null;
    private volatile MonitoringState _monitoringState = MonitoringState.STOPPED;
    private volatile boolean _requestThreadExit = false;
    private final Object _monitoringThreadLock = new Object();
    private final Object _startStopLock = new Object();
    private final Object _intervalWaitMonitor = new Object();
    private final Object _pausingMonitor = new Object();

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public enum MonitoringState {
        STARTING,
        STARTED,
        PAUSED,
        STOPPING,
        STOPPED
    }

    private UsageMonitor(Context context) {
        long j = 1;
        this._context = context.getApplicationContext();
        this._commContext = getCommContext(context);
        long monitorInterval = Utility.convertMillSec(Long.parseLong(GetJarConfig.getInstance(this._commContext, true).getDirectiveValue(GetJarConfig.KEY_USAGE_MONITORING_INTERVAL)));
        this._monitorIntervalInMilliseconds = monitorInterval <= 0 ? 1L : monitorInterval;
        long monitorTrackingInterval = Utility.convertMillSec(Long.parseLong(GetJarConfig.getInstance(this._commContext, true).getDirectiveValue(GetJarConfig.KEY_USAGE_MONITORING_TRACKING_INTERVAL)));
        this._monitorTrackingIntervalInMilliseconds = monitorTrackingInterval > 0 ? monitorTrackingInterval : j;
    }

    public static synchronized UsageMonitor getInstance(Context context) {
        UsageMonitor usageMonitor;
        synchronized (UsageMonitor.class) {
            if (_Instance == null) {
                _Instance = new UsageMonitor(context);
            }
            usageMonitor = _Instance;
        }
        return usageMonitor;
    }

    public boolean isMonitoring() {
        return (this._monitoringState == MonitoringState.STOPPED || this._monitoringState == MonitoringState.STOPPING) ? false : true;
    }

    public void startMonitoring() {
        synchronized (this._startStopLock) {
            if (UsageManager.getInstance(this._context).isMonitoringEnabled()) {
                if (UsageScreenReceiver.getInstance().isScreenOn(this._context)) {
                    if (!_DebugHookSuppressMonitoring) {
                        synchronized (this._monitoringThreadLock) {
                            long value = Area.USAGE.value();
                            Object[] objArr = new Object[1];
                            objArr[0] = this._monitoringThread == null ? "STOPPED" : "STARTED";
                            Logger.v(value, String.format("Start monitoring being attempted while in monitoring state '%1$s'", objArr));
                            if (this._monitoringState == MonitoringState.STOPPED) {
                                this._monitoringState = MonitoringState.STARTING;
                                this._monitoringThread = new UsageMonitoringThread();
                                Logger.v(Area.USAGE.value(), "UsageMonitor: usage monitoring thread [instantiated]");
                                this._requestThreadExit = false;
                                this._monitoringThread.start();
                                Logger.v(Area.USAGE.value(), "UsageMonitor: usage monitoring thread [start() called]");
                            } else {
                                Logger.v(Area.USAGE.value(), String.format("Start monitoring found monitoring already running on thread '%1$d'", Long.valueOf(this._monitoringThread.getId())));
                            }
                            UsageScreenReceiver.getInstance().registerReceiver(this._context);
                            this._context.startService(new Intent(this._context, GetJarService.class));
                            Logger.v(Area.USAGE.value(), String.format(Locale.US, "UsageMonitor: usage monitoring thread started [thread id: %1$d]", Long.valueOf(this._monitoringThread.getId())));
                        }
                    }
                }
            }
        }
    }

    public void stopMonitoring() {
        synchronized (this._startStopLock) {
            UsageMonitoringThread monitoringThreadRef = null;
            try {
                synchronized (this._monitoringThreadLock) {
                    long value = Area.USAGE.value();
                    Object[] objArr = new Object[1];
                    objArr[0] = this._monitoringThread == null ? "STOPPED" : "STARTED";
                    Logger.v(value, String.format("Stop monitoring being attempted while inmonitoring state '%1$s'", objArr));
                    if (this._monitoringState == MonitoringState.STARTED || this._monitoringState == MonitoringState.PAUSED) {
                        this._monitoringState = MonitoringState.STOPPING;
                        monitoringThreadRef = this._monitoringThread;
                        this._requestThreadExit = true;
                        this._monitoringThread = null;
                        synchronized (this._intervalWaitMonitor) {
                            this._intervalWaitMonitor.notify();
                        }
                        synchronized (this._pausingMonitor) {
                            this._pausingMonitor.notify();
                        }
                        Logger.v(Area.USAGE.value(), String.format("Stop monitoring stopping monitoring on thread '%1$d'", Long.valueOf(monitoringThreadRef.getId())));
                    } else {
                        Logger.v(Area.USAGE.value(), "Stop monitoring found monitoring already stopped");
                    }
                }
                if (monitoringThreadRef != null) {
                    long startTime = System.nanoTime();
                    try {
                        monitoringThreadRef.join(2000L);
                    } catch (Exception e) {
                        Logger.e(Area.USAGE.value(), "UsageMonitor: join() failed", e);
                    }
                    Logger.v(Area.USAGE.value(), String.format(Locale.US, "UsageMonitor: stopMonitoring() join on monitoring thread took %1$,.2f ms.", Double.valueOf((System.nanoTime() - startTime) / 1000000.0d)));
                    monitoringThreadRef.interrupt();
                    try {
                        monitoringThreadRef.join(2000L);
                    } catch (Exception e2) {
                        Logger.e(Area.USAGE.value(), "UsageMonitor: join() failed yet again", e2);
                    }
                }
                long value2 = Area.USAGE.value();
                Locale locale = Locale.US;
                Object[] objArr2 = new Object[1];
                objArr2[0] = monitoringThreadRef != null ? Long.toString(monitoringThreadRef.getId()) : "null";
                Logger.v(value2, String.format(locale, "UsageMonitor: usage monitoring thread stopped [thread id: %1$s]", objArr2));
            } catch (Exception e3) {
                Logger.e(Area.USAGE.value(), "UsageMonitor: stopMonitoring() failed", e3);
                long value3 = Area.USAGE.value();
                Locale locale2 = Locale.US;
                Object[] objArr3 = new Object[1];
                objArr3[0] = 0 != 0 ? Long.toString(monitoringThreadRef.getId()) : "null";
                Logger.v(value3, String.format(locale2, "UsageMonitor: usage monitoring thread stopped [thread id: %1$s]", objArr3));
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class UsageMonitoringThread extends Thread {
        private UsageMonitoringThread() {
        }

        /* JADX WARN: Finally extract failed */
        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            try {
                try {
                    UsageMonitor.this._monitoringState = MonitoringState.STARTED;
                    Logger.d(Area.USAGE.value(), String.format(Locale.US, "UsageMonitor: UsageMonitoringThread: started [thread:%1$d]", Long.valueOf(Thread.currentThread().getId())));
                    UsageManager usageManager = UsageManager.getInstance(UsageMonitor.this._context);
                    UsageDatabase usageDB = UsageDatabase.getInstance(UsageMonitor.this._context);
                    long lastCheckTime = 0;
                    try {
                        SharedPreferences prefs = UsageMonitor.this._context.getSharedPreferences(UsageMonitor._LAST_CHECK_TIME_FILE, 0);
                        lastCheckTime = prefs.getLong(UsageMonitor._LAST_CHECK_TIME_KEY, 0L);
                    } catch (Exception e) {
                        Logger.e(Area.USAGE.value(), "UsageMonitor: UsageMonitoringThread: SharedPreferences read failed", e);
                    }
                    try {
                        usageManager.closeAllOpenAppSessions(SessionEvent.Reason.THREAD_START, null, lastCheckTime);
                    } catch (Exception e2) {
                        Logger.e(Area.USAGE.value(), "UsageMonitor: UsageMonitoringThread: failed to close open app sessions.", e2);
                    }
                    try {
                        usageDB.phoneSessionStop(SessionEvent.Reason.THREAD_START, null, lastCheckTime);
                    } catch (Exception e3) {
                        Logger.e(Area.USAGE.value(), "UsageMonitor: UsageMonitoringThread: failed to close open phone sessions.", e3);
                    }
                    updateLastChecked();
                    String phoneSessionId = usageDB.getNewPhoneSessionID();
                    usageDB.phoneSessionStart(SessionEvent.Reason.THREAD_START, null, phoneSessionId);
                    long trackingTimeBuffer = 0;
                    boolean exitingDueToException = false;
                    Exception exitingException = null;
                    while (!UsageMonitor.this._requestThreadExit) {
                        try {
                            try {
                                long loopStart = System.currentTimeMillis();
                                try {
                                    try {
                                        if (!UsageScreenReceiver.getInstance().isScreenOn(UsageMonitor.this._context)) {
                                            Logger.e(Area.USAGE.value(), "UsageMonitor: UsageMonitoringThread: exiting because the screen is not on");
                                            UsageMonitor.this._requestThreadExit = true;
                                            trackingTimeBuffer += System.currentTimeMillis() - loopStart;
                                            if (trackingTimeBuffer >= UsageMonitor.this._monitorTrackingIntervalInMilliseconds) {
                                                trackingTimeBuffer = 0;
                                                updateLastChecked();
                                                try {
                                                    AlarmsUtility.startBackgroundReporting(UsageMonitor.this._commContext, GetJarConfig.getInstance(UsageMonitor.this._commContext, false));
                                                } catch (Exception e4) {
                                                    Logger.w(Area.USAGE.value(), "Error in AlarmUtility.startBackgroundReporting", e4);
                                                }
                                                try {
                                                    usageDB.purgeSyncedClosedEntries();
                                                } catch (Exception e5) {
                                                    Logger.w(Area.USAGE.value(), "Error in purgeSyncedClosedEntries", e5);
                                                }
                                            }
                                        } else {
                                            List<String> runningPackageNames = UsageMonitor.this.getRunningPackageNames();
                                            Logger.v(Area.USAGE.value(), String.format(Locale.US, "UsageMonitor: UsageMonitoringThread: looking at %1$d most recently run apps", Integer.valueOf(runningPackageNames.size())));
                                            ApplicationLists openPackageNameLists = usageDB.appSessionLoadOpenStartLists();
                                            Logger.v(Area.USAGE.value(), String.format(Locale.US, "UsageMonitor: UsageMonitoringThread: %1$d new open app sessions, %2$d old open app sessions", Integer.valueOf(openPackageNameLists.getNewNonDisposedStart().size()), Integer.valueOf(openPackageNameLists.getOldNonDisposedStart().size())));
                                            for (ApplicationSessionEvent appSessionEvent : openPackageNameLists.getOldNonDisposedStart()) {
                                                usageManager.stopAppSession(appSessionEvent, SessionEvent.Reason.THREAD_APP_DETECTION, null);
                                            }
                                            for (ApplicationSessionEvent appSessionEvent2 : openPackageNameLists.getNewNonDisposedStart()) {
                                                if (!runningPackageNames.contains(appSessionEvent2.getPackageName()) && !openPackageNameLists.getOldNonDisposedStart().contains(appSessionEvent2.getPackageName())) {
                                                    usageManager.stopAppSession(appSessionEvent2, SessionEvent.Reason.THREAD_APP_DETECTION, null);
                                                }
                                            }
                                            List<String> openStartPackageNames = usageDB.appSessionLoadOpenStartPackageNames();
                                            for (String packageName : runningPackageNames) {
                                                if (!openStartPackageNames.contains(packageName)) {
                                                    String newAppSessionId = usageDB.getNewApplicationSessionID();
                                                    usageManager.startAppSession(packageName, SessionEvent.Reason.THREAD_APP_DETECTION, null, phoneSessionId, newAppSessionId);
                                                }
                                            }
                                            if (!UsageMonitor.this._requestThreadExit) {
                                                synchronized (UsageMonitor.this._intervalWaitMonitor) {
                                                    UsageMonitor.this._intervalWaitMonitor.wait(UsageMonitor.this._monitorIntervalInMilliseconds);
                                                }
                                            }
                                            trackingTimeBuffer += System.currentTimeMillis() - loopStart;
                                            if (trackingTimeBuffer >= UsageMonitor.this._monitorTrackingIntervalInMilliseconds) {
                                                trackingTimeBuffer = 0;
                                                updateLastChecked();
                                                try {
                                                    AlarmsUtility.startBackgroundReporting(UsageMonitor.this._commContext, GetJarConfig.getInstance(UsageMonitor.this._commContext, false));
                                                } catch (Exception e6) {
                                                    Logger.w(Area.USAGE.value(), "Error in AlarmUtility.startBackgroundReporting", e6);
                                                }
                                                try {
                                                    usageDB.purgeSyncedClosedEntries();
                                                } catch (Exception e7) {
                                                    Logger.w(Area.USAGE.value(), "Error in purgeSyncedClosedEntries", e7);
                                                }
                                            }
                                        }
                                    } catch (InterruptedException e8) {
                                        Logger.d(Area.USAGE.value(), String.format(Locale.US, "UsageMonitor: UsageMonitoringThread: Received an InterruptedException [_exitMonitoringThread = %1$s]", Boolean.valueOf(UsageMonitor.this._requestThreadExit)));
                                        trackingTimeBuffer += System.currentTimeMillis() - loopStart;
                                        if (trackingTimeBuffer >= UsageMonitor.this._monitorTrackingIntervalInMilliseconds) {
                                            trackingTimeBuffer = 0;
                                            updateLastChecked();
                                            try {
                                                AlarmsUtility.startBackgroundReporting(UsageMonitor.this._commContext, GetJarConfig.getInstance(UsageMonitor.this._commContext, false));
                                            } catch (Exception e9) {
                                                Logger.w(Area.USAGE.value(), "Error in AlarmUtility.startBackgroundReporting", e9);
                                            }
                                            try {
                                                usageDB.purgeSyncedClosedEntries();
                                            } catch (Exception e10) {
                                                Logger.w(Area.USAGE.value(), "Error in purgeSyncedClosedEntries", e10);
                                            }
                                        }
                                    }
                                } catch (Throwable th) {
                                    if (trackingTimeBuffer + (System.currentTimeMillis() - loopStart) >= UsageMonitor.this._monitorTrackingIntervalInMilliseconds) {
                                        updateLastChecked();
                                        try {
                                            AlarmsUtility.startBackgroundReporting(UsageMonitor.this._commContext, GetJarConfig.getInstance(UsageMonitor.this._commContext, false));
                                        } catch (Exception e11) {
                                            Logger.w(Area.USAGE.value(), "Error in AlarmUtility.startBackgroundReporting", e11);
                                        }
                                        try {
                                            usageDB.purgeSyncedClosedEntries();
                                        } catch (Exception e12) {
                                            Logger.w(Area.USAGE.value(), "Error in purgeSyncedClosedEntries", e12);
                                        }
                                    }
                                    throw th;
                                }
                            } catch (Exception e13) {
                                exitingDueToException = true;
                                exitingException = e13;
                                throw e13;
                            }
                        } catch (Throwable th2) {
                            SessionEvent.Reason reason = exitingDueToException ? SessionEvent.Reason.THREAD_EXCEPTION : SessionEvent.Reason.THREAD_EXIT;
                            String reasonDetails = null;
                            if (exitingException != null) {
                                reasonDetails = Logger.getThrowableDump(exitingException);
                            }
                            try {
                                usageManager.closeAllOpenAppSessions(reason, null, System.currentTimeMillis());
                            } catch (Exception e14) {
                                Logger.e(Area.USAGE.value(), "UsageMonitor: UsageMonitoringThread: failed to close all open app sessions.", e14);
                            }
                            try {
                                usageDB.phoneSessionStop(reason, reasonDetails, System.currentTimeMillis(), phoneSessionId);
                            } catch (Exception e15) {
                                Logger.e(Area.USAGE.value(), "UsageMonitor: UsageMonitoringThread: failed to close the phone session.", e15);
                            }
                            throw th2;
                        }
                    }
                    SessionEvent.Reason reason2 = 0 != 0 ? SessionEvent.Reason.THREAD_EXCEPTION : SessionEvent.Reason.THREAD_EXIT;
                    String reasonDetails2 = null;
                    if (0 != 0) {
                        reasonDetails2 = Logger.getThrowableDump(null);
                    }
                    try {
                        usageManager.closeAllOpenAppSessions(reason2, null, System.currentTimeMillis());
                    } catch (Exception e16) {
                        Logger.e(Area.USAGE.value(), "UsageMonitor: UsageMonitoringThread: failed to close all open app sessions.", e16);
                    }
                    try {
                        usageDB.phoneSessionStop(reason2, reasonDetails2, System.currentTimeMillis(), phoneSessionId);
                    } catch (Exception e17) {
                        Logger.e(Area.USAGE.value(), "UsageMonitor: UsageMonitoringThread: failed to close the phone session.", e17);
                    }
                    synchronized (UsageMonitor.this._monitoringThreadLock) {
                        UsageMonitor.this._monitoringState = MonitoringState.STOPPED;
                    }
                    Logger.d(Area.USAGE.value(), String.format(Locale.US, "UsageMonitor: UsageMonitoringThread: exiting [thread:%1$d]", Long.valueOf(Thread.currentThread().getId())));
                } catch (Exception e18) {
                    Logger.e(Area.USAGE.value(), "UsageMonitor: UsageMonitoringThread: run() failed", e18);
                    synchronized (UsageMonitor.this._monitoringThreadLock) {
                        UsageMonitor.this._monitoringState = MonitoringState.STOPPED;
                        Logger.d(Area.USAGE.value(), String.format(Locale.US, "UsageMonitor: UsageMonitoringThread: exiting [thread:%1$d]", Long.valueOf(Thread.currentThread().getId())));
                    }
                }
            } catch (Throwable th3) {
                synchronized (UsageMonitor.this._monitoringThreadLock) {
                    UsageMonitor.this._monitoringState = MonitoringState.STOPPED;
                    Logger.d(Area.USAGE.value(), String.format(Locale.US, "UsageMonitor: UsageMonitoringThread: exiting [thread:%1$d]", Long.valueOf(Thread.currentThread().getId())));
                    throw th3;
                }
            }
        }

        private void updateLastChecked() {
            try {
                SharedPreferences.Editor editor = UsageMonitor.this._context.getSharedPreferences(UsageMonitor._LAST_CHECK_TIME_FILE, 0).edit();
                editor.putLong(UsageMonitor._LAST_CHECK_TIME_KEY, System.currentTimeMillis()).commit();
                editor.commit();
                Logger.v(Area.USAGE.value(), "UsageMonitor: UsageMonitoringThread: updateLastChecked() updated");
            } catch (Exception e) {
                Logger.e(Area.USAGE.value(), "UsageMonitor: UsageMonitoringThread: updateLastChecked() failed", e);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public List<String> getRunningPackageNames() {
        List<ActivityManager.RunningTaskInfo> runningTasks;
        List<String> runningPackageNames = new ArrayList<>();
        if (RewardUtility.checkPermission(this._context, "android.permission.GET_TASKS") && (runningTasks = ((ActivityManager) this._context.getSystemService("activity")).getRunningTasks(1)) != null) {
            for (ActivityManager.RunningTaskInfo task : runningTasks) {
                if (!runningPackageNames.contains(task.topActivity.getPackageName())) {
                    runningPackageNames.add(task.topActivity.getPackageName());
                }
            }
        }
        return runningPackageNames;
    }

    private CommContext getCommContext(Context context) {
        if (context == null) {
            throw new IllegalArgumentException("context cannot be null");
        }
        String applicationKey = ApplicationKeyDatabase.getInstance(context).getApplicationKey();
        if (StringUtility.isNullOrEmpty(applicationKey)) {
            throw new IllegalStateException("Unable to access the application key");
        }
        CommContext commContext = CommManager.createContext(applicationKey, context, new ResultReceiver(null) { // from class: com.getjar.sdk.data.usage.UsageMonitor.1
            @Override // android.os.ResultReceiver
            protected void onReceiveResult(int resultCode, Bundle resultData) {
                for (String key : resultData.keySet()) {
                    Logger.d(Area.USAGE.value() | Area.AUTH.value() | Area.COMM.value(), String.format(Locale.US, "UsageMonitor: Callback from the GetJar SDK [%1$s]", resultData.get(key).getClass().getName()));
                }
            }
        }, CommManager.LaunchWork.NONE);
        return commContext;
    }
}
