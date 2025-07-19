package com.getjar.sdk.data.earning;

import android.content.Context;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.ResultReceiver;
import com.getjar.sdk.comm.CommContext;
import com.getjar.sdk.comm.CommManager;
import com.getjar.sdk.comm.GetJarConfig;
import com.getjar.sdk.comm.Operation;
import com.getjar.sdk.comm.TransactionManager;
import com.getjar.sdk.comm.auth.ApplicationKeyDatabase;
import com.getjar.sdk.data.earning.EarnStateDatabase;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.Constants;
import com.getjar.sdk.utilities.StringUtility;
import com.getjar.sdk.utilities.Utility;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.Future;

public class EarningMonitor {
    private static final long _EARNING_APP_INSTALL_NOTIFY_MILLISECONDS = 300000;
    private static final long _EARNING_APP_OPEN_NOTIFY_MILLISECONDS = 60000;
    private static final long _EARNING_APP_OPEN_TIMEOUT_MILLISECONDS = 86400000;
    private static volatile EarningMonitor _Instance = null;
    /* access modifiers changed from: private */
    public final CommContext _commContext;
    /* access modifiers changed from: private */
    public final Context _context;
    /* access modifiers changed from: private */
    public volatile boolean _exitMonitoringThread = false;
    /* access modifiers changed from: private */
    public final Object _intervalWaitMonitor = new Object();
    /* access modifiers changed from: private */
    public final long _monitorIntervalInMilliseconds;
    /* access modifiers changed from: private */
    public volatile EarningMonitoringThread _monitoringThread = null;
    /* access modifiers changed from: private */
    public volatile Object _monitoringThreadLock = new Object();
    private volatile Object _startStopLock = new Object();

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

