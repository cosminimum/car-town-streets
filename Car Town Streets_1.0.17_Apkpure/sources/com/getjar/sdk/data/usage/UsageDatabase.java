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
/* loaded from: classes.dex */
public class UsageDatabase extends SQLiteOpenHelper {
    private static final String DATABASE_NAME = "GetJarDBUsage";
    private static final int DATABASE_VERSION = 4;
    public static final String EmptyUUID = "00000000-0000-0000-0000-000000000000";
    public static final int LRUCap = 2500;
    private static final long _APP_EVENT_AGE_THRESHOLD = 82800000;
    private volatile Object _databaseAccessLock = new Object();
    private static volatile UsageDatabase _Instance = null;
    private static final String DATABASE_TABLE_APP_SESSIONS = "appSessions";
    private static final String DATABASE_TABLE_PHONE_SESSIONS = "phoneSessions";
    private static final String[] DB_TABLE_NAMES = {DATABASE_TABLE_APP_SESSIONS, DATABASE_TABLE_PHONE_SESSIONS};
    private static final String DATABASE_CREATE_TABLE_APP_SESSIONS = "CREATE TABLE IF NOT EXISTS appSessions (id INTEGER PRIMARY KEY AUTOINCREMENT, packageName TEXT NOT NULL, timestamp INTEGER NOT NULL, type TEXT NOT NULL, reason TEXT NOT NULL, reasonDetails TEXT, sessionId TEXT NOT NULL, phoneSessionId TEXT NOT NULL, synced INTEGER NOT NULL DEFAULT 0, disposable INTEGER NOT NULL DEFAULT 0);";
    private static final String DATABASE_CREATE_TABLE_PHONE_SESSIONS = "CREATE TABLE IF NOT EXISTS phoneSessions (id INTEGER PRIMARY KEY AUTOINCREMENT, timestamp INTEGER NOT NULL, type TEXT NOT NULL, reason TEXT NOT NULL, reasonDetails TEXT, sessionId TEXT NOT NULL, synced INTEGER NOT NULL DEFAULT 0, disposable INTEGER NOT NULL DEFAULT 0);";
    private static final String[] DB_CREATE_TABLE_COMMANDS = {DATABASE_CREATE_TABLE_APP_SESSIONS, DATABASE_CREATE_TABLE_PHONE_SESSIONS};
    private static final String[] _SessionIdColumns = {"sessionId", "timestamp"};

    private UsageDatabase(Context context, String name) {
        super(context, name, (SQLiteDatabase.CursorFactory) null, 4);
        Logger.i(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "UsageDatabase: Opened database '%1$s'", DATABASE_NAME));
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

