package com.getjar.sdk.data.usage;

import android.app.ActivityManager;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.os.ResultReceiver;
import com.getjar.sdk.comm.CommContext;
import com.getjar.sdk.comm.CommManager;
import com.getjar.sdk.comm.GetJarConfig;
import com.getjar.sdk.comm.auth.ApplicationKeyDatabase;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.rewards.GetJarService;
import com.getjar.sdk.utilities.RewardUtility;
import com.getjar.sdk.utilities.StringUtility;
import com.getjar.sdk.utilities.Utility;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class UsageMonitor {
    private static boolean _DebugHookSuppressMonitoring = false;
    private static volatile UsageMonitor _Instance = null;
    private static final String _LAST_CHECK_TIME_FILE = "lastUsageCheckFile";
    private static final String _LAST_CHECK_TIME_KEY = "lastUsageCheckTime";
    /* access modifiers changed from: private */
    public final CommContext _commContext;
    /* access modifiers changed from: private */
    public final Context _context;
    /* access modifiers changed from: private */
    public final Object _intervalWaitMonitor = new Object();
    /* access modifiers changed from: private */
    public final long _monitorIntervalInMilliseconds;
    /* access modifiers changed from: private */
    public final long _monitorTrackingIntervalInMilliseconds;
    /* access modifiers changed from: private */
    public volatile MonitoringState _monitoringState = MonitoringState.STOPPED;
    private volatile UsageMonitoringThread _monitoringThread = null;
    /* access modifiers changed from: private */
    public final Object _monitoringThreadLock = new Object();
    private final Object _pausingMonitor = new Object();
    /* access modifiers changed from: private */
    public volatile boolean _requestThreadExit = false;
    private final Object _startStopLock = new Object();

    private enum MonitoringState {
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
        this._monitorIntervalInMilliseconds = monitorInterval <= 0 ? 1 : monitorInterval;
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
                                Logger.v(Area.USAGE.value(), String.format("Start monitoring found monitoring already running on thread '%1$d'", new Object[]{Long.valueOf(this._monitoringThread.getId())}));
                            }
                            UsageScreenReceiver.getInstance().registerReceiver(this._context);
                            this._context.startService(new Intent(this._context, GetJarService.class));
                            Logger.v(Area.USAGE.value(), String.format(Locale.US, "UsageMonitor: usage monitoring thread started [thread id: %1$d]", new Object[]{Long.valueOf(this._monitoringThread.getId())}));
                        }
                    }
                }
            }
        }
    }

    /*  JADX ERROR: IndexOutOfBoundsException in pass: RegionMakerVisitor
        java.lang.IndexOutOfBoundsException: Index: 0, Size: 0
        	at java.util.ArrayList.rangeCheck(ArrayList.java:659)
        	at java.util.ArrayList.get(ArrayList.java:435)
        	at jadx.core.dex.nodes.InsnNode.getArg(InsnNode.java:101)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:611)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverseMonitorExits(RegionMaker.java:619)
        	at jadx.core.dex.visitors.regions.RegionMaker.processMonitorEnter(RegionMaker.java:561)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverse(RegionMaker.java:133)
        	at jadx.core.dex.visitors.regions.RegionMaker.makeRegion(RegionMaker.java:86)
        	at jadx.core.dex.visitors.regions.RegionMaker.processMonitorEnter(RegionMaker.java:598)
        	at jadx.core.dex.visitors.regions.RegionMaker.traverse(RegionMaker.java:133)
        	at jadx.core.dex.visitors.regions.RegionMaker.makeRegion(RegionMaker.java:86)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:49)
        */
    public void stopMonitoring() {
        /*
            r15 = this;
            java.lang.Object r6 = r15._startStopLock
            monitor-enter(r6)
            r1 = 0
            java.lang.Object r5 = r15._monitoringThreadLock     // Catch:{ Exception -> 0x00d2 }
            monitor-enter(r5)     // Catch:{ Exception -> 0x00d2 }
            com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ all -> 0x00cf }
            long r7 = r4.value()     // Catch:{ all -> 0x00cf }
            java.lang.String r9 = "Stop monitoring being attempted while inmonitoring state '%1$s'"
            r4 = 1
            java.lang.Object[] r10 = new java.lang.Object[r4]     // Catch:{ all -> 0x00cf }
            r11 = 0
            com.getjar.sdk.data.usage.UsageMonitor$UsageMonitoringThread r4 = r15._monitoringThread     // Catch:{ all -> 0x00cf }
            if (r4 != 0) goto L_0x00c8
            java.lang.String r4 = "STOPPED"
        L_0x0019:
            r10[r11] = r4     // Catch:{ all -> 0x00cf }
            java.lang.String r4 = java.lang.String.format(r9, r10)     // Catch:{ all -> 0x00cf }
            com.getjar.sdk.logging.Logger.v(r7, r4)     // Catch:{ all -> 0x00cf }
            com.getjar.sdk.data.usage.UsageMonitor$MonitoringState r4 = r15._monitoringState     // Catch:{ all -> 0x00cf }
            com.getjar.sdk.data.usage.UsageMonitor$MonitoringState r7 = com.getjar.sdk.data.usage.UsageMonitor.MonitoringState.STARTED     // Catch:{ all -> 0x00cf }
            if (r4 == r7) goto L_0x002e
            com.getjar.sdk.data.usage.UsageMonitor$MonitoringState r4 = r15._monitoringState     // Catch:{ all -> 0x00cf }
            com.getjar.sdk.data.usage.UsageMonitor$MonitoringState r7 = com.getjar.sdk.data.usage.UsageMonitor.MonitoringState.PAUSED     // Catch:{ all -> 0x00cf }
            if (r4 != r7) goto L_0x0104
        L_0x002e:
            com.getjar.sdk.data.usage.UsageMonitor$MonitoringState r4 = com.getjar.sdk.data.usage.UsageMonitor.MonitoringState.STOPPING     // Catch:{ all -> 0x00cf }
            r15._monitoringState = r4     // Catch:{ all -> 0x00cf }
            com.getjar.sdk.data.usage.UsageMonitor$UsageMonitoringThread r1 = r15._monitoringThread     // Catch:{ all -> 0x00cf }
            r4 = 1
            r15._requestThreadExit = r4     // Catch:{ all -> 0x00cf }
            r4 = 0
            r15._monitoringThread = r4     // Catch:{ all -> 0x00cf }
            java.lang.Object r7 = r15._intervalWaitMonitor     // Catch:{ all -> 0x00cf }
            monitor-enter(r7)     // Catch:{ all -> 0x00cf }
            java.lang.Object r4 = r15._intervalWaitMonitor     // Catch:{ all -> 0x00cc }
            r4.notify()     // Catch:{ all -> 0x00cc }
            monitor-exit(r7)     // Catch:{ all -> 0x00cc }
            java.lang.Object r7 = r15._pausingMonitor     // Catch:{ all -> 0x00cf }
            monitor-enter(r7)     // Catch:{ all -> 0x00cf }
            java.lang.Object r4 = r15._pausingMonitor     // Catch:{ all -> 0x0101 }
            r4.notify()     // Catch:{ all -> 0x0101 }
            monitor-exit(r7)     // Catch:{ all -> 0x0101 }
            com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ all -> 0x00cf }
            long r7 = r4.value()     // Catch:{ all -> 0x00cf }
            java.lang.String r4 = "Stop monitoring stopping monitoring on thread '%1$d'"
            r9 = 1
            java.lang.Object[] r9 = new java.lang.Object[r9]     // Catch:{ all -> 0x00cf }
            r10 = 0
            long r11 = r1.getId()     // Catch:{ all -> 0x00cf }
            java.lang.Long r11 = java.lang.Long.valueOf(r11)     // Catch:{ all -> 0x00cf }
            r9[r10] = r11     // Catch:{ all -> 0x00cf }
            java.lang.String r4 = java.lang.String.format(r4, r9)     // Catch:{ all -> 0x00cf }
            com.getjar.sdk.logging.Logger.v(r7, r4)     // Catch:{ all -> 0x00cf }
        L_0x0069:
            monitor-exit(r5)     // Catch:{ all -> 0x00cf }
            if (r1 == 0) goto L_0x00a4
            long r2 = java.lang.System.nanoTime()     // Catch:{ Exception -> 0x00d2 }
            r4 = 2000(0x7d0, double:9.88E-321)
            r1.join(r4)     // Catch:{ Exception -> 0x0111 }
        L_0x0075:
            com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ Exception -> 0x00d2 }
            long r4 = r4.value()     // Catch:{ Exception -> 0x00d2 }
            java.util.Locale r7 = java.util.Locale.US     // Catch:{ Exception -> 0x00d2 }
            java.lang.String r8 = "UsageMonitor: stopMonitoring() join on monitoring thread took %1$,.2f ms."
            r9 = 1
            java.lang.Object[] r9 = new java.lang.Object[r9]     // Catch:{ Exception -> 0x00d2 }
            r10 = 0
            long r11 = java.lang.System.nanoTime()     // Catch:{ Exception -> 0x00d2 }
            long r11 = r11 - r2
            double r11 = (double) r11     // Catch:{ Exception -> 0x00d2 }
            r13 = 4696837146684686336(0x412e848000000000, double:1000000.0)
            double r11 = r11 / r13
            java.lang.Double r11 = java.lang.Double.valueOf(r11)     // Catch:{ Exception -> 0x00d2 }
            r9[r10] = r11     // Catch:{ Exception -> 0x00d2 }
            java.lang.String r7 = java.lang.String.format(r7, r8, r9)     // Catch:{ Exception -> 0x00d2 }
            com.getjar.sdk.logging.Logger.v(r4, r7)     // Catch:{ Exception -> 0x00d2 }
            r1.interrupt()     // Catch:{ Exception -> 0x00d2 }
            r4 = 2000(0x7d0, double:9.88E-321)
            r1.join(r4)     // Catch:{ Exception -> 0x0146 }
        L_0x00a4:
            com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ all -> 0x0143 }
            long r7 = r4.value()     // Catch:{ all -> 0x0143 }
            java.util.Locale r5 = java.util.Locale.US     // Catch:{ all -> 0x0143 }
            java.lang.String r9 = "UsageMonitor: usage monitoring thread stopped [thread id: %1$s]"
            r4 = 1
            java.lang.Object[] r10 = new java.lang.Object[r4]     // Catch:{ all -> 0x0143 }
            r11 = 0
            if (r1 == 0) goto L_0x0154
            long r12 = r1.getId()     // Catch:{ all -> 0x0143 }
            java.lang.String r4 = java.lang.Long.toString(r12)     // Catch:{ all -> 0x0143 }
        L_0x00bc:
            r10[r11] = r4     // Catch:{ all -> 0x0143 }
            java.lang.String r4 = java.lang.String.format(r5, r9, r10)     // Catch:{ all -> 0x0143 }
            com.getjar.sdk.logging.Logger.v(r7, r4)     // Catch:{ all -> 0x0143 }
            r1 = 0
        L_0x00c6:
            monitor-exit(r6)     // Catch:{ all -> 0x0143 }
            return
        L_0x00c8:
            java.lang.String r4 = "STARTED"
            goto L_0x0019
        L_0x00cc:
            r4 = move-exception
            monitor-exit(r7)     // Catch:{ all -> 0x00cc }
            throw r4     // Catch:{ all -> 0x00cf }
        L_0x00cf:
            r4 = move-exception
            monitor-exit(r5)     // Catch:{ all -> 0x00cf }
            throw r4     // Catch:{ Exception -> 0x00d2 }
        L_0x00d2:
            r0 = move-exception
            com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ all -> 0x011f }
            long r4 = r4.value()     // Catch:{ all -> 0x011f }
            java.lang.String r7 = "UsageMonitor: stopMonitoring() failed"
            com.getjar.sdk.logging.Logger.e(r4, r7, r0)     // Catch:{ all -> 0x011f }
            com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ all -> 0x0143 }
            long r7 = r4.value()     // Catch:{ all -> 0x0143 }
            java.util.Locale r5 = java.util.Locale.US     // Catch:{ all -> 0x0143 }
            java.lang.String r9 = "UsageMonitor: usage monitoring thread stopped [thread id: %1$s]"
            r4 = 1
            java.lang.Object[] r10 = new java.lang.Object[r4]     // Catch:{ all -> 0x0143 }
            r11 = 0
            if (r1 == 0) goto L_0x0158
            long r12 = r1.getId()     // Catch:{ all -> 0x0143 }
            java.lang.String r4 = java.lang.Long.toString(r12)     // Catch:{ all -> 0x0143 }
        L_0x00f6:
            r10[r11] = r4     // Catch:{ all -> 0x0143 }
            java.lang.String r4 = java.lang.String.format(r5, r9, r10)     // Catch:{ all -> 0x0143 }
            com.getjar.sdk.logging.Logger.v(r7, r4)     // Catch:{ all -> 0x0143 }
            r1 = 0
            goto L_0x00c6
        L_0x0101:
            r4 = move-exception
            monitor-exit(r7)     // Catch:{ all -> 0x0101 }
            throw r4     // Catch:{ all -> 0x00cf }
        L_0x0104:
            com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ all -> 0x00cf }
            long r7 = r4.value()     // Catch:{ all -> 0x00cf }
            java.lang.String r4 = "Stop monitoring found monitoring already stopped"
            com.getjar.sdk.logging.Logger.v(r7, r4)     // Catch:{ all -> 0x00cf }
            goto L_0x0069
        L_0x0111:
            r0 = move-exception
            com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ Exception -> 0x00d2 }
            long r4 = r4.value()     // Catch:{ Exception -> 0x00d2 }
            java.lang.String r7 = "UsageMonitor: join() failed"
            com.getjar.sdk.logging.Logger.e(r4, r7, r0)     // Catch:{ Exception -> 0x00d2 }
            goto L_0x0075
        L_0x011f:
            r4 = move-exception
            com.getjar.sdk.logging.Area r5 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ all -> 0x0143 }
            long r7 = r5.value()     // Catch:{ all -> 0x0143 }
            java.util.Locale r9 = java.util.Locale.US     // Catch:{ all -> 0x0143 }
            java.lang.String r10 = "UsageMonitor: usage monitoring thread stopped [thread id: %1$s]"
            r5 = 1
            java.lang.Object[] r11 = new java.lang.Object[r5]     // Catch:{ all -> 0x0143 }
            r12 = 0
            if (r1 == 0) goto L_0x015b
            long r13 = r1.getId()     // Catch:{ all -> 0x0143 }
            java.lang.String r5 = java.lang.Long.toString(r13)     // Catch:{ all -> 0x0143 }
        L_0x0138:
            r11[r12] = r5     // Catch:{ all -> 0x0143 }
            java.lang.String r5 = java.lang.String.format(r9, r10, r11)     // Catch:{ all -> 0x0143 }
            com.getjar.sdk.logging.Logger.v(r7, r5)     // Catch:{ all -> 0x0143 }
            r1 = 0
            throw r4     // Catch:{ all -> 0x0143 }
        L_0x0143:
            r4 = move-exception
            monitor-exit(r6)     // Catch:{ all -> 0x0143 }
            throw r4
        L_0x0146:
            r0 = move-exception
            com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ Exception -> 0x00d2 }
            long r4 = r4.value()     // Catch:{ Exception -> 0x00d2 }
            java.lang.String r7 = "UsageMonitor: join() failed yet again"
            com.getjar.sdk.logging.Logger.e(r4, r7, r0)     // Catch:{ Exception -> 0x00d2 }
            goto L_0x00a4
        L_0x0154:
            java.lang.String r4 = "null"
            goto L_0x00bc
        L_0x0158:
            java.lang.String r4 = "null"
            goto L_0x00f6
        L_0x015b:
            java.lang.String r5 = "null"
            goto L_0x0138
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.usage.UsageMonitor.stopMonitoring():void");
    }

    private class UsageMonitoringThread extends Thread {
        private UsageMonitoringThread() {
        }

        /* JADX WARNING: Code restructure failed: missing block: B:236:?, code lost:
            return;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:52:0x011b, code lost:
            r15 = move-exception;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:54:?, code lost:
            com.getjar.sdk.logging.Logger.e(com.getjar.sdk.logging.Area.USAGE.value(), "UsageMonitor: UsageMonitoringThread: run() failed", r15);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:56:0x012f, code lost:
            monitor-enter(com.getjar.sdk.data.usage.UsageMonitor.access$900(r34.this$0));
         */
        /* JADX WARNING: Code restructure failed: missing block: B:59:?, code lost:
            com.getjar.sdk.data.usage.UsageMonitor.access$102(r34.this$0, com.getjar.sdk.data.usage.UsageMonitor.MonitoringState.STOPPED);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:61:0x013a, code lost:
            com.getjar.sdk.logging.Logger.d(com.getjar.sdk.logging.Area.USAGE.value(), java.lang.String.format(java.util.Locale.US, "UsageMonitor: UsageMonitoringThread: exiting [thread:%1$d]", new java.lang.Object[]{java.lang.Long.valueOf(java.lang.Thread.currentThread().getId())}));
         */
        /* JADX WARNING: Code restructure failed: missing block: B:65:0x016d, code lost:
            r4 = move-exception;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:67:0x0176, code lost:
            monitor-enter(com.getjar.sdk.data.usage.UsageMonitor.access$900(r34.this$0));
         */
        /* JADX WARNING: Code restructure failed: missing block: B:70:?, code lost:
            com.getjar.sdk.data.usage.UsageMonitor.access$102(r34.this$0, com.getjar.sdk.data.usage.UsageMonitor.MonitoringState.STOPPED);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:72:0x0181, code lost:
            com.getjar.sdk.logging.Logger.d(com.getjar.sdk.logging.Area.USAGE.value(), java.lang.String.format(java.util.Locale.US, "UsageMonitor: UsageMonitoringThread: exiting [thread:%1$d]", new java.lang.Object[]{java.lang.Long.valueOf(java.lang.Thread.currentThread().getId())}));
         */
        /* JADX WARNING: Code restructure failed: missing block: B:73:0x01ac, code lost:
            throw r4;
         */
        /* JADX WARNING: Failed to process nested try/catch */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public void run() {
            /*
                r34 = this;
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r4 = com.getjar.sdk.data.usage.UsageMonitor.this     // Catch:{ Exception -> 0x011b }
                com.getjar.sdk.data.usage.UsageMonitor$MonitoringState r5 = com.getjar.sdk.data.usage.UsageMonitor.MonitoringState.STARTED     // Catch:{ Exception -> 0x011b }
                com.getjar.sdk.data.usage.UsageMonitor.MonitoringState unused = r4._monitoringState = r5     // Catch:{ Exception -> 0x011b }
                com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ Exception -> 0x011b }
                long r4 = r4.value()     // Catch:{ Exception -> 0x011b }
                java.util.Locale r11 = java.util.Locale.US     // Catch:{ Exception -> 0x011b }
                java.lang.String r12 = "UsageMonitor: UsageMonitoringThread: started [thread:%1$d]"
                r13 = 1
                java.lang.Object[] r13 = new java.lang.Object[r13]     // Catch:{ Exception -> 0x011b }
                r30 = 0
                java.lang.Thread r31 = java.lang.Thread.currentThread()     // Catch:{ Exception -> 0x011b }
                long r31 = r31.getId()     // Catch:{ Exception -> 0x011b }
                java.lang.Long r31 = java.lang.Long.valueOf(r31)     // Catch:{ Exception -> 0x011b }
                r13[r30] = r31     // Catch:{ Exception -> 0x011b }
                java.lang.String r11 = java.lang.String.format(r11, r12, r13)     // Catch:{ Exception -> 0x011b }
                com.getjar.sdk.logging.Logger.d(r4, r11)     // Catch:{ Exception -> 0x011b }
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r4 = com.getjar.sdk.data.usage.UsageMonitor.this     // Catch:{ Exception -> 0x011b }
                android.content.Context r4 = r4._context     // Catch:{ Exception -> 0x011b }
                com.getjar.sdk.data.usage.UsageManager r2 = com.getjar.sdk.data.usage.UsageManager.getInstance(r4)     // Catch:{ Exception -> 0x011b }
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r4 = com.getjar.sdk.data.usage.UsageMonitor.this     // Catch:{ Exception -> 0x011b }
                android.content.Context r4 = r4._context     // Catch:{ Exception -> 0x011b }
                com.getjar.sdk.data.usage.UsageDatabase r8 = com.getjar.sdk.data.usage.UsageDatabase.getInstance(r4)     // Catch:{ Exception -> 0x011b }
                r20 = 0
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r4 = com.getjar.sdk.data.usage.UsageMonitor.this     // Catch:{ Exception -> 0x015f }
                android.content.Context r4 = r4._context     // Catch:{ Exception -> 0x015f }
                java.lang.String r5 = "lastUsageCheckFile"
                r11 = 0
                android.content.SharedPreferences r26 = r4.getSharedPreferences(r5, r11)     // Catch:{ Exception -> 0x015f }
                java.lang.String r4 = "lastUsageCheckTime"
                r11 = 0
                r0 = r26
                long r20 = r0.getLong(r4, r11)     // Catch:{ Exception -> 0x015f }
            L_0x0060:
                com.getjar.sdk.data.usage.SessionEvent$Reason r4 = com.getjar.sdk.data.usage.SessionEvent.Reason.THREAD_START     // Catch:{ Exception -> 0x01ad }
                r5 = 0
                r0 = r20
                r2.closeAllOpenAppSessions(r4, r5, r0)     // Catch:{ Exception -> 0x01ad }
            L_0x0068:
                com.getjar.sdk.data.usage.SessionEvent$Reason r4 = com.getjar.sdk.data.usage.SessionEvent.Reason.THREAD_START     // Catch:{ Exception -> 0x01bb }
                r5 = 0
                r0 = r20
                r8.phoneSessionStop(r4, r5, r0)     // Catch:{ Exception -> 0x01bb }
            L_0x0070:
                r34.updateLastChecked()     // Catch:{ Exception -> 0x011b }
                java.lang.String r6 = r8.getNewPhoneSessionID()     // Catch:{ Exception -> 0x011b }
                com.getjar.sdk.data.usage.SessionEvent$Reason r4 = com.getjar.sdk.data.usage.SessionEvent.Reason.THREAD_START     // Catch:{ Exception -> 0x011b }
                r5 = 0
                r8.phoneSessionStart(r4, r5, r6)     // Catch:{ Exception -> 0x011b }
                r28 = 0
                r16 = 0
                r17 = 0
            L_0x0083:
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r4 = com.getjar.sdk.data.usage.UsageMonitor.this     // Catch:{ Exception -> 0x00f8 }
                boolean r4 = r4._requestThreadExit     // Catch:{ Exception -> 0x00f8 }
                if (r4 != 0) goto L_0x03fa
                long r22 = java.lang.System.currentTimeMillis()     // Catch:{ Exception -> 0x00f8 }
                com.getjar.sdk.data.usage.UsageScreenReceiver r4 = com.getjar.sdk.data.usage.UsageScreenReceiver.getInstance()     // Catch:{ InterruptedException -> 0x0252 }
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r5 = com.getjar.sdk.data.usage.UsageMonitor.this     // Catch:{ InterruptedException -> 0x0252 }
                android.content.Context r5 = r5._context     // Catch:{ InterruptedException -> 0x0252 }
                boolean r4 = r4.isScreenOn(r5)     // Catch:{ InterruptedException -> 0x0252 }
                if (r4 != 0) goto L_0x01d7
                com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ InterruptedException -> 0x0252 }
                long r4 = r4.value()     // Catch:{ InterruptedException -> 0x0252 }
                java.lang.String r11 = "UsageMonitor: UsageMonitoringThread: exiting because the screen is not on"
                com.getjar.sdk.logging.Logger.e(r4, r11)     // Catch:{ InterruptedException -> 0x0252 }
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r4 = com.getjar.sdk.data.usage.UsageMonitor.this     // Catch:{ InterruptedException -> 0x0252 }
                r5 = 1
                boolean unused = r4._requestThreadExit = r5     // Catch:{ InterruptedException -> 0x0252 }
                long r4 = java.lang.System.currentTimeMillis()     // Catch:{ Exception -> 0x00f8 }
                long r4 = r4 - r22
                long r28 = r28 + r4
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r4 = com.getjar.sdk.data.usage.UsageMonitor.this     // Catch:{ Exception -> 0x00f8 }
                long r4 = r4._monitorTrackingIntervalInMilliseconds     // Catch:{ Exception -> 0x00f8 }
                int r4 = (r28 > r4 ? 1 : (r28 == r4 ? 0 : -1))
                if (r4 < 0) goto L_0x0083
                r28 = 0
                r34.updateLastChecked()     // Catch:{ Exception -> 0x00f8 }
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r4 = com.getjar.sdk.data.usage.UsageMonitor.this     // Catch:{ Exception -> 0x01c9 }
                com.getjar.sdk.comm.CommContext r4 = r4._commContext     // Catch:{ Exception -> 0x01c9 }
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r5 = com.getjar.sdk.data.usage.UsageMonitor.this     // Catch:{ Exception -> 0x01c9 }
                com.getjar.sdk.comm.CommContext r5 = r5._commContext     // Catch:{ Exception -> 0x01c9 }
                r11 = 0
                com.getjar.sdk.comm.GetJarConfig r5 = com.getjar.sdk.comm.GetJarConfig.getInstance(r5, r11)     // Catch:{ Exception -> 0x01c9 }
                com.getjar.sdk.utilities.AlarmsUtility.startBackgroundReporting(r4, r5)     // Catch:{ Exception -> 0x01c9 }
            L_0x00e7:
                r8.purgeSyncedClosedEntries()     // Catch:{ Exception -> 0x00eb }
                goto L_0x0083
            L_0x00eb:
                r15 = move-exception
                com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ Exception -> 0x00f8 }
                long r4 = r4.value()     // Catch:{ Exception -> 0x00f8 }
                java.lang.String r11 = "Error in purgeSyncedClosedEntries"
                com.getjar.sdk.logging.Logger.w(r4, r11, r15)     // Catch:{ Exception -> 0x00f8 }
                goto L_0x0083
            L_0x00f8:
                r15 = move-exception
                r16 = 1
                r17 = r15
                throw r15     // Catch:{ all -> 0x00fe }
            L_0x00fe:
                r4 = move-exception
                if (r16 == 0) goto L_0x046b
                com.getjar.sdk.data.usage.SessionEvent$Reason r9 = com.getjar.sdk.data.usage.SessionEvent.Reason.THREAD_EXCEPTION     // Catch:{ Exception -> 0x011b }
            L_0x0103:
                r10 = 0
                if (r17 == 0) goto L_0x010a
                java.lang.String r10 = com.getjar.sdk.logging.Logger.getThrowableDump(r17)     // Catch:{ Exception -> 0x011b }
            L_0x010a:
                r5 = 0
                long r11 = java.lang.System.currentTimeMillis()     // Catch:{ Exception -> 0x046f }
                r2.closeAllOpenAppSessions(r9, r5, r11)     // Catch:{ Exception -> 0x046f }
            L_0x0112:
                long r11 = java.lang.System.currentTimeMillis()     // Catch:{ Exception -> 0x047d }
                r13 = r6
                r8.phoneSessionStop(r9, r10, r11, r13)     // Catch:{ Exception -> 0x047d }
            L_0x011a:
                throw r4     // Catch:{ Exception -> 0x011b }
            L_0x011b:
                r15 = move-exception
                com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ all -> 0x016d }
                long r4 = r4.value()     // Catch:{ all -> 0x016d }
                java.lang.String r11 = "UsageMonitor: UsageMonitoringThread: run() failed"
                com.getjar.sdk.logging.Logger.e(r4, r11, r15)     // Catch:{ all -> 0x016d }
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r4 = com.getjar.sdk.data.usage.UsageMonitor.this
                java.lang.Object r5 = r4._monitoringThreadLock
                monitor-enter(r5)
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r4 = com.getjar.sdk.data.usage.UsageMonitor.this     // Catch:{ all -> 0x048e }
                com.getjar.sdk.data.usage.UsageMonitor$MonitoringState r11 = com.getjar.sdk.data.usage.UsageMonitor.MonitoringState.STOPPED     // Catch:{ all -> 0x048e }
                com.getjar.sdk.data.usage.UsageMonitor.MonitoringState unused = r4._monitoringState = r11     // Catch:{ all -> 0x048e }
                monitor-exit(r5)     // Catch:{ all -> 0x048e }
                com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.USAGE
                long r4 = r4.value()
                java.util.Locale r11 = java.util.Locale.US
                java.lang.String r12 = "UsageMonitor: UsageMonitoringThread: exiting [thread:%1$d]"
                r13 = 1
                java.lang.Object[] r13 = new java.lang.Object[r13]
                r30 = 0
                java.lang.Thread r31 = java.lang.Thread.currentThread()
                long r31 = r31.getId()
                java.lang.Long r31 = java.lang.Long.valueOf(r31)
                r13[r30] = r31
                java.lang.String r11 = java.lang.String.format(r11, r12, r13)
                com.getjar.sdk.logging.Logger.d(r4, r11)
            L_0x015e:
                return
            L_0x015f:
                r15 = move-exception
                com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ Exception -> 0x011b }
                long r4 = r4.value()     // Catch:{ Exception -> 0x011b }
                java.lang.String r11 = "UsageMonitor: UsageMonitoringThread: SharedPreferences read failed"
                com.getjar.sdk.logging.Logger.e(r4, r11, r15)     // Catch:{ Exception -> 0x011b }
                goto L_0x0060
            L_0x016d:
                r4 = move-exception
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r5 = com.getjar.sdk.data.usage.UsageMonitor.this
                java.lang.Object r5 = r5._monitoringThreadLock
                monitor-enter(r5)
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r11 = com.getjar.sdk.data.usage.UsageMonitor.this     // Catch:{ all -> 0x0491 }
                com.getjar.sdk.data.usage.UsageMonitor$MonitoringState r12 = com.getjar.sdk.data.usage.UsageMonitor.MonitoringState.STOPPED     // Catch:{ all -> 0x0491 }
                com.getjar.sdk.data.usage.UsageMonitor.MonitoringState unused = r11._monitoringState = r12     // Catch:{ all -> 0x0491 }
                monitor-exit(r5)     // Catch:{ all -> 0x0491 }
                com.getjar.sdk.logging.Area r5 = com.getjar.sdk.logging.Area.USAGE
                long r11 = r5.value()
                java.util.Locale r5 = java.util.Locale.US
                java.lang.String r13 = "UsageMonitor: UsageMonitoringThread: exiting [thread:%1$d]"
                r30 = 1
                r0 = r30
                java.lang.Object[] r0 = new java.lang.Object[r0]
                r30 = r0
                r31 = 0
                java.lang.Thread r32 = java.lang.Thread.currentThread()
                long r32 = r32.getId()
                java.lang.Long r32 = java.lang.Long.valueOf(r32)
                r30[r31] = r32
                r0 = r30
                java.lang.String r5 = java.lang.String.format(r5, r13, r0)
                com.getjar.sdk.logging.Logger.d(r11, r5)
                throw r4
            L_0x01ad:
                r15 = move-exception
                com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ Exception -> 0x011b }
                long r4 = r4.value()     // Catch:{ Exception -> 0x011b }
                java.lang.String r11 = "UsageMonitor: UsageMonitoringThread: failed to close open app sessions."
                com.getjar.sdk.logging.Logger.e(r4, r11, r15)     // Catch:{ Exception -> 0x011b }
                goto L_0x0068
            L_0x01bb:
                r15 = move-exception
                com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ Exception -> 0x011b }
                long r4 = r4.value()     // Catch:{ Exception -> 0x011b }
                java.lang.String r11 = "UsageMonitor: UsageMonitoringThread: failed to close open phone sessions."
                com.getjar.sdk.logging.Logger.e(r4, r11, r15)     // Catch:{ Exception -> 0x011b }
                goto L_0x0070
            L_0x01c9:
                r15 = move-exception
                com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ Exception -> 0x00f8 }
                long r4 = r4.value()     // Catch:{ Exception -> 0x00f8 }
                java.lang.String r11 = "Error in AlarmUtility.startBackgroundReporting"
                com.getjar.sdk.logging.Logger.w(r4, r11, r15)     // Catch:{ Exception -> 0x00f8 }
                goto L_0x00e7
            L_0x01d7:
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r4 = com.getjar.sdk.data.usage.UsageMonitor.this     // Catch:{ InterruptedException -> 0x0252 }
                java.util.List r27 = r4.getRunningPackageNames()     // Catch:{ InterruptedException -> 0x0252 }
                com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ InterruptedException -> 0x0252 }
                long r4 = r4.value()     // Catch:{ InterruptedException -> 0x0252 }
                java.util.Locale r11 = java.util.Locale.US     // Catch:{ InterruptedException -> 0x0252 }
                java.lang.String r12 = "UsageMonitor: UsageMonitoringThread: looking at %1$d most recently run apps"
                r13 = 1
                java.lang.Object[] r13 = new java.lang.Object[r13]     // Catch:{ InterruptedException -> 0x0252 }
                r30 = 0
                int r31 = r27.size()     // Catch:{ InterruptedException -> 0x0252 }
                java.lang.Integer r31 = java.lang.Integer.valueOf(r31)     // Catch:{ InterruptedException -> 0x0252 }
                r13[r30] = r31     // Catch:{ InterruptedException -> 0x0252 }
                java.lang.String r11 = java.lang.String.format(r11, r12, r13)     // Catch:{ InterruptedException -> 0x0252 }
                com.getjar.sdk.logging.Logger.v(r4, r11)     // Catch:{ InterruptedException -> 0x0252 }
                com.getjar.sdk.data.usage.ApplicationLists r24 = r8.appSessionLoadOpenStartLists()     // Catch:{ InterruptedException -> 0x0252 }
                com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ InterruptedException -> 0x0252 }
                long r4 = r4.value()     // Catch:{ InterruptedException -> 0x0252 }
                java.util.Locale r11 = java.util.Locale.US     // Catch:{ InterruptedException -> 0x0252 }
                java.lang.String r12 = "UsageMonitor: UsageMonitoringThread: %1$d new open app sessions, %2$d old open app sessions"
                r13 = 2
                java.lang.Object[] r13 = new java.lang.Object[r13]     // Catch:{ InterruptedException -> 0x0252 }
                r30 = 0
                java.util.List r31 = r24.getNewNonDisposedStart()     // Catch:{ InterruptedException -> 0x0252 }
                int r31 = r31.size()     // Catch:{ InterruptedException -> 0x0252 }
                java.lang.Integer r31 = java.lang.Integer.valueOf(r31)     // Catch:{ InterruptedException -> 0x0252 }
                r13[r30] = r31     // Catch:{ InterruptedException -> 0x0252 }
                r30 = 1
                java.util.List r31 = r24.getOldNonDisposedStart()     // Catch:{ InterruptedException -> 0x0252 }
                int r31 = r31.size()     // Catch:{ InterruptedException -> 0x0252 }
                java.lang.Integer r31 = java.lang.Integer.valueOf(r31)     // Catch:{ InterruptedException -> 0x0252 }
                r13[r30] = r31     // Catch:{ InterruptedException -> 0x0252 }
                java.lang.String r11 = java.lang.String.format(r11, r12, r13)     // Catch:{ InterruptedException -> 0x0252 }
                com.getjar.sdk.logging.Logger.v(r4, r11)     // Catch:{ InterruptedException -> 0x0252 }
                java.util.List r4 = r24.getOldNonDisposedStart()     // Catch:{ InterruptedException -> 0x0252 }
                java.util.Iterator r18 = r4.iterator()     // Catch:{ InterruptedException -> 0x0252 }
            L_0x023f:
                boolean r4 = r18.hasNext()     // Catch:{ InterruptedException -> 0x0252 }
                if (r4 == 0) goto L_0x02bd
                java.lang.Object r14 = r18.next()     // Catch:{ InterruptedException -> 0x0252 }
                com.getjar.sdk.data.usage.ApplicationSessionEvent r14 = (com.getjar.sdk.data.usage.ApplicationSessionEvent) r14     // Catch:{ InterruptedException -> 0x0252 }
                com.getjar.sdk.data.usage.SessionEvent$Reason r4 = com.getjar.sdk.data.usage.SessionEvent.Reason.THREAD_APP_DETECTION     // Catch:{ InterruptedException -> 0x0252 }
                r5 = 0
                r2.stopAppSession(r14, r4, r5)     // Catch:{ InterruptedException -> 0x0252 }
                goto L_0x023f
            L_0x0252:
                r19 = move-exception
                com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ all -> 0x02f2 }
                long r4 = r4.value()     // Catch:{ all -> 0x02f2 }
                java.util.Locale r11 = java.util.Locale.US     // Catch:{ all -> 0x02f2 }
                java.lang.String r12 = "UsageMonitor: UsageMonitoringThread: Received an InterruptedException [_exitMonitoringThread = %1$s]"
                r13 = 1
                java.lang.Object[] r13 = new java.lang.Object[r13]     // Catch:{ all -> 0x02f2 }
                r30 = 0
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r0 = com.getjar.sdk.data.usage.UsageMonitor.this     // Catch:{ all -> 0x02f2 }
                r31 = r0
                boolean r31 = r31._requestThreadExit     // Catch:{ all -> 0x02f2 }
                java.lang.Boolean r31 = java.lang.Boolean.valueOf(r31)     // Catch:{ all -> 0x02f2 }
                r13[r30] = r31     // Catch:{ all -> 0x02f2 }
                java.lang.String r11 = java.lang.String.format(r11, r12, r13)     // Catch:{ all -> 0x02f2 }
                com.getjar.sdk.logging.Logger.d(r4, r11)     // Catch:{ all -> 0x02f2 }
                long r4 = java.lang.System.currentTimeMillis()     // Catch:{ Exception -> 0x00f8 }
                long r4 = r4 - r22
                long r28 = r28 + r4
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r4 = com.getjar.sdk.data.usage.UsageMonitor.this     // Catch:{ Exception -> 0x00f8 }
                long r4 = r4._monitorTrackingIntervalInMilliseconds     // Catch:{ Exception -> 0x00f8 }
                int r4 = (r28 > r4 ? 1 : (r28 == r4 ? 0 : -1))
                if (r4 < 0) goto L_0x0083
                r28 = 0
                r34.updateLastChecked()     // Catch:{ Exception -> 0x00f8 }
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r4 = com.getjar.sdk.data.usage.UsageMonitor.this     // Catch:{ Exception -> 0x03d0 }
                com.getjar.sdk.comm.CommContext r4 = r4._commContext     // Catch:{ Exception -> 0x03d0 }
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r5 = com.getjar.sdk.data.usage.UsageMonitor.this     // Catch:{ Exception -> 0x03d0 }
                com.getjar.sdk.comm.CommContext r5 = r5._commContext     // Catch:{ Exception -> 0x03d0 }
                r11 = 0
                com.getjar.sdk.comm.GetJarConfig r5 = com.getjar.sdk.comm.GetJarConfig.getInstance(r5, r11)     // Catch:{ Exception -> 0x03d0 }
                com.getjar.sdk.utilities.AlarmsUtility.startBackgroundReporting(r4, r5)     // Catch:{ Exception -> 0x03d0 }
            L_0x02aa:
                r8.purgeSyncedClosedEntries()     // Catch:{ Exception -> 0x02af }
                goto L_0x0083
            L_0x02af:
                r15 = move-exception
                com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ Exception -> 0x00f8 }
                long r4 = r4.value()     // Catch:{ Exception -> 0x00f8 }
                java.lang.String r11 = "Error in purgeSyncedClosedEntries"
                com.getjar.sdk.logging.Logger.w(r4, r11, r15)     // Catch:{ Exception -> 0x00f8 }
                goto L_0x0083
            L_0x02bd:
                java.util.List r4 = r24.getNewNonDisposedStart()     // Catch:{ InterruptedException -> 0x0252 }
                java.util.Iterator r18 = r4.iterator()     // Catch:{ InterruptedException -> 0x0252 }
            L_0x02c5:
                boolean r4 = r18.hasNext()     // Catch:{ InterruptedException -> 0x0252 }
                if (r4 == 0) goto L_0x0328
                java.lang.Object r14 = r18.next()     // Catch:{ InterruptedException -> 0x0252 }
                com.getjar.sdk.data.usage.ApplicationSessionEvent r14 = (com.getjar.sdk.data.usage.ApplicationSessionEvent) r14     // Catch:{ InterruptedException -> 0x0252 }
                java.lang.String r4 = r14.getPackageName()     // Catch:{ InterruptedException -> 0x0252 }
                r0 = r27
                boolean r4 = r0.contains(r4)     // Catch:{ InterruptedException -> 0x0252 }
                if (r4 != 0) goto L_0x02c5
                java.util.List r4 = r24.getOldNonDisposedStart()     // Catch:{ InterruptedException -> 0x0252 }
                java.lang.String r5 = r14.getPackageName()     // Catch:{ InterruptedException -> 0x0252 }
                boolean r4 = r4.contains(r5)     // Catch:{ InterruptedException -> 0x0252 }
                if (r4 != 0) goto L_0x02c5
                com.getjar.sdk.data.usage.SessionEvent$Reason r4 = com.getjar.sdk.data.usage.SessionEvent.Reason.THREAD_APP_DETECTION     // Catch:{ InterruptedException -> 0x0252 }
                r5 = 0
                r2.stopAppSession(r14, r4, r5)     // Catch:{ InterruptedException -> 0x0252 }
                goto L_0x02c5
            L_0x02f2:
                r4 = move-exception
                long r11 = java.lang.System.currentTimeMillis()     // Catch:{ Exception -> 0x00f8 }
                long r11 = r11 - r22
                long r28 = r28 + r11
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r5 = com.getjar.sdk.data.usage.UsageMonitor.this     // Catch:{ Exception -> 0x00f8 }
                long r11 = r5._monitorTrackingIntervalInMilliseconds     // Catch:{ Exception -> 0x00f8 }
                int r5 = (r28 > r11 ? 1 : (r28 == r11 ? 0 : -1))
                if (r5 < 0) goto L_0x0327
                r28 = 0
                r34.updateLastChecked()     // Catch:{ Exception -> 0x00f8 }
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r5 = com.getjar.sdk.data.usage.UsageMonitor.this     // Catch:{ Exception -> 0x03de }
                com.getjar.sdk.comm.CommContext r5 = r5._commContext     // Catch:{ Exception -> 0x03de }
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r11 = com.getjar.sdk.data.usage.UsageMonitor.this     // Catch:{ Exception -> 0x03de }
                com.getjar.sdk.comm.CommContext r11 = r11._commContext     // Catch:{ Exception -> 0x03de }
                r12 = 0
                com.getjar.sdk.comm.GetJarConfig r11 = com.getjar.sdk.comm.GetJarConfig.getInstance(r11, r12)     // Catch:{ Exception -> 0x03de }
                com.getjar.sdk.utilities.AlarmsUtility.startBackgroundReporting(r5, r11)     // Catch:{ Exception -> 0x03de }
            L_0x0324:
                r8.purgeSyncedClosedEntries()     // Catch:{ Exception -> 0x03ec }
            L_0x0327:
                throw r4     // Catch:{ Exception -> 0x00f8 }
            L_0x0328:
                java.util.List r25 = r8.appSessionLoadOpenStartPackageNames()     // Catch:{ InterruptedException -> 0x0252 }
                java.util.Iterator r18 = r27.iterator()     // Catch:{ InterruptedException -> 0x0252 }
            L_0x0330:
                boolean r4 = r18.hasNext()     // Catch:{ InterruptedException -> 0x0252 }
                if (r4 == 0) goto L_0x034f
                java.lang.Object r3 = r18.next()     // Catch:{ InterruptedException -> 0x0252 }
                java.lang.String r3 = (java.lang.String) r3     // Catch:{ InterruptedException -> 0x0252 }
                r0 = r25
                boolean r4 = r0.contains(r3)     // Catch:{ InterruptedException -> 0x0252 }
                if (r4 != 0) goto L_0x0330
                java.lang.String r7 = r8.getNewApplicationSessionID()     // Catch:{ InterruptedException -> 0x0252 }
                com.getjar.sdk.data.usage.SessionEvent$Reason r4 = com.getjar.sdk.data.usage.SessionEvent.Reason.THREAD_APP_DETECTION     // Catch:{ InterruptedException -> 0x0252 }
                r5 = 0
                r2.startAppSession(r3, r4, r5, r6, r7)     // Catch:{ InterruptedException -> 0x0252 }
                goto L_0x0330
            L_0x034f:
                r27 = 0
                r25 = 0
                r24 = 0
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r4 = com.getjar.sdk.data.usage.UsageMonitor.this     // Catch:{ InterruptedException -> 0x0252 }
                boolean r4 = r4._requestThreadExit     // Catch:{ InterruptedException -> 0x0252 }
                if (r4 != 0) goto L_0x037c
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r4 = com.getjar.sdk.data.usage.UsageMonitor.this     // Catch:{ InterruptedException -> 0x0252 }
                java.lang.Object r5 = r4._intervalWaitMonitor     // Catch:{ InterruptedException -> 0x0252 }
                monitor-enter(r5)     // Catch:{ InterruptedException -> 0x0252 }
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r4 = com.getjar.sdk.data.usage.UsageMonitor.this     // Catch:{ all -> 0x03c0 }
                java.lang.Object r4 = r4._intervalWaitMonitor     // Catch:{ all -> 0x03c0 }
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r11 = com.getjar.sdk.data.usage.UsageMonitor.this     // Catch:{ all -> 0x03c0 }
                long r11 = r11._monitorIntervalInMilliseconds     // Catch:{ all -> 0x03c0 }
                r4.wait(r11)     // Catch:{ all -> 0x03c0 }
                monitor-exit(r5)     // Catch:{ all -> 0x03c0 }
            L_0x037c:
                long r4 = java.lang.System.currentTimeMillis()     // Catch:{ Exception -> 0x00f8 }
                long r4 = r4 - r22
                long r28 = r28 + r4
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r4 = com.getjar.sdk.data.usage.UsageMonitor.this     // Catch:{ Exception -> 0x00f8 }
                long r4 = r4._monitorTrackingIntervalInMilliseconds     // Catch:{ Exception -> 0x00f8 }
                int r4 = (r28 > r4 ? 1 : (r28 == r4 ? 0 : -1))
                if (r4 < 0) goto L_0x0083
                r28 = 0
                r34.updateLastChecked()     // Catch:{ Exception -> 0x00f8 }
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r4 = com.getjar.sdk.data.usage.UsageMonitor.this     // Catch:{ Exception -> 0x03c3 }
                com.getjar.sdk.comm.CommContext r4 = r4._commContext     // Catch:{ Exception -> 0x03c3 }
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r5 = com.getjar.sdk.data.usage.UsageMonitor.this     // Catch:{ Exception -> 0x03c3 }
                com.getjar.sdk.comm.CommContext r5 = r5._commContext     // Catch:{ Exception -> 0x03c3 }
                r11 = 0
                com.getjar.sdk.comm.GetJarConfig r5 = com.getjar.sdk.comm.GetJarConfig.getInstance(r5, r11)     // Catch:{ Exception -> 0x03c3 }
                com.getjar.sdk.utilities.AlarmsUtility.startBackgroundReporting(r4, r5)     // Catch:{ Exception -> 0x03c3 }
            L_0x03ad:
                r8.purgeSyncedClosedEntries()     // Catch:{ Exception -> 0x03b2 }
                goto L_0x0083
            L_0x03b2:
                r15 = move-exception
                com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ Exception -> 0x00f8 }
                long r4 = r4.value()     // Catch:{ Exception -> 0x00f8 }
                java.lang.String r11 = "Error in purgeSyncedClosedEntries"
                com.getjar.sdk.logging.Logger.w(r4, r11, r15)     // Catch:{ Exception -> 0x00f8 }
                goto L_0x0083
            L_0x03c0:
                r4 = move-exception
                monitor-exit(r5)     // Catch:{ all -> 0x03c0 }
                throw r4     // Catch:{ InterruptedException -> 0x0252 }
            L_0x03c3:
                r15 = move-exception
                com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ Exception -> 0x00f8 }
                long r4 = r4.value()     // Catch:{ Exception -> 0x00f8 }
                java.lang.String r11 = "Error in AlarmUtility.startBackgroundReporting"
                com.getjar.sdk.logging.Logger.w(r4, r11, r15)     // Catch:{ Exception -> 0x00f8 }
                goto L_0x03ad
            L_0x03d0:
                r15 = move-exception
                com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ Exception -> 0x00f8 }
                long r4 = r4.value()     // Catch:{ Exception -> 0x00f8 }
                java.lang.String r11 = "Error in AlarmUtility.startBackgroundReporting"
                com.getjar.sdk.logging.Logger.w(r4, r11, r15)     // Catch:{ Exception -> 0x00f8 }
                goto L_0x02aa
            L_0x03de:
                r15 = move-exception
                com.getjar.sdk.logging.Area r5 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ Exception -> 0x00f8 }
                long r11 = r5.value()     // Catch:{ Exception -> 0x00f8 }
                java.lang.String r5 = "Error in AlarmUtility.startBackgroundReporting"
                com.getjar.sdk.logging.Logger.w(r11, r5, r15)     // Catch:{ Exception -> 0x00f8 }
                goto L_0x0324
            L_0x03ec:
                r15 = move-exception
                com.getjar.sdk.logging.Area r5 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ Exception -> 0x00f8 }
                long r11 = r5.value()     // Catch:{ Exception -> 0x00f8 }
                java.lang.String r5 = "Error in purgeSyncedClosedEntries"
                com.getjar.sdk.logging.Logger.w(r11, r5, r15)     // Catch:{ Exception -> 0x00f8 }
                goto L_0x0327
            L_0x03fa:
                if (r16 == 0) goto L_0x044e
                com.getjar.sdk.data.usage.SessionEvent$Reason r9 = com.getjar.sdk.data.usage.SessionEvent.Reason.THREAD_EXCEPTION     // Catch:{ Exception -> 0x011b }
            L_0x03fe:
                r10 = 0
                if (r17 == 0) goto L_0x0405
                java.lang.String r10 = com.getjar.sdk.logging.Logger.getThrowableDump(r17)     // Catch:{ Exception -> 0x011b }
            L_0x0405:
                r4 = 0
                long r11 = java.lang.System.currentTimeMillis()     // Catch:{ Exception -> 0x0451 }
                r2.closeAllOpenAppSessions(r9, r4, r11)     // Catch:{ Exception -> 0x0451 }
            L_0x040d:
                long r11 = java.lang.System.currentTimeMillis()     // Catch:{ Exception -> 0x045e }
                r13 = r6
                r8.phoneSessionStop(r9, r10, r11, r13)     // Catch:{ Exception -> 0x045e }
            L_0x0415:
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r4 = com.getjar.sdk.data.usage.UsageMonitor.this
                java.lang.Object r5 = r4._monitoringThreadLock
                monitor-enter(r5)
                r0 = r34
                com.getjar.sdk.data.usage.UsageMonitor r4 = com.getjar.sdk.data.usage.UsageMonitor.this     // Catch:{ all -> 0x048b }
                com.getjar.sdk.data.usage.UsageMonitor$MonitoringState r11 = com.getjar.sdk.data.usage.UsageMonitor.MonitoringState.STOPPED     // Catch:{ all -> 0x048b }
                com.getjar.sdk.data.usage.UsageMonitor.MonitoringState unused = r4._monitoringState = r11     // Catch:{ all -> 0x048b }
                monitor-exit(r5)     // Catch:{ all -> 0x048b }
                com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.USAGE
                long r4 = r4.value()
                java.util.Locale r11 = java.util.Locale.US
                java.lang.String r12 = "UsageMonitor: UsageMonitoringThread: exiting [thread:%1$d]"
                r13 = 1
                java.lang.Object[] r13 = new java.lang.Object[r13]
                r30 = 0
                java.lang.Thread r31 = java.lang.Thread.currentThread()
                long r31 = r31.getId()
                java.lang.Long r31 = java.lang.Long.valueOf(r31)
                r13[r30] = r31
                java.lang.String r11 = java.lang.String.format(r11, r12, r13)
                com.getjar.sdk.logging.Logger.d(r4, r11)
                goto L_0x015e
            L_0x044e:
                com.getjar.sdk.data.usage.SessionEvent$Reason r9 = com.getjar.sdk.data.usage.SessionEvent.Reason.THREAD_EXIT     // Catch:{ Exception -> 0x011b }
                goto L_0x03fe
            L_0x0451:
                r15 = move-exception
                com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ Exception -> 0x011b }
                long r4 = r4.value()     // Catch:{ Exception -> 0x011b }
                java.lang.String r11 = "UsageMonitor: UsageMonitoringThread: failed to close all open app sessions."
                com.getjar.sdk.logging.Logger.e(r4, r11, r15)     // Catch:{ Exception -> 0x011b }
                goto L_0x040d
            L_0x045e:
                r15 = move-exception
                com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ Exception -> 0x011b }
                long r4 = r4.value()     // Catch:{ Exception -> 0x011b }
                java.lang.String r11 = "UsageMonitor: UsageMonitoringThread: failed to close the phone session."
                com.getjar.sdk.logging.Logger.e(r4, r11, r15)     // Catch:{ Exception -> 0x011b }
                goto L_0x0415
            L_0x046b:
                com.getjar.sdk.data.usage.SessionEvent$Reason r9 = com.getjar.sdk.data.usage.SessionEvent.Reason.THREAD_EXIT     // Catch:{ Exception -> 0x011b }
                goto L_0x0103
            L_0x046f:
                r15 = move-exception
                com.getjar.sdk.logging.Area r5 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ Exception -> 0x011b }
                long r11 = r5.value()     // Catch:{ Exception -> 0x011b }
                java.lang.String r5 = "UsageMonitor: UsageMonitoringThread: failed to close all open app sessions."
                com.getjar.sdk.logging.Logger.e(r11, r5, r15)     // Catch:{ Exception -> 0x011b }
                goto L_0x0112
            L_0x047d:
                r15 = move-exception
                com.getjar.sdk.logging.Area r5 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ Exception -> 0x011b }
                long r11 = r5.value()     // Catch:{ Exception -> 0x011b }
                java.lang.String r5 = "UsageMonitor: UsageMonitoringThread: failed to close the phone session."
                com.getjar.sdk.logging.Logger.e(r11, r5, r15)     // Catch:{ Exception -> 0x011b }
                goto L_0x011a
            L_0x048b:
                r4 = move-exception
                monitor-exit(r5)     // Catch:{ all -> 0x048b }
                throw r4
            L_0x048e:
                r4 = move-exception
                monitor-exit(r5)     // Catch:{ all -> 0x048e }
                throw r4
            L_0x0491:
                r4 = move-exception
                monitor-exit(r5)     // Catch:{ all -> 0x0491 }
                throw r4
            */
            throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.usage.UsageMonitor.UsageMonitoringThread.run():void");
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

    /* access modifiers changed from: private */
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
        if (!StringUtility.isNullOrEmpty(applicationKey)) {
            return CommManager.createContext(applicationKey, context, (ResultReceiver) new ResultReceiver((Handler) null) {
                /* access modifiers changed from: protected */
                public void onReceiveResult(int resultCode, Bundle resultData) {
                    for (String key : resultData.keySet()) {
                        Logger.d(Area.USAGE.value() | Area.AUTH.value() | Area.COMM.value(), String.format(Locale.US, "UsageMonitor: Callback from the GetJar SDK [%1$s]", new Object[]{resultData.get(key).getClass().getName()}));
                    }
                }
            }, CommManager.LaunchWork.NONE);
        }
        throw new IllegalStateException("Unable to access the application key");
    }
}
