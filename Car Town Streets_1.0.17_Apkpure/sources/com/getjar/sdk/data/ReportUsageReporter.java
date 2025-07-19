package com.getjar.sdk.data;

import com.getjar.sdk.comm.CommContext;
import com.getjar.sdk.comm.Operation;
import com.getjar.sdk.comm.ReportUsageProxy;
import com.getjar.sdk.comm.Result;
import com.getjar.sdk.exceptions.CommunicationException;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutionException;
/* loaded from: classes.dex */
public abstract class ReportUsageReporter {
    protected final CommContext _commContext;

    protected abstract void sendUnsyncedData();

    /* JADX INFO: Access modifiers changed from: protected */
    public ReportUsageReporter(CommContext commContext) {
        if (commContext == null) {
            throw new IllegalArgumentException("'commContext' cannot be NULL");
        }
        this._commContext = commContext;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void handleResults(SyncableDatabase<?> database, Operation operation, List<ReportUsageData> usageList, HashMap<ReportUsageData, ? extends DatabaseRecordBase> usageToDBObject) {
        boolean updateRecordsAsSynced = false;
        if (operation == null) {
            updateRecordsAsSynced = true;
        } else {
            try {
                Result result = operation.mo38get();
                if (result != null) {
                    if (result.isSuccessfulResponse()) {
                        updateRecordsAsSynced = true;
                    }
                }
            } catch (InterruptedException e) {
                throw new CommunicationException(e);
            } catch (ExecutionException e2) {
                throw new CommunicationException(e2);
            }
        }
        if (updateRecordsAsSynced) {
            for (ReportUsageData appUsage : usageList) {
                try {
                    DatabaseRecordBase record = usageToDBObject.get(appUsage);
                    database.setRecordAsSynced(record.getId());
                    Logger.v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: InstallStateReporter: handleResults() Updated record as synced [id:%1$d]", Long.valueOf(record.getId())));
                } catch (Exception e3) {
                    Logger.e(Area.USAGE.value() | Area.STORAGE.value(), "Usage: InstallStateReporter: handleResults() Failed", e3);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void reportUsageInChunks(int batchSize, SyncableDatabase<?> database, List<ReportUsageData> usageList, HashMap<ReportUsageData, ? extends DatabaseRecordBase> usageToDBObject) {
        Logger.d(Area.USAGE.value(), "Usage: UsageReporter: reportUsageInChunks() START");
        List<ReportUsageData> currentUsageList = new ArrayList<>();
        for (int i = 0; i < usageList.size(); i++) {
            currentUsageList.add(usageList.get(i));
            if (currentUsageList.size() >= batchSize) {
                Logger.d(Area.USAGE.value(), String.format(Locale.US, "Usage: UsageReporter: reportUsageInChunks() Calling reportApplicationUsage for %1$d records", Integer.valueOf(currentUsageList.size())));
                handleResults(database, ReportUsageProxy.getInstance().reportApplicationUsage(this._commContext, currentUsageList), currentUsageList, usageToDBObject);
                currentUsageList.clear();
            }
        }
        if (currentUsageList.size() > 0) {
            Logger.d(Area.USAGE.value(), String.format(Locale.US, "Usage: UsageReporter: reportUsageInChunks() Calling reportApplicationUsage for %1$d records", Integer.valueOf(currentUsageList.size())));
            handleResults(database, ReportUsageProxy.getInstance().reportApplicationUsage(this._commContext, currentUsageList), currentUsageList, usageToDBObject);
            currentUsageList.clear();
        }
        Logger.d(Area.USAGE.value(), "Usage: UsageReporter: reportUsageInChunks() -- DONE");
    }
}
