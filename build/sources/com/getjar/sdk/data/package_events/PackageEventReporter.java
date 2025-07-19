package com.getjar.sdk.data.package_events;

import com.getjar.sdk.comm.CommContext;
import com.getjar.sdk.comm.Operation;
import com.getjar.sdk.data.DatabaseRecordBase;
import com.getjar.sdk.data.ReportUsageData;
import com.getjar.sdk.data.ReportUsageReporter;
import com.getjar.sdk.data.SyncableDatabase;
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

class PackageEventReporter extends ReportUsageReporter {
    private static volatile PackageEventReporter _Instance = null;

    private PackageEventReporter(CommContext commContext) {
        super(commContext);
    }

    public static synchronized PackageEventReporter getInstance(CommContext commContext) {
        PackageEventReporter packageEventReporter;
        synchronized (PackageEventReporter.class) {
            if (commContext == null) {
                throw new IllegalArgumentException("'commContext' cannot be NULL");
            }
            if (_Instance == null) {
                _Instance = new PackageEventReporter(commContext);
            }
            packageEventReporter = _Instance;
        }
        return packageEventReporter;
    }

    /* access modifiers changed from: protected */
    public void sendUnsyncedData() {
        ReportUsageData.UsageType type;
        List<PackageEventRecord> unsyncedRecords = PackageEventDatabase.getInstance().loadUnsyncedRecords();
        HashMap<ReportUsageData, DatabaseRecordBase> usageToDBRecord = new HashMap<>();
        List<ReportUsageData> usageList = new ArrayList<>();
        for (PackageEventRecord unsyncedRecord : unsyncedRecords) {
            try {
                switch (unsyncedRecord.getEventType()) {
                    case INSTALLED:
                        type = ReportUsageData.UsageType.INSTALLED;
                        break;
                    case UNINSTALLED:
                        type = ReportUsageData.UsageType.UNINSTALLED;
                        break;
                    case FIRST_OPEN:
                        type = ReportUsageData.UsageType.FIRST_OPENED;
                        break;
                    default:
                        throw new IllegalStateException(String.format(Locale.US, "Unrecognized EventType [%1$s]", new Object[]{unsyncedRecord.getEventType().name()}));
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
                    PackageEventDatabase.getInstance().deleteRecord(unsyncedRecord.getId());
                } catch (Exception dbe) {
                    Logger.m643e(Area.USAGE.value(), "deleteRecord failed", dbe);
                }
            }
        }
        if (usageList.size() > 0) {
            reportUsageInChunks(UsageManager.getInstance(this._commContext.getApplicationContext()).getBackgroundBatchCount(), PackageEventDatabase.getInstance(), usageList, usageToDBRecord);
        }
    }

    /* access modifiers changed from: protected */
    public void handleResults(SyncableDatabase<?> database, Operation operation, List<ReportUsageData> usageList, HashMap<ReportUsageData, ? extends DatabaseRecordBase> usageToDBObject) {
        super.handleResults(database, operation, usageList, usageToDBObject);
        database.purgeSyncedRecords();
    }
}
