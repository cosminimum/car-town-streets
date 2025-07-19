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
/* loaded from: classes.dex */
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

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.getjar.sdk.data.ReportUsageReporter
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
                        HashMap<String, String> trackingMetadata = new HashMap<>();
                        trackingMetadata.put(Constants.META_EVENT_TIMESTAMP, Utility.epochToISO8601(unsyncedRecord.getTimestamp()));
                        trackingMetadata.put(Constants.META_EVENT_TYPE, type.name());
                        HashMap<String, String> appMetadata = new HashMap<>();
                        int appFlags = RewardUtility.prepAppDataForReportUsage(unsyncedRecord.getPackageName(), type, this._commContext.getApplicationContext(), appMetadata);
                        ReportUsageData usageData = new ReportUsageData(unsyncedRecord.getPackageName(), type, trackingMetadata, appMetadata, appFlags);
                        usageToDBRecord.put(usageData, unsyncedRecord);
                        usageList.add(usageData);
                        break;
                    case UNINSTALLED:
                        type = ReportUsageData.UsageType.UNINSTALLED;
                        HashMap<String, String> trackingMetadata2 = new HashMap<>();
                        trackingMetadata2.put(Constants.META_EVENT_TIMESTAMP, Utility.epochToISO8601(unsyncedRecord.getTimestamp()));
                        trackingMetadata2.put(Constants.META_EVENT_TYPE, type.name());
                        HashMap<String, String> appMetadata2 = new HashMap<>();
                        int appFlags2 = RewardUtility.prepAppDataForReportUsage(unsyncedRecord.getPackageName(), type, this._commContext.getApplicationContext(), appMetadata2);
                        ReportUsageData usageData2 = new ReportUsageData(unsyncedRecord.getPackageName(), type, trackingMetadata2, appMetadata2, appFlags2);
                        usageToDBRecord.put(usageData2, unsyncedRecord);
                        usageList.add(usageData2);
                        break;
                    case FIRST_OPEN:
                        type = ReportUsageData.UsageType.FIRST_OPENED;
                        HashMap<String, String> trackingMetadata22 = new HashMap<>();
                        trackingMetadata22.put(Constants.META_EVENT_TIMESTAMP, Utility.epochToISO8601(unsyncedRecord.getTimestamp()));
                        trackingMetadata22.put(Constants.META_EVENT_TYPE, type.name());
                        HashMap<String, String> appMetadata22 = new HashMap<>();
                        int appFlags22 = RewardUtility.prepAppDataForReportUsage(unsyncedRecord.getPackageName(), type, this._commContext.getApplicationContext(), appMetadata22);
                        ReportUsageData usageData22 = new ReportUsageData(unsyncedRecord.getPackageName(), type, trackingMetadata22, appMetadata22, appFlags22);
                        usageToDBRecord.put(usageData22, unsyncedRecord);
                        usageList.add(usageData22);
                        break;
                    default:
                        throw new IllegalStateException(String.format(Locale.US, "Unrecognized EventType [%1$s]", unsyncedRecord.getEventType().name()));
                        break;
                }
            } catch (Exception e) {
                Logger.e(Area.USAGE.value(), "Bad database record loaded", e);
                try {
                    PackageEventDatabase.getInstance().deleteRecord(unsyncedRecord.getId());
                } catch (Exception dbe) {
                    Logger.e(Area.USAGE.value(), "deleteRecord failed", dbe);
                }
            }
        }
        if (usageList.size() > 0) {
            reportUsageInChunks(UsageManager.getInstance(this._commContext.getApplicationContext()).getBackgroundBatchCount(), PackageEventDatabase.getInstance(), usageList, usageToDBRecord);
        }
    }

    @Override // com.getjar.sdk.data.ReportUsageReporter
    protected void handleResults(SyncableDatabase<?> database, Operation operation, List<ReportUsageData> usageList, HashMap<ReportUsageData, ? extends DatabaseRecordBase> usageToDBObject) {
        super.handleResults(database, operation, usageList, usageToDBObject);
        database.purgeSyncedRecords();
    }
}
