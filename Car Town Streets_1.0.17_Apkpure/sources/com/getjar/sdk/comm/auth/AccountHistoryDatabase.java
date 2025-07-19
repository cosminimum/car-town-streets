package com.getjar.sdk.comm.auth;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteStatement;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.Constants;
import com.getjar.sdk.utilities.StringUtility;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
/* loaded from: classes.dex */
public class AccountHistoryDatabase extends SQLiteOpenHelper {
    private static final int ACCOUNTS_LRU_CAP = 50;
    private static final String DATABASE_NAME = "GetJarDBAccountHistory";
    private static final int DATABASE_VERSION = 1;
    private static final int EVENTS_LRU_CAP = 100;
    private volatile Object _databaseAccessLock = new Object();
    private static volatile AccountHistoryDatabase _Instance = null;
    private static final String DATABASE_TABLE_ACCOUNT_INFO = "account";
    private static final String DATABASE_TABLE_ACCOUNT_EVENT = "accountEvent";
    private static final String[] DB_TABLE_NAMES = {DATABASE_TABLE_ACCOUNT_INFO, DATABASE_TABLE_ACCOUNT_EVENT};
    private static final String DATABASE_CREATE_TABLE_ACCOUNT_INFO = "CREATE TABLE IF NOT EXISTS account (id INTEGER PRIMARY KEY AUTOINCREMENT, userAccessId TEXT NOT NULL UNIQUE, userDeviceId TEXT NOT NULL, providerFilter TEXT NOT NULL, accountName TEXT NOT NULL, timestampLastAuth INTEGER NOT NULL, timestampCreated INTEGER NOT NULL);";
    private static final String DATABASE_CREATE_TABLE_ACCOUNT_EVENT = "CREATE TABLE IF NOT EXISTS accountEvent (id INTEGER PRIMARY KEY AUTOINCREMENT, userAccessId TEXT NOT NULL, eventType TEXT NOT NULL, timestamp INTEGER NOT NULL, FOREIGN KEY(userAccessId) REFERENCES account(userAccessId) );";
    private static final String[] DB_CREATE_TABLE_COMMANDS = {DATABASE_CREATE_TABLE_ACCOUNT_INFO, DATABASE_CREATE_TABLE_ACCOUNT_EVENT};

    private AccountHistoryDatabase(Context context) {
        super(context, DATABASE_NAME, (SQLiteDatabase.CursorFactory) null, 1);
    }

