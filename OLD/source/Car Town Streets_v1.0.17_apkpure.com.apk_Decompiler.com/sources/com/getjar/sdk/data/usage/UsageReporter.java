package com.getjar.sdk.data.usage;

import android.os.Build;
import com.getjar.sdk.comm.CommContext;
import com.getjar.sdk.comm.Operation;
import com.getjar.sdk.comm.Result;
import com.getjar.sdk.data.DatabaseRecordBase;
import com.getjar.sdk.data.ReportUsageData;
import com.getjar.sdk.data.ReportUsageReporter;
import com.getjar.sdk.data.SyncableDatabase;
import com.getjar.sdk.data.usage.SessionEvent;
import com.getjar.sdk.exceptions.CommunicationException;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.Constants;
import com.getjar.sdk.utilities.RewardUtility;
import com.getjar.sdk.utilities.StringUtility;
import com.getjar.sdk.utilities.Utility;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.ExecutionException;

public class UsageReporter extends ReportUsageReporter {
    private static volatile UsageReporter _Instance = null;

    private UsageReporter(CommContext commContext) {
        super(commContext);
    }

    public static synchronized UsageReporter getInstance(CommContext commContext) {
        UsageReporter usageReporter;
        synchronized (UsageReporter.class) {
            if (commContext == null) {
                throw new IllegalArgumentException("'commContext' cannot be NULL");
            }
            if (_Instance == null) {
                _Instance = new UsageReporter(commContext);
            }
            usageReporter = _Instance;
        }
        return usageReporter;
    }

    public void sendUnsyncedData() {
        UsageDatabase usageDB = UsageDatabase.getInstance(this._commContext.getApplicationContext());
        List<PhoneSessionEvent> phoneSessions = usageDB.phoneSessionLoadUnsynced();
        List<ApplicationSessionEvent> appSessions = usageDB.appSessionLoadUnsynced();
        HashMap<ReportUsageData, DatabaseRecordBase> usageToSession = new HashMap<>();
        ArrayList arrayList = new ArrayList();
        for (PhoneSessionEvent phoneSession : phoneSessions) {
            try {
                ReportUsageData.UsageType type = mapSessionToEventType(phoneSession);
                HashMap<String, String> trackingMetadata = new HashMap<>();
                trackingMetadata.put(Constants.META_PHONE_SESSION_ID, phoneSession.getSessionId());
                trackingMetadata.put(Constants.META_EVENT_TIMESTAMP, Utility.epochToISO8601(phoneSession.getTimestamp()));
                trackingMetadata.put(Constants.META_EVENT_TYPE, type.name());
                trackingMetadata.put(Constants.META_EVENT_REASON, phoneSession.getReason().name());
                if (!StringUtility.isNullOrEmpty(phoneSession.getReasonDetails())) {
                    trackingMetadata.put(Constants.META_EVENT_REASON_DETAILS, phoneSession.getReasonDetails());
                }
                HashMap<String, String> appMetadata = new HashMap<>();
                appMetadata.put(Constants.META_DEVICE_PLATFORM, "android");
                appMetadata.put(Constants.META_DEVICE_PLATFORM_VERSION, Build.VERSION.RELEASE);
                ReportUsageData usageData = new ReportUsageData(type, trackingMetadata, appMetadata, 0);
                usageToSession.put(usageData, phoneSession);
                arrayList.add(usageData);
            } catch (Exception e) {
                Logger.e(Area.USAGE.value(), "Bad phone session record loaded", e);
                try {
                    usageDB.deletePhoneSession(phoneSession.getId());
                } catch (Exception e2) {
                }
            }
        }
        for (ApplicationSessionEvent appSession : appSessions) {
            try {
                ReportUsageData.UsageType type2 = mapSessionToEventType(appSession);
                HashMap<String, String> trackingMetadata2 = new HashMap<>();
                trackingMetadata2.put(Constants.META_PHONE_SESSION_ID, appSession.getPhoneSessionId());
                trackingMetadata2.put(Constants.META_APP_SESSION_ID, appSession.getSessionId());
                trackingMetadata2.put(Constants.META_EVENT_TIMESTAMP, Utility.epochToISO8601(appSession.getTimestamp()));
                trackingMetadata2.put(Constants.META_EVENT_TYPE, type2.name());
                trackingMetadata2.put(Constants.META_EVENT_REASON, appSession.getReason().name());
                if (!StringUtility.isNullOrEmpty(appSession.getReasonDetails())) {
                    trackingMetadata2.put(Constants.META_EVENT_REASON_DETAILS, appSession.getReasonDetails());
                }
                HashMap<String, String> appMetadata2 = new HashMap<>();
                ReportUsageData usageData2 = new ReportUsageData(appSession.getPackageName(), type2, trackingMetadata2, appMetadata2, RewardUtility.prepAppDataForReportUsage(appSession.getPackageName(), type2, this._commContext.getApplicationContext(), appMetadata2));
                usageToSession.put(usageData2, appSession);
                arrayList.add(usageData2);
            } catch (Exception e3) {
                Logger.e(Area.USAGE.value(), "Bad application session record loaded", e3);
                try {
                    usageDB.deleteAppSession(appSession.getId());
                } catch (Exception e4) {
                }
            }
        }
        if (arrayList.size() > 0) {
            reportUsageInChunks(UsageManager.getInstance(this._commContext.getApplicationContext()).getBackgroundBatchCount(), (SyncableDatabase<?>) null, arrayList, usageToSession);
        }
    }