    /* JADX WARNING: No exception handlers in catch block: Catch:{  } */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void startMonitoring() {
        /*
            r10 = this;
            java.lang.Object r1 = r10._startStopLock
            monitor-enter(r1)
            long r2 = r10._monitorIntervalInMilliseconds     // Catch:{ all -> 0x00d3 }
            r4 = 0
            int r0 = (r2 > r4 ? 1 : (r2 == r4 ? 0 : -1))
            if (r0 > 0) goto L_0x0031
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.EARN     // Catch:{ all -> 0x00d3 }
            long r2 = r0.value()     // Catch:{ all -> 0x00d3 }
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ all -> 0x00d3 }
            long r4 = r0.value()     // Catch:{ all -> 0x00d3 }
            long r2 = r2 | r4
            java.util.Locale r0 = java.util.Locale.US     // Catch:{ all -> 0x00d3 }
            java.lang.String r4 = "Earning: EarningMonitor: skipping earning monitoring thread start due to a monitoring interval of %1$d"
            r5 = 1
            java.lang.Object[] r5 = new java.lang.Object[r5]     // Catch:{ all -> 0x00d3 }
            r6 = 0
            long r7 = r10._monitorIntervalInMilliseconds     // Catch:{ all -> 0x00d3 }
            java.lang.Long r7 = java.lang.Long.valueOf(r7)     // Catch:{ all -> 0x00d3 }
            r5[r6] = r7     // Catch:{ all -> 0x00d3 }
            java.lang.String r0 = java.lang.String.format(r0, r4, r5)     // Catch:{ all -> 0x00d3 }
            com.getjar.sdk.logging.Logger.v(r2, r0)     // Catch:{ all -> 0x00d3 }
            monitor-exit(r1)     // Catch:{ all -> 0x00d3 }
        L_0x0030:
            return
        L_0x0031:
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.EARN     // Catch:{ all -> 0x00d3 }
            long r2 = r0.value()     // Catch:{ all -> 0x00d3 }
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ all -> 0x00d3 }
            long r4 = r0.value()     // Catch:{ all -> 0x00d3 }
            long r2 = r2 | r4
            java.util.Locale r0 = java.util.Locale.US     // Catch:{ all -> 0x00d3 }
            java.lang.String r4 = "Earning: EarningMonitor: starting earning monitoring thread with a monitoring interval of %1$d"
            r5 = 1
            java.lang.Object[] r5 = new java.lang.Object[r5]     // Catch:{ all -> 0x00d3 }
            r6 = 0
            long r7 = r10._monitorIntervalInMilliseconds     // Catch:{ all -> 0x00d3 }
            java.lang.Long r7 = java.lang.Long.valueOf(r7)     // Catch:{ all -> 0x00d3 }
            r5[r6] = r7     // Catch:{ all -> 0x00d3 }
            java.lang.String r0 = java.lang.String.format(r0, r4, r5)     // Catch:{ all -> 0x00d3 }
            com.getjar.sdk.logging.Logger.v(r2, r0)     // Catch:{ all -> 0x00d3 }
            java.lang.Object r2 = r10._monitoringThreadLock     // Catch:{ all -> 0x00d3 }
            monitor-enter(r2)     // Catch:{ all -> 0x00d3 }
            com.getjar.sdk.data.earning.EarningMonitor$EarningMonitoringThread r0 = r10._monitoringThread     // Catch:{ all -> 0x00d6 }
            if (r0 != 0) goto L_0x0076
            com.getjar.sdk.data.earning.EarningMonitor$EarningMonitoringThread r0 = new com.getjar.sdk.data.earning.EarningMonitor$EarningMonitoringThread     // Catch:{ all -> 0x00d6 }
            r3 = 0
            r0.<init>()     // Catch:{ all -> 0x00d6 }
            r10._monitoringThread = r0     // Catch:{ all -> 0x00d6 }
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.EARN     // Catch:{ all -> 0x00d6 }
            long r3 = r0.value()     // Catch:{ all -> 0x00d6 }
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ all -> 0x00d6 }
            long r5 = r0.value()     // Catch:{ all -> 0x00d6 }
            long r3 = r3 | r5
            java.lang.String r0 = "Earning: EarningMonitor: earning monitoring thread [instantiated]"
            com.getjar.sdk.logging.Logger.v(r3, r0)     // Catch:{ all -> 0x00d6 }
        L_0x0076:
            r0 = 0
            r10._exitMonitoringThread = r0     // Catch:{ all -> 0x00d6 }
            com.getjar.sdk.data.earning.EarningMonitor$EarningMonitoringThread r0 = r10._monitoringThread     // Catch:{ IllegalThreadStateException -> 0x00d9 }
            r0.start()     // Catch:{ IllegalThreadStateException -> 0x00d9 }
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.EARN     // Catch:{ IllegalThreadStateException -> 0x00d9 }
            long r3 = r0.value()     // Catch:{ IllegalThreadStateException -> 0x00d9 }
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ IllegalThreadStateException -> 0x00d9 }
            long r5 = r0.value()     // Catch:{ IllegalThreadStateException -> 0x00d9 }
            long r3 = r3 | r5
            java.lang.String r0 = "Earning: EarningMonitor: earning monitoring thread [start() called]"
            com.getjar.sdk.logging.Logger.v(r3, r0)     // Catch:{ IllegalThreadStateException -> 0x00d9 }
        L_0x0090:
            com.getjar.sdk.data.earning.EarningScreenReceiver r0 = com.getjar.sdk.data.earning.EarningScreenReceiver.getInstance()     // Catch:{ all -> 0x00d6 }
            android.content.Context r3 = r10._context     // Catch:{ all -> 0x00d6 }
            r0.registerReceiver(r3)     // Catch:{ all -> 0x00d6 }
            android.content.Context r0 = r10._context     // Catch:{ all -> 0x00d6 }
            android.content.Intent r3 = new android.content.Intent     // Catch:{ all -> 0x00d6 }
            android.content.Context r4 = r10._context     // Catch:{ all -> 0x00d6 }
            java.lang.Class<com.getjar.sdk.rewards.GetJarService> r5 = com.getjar.sdk.rewards.GetJarService.class
            r3.<init>(r4, r5)     // Catch:{ all -> 0x00d6 }
            r0.startService(r3)     // Catch:{ all -> 0x00d6 }
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.EARN     // Catch:{ all -> 0x00d6 }
            long r3 = r0.value()     // Catch:{ all -> 0x00d6 }
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ all -> 0x00d6 }
            long r5 = r0.value()     // Catch:{ all -> 0x00d6 }
            long r3 = r3 | r5
            java.util.Locale r0 = java.util.Locale.US     // Catch:{ all -> 0x00d6 }
            java.lang.String r5 = "Earning: EarningMonitor: earning monitoring thread started [thread id: %1$d]"
            r6 = 1
            java.lang.Object[] r6 = new java.lang.Object[r6]     // Catch:{ all -> 0x00d6 }
            r7 = 0
            com.getjar.sdk.data.earning.EarningMonitor$EarningMonitoringThread r8 = r10._monitoringThread     // Catch:{ all -> 0x00d6 }
            long r8 = r8.getId()     // Catch:{ all -> 0x00d6 }
            java.lang.Long r8 = java.lang.Long.valueOf(r8)     // Catch:{ all -> 0x00d6 }
            r6[r7] = r8     // Catch:{ all -> 0x00d6 }
            java.lang.String r0 = java.lang.String.format(r0, r5, r6)     // Catch:{ all -> 0x00d6 }
            com.getjar.sdk.logging.Logger.v(r3, r0)     // Catch:{ all -> 0x00d6 }
            monitor-exit(r2)     // Catch:{ all -> 0x00d6 }
            monitor-exit(r1)     // Catch:{ all -> 0x00d3 }
            goto L_0x0030
        L_0x00d3:
            r0 = move-exception
            monitor-exit(r1)     // Catch:{ all -> 0x00d3 }
            throw r0
        L_0x00d6:
            r0 = move-exception
            monitor-exit(r2)     // Catch:{ all -> 0x00d6 }
            throw r0     // Catch:{ all -> 0x00d3 }
        L_0x00d9:
            r0 = move-exception
            goto L_0x0090
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.earning.EarningMonitor.startMonitoring():void");
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
            r13 = this;
            java.lang.Object r4 = r13._startStopLock
            monitor-enter(r4)
            r1 = 0
            java.lang.Object r3 = r13._monitoringThreadLock     // Catch:{ Exception -> 0x0051 }
            monitor-enter(r3)     // Catch:{ Exception -> 0x0051 }
            com.getjar.sdk.data.earning.EarningMonitor$EarningMonitoringThread r1 = r13._monitoringThread     // Catch:{ all -> 0x004e }
            r2 = 1
            r13._exitMonitoringThread = r2     // Catch:{ all -> 0x004e }
            r2 = 0
            r13._monitoringThread = r2     // Catch:{ all -> 0x004e }
            monitor-exit(r3)     // Catch:{ all -> 0x004e }
            java.lang.Object r3 = r13._intervalWaitMonitor     // Catch:{ Exception -> 0x0051 }
            monitor-enter(r3)     // Catch:{ Exception -> 0x0051 }
            java.lang.Object r2 = r13._intervalWaitMonitor     // Catch:{ all -> 0x008e }
            r2.notify()     // Catch:{ all -> 0x008e }
            monitor-exit(r3)     // Catch:{ all -> 0x008e }
            if (r1 == 0) goto L_0x0023
            r2 = 2000(0x7d0, double:9.88E-321)
            r1.join(r2)     // Catch:{ Exception -> 0x00bf }
        L_0x0020:
            r1.interrupt()     // Catch:{ Exception -> 0x0051 }
        L_0x0023:
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.EARN     // Catch:{ all -> 0x00bc }
            long r2 = r2.value()     // Catch:{ all -> 0x00bc }
            com.getjar.sdk.logging.Area r5 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ all -> 0x00bc }
            long r5 = r5.value()     // Catch:{ all -> 0x00bc }
            long r5 = r5 | r2
            java.util.Locale r3 = java.util.Locale.US     // Catch:{ all -> 0x00bc }
            java.lang.String r7 = "Earning: EarningMonitor: earning monitoring thread stopped [thread id: %1$s]"
            r2 = 1
            java.lang.Object[] r8 = new java.lang.Object[r2]     // Catch:{ all -> 0x00bc }
            r9 = 0
            if (r1 == 0) goto L_0x00d4
            long r10 = r1.getId()     // Catch:{ all -> 0x00bc }
            java.lang.String r2 = java.lang.Long.toString(r10)     // Catch:{ all -> 0x00bc }
        L_0x0042:
            r8[r9] = r2     // Catch:{ all -> 0x00bc }
            java.lang.String r2 = java.lang.String.format(r3, r7, r8)     // Catch:{ all -> 0x00bc }
            com.getjar.sdk.logging.Logger.v(r5, r2)     // Catch:{ all -> 0x00bc }
            r1 = 0
        L_0x004c:
            monitor-exit(r4)     // Catch:{ all -> 0x00bc }
            return
        L_0x004e:
            r2 = move-exception
            monitor-exit(r3)     // Catch:{ all -> 0x004e }
            throw r2     // Catch:{ Exception -> 0x0051 }
        L_0x0051:
            r0 = move-exception
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.EARN     // Catch:{ all -> 0x0091 }
            long r2 = r2.value()     // Catch:{ all -> 0x0091 }
            com.getjar.sdk.logging.Area r5 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ all -> 0x0091 }
            long r5 = r5.value()     // Catch:{ all -> 0x0091 }
            long r2 = r2 | r5
            java.lang.String r5 = "Earning: EarningMonitor: stopMonitoring() failed"
            com.getjar.sdk.logging.Logger.e(r2, r5, r0)     // Catch:{ all -> 0x0091 }
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.EARN     // Catch:{ all -> 0x00bc }
            long r2 = r2.value()     // Catch:{ all -> 0x00bc }
            com.getjar.sdk.logging.Area r5 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ all -> 0x00bc }
            long r5 = r5.value()     // Catch:{ all -> 0x00bc }
            long r5 = r5 | r2
            java.util.Locale r3 = java.util.Locale.US     // Catch:{ all -> 0x00bc }
            java.lang.String r7 = "Earning: EarningMonitor: earning monitoring thread stopped [thread id: %1$s]"
            r2 = 1
            java.lang.Object[] r8 = new java.lang.Object[r2]     // Catch:{ all -> 0x00bc }
            r9 = 0
            if (r1 == 0) goto L_0x00d8
            long r10 = r1.getId()     // Catch:{ all -> 0x00bc }
            java.lang.String r2 = java.lang.Long.toString(r10)     // Catch:{ all -> 0x00bc }
        L_0x0083:
            r8[r9] = r2     // Catch:{ all -> 0x00bc }
            java.lang.String r2 = java.lang.String.format(r3, r7, r8)     // Catch:{ all -> 0x00bc }
            com.getjar.sdk.logging.Logger.v(r5, r2)     // Catch:{ all -> 0x00bc }
            r1 = 0
            goto L_0x004c
        L_0x008e:
            r2 = move-exception
            monitor-exit(r3)     // Catch:{ all -> 0x008e }
            throw r2     // Catch:{ Exception -> 0x0051 }
        L_0x0091:
            r2 = move-exception
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.EARN     // Catch:{ all -> 0x00bc }
            long r5 = r3.value()     // Catch:{ all -> 0x00bc }
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ all -> 0x00bc }
            long r7 = r3.value()     // Catch:{ all -> 0x00bc }
            long r5 = r5 | r7
            java.util.Locale r7 = java.util.Locale.US     // Catch:{ all -> 0x00bc }
            java.lang.String r8 = "Earning: EarningMonitor: earning monitoring thread stopped [thread id: %1$s]"
            r3 = 1
            java.lang.Object[] r9 = new java.lang.Object[r3]     // Catch:{ all -> 0x00bc }
            r10 = 0
            if (r1 == 0) goto L_0x00db
            long r11 = r1.getId()     // Catch:{ all -> 0x00bc }
            java.lang.String r3 = java.lang.Long.toString(r11)     // Catch:{ all -> 0x00bc }
        L_0x00b1:
            r9[r10] = r3     // Catch:{ all -> 0x00bc }
            java.lang.String r3 = java.lang.String.format(r7, r8, r9)     // Catch:{ all -> 0x00bc }
            com.getjar.sdk.logging.Logger.v(r5, r3)     // Catch:{ all -> 0x00bc }
            r1 = 0
            throw r2     // Catch:{ all -> 0x00bc }
        L_0x00bc:
            r2 = move-exception
            monitor-exit(r4)     // Catch:{ all -> 0x00bc }
            throw r2
        L_0x00bf:
            r0 = move-exception
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.EARN     // Catch:{ Exception -> 0x0051 }
            long r2 = r2.value()     // Catch:{ Exception -> 0x0051 }
            com.getjar.sdk.logging.Area r5 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ Exception -> 0x0051 }
            long r5 = r5.value()     // Catch:{ Exception -> 0x0051 }
            long r2 = r2 | r5
            java.lang.String r5 = "Earning: EarningMonitor: join() failed"
            com.getjar.sdk.logging.Logger.e(r2, r5, r0)     // Catch:{ Exception -> 0x0051 }
            goto L_0x0020
        L_0x00d4:
            java.lang.String r2 = "null"
            goto L_0x0042
        L_0x00d8:
            java.lang.String r2 = "null"
            goto L_0x0083
        L_0x00db:
            java.lang.String r3 = "null"
            goto L_0x00b1
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.earning.EarningMonitor.stopMonitoring():void");
    }

    public EarnStateRecord ensureAppMetadataOnEarnStateRecord(EarnStateRecord appState) {
        if (appState == null) {
            throw new IllegalArgumentException("'appState' cannot be NULL");
        }
        boolean doUpdate = false;
        Map<String, String> appMetaMap = null;
        EarnStateRecord returnRecord = appState;
        try {
            appMetaMap = Utility.jsonArrayStringToMap(appState.getApplicationMetadata());
            Logger.d(Area.EARN.value(), String.format(Locale.US, "Earning: EarningMonitor: ensureAppMetadataOnEarnStateRecord() [packageName:'%1$s' metadataCount:%2$d]", new Object[]{appState.getPackageName(), Integer.valueOf(appMetaMap.size())}));
            if (!appMetaMap.containsKey(Constants.META_DEVICE_PLATFORM) || !appMetaMap.containsKey(Constants.META_DEVICE_PLATFORM_VERSION)) {
                appMetaMap.put(Constants.META_DEVICE_PLATFORM, "android");
                appMetaMap.put(Constants.META_DEVICE_PLATFORM_VERSION, Build.VERSION.RELEASE);
                doUpdate = true;
            }
            if (!appMetaMap.containsKey(Constants.META_PACKAGE_VERSION_CODE) || !appMetaMap.containsKey(Constants.META_PACKAGE_VERSION_NAME)) {
                PackageInfo packageInfo = null;
                int tryCount = 0;
                while (tryCount <= 3) {
                    try {
                        packageInfo = this._context.getPackageManager().getPackageInfo(appState.getPackageName(), 128);
                        break;
                    } catch (PackageManager.NameNotFoundException e) {
                        tryCount++;
                        if (tryCount <= 3) {
                            Thread.sleep(333);
                        }
                    }
                }
                if (packageInfo == null) {
                    Logger.w(Area.EARN.value(), String.format(Locale.US, "Earning: EarningMonitor: ensureAppMetadataOnEarnStateRecord() [packageName: %1$s] Failed to get PackageInfo", new Object[]{appState.getPackageName()}));
                } else {
                    appMetaMap.put(Constants.META_PACKAGE_VERSION_CODE, Integer.toString(packageInfo.versionCode));
                    appMetaMap.put(Constants.META_PACKAGE_VERSION_NAME, packageInfo.versionName);
                    doUpdate = true;
                }
            }
            if (doUpdate && appMetaMap != null) {
                try {
                    if (appMetaMap.size() > 0) {
                        String theAppMetadata = Utility.mapToJsonString(appMetaMap);
                        if (!StringUtility.isNullOrEmpty(theAppMetadata)) {
                            EarnStateDatabase.getInstance(this._context).updateApplicationMetadata(appState.getPackageName(), theAppMetadata);
                            EarnStateRecord loadedRecord = EarnStateDatabase.getInstance(this._context).getAppState(appState.getPackageName());
                            if (loadedRecord != null) {
                                returnRecord = loadedRecord;
                            }
                            Logger.d(Area.EARN.value(), String.format(Locale.US, "Earning: EarningMonitor: ensureAppMetadataOnEarnStateRecord() Application metadata update [packageName:'%1$s' metadata:'%2$s']", new Object[]{appState.getPackageName(), theAppMetadata}));
                        }
                    }
                } catch (Exception e2) {
                    Logger.e(Area.EARN.value(), "Earning: EarningMonitor: ensureAppMetadataOnEarnStateRecord() failed", e2);
                }
            }
        } catch (Exception e3) {
            Logger.e(Area.EARN.value(), "Earning: EarningMonitor: ensureAppMetadataOnEarnStateRecord() failed", e3);
            if (doUpdate && appMetaMap != null) {
                try {
                    if (appMetaMap.size() > 0) {
                        String theAppMetadata2 = Utility.mapToJsonString(appMetaMap);
                        if (!StringUtility.isNullOrEmpty(theAppMetadata2)) {
                            EarnStateDatabase.getInstance(this._context).updateApplicationMetadata(appState.getPackageName(), theAppMetadata2);
                            EarnStateRecord loadedRecord2 = EarnStateDatabase.getInstance(this._context).getAppState(appState.getPackageName());
                            if (loadedRecord2 != null) {
                                returnRecord = loadedRecord2;
                            }
                            Logger.d(Area.EARN.value(), String.format(Locale.US, "Earning: EarningMonitor: ensureAppMetadataOnEarnStateRecord() Application metadata update [packageName:'%1$s' metadata:'%2$s']", new Object[]{appState.getPackageName(), theAppMetadata2}));
                        }
                    }
                } catch (Exception e4) {
                    Logger.e(Area.EARN.value(), "Earning: EarningMonitor: ensureAppMetadataOnEarnStateRecord() failed", e4);
                }
            }
        } catch (Throwable th) {
            if (doUpdate && appMetaMap != null) {
                try {
                    if (appMetaMap.size() > 0) {
                        String theAppMetadata3 = Utility.mapToJsonString(appMetaMap);
                        if (!StringUtility.isNullOrEmpty(theAppMetadata3)) {
                            EarnStateDatabase.getInstance(this._context).updateApplicationMetadata(appState.getPackageName(), theAppMetadata3);
                            EarnStateRecord loadedRecord3 = EarnStateDatabase.getInstance(this._context).getAppState(appState.getPackageName());
                            if (loadedRecord3 != null) {
                                EarnStateRecord returnRecord2 = loadedRecord3;
                            }
                            Logger.d(Area.EARN.value(), String.format(Locale.US, "Earning: EarningMonitor: ensureAppMetadataOnEarnStateRecord() Application metadata update [packageName:'%1$s' metadata:'%2$s']", new Object[]{appState.getPackageName(), theAppMetadata3}));
                        }
                    }
                } catch (Exception e5) {
                    Logger.e(Area.EARN.value(), "Earning: EarningMonitor: ensureAppMetadataOnEarnStateRecord() failed", e5);
                }
            }
            throw th;
        }
        return returnRecord;
    }

    private class EarningMonitoringThread extends Thread {
        private EarningMonitoringThread() {
        }

        /* JADX WARNING: Code restructure failed: missing block: B:11:?, code lost:
            com.getjar.sdk.logging.Logger.w(com.getjar.sdk.logging.Area.EARN.value() | com.getjar.sdk.logging.Area.TRANSACTION.value(), "Earning: EarningMonitor: EarningMonitoringThread: not yet authed");
         */
        /* JADX WARNING: Code restructure failed: missing block: B:13:?, code lost:
            com.getjar.sdk.comm.auth.AuthManager.getInstance().reAuth();
         */
        /* JADX WARNING: Code restructure failed: missing block: B:24:0x0169, code lost:
            r10 = move-exception;
         */
        /* JADX WARNING: Code restructure failed: missing block: B:26:?, code lost:
            com.getjar.sdk.logging.Logger.e(com.getjar.sdk.logging.Area.EARN.value() | com.getjar.sdk.logging.Area.TRANSACTION.value(), java.lang.String.format(java.util.Locale.US, "Earning: EarningMonitor: EarningMonitoringThread: failed timeout and notification processing for %1$s", new java.lang.Object[]{r6.getPackageName()}), r10);
         */
        /* JADX WARNING: Code restructure failed: missing block: B:29:?, code lost:
            com.getjar.sdk.logging.Logger.d(com.getjar.sdk.logging.Area.EARN.value() | com.getjar.sdk.logging.Area.TRANSACTION.value(), java.lang.String.format(java.util.Locale.US, "Usage: UsageMonitor: UsageMonitoringThread: Received an InterruptedException [_exitMonitoringThread = %1$s]", new java.lang.Object[]{java.lang.Boolean.valueOf(com.getjar.sdk.data.earning.EarningMonitor.access$200(r30.this$0))}));
         */
        /* JADX WARNING: Failed to process nested try/catch */
        /* JADX WARNING: Removed duplicated region for block: B:27:0x0199 A[ExcHandler: InterruptedException (e java.lang.InterruptedException), PHI: r19 
          PHI: (r19v3 'runningTasks' java.util.List<android.app.ActivityManager$RunningTaskInfo>) = (r19v1 'runningTasks' java.util.List<android.app.ActivityManager$RunningTaskInfo>), (r19v1 'runningTasks' java.util.List<android.app.ActivityManager$RunningTaskInfo>), (r19v1 'runningTasks' java.util.List<android.app.ActivityManager$RunningTaskInfo>), (r19v6 'runningTasks' java.util.List<android.app.ActivityManager$RunningTaskInfo>), (r19v6 'runningTasks' java.util.List<android.app.ActivityManager$RunningTaskInfo>), (r19v5 'runningTasks' java.util.List<android.app.ActivityManager$RunningTaskInfo>), (r19v5 'runningTasks' java.util.List<android.app.ActivityManager$RunningTaskInfo>), (r19v1 'runningTasks' java.util.List<android.app.ActivityManager$RunningTaskInfo>), (r19v1 'runningTasks' java.util.List<android.app.ActivityManager$RunningTaskInfo>), (r19v1 'runningTasks' java.util.List<android.app.ActivityManager$RunningTaskInfo>), (r19v1 'runningTasks' java.util.List<android.app.ActivityManager$RunningTaskInfo>), (r19v1 'runningTasks' java.util.List<android.app.ActivityManager$RunningTaskInfo>) binds: [B:5:0x0065, B:15:0x00ae, B:70:0x03ed, B:105:0x056f, B:106:?, B:87:0x04c5, B:92:0x0507, B:20:0x00f2, B:25:0x016a, B:26:?, B:42:0x023b, B:60:0x0342] A[DONT_GENERATE, DONT_INLINE], Splitter:B:5:0x0065] */
        /* JADX WARNING: Removed duplicated region for block: B:9:0x0090 A[ExcHandler: AuthException (e com.getjar.sdk.exceptions.AuthException), PHI: r19 
          PHI: (r19v4 'runningTasks' java.util.List<android.app.ActivityManager$RunningTaskInfo>) = (r19v1 'runningTasks' java.util.List<android.app.ActivityManager$RunningTaskInfo>), (r19v1 'runningTasks' java.util.List<android.app.ActivityManager$RunningTaskInfo>), (r19v1 'runningTasks' java.util.List<android.app.ActivityManager$RunningTaskInfo>), (r19v6 'runningTasks' java.util.List<android.app.ActivityManager$RunningTaskInfo>), (r19v6 'runningTasks' java.util.List<android.app.ActivityManager$RunningTaskInfo>), (r19v5 'runningTasks' java.util.List<android.app.ActivityManager$RunningTaskInfo>), (r19v5 'runningTasks' java.util.List<android.app.ActivityManager$RunningTaskInfo>), (r19v1 'runningTasks' java.util.List<android.app.ActivityManager$RunningTaskInfo>), (r19v1 'runningTasks' java.util.List<android.app.ActivityManager$RunningTaskInfo>), (r19v1 'runningTasks' java.util.List<android.app.ActivityManager$RunningTaskInfo>), (r19v1 'runningTasks' java.util.List<android.app.ActivityManager$RunningTaskInfo>), (r19v1 'runningTasks' java.util.List<android.app.ActivityManager$RunningTaskInfo>) binds: [B:5:0x0065, B:15:0x00ae, B:70:0x03ed, B:105:0x056f, B:106:?, B:87:0x04c5, B:92:0x0507, B:20:0x00f2, B:25:0x016a, B:26:?, B:42:0x023b, B:60:0x0342] A[DONT_GENERATE, DONT_INLINE], Splitter:B:5:0x0065] */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public void run() {
            /*
                r30 = this;
                com.getjar.sdk.logging.Area r21 = com.getjar.sdk.logging.Area.EARN     // Catch:{ Exception -> 0x01cf }
                long r21 = r21.value()     // Catch:{ Exception -> 0x01cf }
                com.getjar.sdk.logging.Area r23 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ Exception -> 0x01cf }
                long r23 = r23.value()     // Catch:{ Exception -> 0x01cf }
                long r21 = r21 | r23
                com.getjar.sdk.logging.Area r23 = com.getjar.sdk.logging.Area.AUTH     // Catch:{ Exception -> 0x01cf }
                long r23 = r23.value()     // Catch:{ Exception -> 0x01cf }
                long r21 = r21 | r23
                java.util.Locale r23 = java.util.Locale.US     // Catch:{ Exception -> 0x01cf }
                java.lang.String r24 = "Earning: EarningMonitor: EarningMonitoringThread: started [thread:%1$d]"
                r25 = 1
                r0 = r25
                java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ Exception -> 0x01cf }
                r25 = r0
                r26 = 0
                java.lang.Thread r27 = java.lang.Thread.currentThread()     // Catch:{ Exception -> 0x01cf }
                long r27 = r27.getId()     // Catch:{ Exception -> 0x01cf }
                java.lang.Long r27 = java.lang.Long.valueOf(r27)     // Catch:{ Exception -> 0x01cf }
                r25[r26] = r27     // Catch:{ Exception -> 0x01cf }
                java.lang.String r23 = java.lang.String.format(r23, r24, r25)     // Catch:{ Exception -> 0x01cf }
                com.getjar.sdk.logging.Logger.d(r21, r23)     // Catch:{ Exception -> 0x01cf }
                r17 = 0
                r7 = 0
                r19 = 0
                java.util.ArrayList r15 = new java.util.ArrayList     // Catch:{ Exception -> 0x01cf }
                r15.<init>()     // Catch:{ Exception -> 0x01cf }
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this     // Catch:{ Exception -> 0x01cf }
                r21 = r0
                android.content.Context r21 = r21._context     // Catch:{ Exception -> 0x01cf }
                com.getjar.sdk.comm.auth.AuthManager.initialize(r21)     // Catch:{ Exception -> 0x01cf }
                com.getjar.sdk.comm.auth.AuthManager r21 = com.getjar.sdk.comm.auth.AuthManager.getInstance()     // Catch:{ Exception -> 0x01cf }
                r21.waitOnAuth()     // Catch:{ Exception -> 0x01cf }
            L_0x0057:
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this     // Catch:{ Exception -> 0x01cf }
                r21 = r0
                boolean r21 = r21._exitMonitoringThread     // Catch:{ Exception -> 0x01cf }
                if (r21 != 0) goto L_0x0570
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r21 = r0
                android.content.Context r21 = r21._context     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.data.earning.EarnStateDatabase r21 = com.getjar.sdk.data.earning.EarnStateDatabase.getInstance(r21)     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.util.List r7 = r21.getAllDownloadedOrInstalledAppStates()     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                int r21 = r7.size()     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r0 = r21
                long r0 = (long) r0     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r17 = r0
                r21 = 0
                int r21 = (r17 > r21 ? 1 : (r17 == r21 ? 0 : -1))
                if (r21 > 0) goto L_0x00ae
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r21 = r0
                r22 = 1
                boolean unused = r21._exitMonitoringThread = r22     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                goto L_0x0057
            L_0x0090:
                r3 = move-exception
                com.getjar.sdk.logging.Area r21 = com.getjar.sdk.logging.Area.EARN     // Catch:{ Exception -> 0x01cf }
                long r21 = r21.value()     // Catch:{ Exception -> 0x01cf }
                com.getjar.sdk.logging.Area r23 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ Exception -> 0x01cf }
                long r23 = r23.value()     // Catch:{ Exception -> 0x01cf }
                long r21 = r21 | r23
                java.lang.String r23 = "Earning: EarningMonitor: EarningMonitoringThread: not yet authed"
                com.getjar.sdk.logging.Logger.w(r21, r23)     // Catch:{ Exception -> 0x01cf }
                com.getjar.sdk.comm.auth.AuthManager r21 = com.getjar.sdk.comm.auth.AuthManager.getInstance()     // Catch:{ AuthException -> 0x00ac }
                r21.reAuth()     // Catch:{ AuthException -> 0x00ac }
                goto L_0x0057
            L_0x00ac:
                r21 = move-exception
                goto L_0x0057
            L_0x00ae:
                com.getjar.sdk.logging.Area r21 = com.getjar.sdk.logging.Area.EARN     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r21 = r21.value()     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.logging.Area r23 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r23 = r23.value()     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r21 = r21 | r23
                java.util.Locale r23 = java.util.Locale.US     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r24 = "Earning: EarningMonitor: EarningMonitoringThread: found %d packages"
                r25 = 1
                r0 = r25
                java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r25 = r0
                r26 = 0
                int r27 = r7.size()     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.Integer r27 = java.lang.Integer.valueOf(r27)     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r25[r26] = r27     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r23 = java.lang.String.format(r23, r24, r25)     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.logging.Logger.d(r21, r23)     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r15.clear()     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r13 = java.lang.System.currentTimeMillis()     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.util.Iterator r11 = r7.iterator()     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
            L_0x00e6:
                boolean r21 = r11.hasNext()     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                if (r21 == 0) goto L_0x03eb
                java.lang.Object r6 = r11.next()     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.data.earning.EarnStateRecord r6 = (com.getjar.sdk.data.earning.EarnStateRecord) r6     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r21 = r6.getTimestampCreated()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r4 = r13 - r21
                long r21 = r6.getTimestampModified()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r8 = r13 - r21
                r21 = 86400000(0x5265c00, double:4.2687272E-316)
                int r21 = (r4 > r21 ? 1 : (r4 == r21 ? 0 : -1))
                if (r21 <= 0) goto L_0x0234
                com.getjar.sdk.logging.Area r21 = com.getjar.sdk.logging.Area.EARN     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r21 = r21.value()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.logging.Area r23 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r23 = r23.value()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r21 = r21 | r23
                java.util.Locale r23 = java.util.Locale.US     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r24 = "Earning: EarningMonitor: EarningMonitoringThread: %s timed out"
                r25 = 1
                r0 = r25
                java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r25 = r0
                r26 = 0
                java.lang.String r27 = r6.getPackageName()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r25[r26] = r27     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r23 = java.lang.String.format(r23, r24, r25)     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.logging.Logger.d(r21, r23)     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r21 = r0
                android.content.Context r21 = r21._context     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r22 = r6.getPackageName()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.utilities.NotificationsUtility.clearInstallNotification(r21, r22)     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r21 = r0
                android.content.Context r21 = r21._context     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r22 = r6.getPackageName()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.utilities.NotificationsUtility.clearOpenNotification(r21, r22)     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r21 = r0
                android.content.Context r21 = r21._context     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.data.earning.EarnStateDatabase r21 = com.getjar.sdk.data.earning.EarnStateDatabase.getInstance(r21)     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r22 = r6.getPackageName()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.data.earning.EarnStateDatabase$NotificationState r23 = com.getjar.sdk.data.earning.EarnStateDatabase.NotificationState.DONE     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r21.updateNotificationState(r22, r23)     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                goto L_0x00e6
            L_0x0169:
                r10 = move-exception
                com.getjar.sdk.logging.Area r21 = com.getjar.sdk.logging.Area.EARN     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r21 = r21.value()     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.logging.Area r23 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r23 = r23.value()     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r21 = r21 | r23
                java.util.Locale r23 = java.util.Locale.US     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r24 = "Earning: EarningMonitor: EarningMonitoringThread: failed timeout and notification processing for %1$s"
                r25 = 1
                r0 = r25
                java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r25 = r0
                r26 = 0
                java.lang.String r27 = r6.getPackageName()     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r25[r26] = r27     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r23 = java.lang.String.format(r23, r24, r25)     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r0 = r21
                r2 = r23
                com.getjar.sdk.logging.Logger.e(r0, r2, r10)     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                goto L_0x00e6
            L_0x0199:
                r12 = move-exception
                com.getjar.sdk.logging.Area r21 = com.getjar.sdk.logging.Area.EARN     // Catch:{ Exception -> 0x01cf }
                long r21 = r21.value()     // Catch:{ Exception -> 0x01cf }
                com.getjar.sdk.logging.Area r23 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ Exception -> 0x01cf }
                long r23 = r23.value()     // Catch:{ Exception -> 0x01cf }
                long r21 = r21 | r23
                java.util.Locale r23 = java.util.Locale.US     // Catch:{ Exception -> 0x01cf }
                java.lang.String r24 = "Usage: UsageMonitor: UsageMonitoringThread: Received an InterruptedException [_exitMonitoringThread = %1$s]"
                r25 = 1
                r0 = r25
                java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ Exception -> 0x01cf }
                r25 = r0
                r26 = 0
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this     // Catch:{ Exception -> 0x01cf }
                r27 = r0
                boolean r27 = r27._exitMonitoringThread     // Catch:{ Exception -> 0x01cf }
                java.lang.Boolean r27 = java.lang.Boolean.valueOf(r27)     // Catch:{ Exception -> 0x01cf }
                r25[r26] = r27     // Catch:{ Exception -> 0x01cf }
                java.lang.String r23 = java.lang.String.format(r23, r24, r25)     // Catch:{ Exception -> 0x01cf }
                com.getjar.sdk.logging.Logger.d(r21, r23)     // Catch:{ Exception -> 0x01cf }
                goto L_0x0057
            L_0x01cf:
                r10 = move-exception
                com.getjar.sdk.logging.Area r21 = com.getjar.sdk.logging.Area.EARN     // Catch:{ all -> 0x02f6 }
                long r21 = r21.value()     // Catch:{ all -> 0x02f6 }
                com.getjar.sdk.logging.Area r23 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ all -> 0x02f6 }
                long r23 = r23.value()     // Catch:{ all -> 0x02f6 }
                long r21 = r21 | r23
                java.lang.String r23 = "Earning: EarningMonitor: EarningMonitoringThread: run() failed"
                r0 = r21
                r2 = r23
                com.getjar.sdk.logging.Logger.e(r0, r2, r10)     // Catch:{ all -> 0x02f6 }
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this
                r21 = r0
                java.lang.Object r22 = r21._monitoringThreadLock
                monitor-enter(r22)
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this     // Catch:{ all -> 0x05c1 }
                r21 = r0
                r23 = 0
                r0 = r21
                r1 = r23
                com.getjar.sdk.data.earning.EarningMonitor.EarningMonitoringThread unused = r0._monitoringThread = r1     // Catch:{ all -> 0x05c1 }
                monitor-exit(r22)     // Catch:{ all -> 0x05c1 }
                com.getjar.sdk.logging.Area r21 = com.getjar.sdk.logging.Area.EARN
                long r21 = r21.value()
                com.getjar.sdk.logging.Area r23 = com.getjar.sdk.logging.Area.TRANSACTION
                long r23 = r23.value()
                long r21 = r21 | r23
                java.util.Locale r23 = java.util.Locale.US
                java.lang.String r24 = "Earning: EarningMonitor: EarningMonitoringThread: exiting [thread:%1$d]"
                r25 = 1
                r0 = r25
                java.lang.Object[] r0 = new java.lang.Object[r0]
                r25 = r0
                r26 = 0
                java.lang.Thread r27 = java.lang.Thread.currentThread()
                long r27 = r27.getId()
                java.lang.Long r27 = java.lang.Long.valueOf(r27)
                r25[r26] = r27
                java.lang.String r23 = java.lang.String.format(r23, r24, r25)
                com.getjar.sdk.logging.Logger.d(r21, r23)
            L_0x0233:
                return
            L_0x0234:
                r21 = 60000(0xea60, double:2.9644E-319)
                int r21 = (r8 > r21 ? 1 : (r8 == r21 ? 0 : -1))
                if (r21 <= 0) goto L_0x036a
                com.getjar.sdk.data.earning.EarnStateDatabase$Status r21 = com.getjar.sdk.data.earning.EarnStateDatabase.Status.INSTALLED     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.data.earning.EarnStateDatabase$Status r22 = r6.getStatus()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                boolean r21 = r21.equals(r22)     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                if (r21 == 0) goto L_0x036a
                boolean r21 = r6.canShowOpenReminder()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                if (r21 == 0) goto L_0x036a
                com.getjar.sdk.logging.Area r21 = com.getjar.sdk.logging.Area.EARN     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r21 = r21.value()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.logging.Area r23 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r23 = r23.value()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r21 = r21 | r23
                java.util.Locale r23 = java.util.Locale.US     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r24 = "Earning: EarningMonitor: EarningMonitoringThread: %s showing open reminder notification"
                r25 = 1
                r0 = r25
                java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r25 = r0
                r26 = 0
                java.lang.String r27 = r6.getPackageName()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r25[r26] = r27     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r23 = java.lang.String.format(r23, r24, r25)     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.logging.Logger.d(r21, r23)     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r21 = r0
                android.content.Context r21 = r21._context     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r22 = r6.getPackageName()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r23 = r6.getFriendlyName()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                boolean r21 = com.getjar.sdk.utilities.NotificationsUtility.showOpenNotification(r21, r22, r23)     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                if (r21 != 0) goto L_0x0340
                com.getjar.sdk.logging.Area r21 = com.getjar.sdk.logging.Area.EARN     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r21 = r21.value()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.logging.Area r23 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r23 = r23.value()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r21 = r21 | r23
                java.util.Locale r23 = java.util.Locale.US     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r24 = "Earning: EarningMonitor: EarningMonitoringThread: %s no-longer installed, push the install notification instead"
                r25 = 1
                r0 = r25
                java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r25 = r0
                r26 = 0
                java.lang.String r27 = r6.getPackageName()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r25[r26] = r27     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r23 = java.lang.String.format(r23, r24, r25)     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.logging.Logger.d(r21, r23)     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r21 = r0
                android.content.Context r21 = r21._context     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r22 = r6.getPackageName()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r23 = r6.getFriendlyName()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.utilities.NotificationsUtility.showInstallNotification(r21, r22, r23)     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r21 = r0
                android.content.Context r21 = r21._context     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.data.earning.EarnStateDatabase r21 = com.getjar.sdk.data.earning.EarnStateDatabase.getInstance(r21)     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r22 = r6.getPackageName()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.data.earning.EarnStateDatabase$NotificationState r23 = com.getjar.sdk.data.earning.EarnStateDatabase.NotificationState.OPEN_REMINDER     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r21.updateNotificationState(r22, r23)     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r21 = r0
                android.content.Context r21 = r21._context     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r22 = r6.getPackageName()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.utilities.NotificationsUtility.clearOpenNotification(r21, r22)     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                goto L_0x00e6
            L_0x02f6:
                r21 = move-exception
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this
                r22 = r0
                java.lang.Object r22 = r22._monitoringThreadLock
                monitor-enter(r22)
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this     // Catch:{ all -> 0x05c4 }
                r23 = r0
                r24 = 0
                com.getjar.sdk.data.earning.EarningMonitor.EarningMonitoringThread unused = r23._monitoringThread = r24     // Catch:{ all -> 0x05c4 }
                monitor-exit(r22)     // Catch:{ all -> 0x05c4 }
                com.getjar.sdk.logging.Area r22 = com.getjar.sdk.logging.Area.EARN
                long r22 = r22.value()
                com.getjar.sdk.logging.Area r24 = com.getjar.sdk.logging.Area.TRANSACTION
                long r24 = r24.value()
                long r22 = r22 | r24
                java.util.Locale r24 = java.util.Locale.US
                java.lang.String r25 = "Earning: EarningMonitor: EarningMonitoringThread: exiting [thread:%1$d]"
                r26 = 1
                r0 = r26
                java.lang.Object[] r0 = new java.lang.Object[r0]
                r26 = r0
                r27 = 0
                java.lang.Thread r28 = java.lang.Thread.currentThread()
                long r28 = r28.getId()
                java.lang.Long r28 = java.lang.Long.valueOf(r28)
                r26[r27] = r28
                java.lang.String r24 = java.lang.String.format(r24, r25, r26)
                com.getjar.sdk.logging.Logger.d(r22, r24)
                throw r21
            L_0x0340:
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r21 = r0
                android.content.Context r21 = r21._context     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.data.earning.EarnStateDatabase r21 = com.getjar.sdk.data.earning.EarnStateDatabase.getInstance(r21)     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r22 = r6.getPackageName()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.data.earning.EarnStateDatabase$NotificationState r23 = com.getjar.sdk.data.earning.EarnStateDatabase.NotificationState.OPEN_REMINDER     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r21.updateNotificationState(r22, r23)     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r21 = r0
                android.content.Context r21 = r21._context     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r22 = r6.getPackageName()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.utilities.NotificationsUtility.clearInstallNotification(r21, r22)     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                goto L_0x00e6
            L_0x036a:
                r21 = 300000(0x493e0, double:1.482197E-318)
                int r21 = (r8 > r21 ? 1 : (r8 == r21 ? 0 : -1))
                if (r21 <= 0) goto L_0x00e6
                com.getjar.sdk.data.earning.EarnStateDatabase$Status r21 = com.getjar.sdk.data.earning.EarnStateDatabase.Status.DOWNLOADED     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.data.earning.EarnStateDatabase$Status r22 = r6.getStatus()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                boolean r21 = r21.equals(r22)     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                if (r21 == 0) goto L_0x00e6
                boolean r21 = r6.canShowInstallReminder()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                if (r21 == 0) goto L_0x00e6
                com.getjar.sdk.logging.Area r21 = com.getjar.sdk.logging.Area.EARN     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r21 = r21.value()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.logging.Area r23 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r23 = r23.value()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r21 = r21 | r23
                java.util.Locale r23 = java.util.Locale.US     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r24 = "Earning: EarningMonitor: EarningMonitoringThread: %s showing install reminder notification"
                r25 = 1
                r0 = r25
                java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r25 = r0
                r26 = 0
                java.lang.String r27 = r6.getPackageName()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r25[r26] = r27     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r23 = java.lang.String.format(r23, r24, r25)     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.logging.Logger.d(r21, r23)     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r21 = r0
                android.content.Context r21 = r21._context     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r22 = r6.getPackageName()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r23 = r6.getFriendlyName()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.utilities.NotificationsUtility.showInstallNotification(r21, r22, r23)     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r21 = r0
                android.content.Context r21 = r21._context     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.data.earning.EarnStateDatabase r21 = com.getjar.sdk.data.earning.EarnStateDatabase.getInstance(r21)     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r22 = r6.getPackageName()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.data.earning.EarnStateDatabase$NotificationState r23 = com.getjar.sdk.data.earning.EarnStateDatabase.NotificationState.INSTALL_REMINDER     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r21.updateNotificationState(r22, r23)     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r21 = r0
                android.content.Context r21 = r21._context     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r22 = r6.getPackageName()     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.utilities.NotificationsUtility.clearOpenNotification(r21, r22)     // Catch:{ Exception -> 0x0169, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                goto L_0x00e6
            L_0x03eb:
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r21 = r0
                android.content.Context r21 = r21._context     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.data.earning.EarnStateDatabase r21 = com.getjar.sdk.data.earning.EarnStateDatabase.getInstance(r21)     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r22 = 86400000(0x5265c00, double:4.2687272E-316)
                r21.deleteOldRecords(r22)     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r21 = r0
                android.content.Context r21 = r21._context     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.data.earning.EarnStateDatabase r21 = com.getjar.sdk.data.earning.EarnStateDatabase.getInstance(r21)     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.util.List r7 = r21.getAllDownloadedOrInstalledAppStates()     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.logging.Area r21 = com.getjar.sdk.logging.Area.EARN     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r21 = r21.value()     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.logging.Area r23 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r23 = r23.value()     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r21 = r21 | r23
                java.util.Locale r23 = java.util.Locale.US     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r24 = "Earning: EarningMonitor: EarningMonitoringThread: found %d packages after removing old records"
                r25 = 1
                r0 = r25
                java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r25 = r0
                r26 = 0
                int r27 = r7.size()     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.Integer r27 = java.lang.Integer.valueOf(r27)     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r25[r26] = r27     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r23 = java.lang.String.format(r23, r24, r25)     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.logging.Logger.d(r21, r23)     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r21 = r0
                android.content.Context r21 = r21._context     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.util.List r21 = com.getjar.sdk.utilities.SystemUtility.getRecentlyRunAppsFromOS(r21)     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r0 = r21
                r15.addAll(r0)     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r21 = r0
                android.content.Context r21 = r21._context     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r22 = "android.permission.GET_TASKS"
                boolean r21 = com.getjar.sdk.utilities.RewardUtility.checkPermission(r21, r22)     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                if (r21 == 0) goto L_0x047b
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r21 = r0
                android.content.Context r21 = r21._context     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r22 = "activity"
                java.lang.Object r21 = r21.getSystemService(r22)     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                android.app.ActivityManager r21 = (android.app.ActivityManager) r21     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r22 = 100
                java.util.List r19 = r21.getRunningTasks(r22)     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
            L_0x047b:
                if (r19 == 0) goto L_0x04af
                java.util.Iterator r11 = r19.iterator()     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
            L_0x0481:
                boolean r21 = r11.hasNext()     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                if (r21 == 0) goto L_0x04af
                java.lang.Object r20 = r11.next()     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                android.app.ActivityManager$RunningTaskInfo r20 = (android.app.ActivityManager.RunningTaskInfo) r20     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r0 = r20
                android.content.ComponentName r0 = r0.topActivity     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r21 = r0
                java.lang.String r21 = r21.getPackageName()     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r0 = r21
                boolean r21 = r15.contains(r0)     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                if (r21 != 0) goto L_0x0481
                r0 = r20
                android.content.ComponentName r0 = r0.topActivity     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r21 = r0
                java.lang.String r21 = r21.getPackageName()     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r0 = r21
                r15.add(r0)     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                goto L_0x0481
            L_0x04af:
                int r21 = r15.size()     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                if (r21 <= 0) goto L_0x0535
                java.util.Iterator r11 = r7.iterator()     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
            L_0x04b9:
                boolean r21 = r11.hasNext()     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                if (r21 == 0) goto L_0x0535
                java.lang.Object r6 = r11.next()     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.data.earning.EarnStateRecord r6 = (com.getjar.sdk.data.earning.EarnStateRecord) r6     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r16 = r6.getPackageName()     // Catch:{ Exception -> 0x0506, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                boolean r21 = r15.contains(r16)     // Catch:{ Exception -> 0x0506, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                if (r21 == 0) goto L_0x04b9
                com.getjar.sdk.logging.Area r21 = com.getjar.sdk.logging.Area.EARN     // Catch:{ Exception -> 0x0506, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r21 = r21.value()     // Catch:{ Exception -> 0x0506, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.logging.Area r23 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ Exception -> 0x0506, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r23 = r23.value()     // Catch:{ Exception -> 0x0506, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r21 = r21 | r23
                java.util.Locale r23 = java.util.Locale.US     // Catch:{ Exception -> 0x0506, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r24 = "Earning: EarningMonitor: EarningMonitoringThread: %s match found, processing OPEN"
                r25 = 1
                r0 = r25
                java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ Exception -> 0x0506, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r25 = r0
                r26 = 0
                r25[r26] = r16     // Catch:{ Exception -> 0x0506, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r23 = java.lang.String.format(r23, r24, r25)     // Catch:{ Exception -> 0x0506, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.logging.Logger.d(r21, r23)     // Catch:{ Exception -> 0x0506, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this     // Catch:{ Exception -> 0x0506, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r21 = r0
                com.getjar.sdk.comm.CommContext r21 = r21._commContext     // Catch:{ Exception -> 0x0506, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r0 = r30
                r1 = r21
                r0.processOpenEvent(r1, r6)     // Catch:{ Exception -> 0x0506, AuthException -> 0x0090, InterruptedException -> 0x0199 }
                goto L_0x04b9
            L_0x0506:
                r10 = move-exception
                com.getjar.sdk.logging.Area r21 = com.getjar.sdk.logging.Area.EARN     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r21 = r21.value()     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                com.getjar.sdk.logging.Area r23 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r23 = r23.value()     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                long r21 = r21 | r23
                java.util.Locale r23 = java.util.Locale.US     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r24 = "Earning: EarningMonitor: EarningMonitoringThread: failed OPEN processing for %1$s"
                r25 = 1
                r0 = r25
                java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r25 = r0
                r26 = 0
                java.lang.String r27 = r6.getPackageName()     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r25[r26] = r27     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                java.lang.String r23 = java.lang.String.format(r23, r24, r25)     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r0 = r21
                r2 = r23
                com.getjar.sdk.logging.Logger.e(r0, r2, r10)     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                goto L_0x04b9
            L_0x0535:
                r7 = 0
                r19 = 0
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r21 = r0
                boolean r21 = r21._exitMonitoringThread     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                if (r21 != 0) goto L_0x0057
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r21 = r0
                java.lang.Object r22 = r21._intervalWaitMonitor     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                monitor-enter(r22)     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this     // Catch:{ all -> 0x056d }
                r21 = r0
                java.lang.Object r21 = r21._intervalWaitMonitor     // Catch:{ all -> 0x056d }
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this     // Catch:{ all -> 0x056d }
                r23 = r0
                long r23 = r23._monitorIntervalInMilliseconds     // Catch:{ all -> 0x056d }
                r0 = r21
                r1 = r23
                r0.wait(r1)     // Catch:{ all -> 0x056d }
                monitor-exit(r22)     // Catch:{ all -> 0x056d }
                goto L_0x0057
            L_0x056d:
                r21 = move-exception
                monitor-exit(r22)     // Catch:{ all -> 0x056d }
                throw r21     // Catch:{ AuthException -> 0x0090, InterruptedException -> 0x0199 }
            L_0x0570:
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this
                r21 = r0
                java.lang.Object r22 = r21._monitoringThreadLock
                monitor-enter(r22)
                r0 = r30
                com.getjar.sdk.data.earning.EarningMonitor r0 = com.getjar.sdk.data.earning.EarningMonitor.this     // Catch:{ all -> 0x05be }
                r21 = r0
                r23 = 0
                r0 = r21
                r1 = r23
                com.getjar.sdk.data.earning.EarningMonitor.EarningMonitoringThread unused = r0._monitoringThread = r1     // Catch:{ all -> 0x05be }
                monitor-exit(r22)     // Catch:{ all -> 0x05be }
                com.getjar.sdk.logging.Area r21 = com.getjar.sdk.logging.Area.EARN
                long r21 = r21.value()
                com.getjar.sdk.logging.Area r23 = com.getjar.sdk.logging.Area.TRANSACTION
                long r23 = r23.value()
                long r21 = r21 | r23
                java.util.Locale r23 = java.util.Locale.US
                java.lang.String r24 = "Earning: EarningMonitor: EarningMonitoringThread: exiting [thread:%1$d]"
                r25 = 1
                r0 = r25
                java.lang.Object[] r0 = new java.lang.Object[r0]
                r25 = r0
                r26 = 0
                java.lang.Thread r27 = java.lang.Thread.currentThread()
                long r27 = r27.getId()
                java.lang.Long r27 = java.lang.Long.valueOf(r27)
                r25[r26] = r27
                java.lang.String r23 = java.lang.String.format(r23, r24, r25)
                com.getjar.sdk.logging.Logger.d(r21, r23)
                goto L_0x0233
            L_0x05be:
                r21 = move-exception
                monitor-exit(r22)     // Catch:{ all -> 0x05be }
                throw r21
            L_0x05c1:
                r21 = move-exception
                monitor-exit(r22)     // Catch:{ all -> 0x05c1 }
                throw r21
            L_0x05c4:
                r21 = move-exception
                monitor-exit(r22)     // Catch:{ all -> 0x05c4 }
                throw r21
            */
            throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.earning.EarningMonitor.EarningMonitoringThread.run():void");
        }

        private boolean processOpenEvent(CommContext commContext, EarnStateRecord appState) {
            if (commContext == null) {
                throw new IllegalArgumentException("commContext cannot be null");
            } else if (appState == null) {
                throw new IllegalArgumentException("appState cannot be null");
            } else {
                try {
                    EarnStateRecord appState2 = EarningMonitor.this.ensureAppMetadataOnEarnStateRecord(appState);
                    Future<Operation> operation = EarningMonitor.this.earn(EarningMonitor.this._context, commContext, appState2);
                    if (operation == null || operation.get() == null || operation.get().getResult() == null || !operation.get().getResult().isSuccessfulResponse()) {
                        Logger.w(Area.EARN.value() | Area.TRANSACTION.value(), "Earning: EarningMonitor: EarningMonitoringThread: processOpenEvent() earn operation failed");
                    }
                    EarnStateDatabase.getInstance(EarningMonitor.this._context).updateStatus(appState2.getPackageName(), EarnStateDatabase.Status.OPENED);
                    return true;
                } catch (Exception e) {
                    Logger.e(Area.EARN.value() | Area.TRANSACTION.value(), "Earning: EarningMonitor: EarningMonitoringThread: processOpenEvent() failed", e);
                    return false;
                }
            }
        }
    }