    public static synchronized AccountHistoryDatabase getInstance(Context context) {
        AccountHistoryDatabase accountHistoryDatabase;
        synchronized (AccountHistoryDatabase.class) {
            if (_Instance == null) {
                _Instance = new AccountHistoryDatabase(context);
            }
            accountHistoryDatabase = _Instance;
        }
        return accountHistoryDatabase;
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onCreate(SQLiteDatabase db) {
        synchronized (this._databaseAccessLock) {
            String[] arr$ = DB_CREATE_TABLE_COMMANDS;
            for (String createCommand : arr$) {
                db.execSQL(createCommand);
            }
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        synchronized (this._databaseAccessLock) {
            Logger.d(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Upgrading database '%1$s' from version %2$d to %3$d, which will destroy all old data", DATABASE_NAME, Integer.valueOf(oldVersion), Integer.valueOf(newVersion)));
            String[] arr$ = DB_TABLE_NAMES;
            for (String tableName : arr$) {
                db.execSQL(String.format(Locale.US, "DROP TABLE IF EXISTS %1$s", tableName));
            }
            onCreate(db);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void ensureAccountEntry(String userAccessId, String userDeviceId, String accountName, String providerFilter, long timestamp) {
        Logger.v(Area.STORAGE.value() | Area.AUTH.value(), "AccountHistoryDatabase.ensureAccountEntry() START");
        try {
            if (StringUtility.isNullOrEmpty(userAccessId)) {
                throw new IllegalArgumentException("'userAccessId' cannot be NULL or empty");
            }
            if (StringUtility.isNullOrEmpty(userDeviceId)) {
                throw new IllegalArgumentException("'userDeviceId' cannot be NULL or empty");
            }
            if (StringUtility.isNullOrEmpty(accountName)) {
                throw new IllegalArgumentException("'accountName' cannot be NULL or empty");
            }
            if (StringUtility.isNullOrEmpty(providerFilter)) {
                throw new IllegalArgumentException("'providerFilter' cannot be NULL or empty");
            }
            if (timestamp <= 0) {
                throw new IllegalArgumentException("'timestamp' must be greater than zero");
            }
            synchronized (this._databaseAccessLock) {
                if (!checkForAccountEntry(userAccessId)) {
                    ContentValues values = new ContentValues();
                    values.put("userAccessId", userAccessId);
                    values.put("userDeviceId", userDeviceId);
                    values.put("accountName", accountName);
                    values.put("providerFilter", providerFilter);
                    values.put("timestampLastAuth", Long.valueOf(timestamp));
                    values.put("timestampCreated", Long.valueOf(timestamp));
                    if (getWritableDatabase().insert(DATABASE_TABLE_ACCOUNT_INFO, null, values) >= 0) {
                        Logger.v(Area.STORAGE.value() | Area.AUTH.value(), String.format(Locale.US, "AccountHistoryDatabase.ensureAccountEntry() inserted [userAccessId:%1$s userDeviceId:%2$s accountName:'%3$s' providerFilter:%4$s timestampLastAuth:%5$d timestampCreated:%6$d]", userAccessId, userDeviceId, accountName, providerFilter, Long.valueOf(timestamp), Long.valueOf(timestamp)));
                    } else {
                        Logger.e(Area.STORAGE.value() | Area.AUTH.value(), String.format(Locale.US, "AccountHistoryDatabase.ensureAccountEntry() failed to insert [userAccessId:%1$s userDeviceId:%2$s accountName:'%3$s' providerFilter:%4$s timestampLastAuth:%5$d timestampCreated:%6$d]", userAccessId, userDeviceId, accountName, providerFilter, Long.valueOf(timestamp), Long.valueOf(timestamp)));
                    }
                    trimLruEntriesAccountInfo();
                }
            }
        } finally {
            Logger.v(Area.STORAGE.value() | Area.AUTH.value(), "AccountHistoryDatabase.ensureAccountEntry() FINISHED");
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void insertEvent(String userAccessId, AccountEventType eventType, long timestamp) {
        Logger.v(Area.STORAGE.value() | Area.AUTH.value(), "AccountHistoryDatabase.insertEvent() START");
        try {
            if (StringUtility.isNullOrEmpty(userAccessId)) {
                throw new IllegalArgumentException("'userAccessId' cannot be NULL or empty");
            }
            if (eventType == null) {
                throw new IllegalArgumentException("'eventType' cannot be NULL");
            }
            if (timestamp <= 0) {
                throw new IllegalArgumentException("'timestamp' must be greater than zero");
            }
            synchronized (this._databaseAccessLock) {
                ContentValues values = new ContentValues();
                values.put("userAccessId", userAccessId);
                values.put("eventType", eventType.name());
                values.put("timestamp", Long.valueOf(timestamp));
                if (getWritableDatabase().insert(DATABASE_TABLE_ACCOUNT_EVENT, null, values) >= 0) {
                    Logger.v(Area.STORAGE.value() | Area.AUTH.value(), String.format(Locale.US, "AccountHistoryDatabase.insertEvent() inserted [userAccessId:%1$s eventType:%2$s timestamp:%3$d]", userAccessId, eventType.name(), Long.valueOf(timestamp)));
                } else {
                    Logger.e(Area.STORAGE.value() | Area.AUTH.value(), String.format(Locale.US, "AccountHistoryDatabase.insertEvent() failed to insert [userAccessId:%1$s eventType:%2$s timestamp:%3$d]", userAccessId, eventType.name(), Long.valueOf(timestamp)));
                }
                if (eventType.isAuthEvent()) {
                    updateAccountLastAuth(userAccessId, timestamp);
                }
                trimLruEntriesAccountEvent();
            }
        } finally {
            Logger.v(Area.STORAGE.value() | Area.AUTH.value(), "AccountHistoryDatabase.insertEvent() FINISHED");
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public List<AccountHistoryEvent> getEvents(String userAccessId) {
        List<AccountHistoryEvent> eventList;
        Logger.v(Area.STORAGE.value() | Area.AUTH.value(), "AccountHistoryDatabase.getEvents(userAccessId) START");
        try {
            if (StringUtility.isNullOrEmpty(userAccessId)) {
                throw new IllegalArgumentException("'userAccessId' can not be NULL or empty");
            }
            synchronized (this._databaseAccessLock) {
                eventList = new ArrayList<>();
                Cursor results = getReadableDatabase().query(DATABASE_TABLE_ACCOUNT_EVENT, null, "userAccessId = ?", new String[]{userAccessId}, null, null, "timestamp DESC");
                while (results.moveToNext()) {
                    try {
                        eventList.add(new AccountHistoryEvent(results));
                    } finally {
                        try {
                            results.close();
                        } catch (Exception e) {
                        }
                    }
                }
            }
            return eventList;
        } finally {
            Logger.v(Area.STORAGE.value() | Area.AUTH.value(), "AccountHistoryDatabase.getEvents(userAccessId) FINISHED");
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public List<AccountHistoryEvent> getEvents() {
        List<AccountHistoryEvent> eventList;
        Logger.v(Area.STORAGE.value() | Area.AUTH.value(), "AccountHistoryDatabase.getEvents() START");
        try {
            synchronized (this._databaseAccessLock) {
                eventList = new ArrayList<>();
                Cursor results = getReadableDatabase().query(DATABASE_TABLE_ACCOUNT_EVENT, null, null, null, null, null, "timestamp DESC");
                while (results.moveToNext()) {
                    eventList.add(new AccountHistoryEvent(results));
                }
                try {
                    results.close();
                } catch (Exception e) {
                }
            }
            return eventList;
        } finally {
            Logger.v(Area.STORAGE.value() | Area.AUTH.value(), "AccountHistoryDatabase.getEvents() FINISHED");
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public List<AccountHistoryInfo> getAccounts() {
        Logger.v(Area.STORAGE.value() | Area.AUTH.value(), "AccountHistoryDatabase.getAccounts() START");
        try {
            List<AccountHistoryInfo> accounts = new ArrayList<>();
            synchronized (this._databaseAccessLock) {
                Cursor results = getReadableDatabase().query(DATABASE_TABLE_ACCOUNT_INFO, null, null, null, null, null, "accountName");
                while (results.moveToNext()) {
                    accounts.add(new AccountHistoryInfo(results));
                }
                try {
                    results.close();
                } catch (Exception e) {
                }
            }
            return accounts;
        } finally {
            Logger.v(Area.STORAGE.value() | Area.AUTH.value(), "AccountHistoryDatabase.getAccounts() FINISHED");
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public AccountHistoryInfo getAccount(String userAccessId) {
        Logger.v(Area.STORAGE.value() | Area.AUTH.value(), "AccountHistoryDatabase.getAccount() START");
        try {
            if (StringUtility.isNullOrEmpty(userAccessId)) {
                throw new IllegalArgumentException("'userAccessId' can not be NULL or empty");
            }
            synchronized (this._databaseAccessLock) {
                Cursor results = getReadableDatabase().query(DATABASE_TABLE_ACCOUNT_INFO, null, "userAccessId = ?", new String[]{userAccessId}, null, null, null);
                if (!results.moveToNext()) {
                    try {
                        results.close();
                    } catch (Exception e) {
                    }
                    return null;
                }
                AccountHistoryInfo accountHistoryInfo = new AccountHistoryInfo(results);
                try {
                    results.close();
                } catch (Exception e2) {
                }
                return accountHistoryInfo;
            }
        } finally {
            Logger.v(Area.STORAGE.value() | Area.AUTH.value(), "AccountHistoryDatabase.getAccount() FINISHED");
        }
    }

    private void updateAccountLastAuth(String userAccessId, long timestampLastAuth) {
        Logger.v(Area.STORAGE.value() | Area.AUTH.value(), "AccountHistoryDatabase.updateAccountLastAuth() START");
        try {
            if (StringUtility.isNullOrEmpty(userAccessId)) {
                throw new IllegalArgumentException("'userAccessId' cannot be NULL or empty");
            }
            ContentValues values = new ContentValues();
            values.put("timestampLastAuth", Long.valueOf(timestampLastAuth));
            int updateCount = getWritableDatabase().update(DATABASE_TABLE_ACCOUNT_INFO, values, "userAccessId = ?", new String[]{userAccessId});
            if (updateCount > 0) {
                Logger.v(Area.STORAGE.value() | Area.AUTH.value(), String.format(Locale.US, "AccountHistoryDatabase.updateAccountLastAuth() updated [userAccessId:%1$s timestampLastAuth:%2$d]", userAccessId, Long.valueOf(timestampLastAuth)));
            } else {
                Logger.e(Area.STORAGE.value() | Area.AUTH.value(), String.format(Locale.US, "AccountHistoryDatabase.updateAccountLastAuth() failed to update [userAccessId:%1$s timestampLastAuth:%2$d]", userAccessId, Long.valueOf(timestampLastAuth)));
            }
        } finally {
            Logger.v(Area.STORAGE.value() | Area.AUTH.value(), "AccountHistoryDatabase.updateAccountLastAuth() FINISHED");
        }
    }

    private boolean checkForAccountEntry(String userAccessId) {
        boolean z = true;
        if (StringUtility.isNullOrEmpty(userAccessId)) {
            throw new IllegalArgumentException("'userAccessId' cannot be NULL or empty");
        }
        SQLiteStatement dbStatement = getReadableDatabase().compileStatement(String.format(Locale.US, "SELECT count(*) FROM %1$s WHERE userAccessId = ?", DATABASE_TABLE_ACCOUNT_INFO));
        try {
            dbStatement.bindString(1, userAccessId);
            if (dbStatement.simpleQueryForLong() <= 0) {
                z = false;
            }
            return z;
        } finally {
            try {
                dbStatement.close();
            } catch (Exception e) {
                Logger.e(Area.STORAGE.value(), "SQLiteStatement.close() failed", e);
            }
        }
    }

    private long getRecordCount(String tableName) {
        SQLiteStatement dbStatement = getReadableDatabase().compileStatement(String.format(Locale.US, "SELECT count(*) FROM %1$s", tableName));
        try {
            long simpleQueryForLong = dbStatement.simpleQueryForLong();
            try {
                dbStatement.close();
            } catch (Exception e) {
                Logger.e(Area.STORAGE.value(), "SQLiteStatement.close() failed", e);
            }
            return simpleQueryForLong;
        } catch (Throwable th) {
            try {
                dbStatement.close();
            } catch (Exception e2) {
                Logger.e(Area.STORAGE.value(), "SQLiteStatement.close() failed", e2);
            }
            throw th;
        }
    }

    private void trimLruEntriesAccountInfo() {
        trimLruEntries(DATABASE_TABLE_ACCOUNT_INFO, "timestampLastAuth DESC", 50);
    }

    private void trimLruEntriesAccountEvent() {
        trimLruEntries(DATABASE_TABLE_ACCOUNT_EVENT, "timestamp DESC", 100);
    }

    private void trimLruEntries(String tableName, String orderBy, int lruCap) {
        if (getRecordCount(tableName) >= lruCap) {
            Long id = null;
            Cursor results = getWritableDatabase().query(tableName, new String[]{Constants.APP_ID}, null, null, null, null, orderBy);
            try {
                if (results.moveToPosition(lruCap)) {
                    id = Long.valueOf(results.getLong(0));
                }
                int count = getWritableDatabase().delete(tableName, String.format(Locale.US, "id <= %1$d", id), null);
                Logger.v(Area.STORAGE.value(), String.format(Locale.US, "%1$d LRU rows deleted form '%2$s'", Integer.valueOf(count), tableName));
            } finally {
                try {
                    results.close();
                } catch (Exception e) {
                }
            }
        }
    }
}