    @Override // android.database.sqlite.SQLiteOpenHelper
    public synchronized void onCreate(SQLiteDatabase db) {
        synchronized (this._databaseAccessLock) {
            for (int i = 0; i < DB_CREATE_TABLE_COMMANDS.length; i++) {
                db.execSQL(DB_CREATE_TABLE_COMMANDS[i]);
            }
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public synchronized void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        synchronized (this._databaseAccessLock) {
            Logger.d(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Upgrading database '%1$s' from version %2$d to %3$d, which will destroy all old data", DATABASE_NAME, Integer.valueOf(oldVersion), Integer.valueOf(newVersion)));
            String[] arr$ = DB_TABLE_NAMES;
            for (String tableName : arr$) {
                db.execSQL(String.format(Locale.US, "DROP TABLE IF EXISTS %1$s", tableName));
            }
        }
        onCreate(db);
    }

    protected void trimLruEntries() {
        synchronized (this._databaseAccessLock) {
            trimLruEntries(DATABASE_TABLE_APP_SESSIONS, LRUCap);
            trimLruEntries(DATABASE_TABLE_PHONE_SESSIONS, LRUCap);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void purgeSyncedClosedEntries() {
        synchronized (this._databaseAccessLock) {
            getWritableDatabase().delete(DATABASE_TABLE_APP_SESSIONS, "synced = 1 AND disposable = 1", null);
            getWritableDatabase().delete(DATABASE_TABLE_PHONE_SESSIONS, "synced = 1 AND disposable = 1", null);
        }
    }

    private void deleteAllRecords() {
        getWritableDatabase().delete(DATABASE_TABLE_APP_SESSIONS, null, null);
        getWritableDatabase().delete(DATABASE_TABLE_PHONE_SESSIONS, null, null);
    }

    private void trimLruEntries(String tableName, int maxRecordsCap) {
        if (maxRecordsCap < 0) {
            throw new IllegalArgumentException("'maxRecordsCap' can not be negative");
        }
        if (getRecordCount(tableName) >= maxRecordsCap) {
            Long id = null;
            Cursor results = null;
            try {
                results = getReadableDatabase().query(tableName, new String[]{Constants.APP_ID}, null, null, null, null, "timestamp DESC");
                if (results.moveToPosition(maxRecordsCap)) {
                    id = Long.valueOf(results.getLong(0));
                }
                int count = getWritableDatabase().delete(tableName, String.format(Locale.US, "id <= %1$d", id), null);
                if (count > 0) {
                    Logger.v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: UsageDatabase: trimLruEntries() %1$d LRU rows deleted form %2$s", Integer.valueOf(count), tableName));
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
        SQLiteStatement dbStatement = getReadableDatabase().compileStatement(String.format(Locale.US, "SELECT count(*) FROM %1$s", tableName));
        try {
            return dbStatement.simpleQueryForLong();
        } finally {
            try {
                dbStatement.close();
            } catch (Exception e) {
                Logger.e(Area.USAGE.value() | Area.STORAGE.value(), "SQLiteStatement.close() failed", e);
            }
        }
    }

    private boolean checkForRecord(String tableName, long id) {
        boolean z = true;
        SQLiteStatement dbStatement = null;
        try {
            dbStatement = getReadableDatabase().compileStatement(String.format(Locale.US, "SELECT count(*) FROM %1$s WHERE id = ?", tableName));
            dbStatement.bindLong(1, id);
            if (dbStatement.simpleQueryForLong() <= 0) {
                z = false;
            }
            return z;
        } finally {
            if (dbStatement != null) {
                try {
                    dbStatement.close();
                } catch (Exception e) {
                    Logger.e(Area.USAGE.value() | Area.STORAGE.value(), "SQLiteStatement.close() failed", e);
                }
            }
        }
    }

    private void setRecordAsSynced(String tableName, long id) {
        if (checkForRecord(tableName, id)) {
            ContentValues values = new ContentValues();
            values.put("synced", (Integer) 1);
            getWritableDatabase().update(tableName, values, String.format(Locale.US, "id = %1$d", Long.valueOf(id)), null);
            return;
        }
        Logger.w(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: UsageDatabase: setRecordAsSynced() failed to find record %1$d", Long.valueOf(id)));
    }

    private void setSessionAsDisposable(String tableName, String sessionId) {
        ContentValues values = new ContentValues();
        values.put("disposable", (Integer) 1);
        int updateCount = getWritableDatabase().update(tableName, values, "sessionId = ? AND disposable != 1", new String[]{sessionId});
        if (updateCount > 0) {
            Logger.v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: UsageDatabase: setSessionAsDisposable() %1$d non-disposable record(s) in %2$s for session ID %3$s, updated as 'disposable'", Integer.valueOf(updateCount), tableName, sessionId));
        }
    }

    public long appSessionGetRecordCount() {
        long recordCount;
        synchronized (this._databaseAccessLock) {
            recordCount = getRecordCount(DATABASE_TABLE_APP_SESSIONS);
        }
        return recordCount;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void appSessionSetAsSynced(long id) {
        synchronized (this._databaseAccessLock) {
            setRecordAsSynced(DATABASE_TABLE_APP_SESSIONS, id);
        }
    }

    public List<ApplicationSessionEvent> appSessionLoadUnsynced() {
        List<ApplicationSessionEvent> appSessionList;
        synchronized (this._databaseAccessLock) {
            appSessionList = new ArrayList<>();
            Cursor results = getReadableDatabase().query(DATABASE_TABLE_APP_SESSIONS, null, "synced = 0", null, null, null, null);
            while (results.moveToNext()) {
                appSessionList.add(ApplicationSessionEvent.loadFromDB(results));
            }
            if (results != null) {
                try {
                    results.close();
                } catch (Exception e) {
                    Logger.e(Area.USAGE.value() | Area.STORAGE.value(), "Usage: UsageDatabase: appSessionLoadUnsynced() failed", e);
                }
            }
        }
        return appSessionList;
    }

    public ApplicationLists appSessionLoadOpenStartLists() {
        ApplicationLists applicationLists;
        synchronized (this._databaseAccessLock) {
            List<ApplicationSessionEvent> newerList = new ArrayList<>();
            List<ApplicationSessionEvent> olderList = new ArrayList<>();
            long thresholdTimestamp = System.currentTimeMillis() - _APP_EVENT_AGE_THRESHOLD;
            Cursor results = getReadableDatabase().query(DATABASE_TABLE_APP_SESSIONS, null, "type = 'start' AND disposable = 0", null, null, null, null);
            while (results.moveToNext()) {
                ApplicationSessionEvent appSessionEvent = ApplicationSessionEvent.loadFromDB(results);
                if (appSessionEvent.getTimestamp() >= thresholdTimestamp) {
                    if (!newerList.contains(appSessionEvent)) {
                        newerList.add(appSessionEvent);
                    }
                } else if (!olderList.contains(appSessionEvent)) {
                    olderList.add(appSessionEvent);
                }
            }
            try {
                results.close();
                results = null;
            } catch (Exception e) {
                Logger.e(Area.USAGE.value() | Area.STORAGE.value(), "Usage: UsageDatabase: appSessionLoadUnsynced() failed", e);
            }
            if (results != null) {
                try {
                    results.close();
                } catch (Exception e2) {
                    Logger.e(Area.USAGE.value() | Area.STORAGE.value(), "Usage: UsageDatabase: appSessionLoadUnsynced() failed", e2);
                }
            }
            applicationLists = new ApplicationLists(newerList, olderList);
        }
        return applicationLists;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public String getNewApplicationSessionID() {
        return UUID.randomUUID().toString();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public long appSessionStart(String packageName, SessionEvent.Reason reason, String reasonDetails, long eventTimestamp, String phoneSessionId, String appSessionId) {
        long rowId;
        if (StringUtility.isNullOrEmpty(packageName)) {
            throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
        }
        if (reason == null) {
            throw new IllegalArgumentException("'reason' cannot be NULL");
        }
        if (StringUtility.isNullOrEmpty(phoneSessionId)) {
            throw new IllegalArgumentException("'phoneSessionId' cannot be NULL or empty");
        }
        if (StringUtility.isNullOrEmpty(appSessionId)) {
            throw new IllegalArgumentException("'appSessionId' cannot be NULL or empty");
        }
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
            values.put("synced", (Integer) 0);
            values.put("disposable", (Integer) 0);
            rowId = getWritableDatabase().insert(DATABASE_TABLE_APP_SESSIONS, null, values);
            Logger.v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: UsageDatabase: appSessionStart() [packageName:%1$s timestamp:%2$d sessionId:%3$s phoneSessionId:%4$s]", packageName, Long.valueOf(eventTimestamp), appSessionId, phoneSessionId));
        }
        trimLruEntries();
        return rowId;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public long appSessionStop(String packageName, SessionEvent.Reason reason, String reasonDetails, long eventTimestamp, String phoneSessionId, String appSessionId) {
        long rowId;
        if (StringUtility.isNullOrEmpty(packageName)) {
            throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
        }
        if (reason == null) {
            throw new IllegalArgumentException("'reason' cannot be NULL");
        }
        if (StringUtility.isNullOrEmpty(phoneSessionId)) {
            throw new IllegalArgumentException("'phoneSessionId' cannot be NULL or empty");
        }
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
            values.put("synced", (Integer) 0);
            values.put("disposable", (Integer) 1);
            rowId = getWritableDatabase().insert(DATABASE_TABLE_APP_SESSIONS, null, values);
            Logger.v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: UsageDatabase: appSessionStop() [packageName:%1$s timestamp:%2$d sessionId:%3$s phoneSessionId:%4$s] stack:%5$s", packageName, Long.valueOf(eventTimestamp), sessionId, phoneSessionId, Logger.getShortStack()));
        }
        trimLruEntries();
        return rowId;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public long appSessionStop(ApplicationSessionEvent startEvent, SessionEvent.Reason reason, String reasonDetails, long eventTime) {
        long rowId;
        if (startEvent == null) {
            throw new IllegalArgumentException("'startEvent' cannot be NULL");
        }
        if (!SessionEvent.Type.start.equals(startEvent.getType())) {
            throw new IllegalArgumentException("'startEvent' must be a 'start' record");
        }
        if (reason == null) {
            throw new IllegalArgumentException("'reason' cannot be NULL");
        }
        if (eventTime < 0) {
            throw new IllegalArgumentException("'eventTime' cannot be less than zero");
        }
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
            values.put("synced", (Integer) 0);
            values.put("disposable", (Integer) 1);
            rowId = getWritableDatabase().insert(DATABASE_TABLE_APP_SESSIONS, null, values);
            Logger.v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: UsageDatabase: appSessionStop() [packageName:%1$s timestamp:%2$d sessionId:%3$s phoneSessionId:%4$s]", startEvent.getPackageName(), Long.valueOf(stopTime), startEvent.getSessionId(), startEvent.getPhoneSessionId()));
        }
        trimLruEntries();
        return rowId;
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

    protected ApplicationSessionEvent appSessionLoadStartRecord(String stopEventSessionId) {
        ApplicationSessionEvent startEvent;
        synchronized (this._databaseAccessLock) {
            startEvent = null;
            Cursor results = getReadableDatabase().query(DATABASE_TABLE_APP_SESSIONS, null, "sessionId = ? AND type = 'start'", new String[]{stopEventSessionId}, null, null, null);
            if (results.moveToNext()) {
                startEvent = ApplicationSessionEvent.loadFromDB(results);
            }
            if (results != null) {
                try {
                    results.close();
                } catch (Exception e) {
                    Logger.e(Area.USAGE.value() | Area.STORAGE.value(), "Usage: UsageDatabase: appSessionLoadStartRecord() failed", e);
                }
            }
        }
        return startEvent;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void deleteAppSession(long id) {
        synchronized (this._databaseAccessLock) {
            getWritableDatabase().delete(DATABASE_TABLE_APP_SESSIONS, String.format(Locale.US, "id = %1$d", Long.valueOf(id)), null);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
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
            results = getReadableDatabase().query(DATABASE_TABLE_APP_SESSIONS, null, "disposable = 0 AND type = 'start'", null, null, null, null);
            while (results.moveToNext()) {
                appSessionList.add(ApplicationSessionEvent.loadFromDB(results));
            }
            return appSessionList;
        } finally {
            if (results != null) {
                try {
                    results.close();
                } catch (Exception e) {
                    Logger.e(Area.USAGE.value() | Area.STORAGE.value(), "Usage: UsageDatabase: appSessionLoadOpenStartsInternal() failed", e);
                }
            }
        }
    }

    protected ApplicationSessionEvent appSessionLoad(long rowId) {
        ApplicationSessionEvent event;
        synchronized (this._databaseAccessLock) {
            event = null;
            Cursor results = getReadableDatabase().query(DATABASE_TABLE_APP_SESSIONS, null, String.format(Locale.US, "id = %1$d", Long.valueOf(rowId)), null, null, null, null);
            if (results.moveToNext()) {
                event = ApplicationSessionEvent.loadFromDB(results);
            }
            if (results != null) {
                try {
                    results.close();
                } catch (Exception e) {
                    Logger.e(Area.USAGE.value() | Area.STORAGE.value(), "Usage: UsageDatabase: appSessionLoad() failed", e);
                }
            }
        }
        return event;
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
            results = getReadableDatabase().query(DATABASE_TABLE_APP_SESSIONS, _SessionIdColumns, "packageName = ? AND type = ?", new String[]{packageName, "stop"}, null, null, "timestamp DESC", "1");
            if (results.moveToNext()) {
                applicationSessionId = results.getString(0);
                Logger.v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: UsageDatabase: getLatestStopApplicationSessionId() loaded: %1$s", applicationSessionId));
            }
            return applicationSessionId;
        } finally {
            if (results != null) {
                try {
                    results.close();
                } catch (Exception e) {
                    Logger.e(Area.USAGE.value() | Area.STORAGE.value(), "Usage: UsageDatabase: getLatestStopApplicationSessionId() failed", e);
                }
            }
        }
    }

    private String getLatestStartApplicationSessionId(String packageName) {
        String applicationSessionId = null;
        Cursor results = null;
        try {
            results = getReadableDatabase().query(DATABASE_TABLE_APP_SESSIONS, _SessionIdColumns, "packageName = ? AND type = ?", new String[]{packageName, "start"}, null, null, "timestamp DESC", "1");
            if (results.moveToNext()) {
                applicationSessionId = results.getString(0);
                Logger.v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: UsageDatabase: getLatestStartApplicationSessionId() loaded: %1$s", applicationSessionId));
            }
            return applicationSessionId;
        } finally {
            if (results != null) {
                try {
                    results.close();
                } catch (Exception e) {
                    Logger.e(Area.USAGE.value() | Area.STORAGE.value(), "Usage: UsageDatabase: getLatestStartApplicationSessionId() failed", e);
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

    /* JADX INFO: Access modifiers changed from: protected */
    public void phoneSessionSetAsSynced(long id) {
        synchronized (this._databaseAccessLock) {
            setRecordAsSynced(DATABASE_TABLE_PHONE_SESSIONS, id);
        }
    }

    public List<PhoneSessionEvent> phoneSessionLoadUnsynced() {
        List<PhoneSessionEvent> phoneSessionList;
        synchronized (this._databaseAccessLock) {
            phoneSessionList = new ArrayList<>();
            Cursor results = getReadableDatabase().query(DATABASE_TABLE_PHONE_SESSIONS, null, "synced = 0", null, null, null, null);
            while (results.moveToNext()) {
                phoneSessionList.add(PhoneSessionEvent.loadFromDB(results));
            }
            if (results != null) {
                try {
                    results.close();
                } catch (Exception e) {
                    Logger.e(Area.USAGE.value() | Area.STORAGE.value(), "Usage: UsageDatabase: phoneSessionLoadUnsynced() failed", e);
                }
            }
        }
        return phoneSessionList;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public String getNewPhoneSessionID() {
        return UUID.randomUUID().toString();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void phoneSessionStart(SessionEvent.Reason reason, String reasonDetails, String phoneSessionId) {
        if (reason == null) {
            throw new IllegalArgumentException("'reason' cannot be NULL");
        }
        if (StringUtility.isNullOrEmpty(phoneSessionId)) {
            throw new IllegalArgumentException("'phoneSessionId' cannot be NULL or empty");
        }
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
            values.put("synced", (Integer) 0);
            values.put("disposable", (Integer) 0);
            getWritableDatabase().insert(DATABASE_TABLE_PHONE_SESSIONS, null, values);
            Logger.v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: UsageDatabase: phoneSessionStart() [timestamp:%1$d sessionId:%2$s]", Long.valueOf(now), phoneSessionId));
        }
        trimLruEntries();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void phoneSessionStop(SessionEvent.Reason reason, String reasonDetails, long eventTime) {
        phoneSessionStop(reason, reasonDetails, eventTime, null);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void phoneSessionStop(SessionEvent.Reason reason, String reasonDetails, long eventTime, String phoneSessionId) {
        if (reason == null) {
            throw new IllegalArgumentException("'reason' cannot be NULL");
        }
        if (eventTime < 0) {
            throw new IllegalArgumentException("'eventTime' cannot be less than zero");
        }
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
                values.put("synced", (Integer) 0);
                values.put("disposable", (Integer) 1);
                getWritableDatabase().insert(DATABASE_TABLE_PHONE_SESSIONS, null, values);
                Logger.v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: UsageDatabase: phoneSessionStop() [timestamp:%1$d sessionId:%2$s]", Long.valueOf(stopTime), startEvent.getSessionId()));
                trimLruEntries();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void deletePhoneSession(long id) {
        synchronized (this._databaseAccessLock) {
            getWritableDatabase().delete(DATABASE_TABLE_PHONE_SESSIONS, String.format(Locale.US, "id = %1$d", Long.valueOf(id)), null);
        }
    }

    private PhoneSessionEvent getPhoneSessionStart(String phoneSessionId) {
        PhoneSessionEvent result = null;
        Cursor dbResults = null;
        try {
            if (StringUtility.isNullOrEmpty(phoneSessionId) || EmptyUUID.equals(phoneSessionId)) {
                dbResults = getReadableDatabase().query(DATABASE_TABLE_PHONE_SESSIONS, null, "type = 'start' AND disposable = 0", null, null, null, "timestamp DESC", "1");
            } else {
                dbResults = getReadableDatabase().query(DATABASE_TABLE_PHONE_SESSIONS, null, "type = 'start' AND sessionId = ?", new String[]{phoneSessionId}, null, null, "timestamp DESC", "1");
            }
            if (dbResults.moveToNext()) {
                result = PhoneSessionEvent.loadFromDB(dbResults);
                Logger.v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Usage: UsageDatabase: getPhoneSession() loaded: %1$s", result));
            }
            return result;
        } finally {
            if (dbResults != null) {
                try {
                    dbResults.close();
                } catch (Exception e) {
                    Logger.e(Area.USAGE.value() | Area.STORAGE.value(), "Usage: UsageDatabase: getPhoneSession() failed", e);
                }
            }
        }
    }
}
