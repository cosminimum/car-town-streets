package com.getjar.sdk.data.usage;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteStatement;
import com.facebook.internal.ServerProtocol;
import com.getjar.sdk.data.usage.SessionEvent;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.Constants;
import com.getjar.sdk.utilities.StringUtility;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

public class UsageDatabase extends SQLiteOpenHelper {
    private static final String DATABASE_CREATE_TABLE_APP_SESSIONS = "CREATE TABLE IF NOT EXISTS appSessions (id INTEGER PRIMARY KEY AUTOINCREMENT, packageName TEXT NOT NULL, timestamp INTEGER NOT NULL, type TEXT NOT NULL, reason TEXT NOT NULL, reasonDetails TEXT, sessionId TEXT NOT NULL, phoneSessionId TEXT NOT NULL, synced INTEGER NOT NULL DEFAULT 0, disposable INTEGER NOT NULL DEFAULT 0);";
    private static final String DATABASE_CREATE_TABLE_PHONE_SESSIONS = "CREATE TABLE IF NOT EXISTS phoneSessions (id INTEGER PRIMARY KEY AUTOINCREMENT, timestamp INTEGER NOT NULL, type TEXT NOT NULL, reason TEXT NOT NULL, reasonDetails TEXT, sessionId TEXT NOT NULL, synced INTEGER NOT NULL DEFAULT 0, disposable INTEGER NOT NULL DEFAULT 0);";
    private static final String DATABASE_NAME = "GetJarDBUsage";
    private static final String DATABASE_TABLE_APP_SESSIONS = "appSessions";
    private static final String DATABASE_TABLE_PHONE_SESSIONS = "phoneSessions";
    private static final int DATABASE_VERSION = 4;
    private static final String[] DB_CREATE_TABLE_COMMANDS = {DATABASE_CREATE_TABLE_APP_SESSIONS, DATABASE_CREATE_TABLE_PHONE_SESSIONS};
    private static final String[] DB_TABLE_NAMES = {DATABASE_TABLE_APP_SESSIONS, DATABASE_TABLE_PHONE_SESSIONS};
    public static final String EmptyUUID = "00000000-0000-0000-0000-000000000000";
    public static final int LRUCap = 2500;
    private static final long _APP_EVENT_AGE_THRESHOLD = 82800000;
    private static volatile UsageDatabase _Instance = null;
    private static final String[] _SessionIdColumns = {"sessionId", "timestamp"};
    private volatile Object _databaseAccessLock = new Object();

