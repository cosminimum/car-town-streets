package com.getjar.sdk.data.earning;

import android.content.ContentValues;
import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteStatement;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.StringUtility;
import java.util.Locale;
import java.util.UUID;

public class EarnStateDatabase extends SQLiteOpenHelper {
    private static final String DATABASE_CREATE = "CREATE TABLE IF NOT EXISTS appState (id INTEGER PRIMARY KEY AUTOINCREMENT, clientTransactionId TEXT NOT NULL UNIQUE, packageName TEXT NOT NULL UNIQUE, timestampCreated INTEGER NOT NULL, timestampModified INTEGER NOT NULL, friendlyName TEXT NOT NULL, applicationMetadata TEXT NOT NULL, trackingMetadata TEXT NOT NULL, status TEXT NOT NULL, earnState TEXT, earnSubstate TEXT, earnAmount INTEGER, notificationState TEXT NOT NULL);";
    private static final String DATABASE_NAME_PREFIX = "GetJarDBAppState";
    private static final String DATABASE_TABLE = "appState";
    private static final int DATABASE_VERSION = 3;
    private static volatile EarnStateDatabase _Instance = null;
    private static final String[] _StatusDownloadedOrInstalledColumnValue = {Status.DOWNLOADED.name(), Status.INSTALLED.name()};
    private volatile Object _databaseAccessLock = new Object();

    public enum EarnState {
        SUCCESS,
        FAIL
    }

    public enum NotificationState {
        NONE,
        INSTALL_REMINDER,
        OPEN_REMINDER,
        DONE
    }

    public enum Status {
        DOWNLOADED,
        INSTALLED,
        OPENED
    }

    private EarnStateDatabase(Context context, String name) {
        super(context, name, (SQLiteDatabase.CursorFactory) null, 3);
        Logger.i(Area.EARN.value() | Area.STORAGE.value(), String.format(Locale.US, "EarnStateDatabase: Opened user specific database '%1$s%2$d'", new Object[]{DATABASE_NAME_PREFIX, Integer.valueOf(AuthManager.getInstance().getUserAccessId().hashCode())}));
    }

    public static synchronized EarnStateDatabase getInstance(Context context) {
        EarnStateDatabase earnStateDatabase;
        synchronized (EarnStateDatabase.class) {
            if (context == null) {
                throw new IllegalArgumentException("'context' can not be NULL");
            }
            if (_Instance == null) {
                AuthManager.initialize(context);
                AuthManager.getInstance().waitOnAuth();
                if (StringUtility.isNullOrEmpty(AuthManager.getInstance().getUserAccessId())) {
                    throw new IllegalStateException("Must have a user access ID");
                }
                _Instance = new EarnStateDatabase(context, String.format(Locale.US, "%1$s%2$d", new Object[]{DATABASE_NAME_PREFIX, Integer.valueOf(AuthManager.getInstance().getUserAccessId().hashCode())}));
            }
            earnStateDatabase = _Instance;
        }
        return earnStateDatabase;
    }

