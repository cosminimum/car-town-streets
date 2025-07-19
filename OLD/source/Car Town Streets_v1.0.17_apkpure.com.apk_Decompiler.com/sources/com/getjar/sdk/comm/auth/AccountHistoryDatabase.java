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
import java.util.Locale;

public class AccountHistoryDatabase extends SQLiteOpenHelper {
    private static final int ACCOUNTS_LRU_CAP = 50;
    private static final String DATABASE_CREATE_TABLE_ACCOUNT_EVENT = "CREATE TABLE IF NOT EXISTS accountEvent (id INTEGER PRIMARY KEY AUTOINCREMENT, userAccessId TEXT NOT NULL, eventType TEXT NOT NULL, timestamp INTEGER NOT NULL, FOREIGN KEY(userAccessId) REFERENCES account(userAccessId) );";
    private static final String DATABASE_CREATE_TABLE_ACCOUNT_INFO = "CREATE TABLE IF NOT EXISTS account (id INTEGER PRIMARY KEY AUTOINCREMENT, userAccessId TEXT NOT NULL UNIQUE, userDeviceId TEXT NOT NULL, providerFilter TEXT NOT NULL, accountName TEXT NOT NULL, timestampLastAuth INTEGER NOT NULL, timestampCreated INTEGER NOT NULL);";
    private static final String DATABASE_NAME = "GetJarDBAccountHistory";
    private static final String DATABASE_TABLE_ACCOUNT_EVENT = "accountEvent";
    private static final String DATABASE_TABLE_ACCOUNT_INFO = "account";
    private static final int DATABASE_VERSION = 1;
    private static final String[] DB_CREATE_TABLE_COMMANDS = {DATABASE_CREATE_TABLE_ACCOUNT_INFO, DATABASE_CREATE_TABLE_ACCOUNT_EVENT};
    private static final String[] DB_TABLE_NAMES = {DATABASE_TABLE_ACCOUNT_INFO, DATABASE_TABLE_ACCOUNT_EVENT};
    private static final int EVENTS_LRU_CAP = 100;
    private static volatile AccountHistoryDatabase _Instance = null;
    private volatile Object _databaseAccessLock = new Object();

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