    /* access modifiers changed from: protected */
    public void handleResults(SyncableDatabase<?> syncableDatabase, Operation operation, List<ReportUsageData> usageList, HashMap<ReportUsageData, ? extends DatabaseRecordBase> usageToSession) {
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
        UsageDatabase usageDB = UsageDatabase.getInstance(this._commContext.getApplicationContext());
        if (updateRecordsAsSynced) {
            for (ReportUsageData appUsage : usageList) {
                try {
                    DatabaseRecordBase session = (DatabaseRecordBase) usageToSession.get(appUsage);
                    if (session instanceof PhoneSessionEvent) {
                        usageDB.phoneSessionSetAsSynced(session.getId());
                        Logger.v(Area.USAGE.value(), String.format(Locale.US, "Usage: UsageReporter: handleResults() Updated phone session record as synced [id:%1$d]", new Object[]{Long.valueOf(session.getId())}));
                    } else if (session instanceof ApplicationSessionEvent) {
                        usageDB.appSessionSetAsSynced(session.getId());
                        Logger.v(Area.USAGE.value(), String.format(Locale.US, "Usage: UsageReporter: handleResults() Updated application session record as synced [id:%1$d]", new Object[]{Long.valueOf(session.getId())}));
                    } else {
                        throw new IllegalStateException(String.format(Locale.US, "Usage: UsageReporter: handleResults() Unrecognized session event type [%1$s]", new Object[]{session.getClass().getName()}));
                    }
                } catch (Exception e3) {
                    Logger.e(Area.USAGE.value(), "Usage: UsageReporter: handleResults() Failed to find a Session for an App Usage", e3);
                }
            }
        }
    }

    private ReportUsageData.UsageType mapSessionToEventType(SessionEvent session) {
        if (session == null) {
            throw new IllegalArgumentException("'session' cannot be NULL");
        } else if (SessionEvent.Type.start.equals(session.getType())) {
            if (session instanceof PhoneSessionEvent) {
                return ReportUsageData.UsageType.PHONE_SESSION_STARTED;
            }
            if (session instanceof ApplicationSessionEvent) {
                return ReportUsageData.UsageType.APP_SESSION_STARTED;
            }
            throw new IllegalStateException(String.format(Locale.US, "Unrecognized session class [%1$s]", new Object[]{session.getClass().getName()}));
        } else if (SessionEvent.Type.stop.equals(session.getType())) {
            if (session instanceof PhoneSessionEvent) {
                return ReportUsageData.UsageType.PHONE_SESSION_ENDED;
            }
            if (session instanceof ApplicationSessionEvent) {
                return ReportUsageData.UsageType.APP_SESSION_ENDED;
            }
            throw new IllegalStateException(String.format(Locale.US, "Unrecognized session class [%1$s]", new Object[]{session.getClass().getName()}));
        } else if (session.getType() != null) {
            throw new IllegalStateException(String.format(Locale.US, "Unrecognized session record type [%1$s]", new Object[]{session.getType().name()}));
        } else {
            throw new IllegalStateException("Session record found with NULL type");
        }
    }
}
