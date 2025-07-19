package com.getjar.sdk.data.install_state;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import com.getjar.sdk.comm.CommContext;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class InstallStateManager {
    private static volatile InstallStateManager _Instance = null;
    private final Context _context;
    private volatile Object _installStateLock = new Object();

    public enum InstallState {
        FOUND_INSTALLED,
        FOUND_UNINSTALLED
    }

    private InstallStateManager(Context context) {
        this._context = context.getApplicationContext();
        InstallStateDatabase.initialize(context);
    }

    public static synchronized InstallStateManager getInstance(Context context) {
        InstallStateManager installStateManager;
        synchronized (InstallStateManager.class) {
            if (context == null) {
                throw new IllegalArgumentException("'context' cannot be NULL");
            }
            if (_Instance == null) {
                _Instance = new InstallStateManager(context);
            }
            installStateManager = _Instance;
        }
        return installStateManager;
    }

    public void updateCurrentState() {
        synchronized (this._installStateLock) {
            List<String> installedPackageNames = new ArrayList<>();
            for (ApplicationInfo appInfo : this._context.getPackageManager().getInstalledApplications(128)) {
                if (!installedPackageNames.contains(appInfo.packageName)) {
                    installedPackageNames.add(appInfo.packageName);
                }
            }
            Map<String, InstallStateRecord> packageNameToDBRecord = new HashMap<>();
            for (InstallStateRecord record : InstallStateDatabase.getInstance().loadAllRecords()) {
                if (!packageNameToDBRecord.containsKey(record.getPackageName())) {
                    packageNameToDBRecord.put(record.getPackageName(), record);
                }
            }
            for (String packageName : installedPackageNames) {
                if (!packageNameToDBRecord.containsKey(packageName)) {
                    InstallStateDatabase.getInstance().addRecord(packageName);
                }
            }
            for (InstallStateRecord record2 : packageNameToDBRecord.values()) {
                if (InstallState.FOUND_INSTALLED.equals(record2.getStatus()) && !installedPackageNames.contains(record2.getPackageName())) {
                    InstallStateDatabase.getInstance().updateState(record2.getId(), InstallState.FOUND_UNINSTALLED);
                }
            }
        }
    }

    public void sendCurrentStateDeltas(CommContext commContext) {
        if (commContext == null) {
            throw new IllegalArgumentException("'commContext' cannot be NULL");
        }
        synchronized (this._installStateLock) {
            InstallStateReporter.getInstance(commContext).sendUnsyncedData();
        }
    }
}
