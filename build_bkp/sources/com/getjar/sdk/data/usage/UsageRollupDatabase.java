package com.getjar.sdk.data.usage;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import com.getjar.sdk.data.usage.SessionEvent;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.StringUtility;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

public class UsageRollupDatabase extends SQLiteOpenHelper {
    private static final String DATABASE_CREATE_TABLE_ROLLUP = "CREATE TABLE IF NOT EXISTS usageRollup (id INTEGER PRIMARY KEY AUTOINCREMENT, window_id INTEGER NOT NULL, package_name TEXT NOT NULL, start_timestamp INTEGER NOT NULL, stop_timestamp INTEGER NOT NULL, duration INTEGER NOT NULL, sessions INTEGER NOT NULL, last_start_timestamp INTEGER NOT NULL DEFAULT 0, last_stop_timestamp INTEGER NOT NULL DEFAULT 0, FOREIGN KEY(window_id) REFERENCES reportingWindow(id), UNIQUE(window_id, package_name) ON CONFLICT ABORT);";
    private static final String DATABASE_CREATE_TABLE_WINDOW = "CREATE TABLE IF NOT EXISTS reportingWindow (id INTEGER PRIMARY KEY AUTOINCREMENT, start_timestamp INTEGER NOT NULL UNIQUE, stop_timestamp INTEGER NOT NULL UNIQUE);";
    private static final String DATABASE_NAME = "GetJarDBUsageRollup";
    private static final String DATABASE_TABLE_ROLLUP = "usageRollup";
    private static final String DATABASE_TABLE_WINDOW = "reportingWindow";
    private static final int DATABASE_VERSION = 1;
    private static final String[] DB_CREATE_TABLE_COMMANDS = {DATABASE_CREATE_TABLE_WINDOW, DATABASE_CREATE_TABLE_ROLLUP};
    private static final String[] DB_TABLE_NAMES = {DATABASE_TABLE_WINDOW, DATABASE_TABLE_ROLLUP};
    private static volatile UsageRollupDatabase _Instance = null;
    private final Context _context;
    private volatile Object _databaseAccessLock = new Object();

    public static synchronized UsageRollupDatabase getInstance(Context context) {
        UsageRollupDatabase usageRollupDatabase;
        synchronized (UsageRollupDatabase.class) {
            if (context == null) {
                throw new IllegalArgumentException("'context' can not be NULL");
            }
            if (_Instance == null) {
                _Instance = new UsageRollupDatabase(context, DATABASE_NAME);
            }
            usageRollupDatabase = _Instance;
        }
        return usageRollupDatabase;
    }

