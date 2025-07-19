package com.getjar.sdk.data.install_state;

import com.getjar.sdk.comm.CommContext;
import com.getjar.sdk.data.DatabaseRecordBase;
import com.getjar.sdk.data.ReportUsageData;
import com.getjar.sdk.data.ReportUsageReporter;
import com.getjar.sdk.data.install_state.InstallStateManager;
import com.getjar.sdk.data.usage.UsageManager;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.Constants;
import com.getjar.sdk.utilities.RewardUtility;
import com.getjar.sdk.utilities.Utility;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

class InstallStateReporter extends ReportUsageReporter {
    private static volatile InstallStateReporter _Instance = null;

    private InstallStateReporter(CommContext commContext) {
        super(commContext);
    }

    public static synchronized InstallStateReporter getInstance(CommContext commContext) {
        InstallStateReporter installStateReporter;
        synchronized (InstallStateReporter.class) {
            if (commContext == null) {
                throw new IllegalArgumentException("'commContext' cannot be NULL");
            }
            if (_Instance == null) {
                _Instance = new InstallStateReporter(commContext);
            }
            installStateReporter = _Instance;
        }
        return installStateReporter;
    }

    /* access modifiers changed from: protected */
    public void sendUnsyncedData() {
        ReportUsageData.UsageType type;
        List<InstallStateRecord> unsyncedRecords = InstallStateDatabase.getInstance().loadUnsyncedRecords();
        HashMap<ReportUsageData, DatabaseRecordBase> usageToDBRecord = new HashMap<>();
        List<ReportUsageData> usageList = new ArrayList<>();
        for (InstallStateRecord unsyncedRecord : unsyncedRecords) {
            try {
                if (InstallStateManager.InstallState.FOUND_INSTALLED.equals(unsyncedRecord.getStatus())) {
                    type = ReportUsageData.UsageType.FOUND_INSTALLED;
                } else if (InstallStateManager.InstallState.FOUND_UNINSTALLED.equals(unsyncedRecord.getStatus())) {
                    type = ReportUsageData.UsageType.FOUND_UNINSTALLED;
                } else {
                    throw new IllegalStateException(String.format(Locale.US, "Unrecognized InstallStateRecord state [%1$s]", new Object[]{unsyncedRecord.getStatus().name()}));
                }
                HashMap<String, String> trackingMetadata = new HashMap<>();
                trackingMetadata.put(Constants.META_EVENT_TIMESTAMP, Utility.epochToISO8601(unsyncedRecord.getTimestamp()));
                trackingMetadata.put(Constants.META_EVENT_TYPE, type.name());
                HashMap<String, String> appMetadata = new HashMap<>();
                ReportUsageData usageData = new ReportUsageData(unsyncedRecord.getPackageName(), type, trackingMetadata, appMetadata, RewardUtility.prepAppDataForReportUsage(unsyncedRecord.getPackageName(), type, this._commContext.getApplicationContext(), appMetadata));
                usageToDBRecord.put(usageData, unsyncedRecord);
                usageList.add(usageData);
            } catch (Exception e) {
                Logger.m643e(Area.USAGE.value(), "Bad database record loaded", e);
                try {
                    InstallStateDatabase.getInstance().deleteRecord(unsyncedRecord.getId());
                } catch (Exception dbe) {
                    Logger.m643e(Area.USAGE.value(), "deleteRecord failed", dbe);
                }
            }
        }
        if (usageList.size() > 0) {
            reportUsageInChunks(UsageManager.getInstance(this._commContext.getApplicationContext()).getBackgroundBatchCount(), InstallStateDatabase.getInstance(), usageList, usageToDBRecord);
        }
    }
}