    public void onCreate(SQLiteDatabase db) {
        synchronized (this._databaseAccessLock) {
            for (String createCommand : DB_CREATE_TABLE_COMMANDS) {
                db.execSQL(createCommand);
            }
        }
    }

    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        synchronized (this._databaseAccessLock) {
            Logger.d(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "Upgrading database '%1$s' from version %2$d to %3$d, which will destroy all old data", new Object[]{DATABASE_NAME, Integer.valueOf(oldVersion), Integer.valueOf(newVersion)}));
            for (String tableName : DB_TABLE_NAMES) {
                db.execSQL(String.format(Locale.US, "DROP TABLE IF EXISTS %1$s", new Object[]{tableName}));
            }
            onCreate(db);
        }
    }

    /* access modifiers changed from: protected */
    public void ensureAccountEntry(String userAccessId, String userDeviceId, String accountName, String providerFilter, long timestamp) {
        Logger.v(Area.STORAGE.value() | Area.AUTH.value(), "AccountHistoryDatabase.ensureAccountEntry() START");
        try {
            if (StringUtility.isNullOrEmpty(userAccessId)) {
                throw new IllegalArgumentException("'userAccessId' cannot be NULL or empty");
            } else if (StringUtility.isNullOrEmpty(userDeviceId)) {
                throw new IllegalArgumentException("'userDeviceId' cannot be NULL or empty");
            } else if (StringUtility.isNullOrEmpty(accountName)) {
                throw new IllegalArgumentException("'accountName' cannot be NULL or empty");
            } else if (StringUtility.isNullOrEmpty(providerFilter)) {
                throw new IllegalArgumentException("'providerFilter' cannot be NULL or empty");
            } else if (timestamp <= 0) {
                throw new IllegalArgumentException("'timestamp' must be greater than zero");
            } else {
                synchronized (this._databaseAccessLock) {
                    if (!checkForAccountEntry(userAccessId)) {
                        ContentValues values = new ContentValues();
                        values.put("userAccessId", userAccessId);
                        values.put("userDeviceId", userDeviceId);
                        values.put("accountName", accountName);
                        values.put("providerFilter", providerFilter);
                        values.put("timestampLastAuth", Long.valueOf(timestamp));
                        values.put("timestampCreated", Long.valueOf(timestamp));
                        if (getWritableDatabase().insert(DATABASE_TABLE_ACCOUNT_INFO, (String) null, values) >= 0) {
                            Logger.v(Area.STORAGE.value() | Area.AUTH.value(), String.format(Locale.US, "AccountHistoryDatabase.ensureAccountEntry() inserted [userAccessId:%1$s userDeviceId:%2$s accountName:'%3$s' providerFilter:%4$s timestampLastAuth:%5$d timestampCreated:%6$d]", new Object[]{userAccessId, userDeviceId, accountName, providerFilter, Long.valueOf(timestamp), Long.valueOf(timestamp)}));
                        } else {
                            Logger.e(Area.STORAGE.value() | Area.AUTH.value(), String.format(Locale.US, "AccountHistoryDatabase.ensureAccountEntry() failed to insert [userAccessId:%1$s userDeviceId:%2$s accountName:'%3$s' providerFilter:%4$s timestampLastAuth:%5$d timestampCreated:%6$d]", new Object[]{userAccessId, userDeviceId, accountName, providerFilter, Long.valueOf(timestamp), Long.valueOf(timestamp)}));
                        }
                        trimLruEntriesAccountInfo();
                    }
                }
                Logger.v(Area.STORAGE.value() | Area.AUTH.value(), "AccountHistoryDatabase.ensureAccountEntry() FINISHED");
            }
        } catch (Throwable th) {
            Logger.v(Area.STORAGE.value() | Area.AUTH.value(), "AccountHistoryDatabase.ensureAccountEntry() FINISHED");
            throw th;
        }
    }

    /* access modifiers changed from: protected */
    public void insertEvent(String userAccessId, AccountEventType eventType, long timestamp) {
        Logger.v(Area.STORAGE.value() | Area.AUTH.value(), "AccountHistoryDatabase.insertEvent() START");
        try {
            if (StringUtility.isNullOrEmpty(userAccessId)) {
                throw new IllegalArgumentException("'userAccessId' cannot be NULL or empty");
            } else if (eventType == null) {
                throw new IllegalArgumentException("'eventType' cannot be NULL");
            } else if (timestamp <= 0) {
                throw new IllegalArgumentException("'timestamp' must be greater than zero");
            } else {
                synchronized (this._databaseAccessLock) {
                    ContentValues values = new ContentValues();
                    values.put("userAccessId", userAccessId);
                    values.put("eventType", eventType.name());
                    values.put("timestamp", Long.valueOf(timestamp));
                    if (getWritableDatabase().insert(DATABASE_TABLE_ACCOUNT_EVENT, (String) null, values) >= 0) {
                        Logger.v(Area.STORAGE.value() | Area.AUTH.value(), String.format(Locale.US, "AccountHistoryDatabase.insertEvent() inserted [userAccessId:%1$s eventType:%2$s timestamp:%3$d]", new Object[]{userAccessId, eventType.name(), Long.valueOf(timestamp)}));
                    } else {
                        Logger.e(Area.STORAGE.value() | Area.AUTH.value(), String.format(Locale.US, "AccountHistoryDatabase.insertEvent() failed to insert [userAccessId:%1$s eventType:%2$s timestamp:%3$d]", new Object[]{userAccessId, eventType.name(), Long.valueOf(timestamp)}));
                    }
                    if (eventType.isAuthEvent()) {
                        updateAccountLastAuth(userAccessId, timestamp);
                    }
                    trimLruEntriesAccountEvent();
                }
                Logger.v(Area.STORAGE.value() | Area.AUTH.value(), "AccountHistoryDatabase.insertEvent() FINISHED");
            }
        } catch (Throwable th) {
            Logger.v(Area.STORAGE.value() | Area.AUTH.value(), "AccountHistoryDatabase.insertEvent() FINISHED");
            throw th;
        }
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:22:0x0067=Splitter:B:22:0x0067, B:31:0x006f=Splitter:B:31:0x006f} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public java.util.List<com.getjar.sdk.comm.auth.AccountHistoryEvent> getEvents(java.lang.String r12) {
        /*
            r11 = this;
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.STORAGE
            long r0 = r0.value()
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.AUTH
            long r2 = r2.value()
            long r0 = r0 | r2
            java.lang.String r2 = "AccountHistoryDatabase.getEvents(userAccessId) START"
            com.getjar.sdk.logging.Logger.v(r0, r2)
            boolean r0 = com.getjar.sdk.utilities.StringUtility.isNullOrEmpty(r12)     // Catch:{ all -> 0x0020 }
            if (r0 == 0) goto L_0x0034
            java.lang.IllegalArgumentException r0 = new java.lang.IllegalArgumentException     // Catch:{ all -> 0x0020 }
            java.lang.String r1 = "'userAccessId' can not be NULL or empty"
            r0.<init>(r1)     // Catch:{ all -> 0x0020 }
            throw r0     // Catch:{ all -> 0x0020 }
        L_0x0020:
            r0 = move-exception
            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.STORAGE
            long r1 = r1.value()
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.AUTH
            long r3 = r3.value()
            long r1 = r1 | r3
            java.lang.String r3 = "AccountHistoryDatabase.getEvents(userAccessId) FINISHED"
            com.getjar.sdk.logging.Logger.v(r1, r3)
            throw r0
        L_0x0034:
            java.lang.Object r10 = r11._databaseAccessLock     // Catch:{ all -> 0x0020 }
            monitor-enter(r10)     // Catch:{ all -> 0x0020 }
            java.util.ArrayList r8 = new java.util.ArrayList     // Catch:{ all -> 0x0068 }
            r8.<init>()     // Catch:{ all -> 0x0068 }
            android.database.sqlite.SQLiteDatabase r0 = r11.getReadableDatabase()     // Catch:{ all -> 0x0068 }
            java.lang.String r1 = "accountEvent"
            r2 = 0
            java.lang.String r3 = "userAccessId = ?"
            r4 = 1
            java.lang.String[] r4 = new java.lang.String[r4]     // Catch:{ all -> 0x0068 }
            r5 = 0
            r4[r5] = r12     // Catch:{ all -> 0x0068 }
            r5 = 0
            r6 = 0
            java.lang.String r7 = "timestamp DESC"
            android.database.Cursor r9 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch:{ all -> 0x0068 }
        L_0x0053:
            boolean r0 = r9.moveToNext()     // Catch:{ all -> 0x0062 }
            if (r0 == 0) goto L_0x006b
            com.getjar.sdk.comm.auth.AccountHistoryEvent r0 = new com.getjar.sdk.comm.auth.AccountHistoryEvent     // Catch:{ all -> 0x0062 }
            r0.<init>(r9)     // Catch:{ all -> 0x0062 }
            r8.add(r0)     // Catch:{ all -> 0x0062 }
            goto L_0x0053
        L_0x0062:
            r0 = move-exception
            r9.close()     // Catch:{ Exception -> 0x0085 }
            r9 = 0
        L_0x0067:
            throw r0     // Catch:{ all -> 0x0068 }
        L_0x0068:
            r0 = move-exception
            monitor-exit(r10)     // Catch:{ all -> 0x0068 }
            throw r0     // Catch:{ all -> 0x0020 }
        L_0x006b:
            r9.close()     // Catch:{ Exception -> 0x0083 }
            r9 = 0
        L_0x006f:
            monitor-exit(r10)     // Catch:{ all -> 0x0068 }
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.STORAGE
            long r0 = r0.value()
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.AUTH
            long r2 = r2.value()
            long r0 = r0 | r2
            java.lang.String r2 = "AccountHistoryDatabase.getEvents(userAccessId) FINISHED"
            com.getjar.sdk.logging.Logger.v(r0, r2)
            return r8
        L_0x0083:
            r0 = move-exception
            goto L_0x006f
        L_0x0085:
            r1 = move-exception
            goto L_0x0067
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.comm.auth.AccountHistoryDatabase.getEvents(java.lang.String):java.util.List");
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:26:0x005b=Splitter:B:26:0x005b, B:14:0x003f=Splitter:B:14:0x003f} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public java.util.List<com.getjar.sdk.comm.auth.AccountHistoryEvent> getEvents() {
        /*
            r11 = this;
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.STORAGE
            long r0 = r0.value()
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.AUTH
            long r2 = r2.value()
            long r0 = r0 | r2
            java.lang.String r2 = "AccountHistoryDatabase.getEvents() START"
            com.getjar.sdk.logging.Logger.v(r0, r2)
            java.lang.Object r10 = r11._databaseAccessLock     // Catch:{ all -> 0x0043 }
            monitor-enter(r10)     // Catch:{ all -> 0x0043 }
            java.util.ArrayList r8 = new java.util.ArrayList     // Catch:{ all -> 0x0040 }
            r8.<init>()     // Catch:{ all -> 0x0040 }
            android.database.sqlite.SQLiteDatabase r0 = r11.getReadableDatabase()     // Catch:{ all -> 0x0040 }
            java.lang.String r1 = "accountEvent"
            r2 = 0
            r3 = 0
            r4 = 0
            r5 = 0
            r6 = 0
            java.lang.String r7 = "timestamp DESC"
            android.database.Cursor r9 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch:{ all -> 0x0040 }
        L_0x002b:
            boolean r0 = r9.moveToNext()     // Catch:{ all -> 0x003a }
            if (r0 == 0) goto L_0x0057
            com.getjar.sdk.comm.auth.AccountHistoryEvent r0 = new com.getjar.sdk.comm.auth.AccountHistoryEvent     // Catch:{ all -> 0x003a }
            r0.<init>(r9)     // Catch:{ all -> 0x003a }
            r8.add(r0)     // Catch:{ all -> 0x003a }
            goto L_0x002b
        L_0x003a:
            r0 = move-exception
            r9.close()     // Catch:{ Exception -> 0x0071 }
            r9 = 0
        L_0x003f:
            throw r0     // Catch:{ all -> 0x0040 }
        L_0x0040:
            r0 = move-exception
            monitor-exit(r10)     // Catch:{ all -> 0x0040 }
            throw r0     // Catch:{ all -> 0x0043 }
        L_0x0043:
            r0 = move-exception
            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.STORAGE
            long r1 = r1.value()
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.AUTH
            long r3 = r3.value()
            long r1 = r1 | r3
            java.lang.String r3 = "AccountHistoryDatabase.getEvents() FINISHED"
            com.getjar.sdk.logging.Logger.v(r1, r3)
            throw r0
        L_0x0057:
            r9.close()     // Catch:{ Exception -> 0x006f }
            r9 = 0
        L_0x005b:
            monitor-exit(r10)     // Catch:{ all -> 0x0040 }
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.STORAGE
            long r0 = r0.value()
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.AUTH
            long r2 = r2.value()
            long r0 = r0 | r2
            java.lang.String r2 = "AccountHistoryDatabase.getEvents() FINISHED"
            com.getjar.sdk.logging.Logger.v(r0, r2)
            return r8
        L_0x006f:
            r0 = move-exception
            goto L_0x005b
        L_0x0071:
            r1 = move-exception
            goto L_0x003f
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.comm.auth.AccountHistoryDatabase.getEvents():java.util.List");
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:26:0x005b=Splitter:B:26:0x005b, B:14:0x003f=Splitter:B:14:0x003f} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public java.util.List<com.getjar.sdk.comm.auth.AccountHistoryInfo> getAccounts() {
        /*
            r11 = this;
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.STORAGE
            long r0 = r0.value()
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.AUTH
            long r2 = r2.value()
            long r0 = r0 | r2
            java.lang.String r2 = "AccountHistoryDatabase.getAccounts() START"
            com.getjar.sdk.logging.Logger.v(r0, r2)
            java.util.ArrayList r8 = new java.util.ArrayList     // Catch:{ all -> 0x0043 }
            r8.<init>()     // Catch:{ all -> 0x0043 }
            java.lang.Object r10 = r11._databaseAccessLock     // Catch:{ all -> 0x0043 }
            monitor-enter(r10)     // Catch:{ all -> 0x0043 }
            android.database.sqlite.SQLiteDatabase r0 = r11.getReadableDatabase()     // Catch:{ all -> 0x0040 }
            java.lang.String r1 = "account"
            r2 = 0
            r3 = 0
            r4 = 0
            r5 = 0
            r6 = 0
            java.lang.String r7 = "accountName"
            android.database.Cursor r9 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch:{ all -> 0x0040 }
        L_0x002b:
            boolean r0 = r9.moveToNext()     // Catch:{ all -> 0x003a }
            if (r0 == 0) goto L_0x0057
            com.getjar.sdk.comm.auth.AccountHistoryInfo r0 = new com.getjar.sdk.comm.auth.AccountHistoryInfo     // Catch:{ all -> 0x003a }
            r0.<init>(r9)     // Catch:{ all -> 0x003a }
            r8.add(r0)     // Catch:{ all -> 0x003a }
            goto L_0x002b
        L_0x003a:
            r0 = move-exception
            r9.close()     // Catch:{ Exception -> 0x0071 }
            r9 = 0
        L_0x003f:
            throw r0     // Catch:{ all -> 0x0040 }
        L_0x0040:
            r0 = move-exception
            monitor-exit(r10)     // Catch:{ all -> 0x0040 }
            throw r0     // Catch:{ all -> 0x0043 }
        L_0x0043:
            r0 = move-exception
            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.STORAGE
            long r1 = r1.value()
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.AUTH
            long r3 = r3.value()
            long r1 = r1 | r3
            java.lang.String r3 = "AccountHistoryDatabase.getAccounts() FINISHED"
            com.getjar.sdk.logging.Logger.v(r1, r3)
            throw r0
        L_0x0057:
            r9.close()     // Catch:{ Exception -> 0x006f }
            r9 = 0
        L_0x005b:
            monitor-exit(r10)     // Catch:{ all -> 0x0040 }
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.STORAGE
            long r0 = r0.value()
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.AUTH
            long r2 = r2.value()
            long r0 = r0 | r2
            java.lang.String r2 = "AccountHistoryDatabase.getAccounts() FINISHED"
            com.getjar.sdk.logging.Logger.v(r0, r2)
            return r8
        L_0x006f:
            r0 = move-exception
            goto L_0x005b
        L_0x0071:
            r1 = move-exception
            goto L_0x003f
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.comm.auth.AccountHistoryDatabase.getAccounts():java.util.List");
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:27:0x0075=Splitter:B:27:0x0075, B:21:0x005d=Splitter:B:21:0x005d, B:34:0x008f=Splitter:B:34:0x008f} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public com.getjar.sdk.comm.auth.AccountHistoryInfo getAccount(java.lang.String r12) {
        /*
            r11 = this;
            r9 = 0
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.STORAGE
            long r0 = r0.value()
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.AUTH
            long r2 = r2.value()
            long r0 = r0 | r2
            java.lang.String r2 = "AccountHistoryDatabase.getAccount() START"
            com.getjar.sdk.logging.Logger.v(r0, r2)
            boolean r0 = com.getjar.sdk.utilities.StringUtility.isNullOrEmpty(r12)     // Catch:{ all -> 0x0021 }
            if (r0 == 0) goto L_0x0035
            java.lang.IllegalArgumentException r0 = new java.lang.IllegalArgumentException     // Catch:{ all -> 0x0021 }
            java.lang.String r1 = "'userAccessId' can not be NULL or empty"
            r0.<init>(r1)     // Catch:{ all -> 0x0021 }
            throw r0     // Catch:{ all -> 0x0021 }
        L_0x0021:
            r0 = move-exception
            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.STORAGE
            long r1 = r1.value()
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.AUTH
            long r3 = r3.value()
            long r1 = r1 | r3
            java.lang.String r3 = "AccountHistoryDatabase.getAccount() FINISHED"
            com.getjar.sdk.logging.Logger.v(r1, r3)
            throw r0
        L_0x0035:
            java.lang.Object r10 = r11._databaseAccessLock     // Catch:{ all -> 0x0021 }
            monitor-enter(r10)     // Catch:{ all -> 0x0021 }
            android.database.sqlite.SQLiteDatabase r0 = r11.getReadableDatabase()     // Catch:{ all -> 0x0090 }
            java.lang.String r1 = "account"
            r2 = 0
            java.lang.String r3 = "userAccessId = ?"
            r4 = 1
            java.lang.String[] r4 = new java.lang.String[r4]     // Catch:{ all -> 0x0090 }
            r5 = 0
            r4[r5] = r12     // Catch:{ all -> 0x0090 }
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r8 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch:{ all -> 0x0090 }
            boolean r0 = r8.moveToNext()     // Catch:{ all -> 0x008a }
            if (r0 == 0) goto L_0x0071
            com.getjar.sdk.comm.auth.AccountHistoryInfo r0 = new com.getjar.sdk.comm.auth.AccountHistoryInfo     // Catch:{ all -> 0x008a }
            r0.<init>(r8)     // Catch:{ all -> 0x008a }
            r8.close()     // Catch:{ Exception -> 0x0093 }
            r8 = 0
        L_0x005d:
            monitor-exit(r10)     // Catch:{ all -> 0x0090 }
            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.STORAGE
            long r1 = r1.value()
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.AUTH
            long r3 = r3.value()
            long r1 = r1 | r3
            java.lang.String r3 = "AccountHistoryDatabase.getAccount() FINISHED"
            com.getjar.sdk.logging.Logger.v(r1, r3)
        L_0x0070:
            return r0
        L_0x0071:
            r8.close()     // Catch:{ Exception -> 0x0095 }
            r8 = 0
        L_0x0075:
            monitor-exit(r10)     // Catch:{ all -> 0x0090 }
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.STORAGE
            long r0 = r0.value()
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.AUTH
            long r2 = r2.value()
            long r0 = r0 | r2
            java.lang.String r2 = "AccountHistoryDatabase.getAccount() FINISHED"
            com.getjar.sdk.logging.Logger.v(r0, r2)
            r0 = r9
            goto L_0x0070
        L_0x008a:
            r0 = move-exception
            r8.close()     // Catch:{ Exception -> 0x0097 }
            r8 = 0
        L_0x008f:
            throw r0     // Catch:{ all -> 0x0090 }
        L_0x0090:
            r0 = move-exception
            monitor-exit(r10)     // Catch:{ all -> 0x0090 }
            throw r0     // Catch:{ all -> 0x0021 }
        L_0x0093:
            r1 = move-exception
            goto L_0x005d
        L_0x0095:
            r0 = move-exception
            goto L_0x0075
        L_0x0097:
            r1 = move-exception
            goto L_0x008f
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.comm.auth.AccountHistoryDatabase.getAccount(java.lang.String):com.getjar.sdk.comm.auth.AccountHistoryInfo");
    }

    private void updateAccountLastAuth(String userAccessId, long timestampLastAuth) {
        String str;
        Logger.v(Area.STORAGE.value() | Area.AUTH.value(), "AccountHistoryDatabase.updateAccountLastAuth() START");
        try {
            if (StringUtility.isNullOrEmpty(userAccessId)) {
                throw new IllegalArgumentException("'userAccessId' cannot be NULL or empty");
            }
            ContentValues values = new ContentValues();
            values.put("timestampLastAuth", Long.valueOf(timestampLastAuth));
            if (getWritableDatabase().update(DATABASE_TABLE_ACCOUNT_INFO, values, "userAccessId = ?", new String[]{userAccessId}) > 0) {
                Logger.v(Area.STORAGE.value() | Area.AUTH.value(), String.format(Locale.US, "AccountHistoryDatabase.updateAccountLastAuth() updated [userAccessId:%1$s timestampLastAuth:%2$d]", new Object[]{userAccessId, Long.valueOf(timestampLastAuth)}));
            } else {
                Logger.e(Area.STORAGE.value() | Area.AUTH.value(), String.format(Locale.US, "AccountHistoryDatabase.updateAccountLastAuth() failed to update [userAccessId:%1$s timestampLastAuth:%2$d]", new Object[]{userAccessId, Long.valueOf(timestampLastAuth)}));
            }
        } finally {
            str = "AccountHistoryDatabase.updateAccountLastAuth() FINISHED";
            Logger.v(Area.STORAGE.value() | Area.AUTH.value(), str);
        }
    }

    private boolean checkForAccountEntry(String userAccessId) {
        boolean z = true;
        if (StringUtility.isNullOrEmpty(userAccessId)) {
            throw new IllegalArgumentException("'userAccessId' cannot be NULL or empty");
        }
        SQLiteStatement dbStatement = getReadableDatabase().compileStatement(String.format(Locale.US, "SELECT count(*) FROM %1$s WHERE userAccessId = ?", new Object[]{DATABASE_TABLE_ACCOUNT_INFO}));
        try {
            dbStatement.bindString(1, userAccessId);
            if (dbStatement.simpleQueryForLong() <= 0) {
                z = false;
            }
            try {
            } catch (Exception e) {
                Logger.e(Area.STORAGE.value(), "SQLiteStatement.close() failed", e);
            }
            return z;
        } finally {
            try {
                dbStatement.close();
            } catch (Exception e2) {
                Logger.e(Area.STORAGE.value(), "SQLiteStatement.close() failed", e2);
            }
        }
    }

    private long getRecordCount(String tableName) {
        SQLiteStatement dbStatement = getReadableDatabase().compileStatement(String.format(Locale.US, "SELECT count(*) FROM %1$s", new Object[]{tableName}));
        try {
            long simpleQueryForLong = dbStatement.simpleQueryForLong();
            try {
            } catch (Exception e) {
                Logger.e(Area.STORAGE.value(), "SQLiteStatement.close() failed", e);
            }
            return simpleQueryForLong;
        } finally {
            try {
                dbStatement.close();
            } catch (Exception e2) {
                Logger.e(Area.STORAGE.value(), "SQLiteStatement.close() failed", e2);
            }
        }
    }

    private void trimLruEntriesAccountInfo() {
        trimLruEntries(DATABASE_TABLE_ACCOUNT_INFO, "timestampLastAuth DESC", 50);
    }

    private void trimLruEntriesAccountEvent() {
        trimLruEntries(DATABASE_TABLE_ACCOUNT_EVENT, "timestamp DESC", 100);
    }

    private void trimLruEntries(String tableName, String orderBy, int lruCap) {
        if (getRecordCount(tableName) >= ((long) lruCap)) {
            Long id = null;
            Cursor results = getWritableDatabase().query(tableName, new String[]{Constants.APP_ID}, (String) null, (String[]) null, (String) null, (String) null, orderBy);
            try {
                if (results.moveToPosition(lruCap)) {
                    id = Long.valueOf(results.getLong(0));
                }
                int count = getWritableDatabase().delete(tableName, String.format(Locale.US, "id <= %1$d", new Object[]{id}), (String[]) null);
                Logger.v(Area.STORAGE.value(), String.format(Locale.US, "%1$d LRU rows deleted form '%2$s'", new Object[]{Integer.valueOf(count), tableName}));
            } finally {
                try {
                    results.close();
                } catch (Exception e) {
                }
            }
        }
    }
}