    private UsageDatabase(Context context, String name) {
        super(context, name, (SQLiteDatabase.CursorFactory) null, 4);
        Logger.m644i(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "UsageDatabase: Opened database '%1$s'", new Object[]{DATABASE_NAME}));
    }

    public static synchronized UsageDatabase getInstance(Context context) {
        UsageDatabase usageDatabase;
        synchronized (UsageDatabase.class) {
            if (context == null) {
                throw new IllegalArgumentException("'context' can not be NULL");
            }
            if (_Instance == null) {
                _Instance = new UsageDatabase(context, DATABASE_NAME);
            }
            usageDatabase = _Instance;
        }
        return usageDatabase;
    }

    public synchronized void onCreate(SQLiteDatabase db) {
        synchronized (this._databaseAccessLock) {
            for (String execSQL : DB_CREATE_TABLE_COMMANDS) {
                db.execSQL(execSQL);
            }
        }
    }

    public synchronized void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        synchronized (this._databaseAccessLock) {
            Logger.m640d(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Upgrading database '%1$s' from version %2$d to %3$d, which will destroy all old data", new Object[]{DATABASE_NAME, Integer.valueOf(oldVersion), Integer.valueOf(newVersion)}));
            for (String tableName : DB_TABLE_NAMES) {
                db.execSQL(String.format(Locale.US, "DROP TABLE IF EXISTS %1$s", new Object[]{tableName}));
            }
        }
        onCreate(db);
    }

    /* access modifiers changed from: protected */
    public void trimLruEntries() {
        synchronized (this._databaseAccessLock) {
            trimLruEntries(DATABASE_TABLE_APP_SESSIONS, LRUCap);
            trimLruEntries(DATABASE_TABLE_PHONE_SESSIONS, LRUCap);
        }
    }

    /* access modifiers changed from: protected */
    public void purgeSyncedClosedEntries() {
        synchronized (this._databaseAccessLock) {
            getWritableDatabase().delete(DATABASE_TABLE_APP_SESSIONS, "synced = 1 AND disposable = 1", (String[]) null);
            getWritableDatabase().delete(DATABASE_TABLE_PHONE_SESSIONS, "synced = 1 AND disposable = 1", (String[]) null);
        }
    }

    private void deleteAllRecords() {
        getWritableDatabase().delete(DATABASE_TABLE_APP_SESSIONS, (String) null, (String[]) null);
        getWritableDatabase().delete(DATABASE_TABLE_PHONE_SESSIONS, (String) null, (String[]) null);
    }

    private void trimLruEntries(String tableName, int maxRecordsCap) {
        if (maxRecordsCap < 0) {
            throw new IllegalArgumentException("'maxRecordsCap' can not be negative");
        } else if (getRecordCount(tableName) >= ((long) maxRecordsCap)) {
            Long id = null;
            Cursor results = null;
            try {
                results = getReadableDatabase().query(tableName, new String[]{Constants.APP_ID}, (String) null, (String[]) null, (String) null, (String) null, "timestamp DESC");
                if (results.moveToPosition(maxRecordsCap)) {
                    id = Long.valueOf(results.getLong(0));
                }
                int count = getWritableDatabase().delete(tableName, String.format(Locale.US, "id <= %1$d", new Object[]{id}), (String[]) null);
                if (count > 0) {
                    Logger.m646v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: UsageDatabase: trimLruEntries() %1$d LRU rows deleted form %2$s", new Object[]{Integer.valueOf(count), tableName}));
                }
            } finally {
                if (results != null) {
                    try {
                        results.close();
                    } catch (Exception e) {
                    }
                }
            }
        }
    }

    private long getRecordCount(String tableName) {
        SQLiteStatement dbStatement = getReadableDatabase().compileStatement(String.format(Locale.US, "SELECT count(*) FROM %1$s", new Object[]{tableName}));
        try {
            long simpleQueryForLong = dbStatement.simpleQueryForLong();
            try {
            } catch (Exception e) {
                Logger.m643e(Area.USAGE.value() | Area.STORAGE.value(), "SQLiteStatement.close() failed", e);
            }
            return simpleQueryForLong;
        } finally {
            try {
                dbStatement.close();
            } catch (Exception e2) {
                Logger.m643e(Area.USAGE.value() | Area.STORAGE.value(), "SQLiteStatement.close() failed", e2);
            }
        }
    }

    private boolean checkForRecord(String tableName, long id) {
        boolean z = true;
        SQLiteStatement dbStatement = null;
        try {
            dbStatement = getReadableDatabase().compileStatement(String.format(Locale.US, "SELECT count(*) FROM %1$s WHERE id = ?", new Object[]{tableName}));
            dbStatement.bindLong(1, id);
            if (dbStatement.simpleQueryForLong() <= 0) {
                z = false;
            }
            if (dbStatement != null) {
                try {
                } catch (Exception e) {
                    Logger.m643e(Area.USAGE.value() | Area.STORAGE.value(), "SQLiteStatement.close() failed", e);
                }
            }
            return z;
        } finally {
            if (dbStatement != null) {
                try {
                    dbStatement.close();
                } catch (Exception e2) {
                    Logger.m643e(Area.USAGE.value() | Area.STORAGE.value(), "SQLiteStatement.close() failed", e2);
                }
            }
        }
    }

    private void setRecordAsSynced(String tableName, long id) {
        if (checkForRecord(tableName, id)) {
            ContentValues values = new ContentValues();
            values.put("synced", 1);
            getWritableDatabase().update(tableName, values, String.format(Locale.US, "id = %1$d", new Object[]{Long.valueOf(id)}), (String[]) null);
            return;
        }
        Logger.m648w(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: UsageDatabase: setRecordAsSynced() failed to find record %1$d", new Object[]{Long.valueOf(id)}));
    }

    private void setSessionAsDisposable(String tableName, String sessionId) {
        ContentValues values = new ContentValues();
        values.put("disposable", 1);
        int updateCount = getWritableDatabase().update(tableName, values, "sessionId = ? AND disposable != 1", new String[]{sessionId});
        if (updateCount > 0) {
            Logger.m646v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: UsageDatabase: setSessionAsDisposable() %1$d non-disposable record(s) in %2$s for session ID %3$s, updated as 'disposable'", new Object[]{Integer.valueOf(updateCount), tableName, sessionId}));
        }
    }

    public long appSessionGetRecordCount() {
        long recordCount;
        synchronized (this._databaseAccessLock) {
            recordCount = getRecordCount(DATABASE_TABLE_APP_SESSIONS);
        }
        return recordCount;
    }

    /* access modifiers changed from: protected */
    public void appSessionSetAsSynced(long id) {
        synchronized (this._databaseAccessLock) {
            setRecordAsSynced(DATABASE_TABLE_APP_SESSIONS, id);
        }
    }

    /* JADX WARNING: Unknown top exception splitter block from list: {B:24:0x0039=Splitter:B:24:0x0039, B:15:0x002f=Splitter:B:15:0x002f} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public java.util.List<com.getjar.sdk.data.usage.ApplicationSessionEvent> appSessionLoadUnsynced() {
        /*
            r12 = this;
            java.lang.Object r11 = r12._databaseAccessLock
            monitor-enter(r11)
            java.util.ArrayList r8 = new java.util.ArrayList     // Catch:{ all -> 0x0030 }
            r8.<init>()     // Catch:{ all -> 0x0030 }
            r10 = 0
            android.database.sqlite.SQLiteDatabase r0 = r12.getReadableDatabase()     // Catch:{ all -> 0x0028 }
            java.lang.String r1 = "appSessions"
            r2 = 0
            java.lang.String r3 = "synced = 0"
            r4 = 0
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r10 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch:{ all -> 0x0028 }
        L_0x001a:
            boolean r0 = r10.moveToNext()     // Catch:{ all -> 0x0028 }
            if (r0 == 0) goto L_0x0033
            com.getjar.sdk.data.usage.ApplicationSessionEvent r0 = com.getjar.sdk.data.usage.ApplicationSessionEvent.loadFromDB(r10)     // Catch:{ all -> 0x0028 }
            r8.add(r0)     // Catch:{ all -> 0x0028 }
            goto L_0x001a
        L_0x0028:
            r0 = move-exception
            if (r10 == 0) goto L_0x002f
            r10.close()     // Catch:{ Exception -> 0x004f }
            r10 = 0
        L_0x002f:
            throw r0     // Catch:{ all -> 0x0030 }
        L_0x0030:
            r0 = move-exception
            monitor-exit(r11)     // Catch:{ all -> 0x0030 }
            throw r0
        L_0x0033:
            if (r10 == 0) goto L_0x0039
            r10.close()     // Catch:{ Exception -> 0x003b }
            r10 = 0
        L_0x0039:
            monitor-exit(r11)     // Catch:{ all -> 0x0030 }
            return r8
        L_0x003b:
            r9 = move-exception
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ all -> 0x0030 }
            long r0 = r0.value()     // Catch:{ all -> 0x0030 }
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x0030 }
            long r2 = r2.value()     // Catch:{ all -> 0x0030 }
            long r0 = r0 | r2
            java.lang.String r2 = "Usage: UsageDatabase: appSessionLoadUnsynced() failed"
            com.getjar.sdk.logging.Logger.m643e(r0, r2, r9)     // Catch:{ all -> 0x0030 }
            goto L_0x0039
        L_0x004f:
            r9 = move-exception
            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ all -> 0x0030 }
            long r1 = r1.value()     // Catch:{ all -> 0x0030 }
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x0030 }
            long r3 = r3.value()     // Catch:{ all -> 0x0030 }
            long r1 = r1 | r3
            java.lang.String r3 = "Usage: UsageDatabase: appSessionLoadUnsynced() failed"
            com.getjar.sdk.logging.Logger.m643e(r1, r3, r9)     // Catch:{ all -> 0x0030 }
            goto L_0x002f
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.usage.UsageDatabase.appSessionLoadUnsynced():java.util.List");
    }

    /* JADX WARNING: Unknown top exception splitter block from list: {B:35:0x0067=Splitter:B:35:0x0067, B:19:0x004f=Splitter:B:19:0x004f} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public com.getjar.sdk.data.usage.ApplicationLists appSessionLoadOpenStartLists() {
        /*
            r17 = this;
            r0 = r17
            java.lang.Object r0 = r0._databaseAccessLock
            r16 = r0
            monitor-enter(r16)
            java.util.ArrayList r11 = new java.util.ArrayList     // Catch:{ all -> 0x0050 }
            r11.<init>()     // Catch:{ all -> 0x0050 }
            java.util.ArrayList r12 = new java.util.ArrayList     // Catch:{ all -> 0x0050 }
            r12.<init>()     // Catch:{ all -> 0x0050 }
            long r1 = java.lang.System.currentTimeMillis()     // Catch:{ all -> 0x0050 }
            r3 = 82800000(0x4ef6d80, double:4.09086355E-316)
            long r14 = r1 - r3
            r13 = 0
            android.database.sqlite.SQLiteDatabase r1 = r17.getReadableDatabase()     // Catch:{ all -> 0x0048 }
            java.lang.String r2 = "appSessions"
            r3 = 0
            java.lang.String r4 = "type = 'start' AND disposable = 0"
            r5 = 0
            r6 = 0
            r7 = 0
            r8 = 0
            android.database.Cursor r13 = r1.query(r2, r3, r4, r5, r6, r7, r8)     // Catch:{ all -> 0x0048 }
        L_0x002c:
            boolean r1 = r13.moveToNext()     // Catch:{ all -> 0x0048 }
            if (r1 == 0) goto L_0x005d
            com.getjar.sdk.data.usage.ApplicationSessionEvent r9 = com.getjar.sdk.data.usage.ApplicationSessionEvent.loadFromDB(r13)     // Catch:{ all -> 0x0048 }
            long r1 = r9.getTimestamp()     // Catch:{ all -> 0x0048 }
            int r1 = (r1 > r14 ? 1 : (r1 == r14 ? 0 : -1))
            if (r1 < 0) goto L_0x0053
            boolean r1 = r11.contains(r9)     // Catch:{ all -> 0x0048 }
            if (r1 != 0) goto L_0x002c
            r11.add(r9)     // Catch:{ all -> 0x0048 }
            goto L_0x002c
        L_0x0048:
            r1 = move-exception
            if (r13 == 0) goto L_0x004f
            r13.close()     // Catch:{ Exception -> 0x0096 }
            r13 = 0
        L_0x004f:
            throw r1     // Catch:{ all -> 0x0050 }
        L_0x0050:
            r1 = move-exception
            monitor-exit(r16)     // Catch:{ all -> 0x0050 }
            throw r1
        L_0x0053:
            boolean r1 = r12.contains(r9)     // Catch:{ all -> 0x0048 }
            if (r1 != 0) goto L_0x002c
            r12.add(r9)     // Catch:{ all -> 0x0048 }
            goto L_0x002c
        L_0x005d:
            r13.close()     // Catch:{ Exception -> 0x006e }
            r13 = 0
        L_0x0061:
            if (r13 == 0) goto L_0x0067
            r13.close()     // Catch:{ Exception -> 0x0082 }
            r13 = 0
        L_0x0067:
            com.getjar.sdk.data.usage.ApplicationLists r1 = new com.getjar.sdk.data.usage.ApplicationLists     // Catch:{ all -> 0x0050 }
            r1.<init>(r11, r12)     // Catch:{ all -> 0x0050 }
            monitor-exit(r16)     // Catch:{ all -> 0x0050 }
            return r1
        L_0x006e:
            r10 = move-exception
            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ all -> 0x0048 }
            long r1 = r1.value()     // Catch:{ all -> 0x0048 }
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x0048 }
            long r3 = r3.value()     // Catch:{ all -> 0x0048 }
            long r1 = r1 | r3
            java.lang.String r3 = "Usage: UsageDatabase: appSessionLoadUnsynced() failed"
            com.getjar.sdk.logging.Logger.m643e(r1, r3, r10)     // Catch:{ all -> 0x0048 }
            goto L_0x0061
        L_0x0082:
            r10 = move-exception
            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ all -> 0x0050 }
            long r1 = r1.value()     // Catch:{ all -> 0x0050 }
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x0050 }
            long r3 = r3.value()     // Catch:{ all -> 0x0050 }
            long r1 = r1 | r3
            java.lang.String r3 = "Usage: UsageDatabase: appSessionLoadUnsynced() failed"
            com.getjar.sdk.logging.Logger.m643e(r1, r3, r10)     // Catch:{ all -> 0x0050 }
            goto L_0x0067
        L_0x0096:
            r10 = move-exception
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ all -> 0x0050 }
            long r2 = r2.value()     // Catch:{ all -> 0x0050 }
            com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x0050 }
            long r4 = r4.value()     // Catch:{ all -> 0x0050 }
            long r2 = r2 | r4
            java.lang.String r4 = "Usage: UsageDatabase: appSessionLoadUnsynced() failed"
            com.getjar.sdk.logging.Logger.m643e(r2, r4, r10)     // Catch:{ all -> 0x0050 }
            goto L_0x004f
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.usage.UsageDatabase.appSessionLoadOpenStartLists():com.getjar.sdk.data.usage.ApplicationLists");
    }

    /* access modifiers changed from: protected */
    public String getNewApplicationSessionID() {
        return UUID.randomUUID().toString();
    }

    /* access modifiers changed from: protected */
    public long appSessionStart(String packageName, SessionEvent.Reason reason, String reasonDetails, long eventTimestamp, String phoneSessionId, String appSessionId) {
        long rowId;
        if (StringUtility.isNullOrEmpty(packageName)) {
            throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
        } else if (reason == null) {
            throw new IllegalArgumentException("'reason' cannot be NULL");
        } else if (StringUtility.isNullOrEmpty(phoneSessionId)) {
            throw new IllegalArgumentException("'phoneSessionId' cannot be NULL or empty");
        } else if (StringUtility.isNullOrEmpty(appSessionId)) {
            throw new IllegalArgumentException("'appSessionId' cannot be NULL or empty");
        } else {
            synchronized (this._databaseAccessLock) {
                ContentValues values = new ContentValues();
                values.put("packageName", packageName);
                values.put("timestamp", Long.valueOf(eventTimestamp));
                values.put(ServerProtocol.DIALOG_PARAM_TYPE, "start");
                values.put("reason", reason.name());
                if (!StringUtility.isNullOrEmpty(reasonDetails)) {
                    values.put("reasonDetails", reasonDetails);
                }
                values.put("sessionId", appSessionId);
                values.put("phoneSessionId", phoneSessionId);
                values.put("synced", 0);
                values.put("disposable", 0);
                rowId = getWritableDatabase().insert(DATABASE_TABLE_APP_SESSIONS, (String) null, values);
                Logger.m646v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: UsageDatabase: appSessionStart() [packageName:%1$s timestamp:%2$d sessionId:%3$s phoneSessionId:%4$s]", new Object[]{packageName, Long.valueOf(eventTimestamp), appSessionId, phoneSessionId}));
            }
            trimLruEntries();
            return rowId;
        }
    }

    /* access modifiers changed from: protected */
    public long appSessionStop(String packageName, SessionEvent.Reason reason, String reasonDetails, long eventTimestamp, String phoneSessionId, String appSessionId) {
        long rowId;
        if (StringUtility.isNullOrEmpty(packageName)) {
            throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
        } else if (reason == null) {
            throw new IllegalArgumentException("'reason' cannot be NULL");
        } else if (StringUtility.isNullOrEmpty(phoneSessionId)) {
            throw new IllegalArgumentException("'phoneSessionId' cannot be NULL or empty");
        } else {
            synchronized (this._databaseAccessLock) {
                String sessionId = appSessionId;
                if (StringUtility.isNullOrEmpty(sessionId)) {
                    sessionId = getCurrentApplicationSessionId(packageName);
                }
                setSessionAsDisposable(DATABASE_TABLE_APP_SESSIONS, sessionId);
                ContentValues values = new ContentValues();
                values.put("packageName", packageName);
                values.put("timestamp", Long.valueOf(eventTimestamp));
                values.put(ServerProtocol.DIALOG_PARAM_TYPE, "stop");
                values.put("reason", reason.name());
                if (!StringUtility.isNullOrEmpty(reasonDetails)) {
                    values.put("reasonDetails", reasonDetails);
                }
                values.put("sessionId", sessionId);
                values.put("phoneSessionId", phoneSessionId);
                values.put("synced", 0);
                values.put("disposable", 1);
                rowId = getWritableDatabase().insert(DATABASE_TABLE_APP_SESSIONS, (String) null, values);
                Logger.m646v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: UsageDatabase: appSessionStop() [packageName:%1$s timestamp:%2$d sessionId:%3$s phoneSessionId:%4$s] stack:%5$s", new Object[]{packageName, Long.valueOf(eventTimestamp), sessionId, phoneSessionId, Logger.getShortStack()}));
            }
            trimLruEntries();
            return rowId;
        }
    }

    /* access modifiers changed from: protected */
    public long appSessionStop(ApplicationSessionEvent startEvent, SessionEvent.Reason reason, String reasonDetails, long eventTime) {
        long rowId;
        if (startEvent == null) {
            throw new IllegalArgumentException("'startEvent' cannot be NULL");
        } else if (!SessionEvent.Type.start.equals(startEvent.getType())) {
            throw new IllegalArgumentException("'startEvent' must be a 'start' record");
        } else if (reason == null) {
            throw new IllegalArgumentException("'reason' cannot be NULL");
        } else if (eventTime < 0) {
            throw new IllegalArgumentException("'eventTime' cannot be less than zero");
        } else {
            synchronized (this._databaseAccessLock) {
                setSessionAsDisposable(DATABASE_TABLE_APP_SESSIONS, startEvent.getSessionId());
                long stopTime = eventTime;
                if (stopTime > 0 && stopTime < startEvent.getTimestamp()) {
                    stopTime = startEvent.getTimestamp();
                }
                ContentValues values = new ContentValues();
                values.put("packageName", startEvent.getPackageName());
                values.put("timestamp", Long.valueOf(stopTime));
                values.put(ServerProtocol.DIALOG_PARAM_TYPE, "stop");
                values.put("reason", reason.name());
                if (!StringUtility.isNullOrEmpty(reasonDetails)) {
                    values.put("reasonDetails", reasonDetails);
                }
                values.put("sessionId", startEvent.getSessionId());
                values.put("phoneSessionId", startEvent.getPhoneSessionId());
                values.put("synced", 0);
                values.put("disposable", 1);
                rowId = getWritableDatabase().insert(DATABASE_TABLE_APP_SESSIONS, (String) null, values);
                Logger.m646v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: UsageDatabase: appSessionStop() [packageName:%1$s timestamp:%2$d sessionId:%3$s phoneSessionId:%4$s]", new Object[]{startEvent.getPackageName(), Long.valueOf(stopTime), startEvent.getSessionId(), startEvent.getPhoneSessionId()}));
            }
            trimLruEntries();
            return rowId;
        }
    }

    public List<String> appSessionLoadOpenStartPackageNames() {
        List<String> resultList;
        synchronized (this._databaseAccessLock) {
            resultList = new ArrayList<>();
            for (ApplicationSessionEvent event : appSessionLoadOpenStartsInternal()) {
                resultList.add(event.getPackageName());
            }
        }
        return resultList;
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:11:0x002b=Splitter:B:11:0x002b, B:24:0x004b=Splitter:B:24:0x004b} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public com.getjar.sdk.data.usage.ApplicationSessionEvent appSessionLoadStartRecord(java.lang.String r13) {
        /*
            r12 = this;
            java.lang.Object r11 = r12._databaseAccessLock
            monitor-enter(r11)
            r10 = 0
            r9 = 0
            android.database.sqlite.SQLiteDatabase r0 = r12.getReadableDatabase()     // Catch:{ all -> 0x0044 }
            java.lang.String r1 = "appSessions"
            r2 = 0
            java.lang.String r3 = "sessionId = ? AND type = 'start'"
            r4 = 1
            java.lang.String[] r4 = new java.lang.String[r4]     // Catch:{ all -> 0x0044 }
            r5 = 0
            r4[r5] = r13     // Catch:{ all -> 0x0044 }
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r9 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch:{ all -> 0x0044 }
            boolean r0 = r9.moveToNext()     // Catch:{ all -> 0x0044 }
            if (r0 == 0) goto L_0x0025
            com.getjar.sdk.data.usage.ApplicationSessionEvent r10 = com.getjar.sdk.data.usage.ApplicationSessionEvent.loadFromDB(r9)     // Catch:{ all -> 0x0044 }
        L_0x0025:
            if (r9 == 0) goto L_0x002b
            r9.close()     // Catch:{ Exception -> 0x002d }
            r9 = 0
        L_0x002b:
            monitor-exit(r11)     // Catch:{ all -> 0x0041 }
            return r10
        L_0x002d:
            r8 = move-exception
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ all -> 0x0041 }
            long r0 = r0.value()     // Catch:{ all -> 0x0041 }
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x0041 }
            long r2 = r2.value()     // Catch:{ all -> 0x0041 }
            long r0 = r0 | r2
            java.lang.String r2 = "Usage: UsageDatabase: appSessionLoadStartRecord() failed"
            com.getjar.sdk.logging.Logger.m643e(r0, r2, r8)     // Catch:{ all -> 0x0041 }
            goto L_0x002b
        L_0x0041:
            r0 = move-exception
            monitor-exit(r11)     // Catch:{ all -> 0x0041 }
            throw r0
        L_0x0044:
            r0 = move-exception
            if (r9 == 0) goto L_0x004b
            r9.close()     // Catch:{ Exception -> 0x004c }
            r9 = 0
        L_0x004b:
            throw r0     // Catch:{ all -> 0x0041 }
        L_0x004c:
            r8 = move-exception
            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ all -> 0x0041 }
            long r1 = r1.value()     // Catch:{ all -> 0x0041 }
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x0041 }
            long r3 = r3.value()     // Catch:{ all -> 0x0041 }
            long r1 = r1 | r3
            java.lang.String r3 = "Usage: UsageDatabase: appSessionLoadStartRecord() failed"
            com.getjar.sdk.logging.Logger.m643e(r1, r3, r8)     // Catch:{ all -> 0x0041 }
            goto L_0x004b
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.usage.UsageDatabase.appSessionLoadStartRecord(java.lang.String):com.getjar.sdk.data.usage.ApplicationSessionEvent");
    }

    /* access modifiers changed from: protected */
    public void deleteAppSession(long id) {
        synchronized (this._databaseAccessLock) {
            getWritableDatabase().delete(DATABASE_TABLE_APP_SESSIONS, String.format(Locale.US, "id = %1$d", new Object[]{Long.valueOf(id)}), (String[]) null);
        }
    }

    /* access modifiers changed from: protected */
    public List<ApplicationSessionEvent> appSessionLoadOpenStarts() {
        List<ApplicationSessionEvent> appSessionLoadOpenStartsInternal;
        synchronized (this._databaseAccessLock) {
            appSessionLoadOpenStartsInternal = appSessionLoadOpenStartsInternal();
        }
        return appSessionLoadOpenStartsInternal;
    }

    private List<ApplicationSessionEvent> appSessionLoadOpenStartsInternal() {
        List<ApplicationSessionEvent> appSessionList = new ArrayList<>();
        Cursor results = null;
        try {
            results = getReadableDatabase().query(DATABASE_TABLE_APP_SESSIONS, (String[]) null, "disposable = 0 AND type = 'start'", (String[]) null, (String) null, (String) null, (String) null);
            while (results.moveToNext()) {
                appSessionList.add(ApplicationSessionEvent.loadFromDB(results));
            }
            if (results != null) {
                try {
                } catch (Exception e) {
                    Logger.m643e(Area.USAGE.value() | Area.STORAGE.value(), "Usage: UsageDatabase: appSessionLoadOpenStartsInternal() failed", e);
                }
            }
            return appSessionList;
        } finally {
            if (results != null) {
                try {
                    results.close();
                } catch (Exception e2) {
                    Logger.m643e(Area.USAGE.value() | Area.STORAGE.value(), "Usage: UsageDatabase: appSessionLoadOpenStartsInternal() failed", e2);
                }
            }
        }
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:11:0x0036=Splitter:B:11:0x0036, B:24:0x0056=Splitter:B:24:0x0056} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public com.getjar.sdk.data.usage.ApplicationSessionEvent appSessionLoad(long r13) {
        /*
            r12 = this;
            java.lang.Object r11 = r12._databaseAccessLock
            monitor-enter(r11)
            r9 = 0
            r10 = 0
            android.database.sqlite.SQLiteDatabase r0 = r12.getReadableDatabase()     // Catch:{ all -> 0x004f }
            java.lang.String r1 = "appSessions"
            r2 = 0
            java.util.Locale r3 = java.util.Locale.US     // Catch:{ all -> 0x004f }
            java.lang.String r4 = "id = %1$d"
            r5 = 1
            java.lang.Object[] r5 = new java.lang.Object[r5]     // Catch:{ all -> 0x004f }
            r6 = 0
            java.lang.Long r7 = java.lang.Long.valueOf(r13)     // Catch:{ all -> 0x004f }
            r5[r6] = r7     // Catch:{ all -> 0x004f }
            java.lang.String r3 = java.lang.String.format(r3, r4, r5)     // Catch:{ all -> 0x004f }
            r4 = 0
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r10 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch:{ all -> 0x004f }
            boolean r0 = r10.moveToNext()     // Catch:{ all -> 0x004f }
            if (r0 == 0) goto L_0x0030
            com.getjar.sdk.data.usage.ApplicationSessionEvent r9 = com.getjar.sdk.data.usage.ApplicationSessionEvent.loadFromDB(r10)     // Catch:{ all -> 0x004f }
        L_0x0030:
            if (r10 == 0) goto L_0x0036
            r10.close()     // Catch:{ Exception -> 0x0038 }
            r10 = 0
        L_0x0036:
            monitor-exit(r11)     // Catch:{ all -> 0x004c }
            return r9
        L_0x0038:
            r8 = move-exception
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ all -> 0x004c }
            long r0 = r0.value()     // Catch:{ all -> 0x004c }
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x004c }
            long r2 = r2.value()     // Catch:{ all -> 0x004c }
            long r0 = r0 | r2
            java.lang.String r2 = "Usage: UsageDatabase: appSessionLoad() failed"
            com.getjar.sdk.logging.Logger.m643e(r0, r2, r8)     // Catch:{ all -> 0x004c }
            goto L_0x0036
        L_0x004c:
            r0 = move-exception
            monitor-exit(r11)     // Catch:{ all -> 0x004c }
            throw r0
        L_0x004f:
            r0 = move-exception
            if (r10 == 0) goto L_0x0056
            r10.close()     // Catch:{ Exception -> 0x0057 }
            r10 = 0
        L_0x0056:
            throw r0     // Catch:{ all -> 0x004c }
        L_0x0057:
            r8 = move-exception
            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ all -> 0x004c }
            long r1 = r1.value()     // Catch:{ all -> 0x004c }
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x004c }
            long r3 = r3.value()     // Catch:{ all -> 0x004c }
            long r1 = r1 | r3
            java.lang.String r3 = "Usage: UsageDatabase: appSessionLoad() failed"
            com.getjar.sdk.logging.Logger.m643e(r1, r3, r8)     // Catch:{ all -> 0x004c }
            goto L_0x0056
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.usage.UsageDatabase.appSessionLoad(long):com.getjar.sdk.data.usage.ApplicationSessionEvent");
    }

    private String getCurrentApplicationSessionId(String packageName) {
        String sessionIdStart = getLatestStartApplicationSessionId(packageName);
        String sessionIdStop = getLatestStopApplicationSessionId(packageName);
        if (StringUtility.isNullOrEmpty(sessionIdStart) || sessionIdStart.equals(sessionIdStop)) {
            return EmptyUUID;
        }
        return sessionIdStart;
    }

    private String getLatestStopApplicationSessionId(String packageName) {
        String applicationSessionId = null;
        Cursor results = null;
        try {
            results = getReadableDatabase().query(DATABASE_TABLE_APP_SESSIONS, _SessionIdColumns, "packageName = ? AND type = ?", new String[]{packageName, "stop"}, (String) null, (String) null, "timestamp DESC", "1");
            if (results.moveToNext()) {
                applicationSessionId = results.getString(0);
                Logger.m646v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: UsageDatabase: getLatestStopApplicationSessionId() loaded: %1$s", new Object[]{applicationSessionId}));
            }
            if (results != null) {
                try {
                } catch (Exception e) {
                    Logger.m643e(Area.USAGE.value() | Area.STORAGE.value(), "Usage: UsageDatabase: getLatestStopApplicationSessionId() failed", e);
                }
            }
            return applicationSessionId;
        } finally {
            if (results != null) {
                try {
                    results.close();
                } catch (Exception e2) {
                    Logger.m643e(Area.USAGE.value() | Area.STORAGE.value(), "Usage: UsageDatabase: getLatestStopApplicationSessionId() failed", e2);
                }
            }
        }
    }

    private String getLatestStartApplicationSessionId(String packageName) {
        String applicationSessionId = null;
        Cursor results = null;
        try {
            results = getReadableDatabase().query(DATABASE_TABLE_APP_SESSIONS, _SessionIdColumns, "packageName = ? AND type = ?", new String[]{packageName, "start"}, (String) null, (String) null, "timestamp DESC", "1");
            if (results.moveToNext()) {
                applicationSessionId = results.getString(0);
                Logger.m646v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: UsageDatabase: getLatestStartApplicationSessionId() loaded: %1$s", new Object[]{applicationSessionId}));
            }
            if (results != null) {
                try {
                } catch (Exception e) {
                    Logger.m643e(Area.USAGE.value() | Area.STORAGE.value(), "Usage: UsageDatabase: getLatestStartApplicationSessionId() failed", e);
                }
            }
            return applicationSessionId;
        } finally {
            if (results != null) {
                try {
                    results.close();
                } catch (Exception e2) {
                    Logger.m643e(Area.USAGE.value() | Area.STORAGE.value(), "Usage: UsageDatabase: getLatestStartApplicationSessionId() failed", e2);
                }
            }
        }
    }

    public long phoneSessionGetRecordCount() {
        long recordCount;
        synchronized (this._databaseAccessLock) {
            recordCount = getRecordCount(DATABASE_TABLE_PHONE_SESSIONS);
        }
        return recordCount;
    }

    /* access modifiers changed from: protected */
    public void phoneSessionSetAsSynced(long id) {
        synchronized (this._databaseAccessLock) {
            setRecordAsSynced(DATABASE_TABLE_PHONE_SESSIONS, id);
        }
    }

    /* JADX WARNING: Unknown top exception splitter block from list: {B:24:0x0039=Splitter:B:24:0x0039, B:15:0x002f=Splitter:B:15:0x002f} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public java.util.List<com.getjar.sdk.data.usage.PhoneSessionEvent> phoneSessionLoadUnsynced() {
        /*
            r12 = this;
            java.lang.Object r11 = r12._databaseAccessLock
            monitor-enter(r11)
            java.util.ArrayList r9 = new java.util.ArrayList     // Catch:{ all -> 0x0030 }
            r9.<init>()     // Catch:{ all -> 0x0030 }
            r10 = 0
            android.database.sqlite.SQLiteDatabase r0 = r12.getReadableDatabase()     // Catch:{ all -> 0x0028 }
            java.lang.String r1 = "phoneSessions"
            r2 = 0
            java.lang.String r3 = "synced = 0"
            r4 = 0
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r10 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch:{ all -> 0x0028 }
        L_0x001a:
            boolean r0 = r10.moveToNext()     // Catch:{ all -> 0x0028 }
            if (r0 == 0) goto L_0x0033
            com.getjar.sdk.data.usage.PhoneSessionEvent r0 = com.getjar.sdk.data.usage.PhoneSessionEvent.loadFromDB(r10)     // Catch:{ all -> 0x0028 }
            r9.add(r0)     // Catch:{ all -> 0x0028 }
            goto L_0x001a
        L_0x0028:
            r0 = move-exception
            if (r10 == 0) goto L_0x002f
            r10.close()     // Catch:{ Exception -> 0x004f }
            r10 = 0
        L_0x002f:
            throw r0     // Catch:{ all -> 0x0030 }
        L_0x0030:
            r0 = move-exception
            monitor-exit(r11)     // Catch:{ all -> 0x0030 }
            throw r0
        L_0x0033:
            if (r10 == 0) goto L_0x0039
            r10.close()     // Catch:{ Exception -> 0x003b }
            r10 = 0
        L_0x0039:
            monitor-exit(r11)     // Catch:{ all -> 0x0030 }
            return r9
        L_0x003b:
            r8 = move-exception
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ all -> 0x0030 }
            long r0 = r0.value()     // Catch:{ all -> 0x0030 }
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x0030 }
            long r2 = r2.value()     // Catch:{ all -> 0x0030 }
            long r0 = r0 | r2
            java.lang.String r2 = "Usage: UsageDatabase: phoneSessionLoadUnsynced() failed"
            com.getjar.sdk.logging.Logger.m643e(r0, r2, r8)     // Catch:{ all -> 0x0030 }
            goto L_0x0039
        L_0x004f:
            r8 = move-exception
            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.USAGE     // Catch:{ all -> 0x0030 }
            long r1 = r1.value()     // Catch:{ all -> 0x0030 }
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x0030 }
            long r3 = r3.value()     // Catch:{ all -> 0x0030 }
            long r1 = r1 | r3
            java.lang.String r3 = "Usage: UsageDatabase: phoneSessionLoadUnsynced() failed"
            com.getjar.sdk.logging.Logger.m643e(r1, r3, r8)     // Catch:{ all -> 0x0030 }
            goto L_0x002f
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.usage.UsageDatabase.phoneSessionLoadUnsynced():java.util.List");
    }

    /* access modifiers changed from: protected */
    public String getNewPhoneSessionID() {
        return UUID.randomUUID().toString();
    }

    /* access modifiers changed from: protected */
    public void phoneSessionStart(SessionEvent.Reason reason, String reasonDetails, String phoneSessionId) {
        if (reason == null) {
            throw new IllegalArgumentException("'reason' cannot be NULL");
        } else if (StringUtility.isNullOrEmpty(phoneSessionId)) {
            throw new IllegalArgumentException("'phoneSessionId' cannot be NULL or empty");
        } else {
            synchronized (this._databaseAccessLock) {
                long now = System.currentTimeMillis();
                ContentValues values = new ContentValues();
                values.put("timestamp", Long.valueOf(now));
                values.put(ServerProtocol.DIALOG_PARAM_TYPE, "start");
                values.put("reason", reason.name());
                if (!StringUtility.isNullOrEmpty(reasonDetails)) {
                    values.put("reasonDetails", reasonDetails);
                }
                values.put("sessionId", phoneSessionId);
                values.put("synced", 0);
                values.put("disposable", 0);
                getWritableDatabase().insert(DATABASE_TABLE_PHONE_SESSIONS, (String) null, values);
                Logger.m646v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: UsageDatabase: phoneSessionStart() [timestamp:%1$d sessionId:%2$s]", new Object[]{Long.valueOf(now), phoneSessionId}));
            }
            trimLruEntries();
        }
    }

    /* access modifiers changed from: protected */
    public void phoneSessionStop(SessionEvent.Reason reason, String reasonDetails, long eventTime) {
        phoneSessionStop(reason, reasonDetails, eventTime, (String) null);
    }

    /* access modifiers changed from: protected */
    public void phoneSessionStop(SessionEvent.Reason reason, String reasonDetails, long eventTime, String phoneSessionId) {
        if (reason == null) {
            throw new IllegalArgumentException("'reason' cannot be NULL");
        } else if (eventTime < 0) {
            throw new IllegalArgumentException("'eventTime' cannot be less than zero");
        } else {
            synchronized (this._databaseAccessLock) {
                PhoneSessionEvent startEvent = getPhoneSessionStart(phoneSessionId);
                if (startEvent != null) {
                    setSessionAsDisposable(DATABASE_TABLE_PHONE_SESSIONS, startEvent.getSessionId());
                    long stopTime = eventTime;
                    if (stopTime > 0 && stopTime < startEvent.getTimestamp()) {
                        stopTime = startEvent.getTimestamp();
                    }
                    ContentValues values = new ContentValues();
                    values.put("timestamp", Long.valueOf(stopTime));
                    values.put(ServerProtocol.DIALOG_PARAM_TYPE, "stop");
                    values.put("reason", reason.name());
                    if (!StringUtility.isNullOrEmpty(reasonDetails)) {
                        values.put("reasonDetails", reasonDetails);
                    }
                    values.put("sessionId", startEvent.getSessionId());
                    values.put("synced", 0);
                    values.put("disposable", 1);
                    getWritableDatabase().insert(DATABASE_TABLE_PHONE_SESSIONS, (String) null, values);
                    Logger.m646v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: UsageDatabase: phoneSessionStop() [timestamp:%1$d sessionId:%2$s]", new Object[]{Long.valueOf(stopTime), startEvent.getSessionId()}));
                    trimLruEntries();
                }
            }
        }
    }

    /* access modifiers changed from: protected */
    public void deletePhoneSession(long id) {
        synchronized (this._databaseAccessLock) {
            getWritableDatabase().delete(DATABASE_TABLE_PHONE_SESSIONS, String.format(Locale.US, "id = %1$d", new Object[]{Long.valueOf(id)}), (String[]) null);
        }
    }

    private PhoneSessionEvent getPhoneSessionStart(String phoneSessionId) {
        Cursor dbResults;
        PhoneSessionEvent result = null;
        Cursor dbResults2 = null;
        try {
            if (StringUtility.isNullOrEmpty(phoneSessionId) || EmptyUUID.equals(phoneSessionId)) {
                dbResults = getReadableDatabase().query(DATABASE_TABLE_PHONE_SESSIONS, (String[]) null, "type = 'start' AND disposable = 0", (String[]) null, (String) null, (String) null, "timestamp DESC", "1");
            } else {
                dbResults = getReadableDatabase().query(DATABASE_TABLE_PHONE_SESSIONS, (String[]) null, "type = 'start' AND sessionId = ?", new String[]{phoneSessionId}, (String) null, (String) null, "timestamp DESC", "1");
            }
            if (dbResults2.moveToNext()) {
                result = PhoneSessionEvent.loadFromDB(dbResults2);
                Logger.m646v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: UsageDatabase: getPhoneSession() loaded: %1$s", new Object[]{result}));
            }
            if (dbResults2 != null) {
                try {
                } catch (Exception e) {
                    Logger.m643e(Area.USAGE.value() | Area.STORAGE.value(), "Usage: UsageDatabase: getPhoneSession() failed", e);
                }
            }
            return result;
        } finally {
            if (dbResults2 != null) {
                try {
                    dbResults2.close();
                } catch (Exception e2) {
                    Logger.m643e(Area.USAGE.value() | Area.STORAGE.value(), "Usage: UsageDatabase: getPhoneSession() failed", e2);
                }
            }
        }
    }
}