    public void onCreate(SQLiteDatabase db) {
        synchronized (this._databaseAccessLock) {
            db.execSQL(DATABASE_CREATE);
        }
    }

    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        synchronized (this._databaseAccessLock) {
            Logger.d(Area.EARN.value() | Area.STORAGE.value(), String.format(Locale.US, "Upgrading database '%1$s' from version %2$d to %3$d, which will destroy all old data", new Object[]{DATABASE_NAME_PREFIX, Integer.valueOf(oldVersion), Integer.valueOf(newVersion)}));
            db.execSQL("DROP TABLE IF EXISTS appState");
            onCreate(db);
        }
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:21:0x0041=Splitter:B:21:0x0041, B:9:0x0023=Splitter:B:9:0x0023} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public long getRecordCount() {
        /*
            r10 = this;
            java.lang.Object r3 = r10._databaseAccessLock
            monitor-enter(r3)
            android.database.sqlite.SQLiteDatabase r2 = r10.getReadableDatabase()     // Catch:{ all -> 0x0039 }
            java.util.Locale r4 = java.util.Locale.US     // Catch:{ all -> 0x0039 }
            java.lang.String r5 = "SELECT count(*) FROM %1$s"
            r6 = 1
            java.lang.Object[] r6 = new java.lang.Object[r6]     // Catch:{ all -> 0x0039 }
            r7 = 0
            java.lang.String r8 = "appState"
            r6[r7] = r8     // Catch:{ all -> 0x0039 }
            java.lang.String r4 = java.lang.String.format(r4, r5, r6)     // Catch:{ all -> 0x0039 }
            android.database.sqlite.SQLiteStatement r0 = r2.compileStatement(r4)     // Catch:{ all -> 0x0039 }
            long r4 = r0.simpleQueryForLong()     // Catch:{ all -> 0x003c }
            r0.close()     // Catch:{ Exception -> 0x0025 }
            r0 = 0
        L_0x0023:
            monitor-exit(r3)     // Catch:{ all -> 0x0039 }
            return r4
        L_0x0025:
            r1 = move-exception
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.EARN     // Catch:{ all -> 0x0039 }
            long r6 = r2.value()     // Catch:{ all -> 0x0039 }
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x0039 }
            long r8 = r2.value()     // Catch:{ all -> 0x0039 }
            long r6 = r6 | r8
            java.lang.String r2 = "SQLiteStatement.close() failed"
            com.getjar.sdk.logging.Logger.e(r6, r2, r1)     // Catch:{ all -> 0x0039 }
            goto L_0x0023
        L_0x0039:
            r2 = move-exception
            monitor-exit(r3)     // Catch:{ all -> 0x0039 }
            throw r2
        L_0x003c:
            r2 = move-exception
            r0.close()     // Catch:{ Exception -> 0x0042 }
            r0 = 0
        L_0x0041:
            throw r2     // Catch:{ all -> 0x0039 }
        L_0x0042:
            r1 = move-exception
            com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.EARN     // Catch:{ all -> 0x0039 }
            long r4 = r4.value()     // Catch:{ all -> 0x0039 }
            com.getjar.sdk.logging.Area r6 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x0039 }
            long r6 = r6.value()     // Catch:{ all -> 0x0039 }
            long r4 = r4 | r6
            java.lang.String r6 = "SQLiteStatement.close() failed"
            com.getjar.sdk.logging.Logger.e(r4, r6, r1)     // Catch:{ all -> 0x0039 }
            goto L_0x0041
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.earning.EarnStateDatabase.getRecordCount():long");
    }

    /* JADX WARNING: Unknown top exception splitter block from list: {B:29:0x0074=Splitter:B:29:0x0074, B:32:0x0078=Splitter:B:32:0x0078, B:20:0x0059=Splitter:B:20:0x0059, B:23:0x005d=Splitter:B:23:0x005d} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public com.getjar.sdk.data.earning.EarnStateRecord getAppState(java.lang.String r14) {
        /*
            r13 = this;
            java.lang.Object r12 = r13._databaseAccessLock
            monitor-enter(r12)
            boolean r0 = com.getjar.sdk.utilities.StringUtility.isNullOrEmpty(r14)     // Catch:{ all -> 0x0011 }
            if (r0 == 0) goto L_0x0014
            java.lang.IllegalArgumentException r0 = new java.lang.IllegalArgumentException     // Catch:{ all -> 0x0011 }
            java.lang.String r1 = "'packageName' cannot be NULL or empty"
            r0.<init>(r1)     // Catch:{ all -> 0x0011 }
            throw r0     // Catch:{ all -> 0x0011 }
        L_0x0011:
            r0 = move-exception
            monitor-exit(r12)     // Catch:{ all -> 0x0011 }
            throw r0
        L_0x0014:
            r8 = 0
            android.database.sqlite.SQLiteDatabase r0 = r13.getReadableDatabase()     // Catch:{ all -> 0x0011 }
            java.lang.String r1 = "appState"
            r2 = 0
            java.lang.String r3 = "packageName = ?"
            r4 = 1
            java.lang.String[] r4 = new java.lang.String[r4]     // Catch:{ all -> 0x0011 }
            r5 = 0
            r4[r5] = r14     // Catch:{ all -> 0x0011 }
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r11 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch:{ all -> 0x0011 }
            boolean r0 = r11.moveToNext()     // Catch:{ all -> 0x0073 }
            if (r0 == 0) goto L_0x0059
            com.getjar.sdk.data.earning.EarnStateRecord r9 = new com.getjar.sdk.data.earning.EarnStateRecord     // Catch:{ all -> 0x0073 }
            r9.<init>(r11)     // Catch:{ all -> 0x0073 }
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.EARN     // Catch:{ all -> 0x008d }
            long r0 = r0.value()     // Catch:{ all -> 0x008d }
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x008d }
            long r2 = r2.value()     // Catch:{ all -> 0x008d }
            long r0 = r0 | r2
            java.util.Locale r2 = java.util.Locale.US     // Catch:{ all -> 0x008d }
            java.lang.String r3 = "Earning: EarnStateDatabase: getAppState() loaded: %1$s"
            r4 = 1
            java.lang.Object[] r4 = new java.lang.Object[r4]     // Catch:{ all -> 0x008d }
            r5 = 0
            java.lang.String r6 = r9.toString()     // Catch:{ all -> 0x008d }
            r4[r5] = r6     // Catch:{ all -> 0x008d }
            java.lang.String r2 = java.lang.String.format(r2, r3, r4)     // Catch:{ all -> 0x008d }
            com.getjar.sdk.logging.Logger.v(r0, r2)     // Catch:{ all -> 0x008d }
            r8 = r9
        L_0x0059:
            r11.close()     // Catch:{ Exception -> 0x005f }
            r11 = 0
        L_0x005d:
            monitor-exit(r12)     // Catch:{ all -> 0x0011 }
            return r8
        L_0x005f:
            r10 = move-exception
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.EARN     // Catch:{ all -> 0x0011 }
            long r0 = r0.value()     // Catch:{ all -> 0x0011 }
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x0011 }
            long r2 = r2.value()     // Catch:{ all -> 0x0011 }
            long r0 = r0 | r2
            java.lang.String r2 = "Earning: EarnStateDatabase: getStatus() failed"
            com.getjar.sdk.logging.Logger.e(r0, r2, r10)     // Catch:{ all -> 0x0011 }
            goto L_0x005d
        L_0x0073:
            r0 = move-exception
        L_0x0074:
            r11.close()     // Catch:{ Exception -> 0x0079 }
            r11 = 0
        L_0x0078:
            throw r0     // Catch:{ all -> 0x0011 }
        L_0x0079:
            r10 = move-exception
            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.EARN     // Catch:{ all -> 0x0011 }
            long r1 = r1.value()     // Catch:{ all -> 0x0011 }
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x0011 }
            long r3 = r3.value()     // Catch:{ all -> 0x0011 }
            long r1 = r1 | r3
            java.lang.String r3 = "Earning: EarnStateDatabase: getStatus() failed"
            com.getjar.sdk.logging.Logger.e(r1, r3, r10)     // Catch:{ all -> 0x0011 }
            goto L_0x0078
        L_0x008d:
            r0 = move-exception
            r8 = r9
            goto L_0x0074
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.earning.EarnStateDatabase.getAppState(java.lang.String):com.getjar.sdk.data.earning.EarnStateRecord");
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:20:0x0036=Splitter:B:20:0x0036, B:12:0x002e=Splitter:B:12:0x002e} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public java.util.List<com.getjar.sdk.data.earning.EarnStateRecord> getAllDownloadedOrInstalledAppStates() {
        /*
            r12 = this;
            java.lang.Object r11 = r12._databaseAccessLock
            monitor-enter(r11)
            java.util.ArrayList r8 = new java.util.ArrayList     // Catch:{ all -> 0x002f }
            r8.<init>()     // Catch:{ all -> 0x002f }
            android.database.sqlite.SQLiteDatabase r0 = r12.getReadableDatabase()     // Catch:{ all -> 0x002f }
            java.lang.String r1 = "appState"
            r2 = 0
            java.lang.String r3 = "status = ? OR status = ?"
            java.lang.String[] r4 = _StatusDownloadedOrInstalledColumnValue     // Catch:{ all -> 0x002f }
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r10 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch:{ all -> 0x002f }
        L_0x001a:
            boolean r0 = r10.moveToNext()     // Catch:{ all -> 0x0029 }
            if (r0 == 0) goto L_0x0032
            com.getjar.sdk.data.earning.EarnStateRecord r0 = new com.getjar.sdk.data.earning.EarnStateRecord     // Catch:{ all -> 0x0029 }
            r0.<init>(r10)     // Catch:{ all -> 0x0029 }
            r8.add(r0)     // Catch:{ all -> 0x0029 }
            goto L_0x001a
        L_0x0029:
            r0 = move-exception
            r10.close()     // Catch:{ Exception -> 0x0078 }
            r10 = 0
        L_0x002e:
            throw r0     // Catch:{ all -> 0x002f }
        L_0x002f:
            r0 = move-exception
            monitor-exit(r11)     // Catch:{ all -> 0x002f }
            throw r0
        L_0x0032:
            r10.close()     // Catch:{ Exception -> 0x0064 }
            r10 = 0
        L_0x0036:
            int r0 = r8.size()     // Catch:{ all -> 0x002f }
            if (r0 <= 0) goto L_0x0062
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.EARN     // Catch:{ all -> 0x002f }
            long r0 = r0.value()     // Catch:{ all -> 0x002f }
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x002f }
            long r2 = r2.value()     // Catch:{ all -> 0x002f }
            long r0 = r0 | r2
            java.util.Locale r2 = java.util.Locale.US     // Catch:{ all -> 0x002f }
            java.lang.String r3 = "Earning: EarnStateDatabase: getAllAppStates() loaded %1$d records"
            r4 = 1
            java.lang.Object[] r4 = new java.lang.Object[r4]     // Catch:{ all -> 0x002f }
            r5 = 0
            int r6 = r8.size()     // Catch:{ all -> 0x002f }
            java.lang.Integer r6 = java.lang.Integer.valueOf(r6)     // Catch:{ all -> 0x002f }
            r4[r5] = r6     // Catch:{ all -> 0x002f }
            java.lang.String r2 = java.lang.String.format(r2, r3, r4)     // Catch:{ all -> 0x002f }
            com.getjar.sdk.logging.Logger.v(r0, r2)     // Catch:{ all -> 0x002f }
        L_0x0062:
            monitor-exit(r11)     // Catch:{ all -> 0x002f }
            return r8
        L_0x0064:
            r9 = move-exception
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.EARN     // Catch:{ all -> 0x002f }
            long r0 = r0.value()     // Catch:{ all -> 0x002f }
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x002f }
            long r2 = r2.value()     // Catch:{ all -> 0x002f }
            long r0 = r0 | r2
            java.lang.String r2 = "Earning: EarnStateDatabase: getAllAppStates() failed"
            com.getjar.sdk.logging.Logger.e(r0, r2, r9)     // Catch:{ all -> 0x002f }
            goto L_0x0036
        L_0x0078:
            r9 = move-exception
            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.EARN     // Catch:{ all -> 0x002f }
            long r1 = r1.value()     // Catch:{ all -> 0x002f }
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x002f }
            long r3 = r3.value()     // Catch:{ all -> 0x002f }
            long r1 = r1 | r3
            java.lang.String r3 = "Earning: EarnStateDatabase: getAllAppStates() failed"
            com.getjar.sdk.logging.Logger.e(r1, r3, r9)     // Catch:{ all -> 0x002f }
            goto L_0x002e
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.earning.EarnStateDatabase.getAllDownloadedOrInstalledAppStates():java.util.List");
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:20:0x0034=Splitter:B:20:0x0034, B:12:0x002c=Splitter:B:12:0x002c} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public java.util.List<com.getjar.sdk.data.earning.EarnStateRecord> getAllAppStates() {
        /*
            r12 = this;
            java.lang.Object r11 = r12._databaseAccessLock
            monitor-enter(r11)
            java.util.ArrayList r8 = new java.util.ArrayList     // Catch:{ all -> 0x002d }
            r8.<init>()     // Catch:{ all -> 0x002d }
            android.database.sqlite.SQLiteDatabase r0 = r12.getReadableDatabase()     // Catch:{ all -> 0x002d }
            java.lang.String r1 = "appState"
            r2 = 0
            r3 = 0
            r4 = 0
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r10 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch:{ all -> 0x002d }
        L_0x0018:
            boolean r0 = r10.moveToNext()     // Catch:{ all -> 0x0027 }
            if (r0 == 0) goto L_0x0030
            com.getjar.sdk.data.earning.EarnStateRecord r0 = new com.getjar.sdk.data.earning.EarnStateRecord     // Catch:{ all -> 0x0027 }
            r0.<init>(r10)     // Catch:{ all -> 0x0027 }
            r8.add(r0)     // Catch:{ all -> 0x0027 }
            goto L_0x0018
        L_0x0027:
            r0 = move-exception
            r10.close()     // Catch:{ Exception -> 0x0076 }
            r10 = 0
        L_0x002c:
            throw r0     // Catch:{ all -> 0x002d }
        L_0x002d:
            r0 = move-exception
            monitor-exit(r11)     // Catch:{ all -> 0x002d }
            throw r0
        L_0x0030:
            r10.close()     // Catch:{ Exception -> 0x0062 }
            r10 = 0
        L_0x0034:
            int r0 = r8.size()     // Catch:{ all -> 0x002d }
            if (r0 <= 0) goto L_0x0060
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.EARN     // Catch:{ all -> 0x002d }
            long r0 = r0.value()     // Catch:{ all -> 0x002d }
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x002d }
            long r2 = r2.value()     // Catch:{ all -> 0x002d }
            long r0 = r0 | r2
            java.util.Locale r2 = java.util.Locale.US     // Catch:{ all -> 0x002d }
            java.lang.String r3 = "Earning: EarnStateDatabase: getAllAppStates() loaded %1$d records"
            r4 = 1
            java.lang.Object[] r4 = new java.lang.Object[r4]     // Catch:{ all -> 0x002d }
            r5 = 0
            int r6 = r8.size()     // Catch:{ all -> 0x002d }
            java.lang.Integer r6 = java.lang.Integer.valueOf(r6)     // Catch:{ all -> 0x002d }
            r4[r5] = r6     // Catch:{ all -> 0x002d }
            java.lang.String r2 = java.lang.String.format(r2, r3, r4)     // Catch:{ all -> 0x002d }
            com.getjar.sdk.logging.Logger.v(r0, r2)     // Catch:{ all -> 0x002d }
        L_0x0060:
            monitor-exit(r11)     // Catch:{ all -> 0x002d }
            return r8
        L_0x0062:
            r9 = move-exception
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.EARN     // Catch:{ all -> 0x002d }
            long r0 = r0.value()     // Catch:{ all -> 0x002d }
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x002d }
            long r2 = r2.value()     // Catch:{ all -> 0x002d }
            long r0 = r0 | r2
            java.lang.String r2 = "Earning: EarnStateDatabase: getAllAppStates() failed"
            com.getjar.sdk.logging.Logger.e(r0, r2, r9)     // Catch:{ all -> 0x002d }
            goto L_0x0034
        L_0x0076:
            r9 = move-exception
            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.EARN     // Catch:{ all -> 0x002d }
            long r1 = r1.value()     // Catch:{ all -> 0x002d }
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x002d }
            long r3 = r3.value()     // Catch:{ all -> 0x002d }
            long r1 = r1 | r3
            java.lang.String r3 = "Earning: EarnStateDatabase: getAllAppStates() failed"
            com.getjar.sdk.logging.Logger.e(r1, r3, r9)     // Catch:{ all -> 0x002d }
            goto L_0x002c
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.earning.EarnStateDatabase.getAllAppStates():java.util.List");
    }

    /* access modifiers changed from: protected */
    public void deleteAppState(String packageName) {
        synchronized (this._databaseAccessLock) {
            getWritableDatabase().delete(DATABASE_TABLE, "packageName = ?", new String[]{packageName});
            Logger.v(Area.EARN.value() | Area.STORAGE.value(), String.format(Locale.US, "Earning: EarnStateDatabase: deleteAppState() deleted '%1$s'", new Object[]{packageName}));
        }
    }

    public void deleteOldRecords(long olderThanMilliseconds) {
        synchronized (this._databaseAccessLock) {
            int deleteCount = getWritableDatabase().delete(DATABASE_TABLE, String.format(Locale.US, "timestampCreated < %1$d", new Object[]{Long.valueOf(System.currentTimeMillis() - olderThanMilliseconds)}), (String[]) null);
            Logger.v(Area.EARN.value() | Area.STORAGE.value(), String.format(Locale.US, "Earning: EarnStateDatabase: deleteOldRecords() deleted %1$d records", new Object[]{Integer.valueOf(deleteCount)}));
        }
    }

    private boolean checkForAppState(String packageName) {
        boolean z = true;
        if (StringUtility.isNullOrEmpty(packageName)) {
            throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
        }
        SQLiteStatement dbStatement = getReadableDatabase().compileStatement(String.format(Locale.US, "SELECT count(*) FROM %1$s WHERE packageName = ?", new Object[]{DATABASE_TABLE}));
        try {
            dbStatement.bindString(1, packageName);
            if (dbStatement.simpleQueryForLong() <= 0) {
                z = false;
            }
            try {
            } catch (Exception e) {
                Logger.e(Area.EARN.value() | Area.STORAGE.value(), "SQLiteStatement.close() failed", e);
            }
            return z;
        } finally {
            try {
                dbStatement.close();
            } catch (Exception e2) {
                Logger.e(Area.EARN.value() | Area.STORAGE.value(), "SQLiteStatement.close() failed", e2);
            }
        }
    }

    public void addAppState(String packageName, String friendlyName, String applicationMetadata, String trackingMetadata) {
        synchronized (this._databaseAccessLock) {
            if (StringUtility.isNullOrEmpty(packageName)) {
                throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
            } else if (StringUtility.isNullOrEmpty(friendlyName)) {
                throw new IllegalArgumentException("'friendlyName' cannot be NULL or empty");
            } else if (StringUtility.isNullOrEmpty(applicationMetadata)) {
                throw new IllegalArgumentException("'applicationMetadata' cannot be NULL or empty");
            } else if (StringUtility.isNullOrEmpty(trackingMetadata)) {
                throw new IllegalArgumentException("'trackingMetadata' cannot be NULL or empty");
            } else if (checkForAppState(packageName)) {
                Logger.v(Area.EARN.value() | Area.STORAGE.value(), String.format(Locale.US, "Earning: EarnStateDatabase: Preexisting record found for '%1$s'", new Object[]{packageName}));
            } else {
                long now = System.currentTimeMillis();
                ContentValues values = new ContentValues();
                values.put("clientTransactionId", UUID.randomUUID().toString());
                values.put("packageName", packageName);
                values.put("timestampCreated", Long.valueOf(now));
                values.put("timestampModified", Long.valueOf(now));
                values.put("friendlyName", friendlyName);
                values.put("applicationMetadata", applicationMetadata);
                values.put("trackingMetadata", trackingMetadata);
                values.put("status", Status.DOWNLOADED.name());
                values.put("notificationState", NotificationState.NONE.name());
                getWritableDatabase().insert(DATABASE_TABLE, (String) null, values);
                Logger.v(Area.EARN.value() | Area.STORAGE.value(), String.format(Locale.US, "Earning: EarnStateDatabase: Added a DOWNLOADED record for '%1$s'", new Object[]{packageName}));
            }
        }
    }

    /* access modifiers changed from: protected */
    public void updateNotificationState(String packageName, NotificationState notificationState) {
        synchronized (this._databaseAccessLock) {
            if (StringUtility.isNullOrEmpty(packageName)) {
                throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
            }
            long now = System.currentTimeMillis();
            ContentValues values = new ContentValues();
            values.put("timestampModified", Long.valueOf(now));
            values.put("notificationState", notificationState.name());
            getWritableDatabase().update(DATABASE_TABLE, values, "packageName = ?", new String[]{packageName});
            Logger.v(Area.EARN.value() | Area.STORAGE.value(), String.format(Locale.US, "Earning: EarnStateDatabase: setNotificationShown() Updated record for '%1$s'", new Object[]{packageName}));
        }
    }

    public void updateApplicationMetadata(String packageName, String applicationMetadata) {
        synchronized (this._databaseAccessLock) {
            if (StringUtility.isNullOrEmpty(packageName)) {
                throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
            } else if (StringUtility.isNullOrEmpty(applicationMetadata)) {
                throw new IllegalArgumentException("'applicationMetadata' cannot be NULL or empty");
            } else {
                long now = System.currentTimeMillis();
                ContentValues values = new ContentValues();
                values.put("timestampModified", Long.valueOf(now));
                values.put("applicationMetadata", applicationMetadata);
                getWritableDatabase().update(DATABASE_TABLE, values, "packageName = ?", new String[]{packageName});
                Logger.v(Area.EARN.value() | Area.STORAGE.value(), String.format(Locale.US, "Earning: EarnStateDatabase: updateApplicationMetadata() Updated record for '%1$s' with applicationMetadata:%2$s", new Object[]{packageName, applicationMetadata}));
            }
        }
    }

    public void updateStatus(String packageName, Status status) {
        synchronized (this._databaseAccessLock) {
            if (StringUtility.isNullOrEmpty(packageName)) {
                throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
            } else if (status == null) {
                throw new IllegalArgumentException("'status' cannot be NULL");
            } else {
                long now = System.currentTimeMillis();
                ContentValues values = new ContentValues();
                values.put("timestampModified", Long.valueOf(now));
                values.put("status", status.name());
                getWritableDatabase().update(DATABASE_TABLE, values, "packageName = ?", new String[]{packageName});
                Logger.v(Area.EARN.value() | Area.STORAGE.value(), String.format(Locale.US, "Earning: EarnStateDatabase: updateStatus() Updated record for '%1$s' with status:%2$s", new Object[]{packageName, status.name()}));
            }
        }
    }

    public void updateEarnAmount(String packageName, long amount) {
        synchronized (this._databaseAccessLock) {
            if (StringUtility.isNullOrEmpty(packageName)) {
                throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
            } else if (amount < 0) {
                throw new IllegalArgumentException("'amount' cannot be less than zero");
            } else {
                long now = System.currentTimeMillis();
                ContentValues values = new ContentValues();
                values.put("timestampModified", Long.valueOf(now));
                values.put("earnAmount", Long.valueOf(amount));
                getWritableDatabase().update(DATABASE_TABLE, values, "packageName = ?", new String[]{packageName});
                Logger.v(Area.EARN.value() | Area.STORAGE.value(), String.format(Locale.US, "Earning: EarnStateDatabase: updateEarnAmount() Updated record for '%1$s' with amount:%2$d", new Object[]{packageName, Long.valueOf(amount)}));
            }
        }
    }

    public void updateEarnState(String packageName, EarnState earnState, String earnSubstate) {
        synchronized (this._databaseAccessLock) {
            if (StringUtility.isNullOrEmpty(packageName)) {
                throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
            } else if (earnState == null) {
                throw new IllegalArgumentException("'earnState' cannot be NULL");
            } else if (StringUtility.isNullOrEmpty(earnSubstate)) {
                throw new IllegalArgumentException("'earnSubstate' cannot be NULL or empty");
            } else {
                long now = System.currentTimeMillis();
                ContentValues values = new ContentValues();
                values.put("timestampModified", Long.valueOf(now));
                values.put("earnState", earnState.name());
                values.put("earnSubstate", earnSubstate);
                getWritableDatabase().update(DATABASE_TABLE, values, "packageName = ?", new String[]{packageName});
                Logger.v(Area.EARN.value() | Area.STORAGE.value(), String.format(Locale.US, "Earning: EarnStateDatabase: updateEarnState() Updated record for '%1$s' with earnState:%2$s and earnSubstate:%3$s", new Object[]{packageName, earnState.name(), earnSubstate}));
            }
        }
    }
}