    private UsageRollupDatabase(Context context, String name) {
        super(context, name, (SQLiteDatabase.CursorFactory) null, 1);
        this._context = context;
        Logger.m644i(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "UsageRollupDatabase: Opened database '%1$s'", new Object[]{name}));
    }

    public void onCreate(SQLiteDatabase db) {
        synchronized (this._databaseAccessLock) {
            for (String createCommand : DB_CREATE_TABLE_COMMANDS) {
                db.execSQL(createCommand);
            }
        }
    }

    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        synchronized (this._databaseAccessLock) {
            Logger.m640d(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Upgrading database '%1$s' from version %2$d to %3$d, which will destroy all old data", new Object[]{DATABASE_NAME, Integer.valueOf(oldVersion), Integer.valueOf(newVersion)}));
            for (String tableName : DB_TABLE_NAMES) {
                db.execSQL(String.format(Locale.US, "DROP TABLE IF EXISTS %1$s", new Object[]{tableName}));
            }
            onCreate(db);
        }
    }

    /* access modifiers changed from: protected */
    public void collectAppSessionEvent(SessionEvent.Type eventType, long eventTimestamp, String eventPackageName, Long startEventTimestamp) {
        if (eventType == null) {
            throw new IllegalArgumentException("'eventType' cannot be NULL");
        } else if (eventTimestamp < 0) {
            throw new IllegalArgumentException("'eventTimestamp' cannot be less than zero");
        } else if (StringUtility.isNullOrEmpty(eventPackageName)) {
            throw new IllegalArgumentException("'eventPackageName' cannot be NULL or empty");
        } else {
            if (SessionEvent.Type.stop.equals(eventType)) {
                if (startEventTimestamp == null) {
                    throw new IllegalArgumentException("'startEventTimestamp' cannot be NULL for collecting 'stop' events");
                } else if (startEventTimestamp.longValue() < 0) {
                    throw new IllegalArgumentException("'startEventTimestamp' cannot be less than zero for collecting 'stop' events");
                }
            }
            long now = System.currentTimeMillis();
            synchronized (this._databaseAccessLock) {
                boolean newWindowsCreated = false;
                long windowId = -1;
                List<ReportingWindow> reportingWindows = loadReportingWindows();
                if (reportingWindows.size() <= 0) {
                    long stop = eventTimestamp + ((long) UsageManager.getInstance(this._context).getRequestTimeWindowMilliseconds());
                    ContentValues values = new ContentValues();
                    values.put("start_timestamp", Long.valueOf(eventTimestamp));
                    values.put("stop_timestamp", Long.valueOf(stop));
                    windowId = getWritableDatabase().insert(DATABASE_TABLE_WINDOW, (String) null, values);
                    newWindowsCreated = true;
                    Logger.m646v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: UsageRollupDatabase: collectAppSessionEvent() Created reporting window [id:%1$d start:%2$d stop:%3$d]", new Object[]{Long.valueOf(windowId), Long.valueOf(eventTimestamp), Long.valueOf(stop)}));
                } else {
                    int i = 0;
                    while (true) {
                        if (i >= reportingWindows.size()) {
                            break;
                        }
                        ReportingWindow window = reportingWindows.get(i);
                        if (window.getTimestampStart() <= eventTimestamp && window.getTimestampStop() >= eventTimestamp) {
                            windowId = window.getId();
                            break;
                        }
                        i++;
                    }
                    long reportingStart = now - ((long) (UsageManager.getInstance(this._context).getRequestTimeWindowMilliseconds() * UsageManager.getInstance(this._context).getRequestTimeWindowCount()));
                    long windowSize = (long) UsageManager.getInstance(this._context).getRequestTimeWindowMilliseconds();
                    long windowStop = reportingWindows.get(0).getTimestampStop();
                    while (windowStop < now) {
                        long windowStart = windowStop + 1;
                        windowStop = windowStart + windowSize;
                        if (windowStop >= reportingStart) {
                            ContentValues values2 = new ContentValues();
                            values2.put("start_timestamp", Long.valueOf(windowStart));
                            values2.put("stop_timestamp", Long.valueOf(windowStop));
                            long newId = getWritableDatabase().insert(DATABASE_TABLE_WINDOW, (String) null, values2);
                            newWindowsCreated = true;
                            Logger.m646v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: UsageRollupDatabase: collectAppSessionEvent() Created reporting window [id:%1$d start:%2$d stop:%3$d]", new Object[]{Long.valueOf(newId), Long.valueOf(windowStart), Long.valueOf(windowStop)}));
                            if (windowStart <= eventTimestamp && windowStop >= eventTimestamp) {
                                windowId = newId;
                            }
                        }
                    }
                }
                if (windowId < 0) {
                    Logger.m642e(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: UsageRollupDatabase: collectAppSessionEvent() Failed to find or create a reporting window for an event with timestamp %1$d, giving up...", new Object[]{Long.valueOf(eventTimestamp)}));
                    return;
                }
                if (newWindowsCreated) {
                    reportingWindows = loadReportingWindows();
                }
                ReportingWindow activeWindow = null;
                Iterator i$ = reportingWindows.iterator();
                while (true) {
                    if (!i$.hasNext()) {
                        break;
                    }
                    ReportingWindow window2 = i$.next();
                    if (windowId == window2.getId()) {
                        activeWindow = window2;
                        break;
                    }
                }
                if (activeWindow == null) {
                    Logger.m642e(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: UsageRollupDatabase: collectAppSessionEvent() Reporting window %1$d for an event with timestamp %2$d, has been purged, giving up...", new Object[]{Long.valueOf(windowId), Long.valueOf(eventTimestamp)}));
                    return;
                }
                Logger.m646v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: UsageRollupDatabase: collectAppSessionEvent() Collecting event [packageName:%1$s type:%2$s time:%3$d] into reporting window [id:%4$d start:%5$d stop:%6$d]", new Object[]{eventPackageName, eventType.name(), Long.valueOf(eventTimestamp), Long.valueOf(activeWindow.getId()), Long.valueOf(activeWindow.getTimestampStart()), Long.valueOf(activeWindow.getTimestampStop())}));
                AggregateSession rollupRecord = loadAggregateSession(activeWindow.getId(), eventPackageName);
                if (SessionEvent.Type.start.equals(eventType)) {
                    if (rollupRecord != null) {
                        ContentValues values3 = new ContentValues();
                        values3.put("start_timestamp", Long.valueOf(Math.min(eventTimestamp, rollupRecord.getTimestampStart())));
                        values3.put("stop_timestamp", Long.valueOf(Math.max(eventTimestamp, rollupRecord.getTimestampStart())));
                        values3.put("sessions", Integer.valueOf(rollupRecord.getTotalSessionsCount() + 1));
                        values3.put("last_start_timestamp", Long.valueOf(eventTimestamp));
                        getWritableDatabase().update(DATABASE_TABLE_ROLLUP, values3, String.format(Locale.US, "id = %1$d", new Object[]{Long.valueOf(rollupRecord.getId())}), (String[]) null);
                    } else {
                        ContentValues values4 = new ContentValues();
                        values4.put("window_id", Long.valueOf(activeWindow.getId()));
                        values4.put("package_name", eventPackageName);
                        values4.put("start_timestamp", Long.valueOf(eventTimestamp));
                        values4.put("stop_timestamp", Long.valueOf(eventTimestamp));
                        values4.put("duration", (Integer) null);
                        values4.put("sessions", 1);
                        values4.put("last_start_timestamp", Long.valueOf(eventTimestamp));
                        getWritableDatabase().insert(DATABASE_TABLE_ROLLUP, (String) null, values4);
                    }
                } else if (SessionEvent.Type.stop.equals(eventType)) {
                    long startTime = activeWindow.getTimestampStart();
                    if (startEventTimestamp != null) {
                        startTime = startEventTimestamp.longValue();
                    } else if (rollupRecord != null) {
                        startTime = rollupRecord.getTimestampStart();
                    }
                    long sessionDuration = eventTimestamp - startTime;
                    if (sessionDuration < 0) {
                        sessionDuration = 0;
                    }
                    if (rollupRecord != null) {
                        ContentValues values5 = new ContentValues();
                        values5.put("stop_timestamp", Long.valueOf(Math.max(eventTimestamp, rollupRecord.getTimestampStart())));
                        values5.put("duration", Long.valueOf(((long) rollupRecord.getTotalUseDuration()) + sessionDuration));
                        values5.put("last_stop_timestamp", Long.valueOf(eventTimestamp));
                        getWritableDatabase().update(DATABASE_TABLE_ROLLUP, values5, String.format(Locale.US, "id = %1$d", new Object[]{Long.valueOf(rollupRecord.getId())}), (String[]) null);
                    } else {
                        ContentValues values6 = new ContentValues();
                        values6.put("window_id", Long.valueOf(activeWindow.getId()));
                        values6.put("package_name", eventPackageName);
                        values6.put("start_timestamp", Long.valueOf(startTime));
                        values6.put("stop_timestamp", Long.valueOf(eventTimestamp));
                        values6.put("duration", Long.valueOf(sessionDuration));
                        values6.put("sessions", 1);
                        values6.put("last_start_timestamp", Long.valueOf(startTime));
                        values6.put("last_stop_timestamp", Long.valueOf(eventTimestamp));
                        getWritableDatabase().insert(DATABASE_TABLE_ROLLUP, (String) null, values6);
                    }
                } else {
                    throw new IllegalStateException(String.format("Unrecognized event type [%1$s]", new Object[]{eventType.name()}));
                }
                for (int i2 = 1; i2 < reportingWindows.size(); i2++) {
                    ReportingWindow oldWindow = reportingWindows.get(i2);
                    for (AggregateSession rollup : loadAggregateSessions(oldWindow.getId())) {
                        if (rollup.getTimestampLastStop() < rollup.getTimestampLastStart()) {
                            int durationDelta = (int) (oldWindow.getTimestampStop() - rollup.getTimestampLastStart());
                            ContentValues values7 = new ContentValues();
                            values7.put("stop_timestamp", Long.valueOf(oldWindow.getTimestampStop()));
                            values7.put("duration", Integer.valueOf(rollup.getTotalUseDuration() + durationDelta));
                            values7.put("last_stop_timestamp", Long.valueOf(oldWindow.getTimestampStop()));
                            getWritableDatabase().update(DATABASE_TABLE_ROLLUP, values7, String.format(Locale.US, "id = %1$d", new Object[]{Long.valueOf(rollup.getId())}), (String[]) null);
                        }
                    }
                }
                purgeObsoleteAggregationDataInternal();
            }
        }
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:15:0x0030=Splitter:B:15:0x0030, B:24:0x003a=Splitter:B:24:0x003a} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public java.util.List<com.getjar.sdk.data.usage.AggregateSession> loadAggregateSessions() {
        /*
            r12 = this;
            java.lang.Object r11 = r12._databaseAccessLock
            monitor-enter(r11)
            java.util.ArrayList r9 = new java.util.ArrayList     // Catch:{ all -> 0x0031 }
            r9.<init>()     // Catch:{ all -> 0x0031 }
            r10 = 0
            android.database.sqlite.SQLiteDatabase r0 = r12.getReadableDatabase()     // Catch:{ all -> 0x0029 }
            java.lang.String r1 = "usageRollup"
            r2 = 0
            r3 = 0
            r4 = 0
            r5 = 0
            r6 = 0
            java.lang.String r7 = "package_name"
            android.database.Cursor r10 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch:{ all -> 0x0029 }
        L_0x001a:
            boolean r0 = r10.moveToNext()     // Catch:{ all -> 0x0029 }
            if (r0 == 0) goto L_0x0034
            com.getjar.sdk.data.usage.AggregateSession r0 = new com.getjar.sdk.data.usage.AggregateSession     // Catch:{ all -> 0x0029 }
            r0.<init>(r10)     // Catch:{ all -> 0x0029 }
            r9.add(r0)     // Catch:{ all -> 0x0029 }
            goto L_0x001a
        L_0x0029:
            r0 = move-exception
            if (r10 == 0) goto L_0x0030
            r10.close()     // Catch:{ Exception -> 0x0050 }
            r10 = 0
        L_0x0030:
            throw r0     // Catch:{ all -> 0x0031 }
        L_0x0031:
            r0 = move-exception
            monitor-exit(r11)     // Catch:{ all -> 0x0031 }
            throw r0
        L_0x0034:
            if (r10 == 0) goto L_0x003a
            r10.close()     // Catch:{ Exception -> 0x003c }
            r10 = 0
        L_0x003a:
            monitor-exit(r11)     // Catch:{ all -> 0x0031 }
            return r9
        L_0x003c:
            r8 = move-exception
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ all -> 0x0031 }
            long r0 = r0.value()     // Catch:{ all -> 0x0031 }
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x0031 }
            long r2 = r2.value()     // Catch:{ all -> 0x0031 }
            long r0 = r0 | r2
            java.lang.String r2 = "Usage: UsageRollupDatabase: loadAggregateSessions() results.close() failed"
            com.getjar.sdk.logging.Logger.m643e(r0, r2, r8)     // Catch:{ all -> 0x0031 }
            goto L_0x003a
        L_0x0050:
            r8 = move-exception
            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ all -> 0x0031 }
            long r1 = r1.value()     // Catch:{ all -> 0x0031 }
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x0031 }
            long r3 = r3.value()     // Catch:{ all -> 0x0031 }
            long r1 = r1 | r3
            java.lang.String r3 = "Usage: UsageRollupDatabase: loadAggregateSessions() results.close() failed"
            com.getjar.sdk.logging.Logger.m643e(r1, r3, r8)     // Catch:{ all -> 0x0031 }
            goto L_0x0030
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.usage.UsageRollupDatabase.loadAggregateSessions():java.util.List");
    }

    /* access modifiers changed from: protected */
    public void purgeObsoleteAggregationData() {
        synchronized (this._databaseAccessLock) {
            purgeObsoleteAggregationDataInternal();
        }
    }

    /* access modifiers changed from: protected */
    public long[] getTotalReportingWindow() {
        long[] minMax = {0, 0};
        Cursor results = null;
        try {
            results = getReadableDatabase().rawQuery(String.format(Locale.US, "SELECT min(start_timestamp), max(stop_timestamp) FROM %1$s", new Object[]{DATABASE_TABLE_WINDOW}), (String[]) null);
            if (results.moveToNext()) {
                minMax[0] = results.getLong(0);
                minMax[1] = results.getLong(1);
            }
            if (results != null) {
                try {
                } catch (Exception e) {
                    Logger.m643e(Area.USAGE.value() | Area.STORAGE.value(), "Usage: UsageRollupDatabase: loadAggregateSessions() results.close() failed", e);
                }
            }
            return minMax;
        } finally {
            if (results != null) {
                try {
                    results.close();
                } catch (Exception e2) {
                    Logger.m643e(Area.USAGE.value() | Area.STORAGE.value(), "Usage: UsageRollupDatabase: loadAggregateSessions() results.close() failed", e2);
                }
            }
        }
    }

    private List<AggregateSession> loadAggregateSessions(long windowId) {
        List<AggregateSession> result = new ArrayList<>();
        Cursor results = null;
        try {
            results = getReadableDatabase().query(DATABASE_TABLE_ROLLUP, (String[]) null, String.format(Locale.US, "window_id = %1$d", new Object[]{Long.valueOf(windowId)}), (String[]) null, (String) null, (String) null, (String) null);
            while (results.moveToNext()) {
                result.add(new AggregateSession(results));
            }
            if (results != null) {
                try {
                } catch (Exception e) {
                    Logger.m643e(Area.USAGE.value() | Area.STORAGE.value(), "Usage: UsageRollupDatabase: loadAggregateSessions() results.close() failed", e);
                }
            }
            return result;
        } finally {
            if (results != null) {
                try {
                    results.close();
                } catch (Exception e2) {
                    Logger.m643e(Area.USAGE.value() | Area.STORAGE.value(), "Usage: UsageRollupDatabase: loadAggregateSessions() results.close() failed", e2);
                }
            }
        }
    }

    private void purgeObsoleteAggregationDataInternal() {
        int windowCount = UsageManager.getInstance(this._context).getRequestTimeWindowCount();
        List<ReportingWindow> reportingWindows = loadReportingWindows();
        if (reportingWindows.size() > windowCount) {
            for (int i = windowCount; i < reportingWindows.size(); i++) {
                long windowIdToKill = reportingWindows.get(i).getId();
                int deleteCount = getWritableDatabase().delete(DATABASE_TABLE_ROLLUP, String.format(Locale.US, "window_id = %1$d", new Object[]{Long.valueOf(windowIdToKill)}), (String[]) null);
                Logger.m646v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: UsageRollupDatabase: purgeObsoleteAggregationDataInternal() Removed %1$d roll-up records for aged-out reporting window %2$d", new Object[]{Integer.valueOf(deleteCount), Long.valueOf(windowIdToKill)}));
                getWritableDatabase().delete(DATABASE_TABLE_WINDOW, String.format(Locale.US, "id = %1$d", new Object[]{Long.valueOf(windowIdToKill)}), (String[]) null);
                Logger.m646v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: UsageRollupDatabase: purgeObsoleteAggregationDataInternal() Removed aged-out reporting window %1$d", new Object[]{Long.valueOf(windowIdToKill)}));
            }
        }
    }

    private List<ReportingWindow> loadReportingWindows() {
        List<ReportingWindow> resultList = new ArrayList<>();
        Cursor results = null;
        try {
            results = getReadableDatabase().query(DATABASE_TABLE_WINDOW, (String[]) null, (String) null, (String[]) null, (String) null, (String) null, "stop_timestamp DESC");
            while (results.moveToNext()) {
                resultList.add(new ReportingWindow(results));
            }
            if (results != null) {
                try {
                } catch (Exception e) {
                    Logger.m643e(Area.USAGE.value() | Area.STORAGE.value(), "Usage: UsageRollupDatabase: loadReportingWindows() results.close() failed", e);
                }
            }
            return resultList;
        } finally {
            if (results != null) {
                try {
                    results.close();
                } catch (Exception e2) {
                    Logger.m643e(Area.USAGE.value() | Area.STORAGE.value(), "Usage: UsageRollupDatabase: loadReportingWindows() results.close() failed", e2);
                }
            }
        }
    }

    private AggregateSession loadAggregateSession(long windowId, String packageName) {
        AggregateSession result = null;
        Cursor results = null;
        try {
            results = getReadableDatabase().query(DATABASE_TABLE_ROLLUP, (String[]) null, String.format(Locale.US, "window_id = %1$d AND package_name = ?", new Object[]{Long.valueOf(windowId)}), new String[]{packageName}, (String) null, (String) null, (String) null);
            if (results.moveToNext()) {
                result = new AggregateSession(results);
            }
            if (results != null) {
                try {
                } catch (Exception e) {
                    Logger.m643e(Area.USAGE.value() | Area.STORAGE.value(), "Usage: UsageRollupDatabase: loadAggregateSession() results.close() failed", e);
                }
            }
            return result;
        } finally {
            if (results != null) {
                try {
                    results.close();
                } catch (Exception e2) {
                    Logger.m643e(Area.USAGE.value() | Area.STORAGE.value(), "Usage: UsageRollupDatabase: loadAggregateSession() results.close() failed", e2);
                }
            }
        }
    }

    private void deleteAllRecords() {
        getWritableDatabase().delete(DATABASE_TABLE_ROLLUP, (String) null, (String[]) null);
        getWritableDatabase().delete(DATABASE_TABLE_WINDOW, (String) null, (String[]) null);
    }
}