    /* access modifiers changed from: private */
    public Future<Operation> earn(Context context, CommContext commContext, EarnStateRecord appState) throws Exception {
        HashMap<String, String> trackingMetadata;
        HashMap<String, String> appMetadata;
        if (context == null) {
            throw new IllegalArgumentException("'context' cannot be NULL");
        } else if (commContext == null) {
            throw new IllegalArgumentException("'commContext' cannot be NULL");
        } else if (appState == null) {
            throw new IllegalArgumentException("'appState' cannot be NULL");
        } else {
            Logger.d(Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Earning: EarningMonitor: earn() for: %1$s", new Object[]{appState.toString()}));
            new HashMap();
            new HashMap();
            if (StringUtility.isNullOrEmpty(appState.getTrackingMetadata()) || (!appState.getTrackingMetadata().startsWith("[{\"key\":") && !appState.getTrackingMetadata().startsWith("[{\"value\":"))) {
                trackingMetadata = Utility.jsonArrayStringToMapUnchange(appState.getTrackingMetadata());
            } else {
                trackingMetadata = Utility.jsonArrayStringToMap(appState.getTrackingMetadata());
            }
            if (StringUtility.isNullOrEmpty(appState.getApplicationMetadata()) || (!appState.getApplicationMetadata().startsWith("[{\"key\":") && !appState.getApplicationMetadata().startsWith("[{\"value\":"))) {
                appMetadata = Utility.jsonArrayStringToMapUnchange(appState.getApplicationMetadata());
            } else {
                appMetadata = Utility.jsonArrayStringToMap(appState.getApplicationMetadata());
            }
            String clientTransactionId = appState.getClientTransactionId();
            Logger.d(Area.EARN.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Earning: EarningMonitor: earn() Sending Earn transaction for %1$s [clientTransactionId: %2$s]", new Object[]{appState.getPackageName(), clientTransactionId}));
            Future<Operation> operation = new TransactionManager(context).runEarnTransaction(clientTransactionId, commContext, appMetadata.get(Constants.META_ITEM_ID), appState.getPackageName(), appMetadata, trackingMetadata);
            operation.get();
            return operation;
        }
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
                        Logger.d(Area.EARN.value() | Area.AUTH.value() | Area.TRANSACTION.value(), String.format(Locale.US, "Earning: EarningMonitor: Callback from the GetJar SDK [%1$s]", new Object[]{resultData.get(key).getClass().getName()}));
                    }
                }
            }, CommManager.LaunchWork.NONE);
        }
        throw new IllegalStateException("Unable to access the application key");
    }
}
