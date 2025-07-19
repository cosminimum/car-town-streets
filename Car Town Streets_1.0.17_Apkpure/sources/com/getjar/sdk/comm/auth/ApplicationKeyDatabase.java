package com.getjar.sdk.comm.auth;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteStatement;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.StringUtility;
import java.util.Locale;
/* loaded from: classes.dex */
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

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onCreate(SQLiteDatabase db) {
        synchronized (this._databaseAccessLock) {
            db.execSQL(DATABASE_CREATE);
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        synchronized (this._databaseAccessLock) {
            Logger.d(Area.STORAGE.value(), String.format(Locale.US, "Upgrading database '%1$s' from version %2$d to %3$d, which will destroy all old data", DATABASE_NAME, Integer.valueOf(oldVersion), Integer.valueOf(newVersion)));
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
                getWritableDatabase().update(DATABASE_TABLE, values, null, null);
            } else {
                getWritableDatabase().insert(DATABASE_TABLE, null, values);
            }
            Logger.v(Area.STORAGE.value(), "ApplicationKeyDatabase: setApplicationKey()");
        }
    }

    public String getApplicationKey() {
        String applicationKey;
        synchronized (this._databaseAccessLock) {
            applicationKey = null;
            Cursor results = getReadableDatabase().query(DATABASE_TABLE, null, null, null, null, null, null);
            if (results.moveToNext()) {
                applicationKey = results.getString(0);
            }
            try {
                results.close();
            } catch (Exception e) {
                Logger.e(Area.STORAGE.value(), "ApplicationKeyDatabase: getApplicationKey() failed", e);
            }
            Logger.v(Area.STORAGE.value(), "ApplicationKeyDatabase: getApplicationKey()");
        }
        return applicationKey;
    }

    private long getRecordCount() {
        SQLiteStatement dbStatement = getReadableDatabase().compileStatement(String.format(Locale.US, "SELECT count(*) FROM %1$s", DATABASE_TABLE));
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
}
