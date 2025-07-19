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

public abstract class ReportUsageReporter {
    protected final CommContext _commContext;

    /* access modifiers changed from: protected */
    public abstract void sendUnsyncedData();

    protected ReportUsageReporter(CommContext commContext) {
        if (commContext == null) {
            throw new IllegalArgumentException("'commContext' cannot be NULL");
        }
        this._commContext = commContext;
    }

    /* access modifiers changed from: protected */
    public void handleResults(SyncableDatabase<?> database, Operation operation, List<ReportUsageData> usageList, HashMap<ReportUsageData, ? extends DatabaseRecordBase> usageToDBObject) {
        boolean updateRecordsAsSynced = false;
        if (operation == null) {
            updateRecordsAsSynced = true;
        } else {
            try {
                Result result = operation.get();
                if (result != null && result.isSuccessfulResponse()) {
                    updateRecordsAsSynced = true;
                }
            } catch (InterruptedException e) {
                throw new CommunicationException((Throwable) e);
            } catch (ExecutionException e2) {
                throw new CommunicationException((Throwable) e2);
            }
        }
        if (updateRecordsAsSynced) {
            for (ReportUsageData appUsage : usageList) {
                try {
                    DatabaseRecordBase record = (DatabaseRecordBase) usageToDBObject.get(appUsage);
                    database.setRecordAsSynced(record.getId());
                    Logger.m646v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: InstallStateReporter: handleResults() Updated record as synced [id:%1$d]", new Object[]{Long.valueOf(record.getId())}));
                } catch (Exception e3) {
                    Logger.m643e(Area.USAGE.value() | Area.STORAGE.value(), "Usage: InstallStateReporter: handleResults() Failed", e3);
                }
            }
        }
    }

    /* access modifiers changed from: protected */
    public void reportUsageInChunks(int batchSize, SyncableDatabase<?> database, List<ReportUsageData> usageList, HashMap<ReportUsageData, ? extends DatabaseRecordBase> usageToDBObject) {
        Logger.m640d(Area.USAGE.value(), "Usage: UsageReporter: reportUsageInChunks() START");
        List<ReportUsageData> currentUsageList = new ArrayList<>();
        for (int i = 0; i < usageList.size(); i++) {
            currentUsageList.add(usageList.get(i));
            if (currentUsageList.size() >= batchSize) {
                Logger.m640d(Area.USAGE.value(), String.format(Locale.US, "Usage: UsageReporter: reportUsageInChunks() Calling reportApplicationUsage for %1$d records", new Object[]{Integer.valueOf(currentUsageList.size())}));
                handleResults(database, ReportUsageProxy.getInstance().reportApplicationUsage(this._commContext, currentUsageList), currentUsageList, usageToDBObject);
                currentUsageList.clear();
            }
        }
        if (currentUsageList.size() > 0) {
            Logger.m640d(Area.USAGE.value(), String.format(Locale.US, "Usage: UsageReporter: reportUsageInChunks() Calling reportApplicationUsage for %1$d records", new Object[]{Integer.valueOf(currentUsageList.size())}));
            handleResults(database, ReportUsageProxy.getInstance().reportApplicationUsage(this._commContext, currentUsageList), currentUsageList, usageToDBObject);
            currentUsageList.clear();
        }
        Logger.m640d(Area.USAGE.value(), "Usage: UsageReporter: reportUsageInChunks() -- DONE");
    }
}
