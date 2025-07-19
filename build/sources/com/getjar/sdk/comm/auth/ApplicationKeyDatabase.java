package com.getjar.sdk.comm.auth;

import android.content.ContentValues;
import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteStatement;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.StringUtility;
import java.util.Locale;

public class ApplicationKeyDatabase extends SQLiteOpenHelper {
    private static final String DATABASE_CREATE = "CREATE TABLE IF NOT EXISTS applicationKey (applicationKey TEXT NOT NULL UNIQUE);";
    private static final String DATABASE_NAME = "GetJarDBApplicationKey";
    private static final String DATABASE_TABLE = "applicationKey";
    private static final int DATABASE_VERSION = 1;
    private static volatile ApplicationKeyDatabase _Instance = null;
    private volatile Object _databaseAccessLock = new Object();

    private ApplicationKeyDatabase(Context context) {
        super(context, DATABASE_NAME, (SQLiteDatabase.CursorFactory) null, 1);
    }

    public static synchronized ApplicationKeyDatabase getInstance(Context context) {
        ApplicationKeyDatabase applicationKeyDatabase;
        synchronized (ApplicationKeyDatabase.class) {
            if (_Instance == null) {
                _Instance = new ApplicationKeyDatabase(context);
            }
            applicationKeyDatabase = _Instance;
        }
        return applicationKeyDatabase;
    }

    public void onCreate(SQLiteDatabase db) {
        synchronized (this._databaseAccessLock) {
            db.execSQL(DATABASE_CREATE);
        }
    }

    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        synchronized (this._databaseAccessLock) {
            Logger.m640d(Area.STORAGE.value(), String.format(Locale.US, "Upgrading database '%1$s' from version %2$d to %3$d, which will destroy all old data", new Object[]{DATABASE_NAME, Integer.valueOf(oldVersion), Integer.valueOf(newVersion)}));
            db.execSQL("DROP TABLE IF EXISTS applicationKey");
            onCreate(db);
        }
    }

    public void setApplicationKey(String applicationKey) {
        if (StringUtility.isNullOrEmpty(applicationKey)) {
            throw new IllegalArgumentException("'applicationKey' cannot be NULL or empty");
        }
        synchronized (this._databaseAccessLock) {
            ContentValues values = new ContentValues();
            values.put(DATABASE_TABLE, applicationKey);
            if (getRecordCount() > 0) {
                getWritableDatabase().update(DATABASE_TABLE, values, (String) null, (String[]) null);
            } else {
                getWritableDatabase().insert(DATABASE_TABLE, (String) null, values);
            }
            Logger.m646v(Area.STORAGE.value(), "ApplicationKeyDatabase: setApplicationKey()");
        }
    }

    /* JADX WARNING: Unknown top exception splitter block from list: {B:12:0x0023=Splitter:B:12:0x0023, B:25:0x0045=Splitter:B:25:0x0045, B:9:0x001f=Splitter:B:9:0x001f} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public java.lang.String getApplicationKey() {
        /*
            r12 = this;
            java.lang.Object r11 = r12._databaseAccessLock
            monitor-enter(r11)
            r8 = 0
            android.database.sqlite.SQLiteDatabase r0 = r12.getReadableDatabase()     // Catch:{ all -> 0x003d }
            java.lang.String r1 = "applicationKey"
            r2 = 0
            r3 = 0
            r4 = 0
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r10 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch:{ all -> 0x003d }
            boolean r0 = r10.moveToNext()     // Catch:{ all -> 0x0040 }
            if (r0 == 0) goto L_0x001f
            r0 = 0
            java.lang.String r8 = r10.getString(r0)     // Catch:{ all -> 0x0040 }
        L_0x001f:
            r10.close()     // Catch:{ Exception -> 0x0030 }
            r10 = 0
        L_0x0023:
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x003d }
            long r0 = r0.value()     // Catch:{ all -> 0x003d }
            java.lang.String r2 = "ApplicationKeyDatabase: getApplicationKey()"
            com.getjar.sdk.logging.Logger.m646v(r0, r2)     // Catch:{ all -> 0x003d }
            monitor-exit(r11)     // Catch:{ all -> 0x003d }
            return r8
        L_0x0030:
            r9 = move-exception
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x003d }
            long r0 = r0.value()     // Catch:{ all -> 0x003d }
            java.lang.String r2 = "ApplicationKeyDatabase: getApplicationKey() failed"
            com.getjar.sdk.logging.Logger.m643e(r0, r2, r9)     // Catch:{ all -> 0x003d }
            goto L_0x0023
        L_0x003d:
            r0 = move-exception
            monitor-exit(r11)     // Catch:{ all -> 0x003d }
            throw r0
        L_0x0040:
            r0 = move-exception
            r10.close()     // Catch:{ Exception -> 0x0046 }
            r10 = 0
        L_0x0045:
            throw r0     // Catch:{ all -> 0x003d }
        L_0x0046:
            r9 = move-exception
            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x003d }
            long r1 = r1.value()     // Catch:{ all -> 0x003d }
            java.lang.String r3 = "ApplicationKeyDatabase: getApplicationKey() failed"
            com.getjar.sdk.logging.Logger.m643e(r1, r3, r9)     // Catch:{ all -> 0x003d }
            goto L_0x0045
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.comm.auth.ApplicationKeyDatabase.getApplicationKey():java.lang.String");
    }

    private long getRecordCount() {
        SQLiteStatement dbStatement = getReadableDatabase().compileStatement(String.format(Locale.US, "SELECT count(*) FROM %1$s", new Object[]{DATABASE_TABLE}));
        try {
            long simpleQueryForLong = dbStatement.simpleQueryForLong();
            try {
            } catch (Exception e) {
                Logger.m643e(Area.STORAGE.value(), "SQLiteStatement.close() failed", e);
            }
            return simpleQueryForLong;
        } finally {
            try {
                dbStatement.close();
            } catch (Exception e2) {
                Logger.m643e(Area.STORAGE.value(), "SQLiteStatement.close() failed", e2);
            }
        }
    }
}
