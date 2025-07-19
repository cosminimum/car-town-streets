package com.getjar.sdk.data.install_state;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteStatement;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.data.SyncableDatabase;
import com.getjar.sdk.data.install_state.InstallStateManager;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.StringUtility;
import java.util.Locale;

class InstallStateDatabase extends SyncableDatabase<InstallStateRecord> {
    private static final String DATABASE_NAME_PREFIX = "GetJarDBInstallState";
    private static final String DATABASE_TABLE = "installState";
    private static final int DATABASE_VERSION = 1;
    private static int LRU_CAP = 1000;
    private static volatile InstallStateDatabase _Instance = null;

    protected static synchronized InstallStateDatabase getInstance() {
        InstallStateDatabase installStateDatabase;
        synchronized (InstallStateDatabase.class) {
            if (_Instance == null) {
                throw new IllegalStateException("initialize() must be called first");
            }
            installStateDatabase = _Instance;
        }
        return installStateDatabase;
    }

    protected static synchronized void initialize(Context context) {
        synchronized (InstallStateDatabase.class) {
            if (context == null) {
                throw new IllegalArgumentException("'context' can not be NULL");
            } else if (_Instance == null) {
                Logger.m644i(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "InstallStateDatabase: waitForUserAccess() START [%1$s]", new Object[]{Logger.getShortStack()}));
                AuthManager.initialize(context);
                AuthManager.getInstance().waitOnAuth();
                Logger.m644i(Area.USAGE.value() | Area.STORAGE.value(), "InstallStateDatabase: waitForUserAccess() DONE");
                if (StringUtility.isNullOrEmpty(AuthManager.getInstance().getUserAccessId())) {
                    throw new IllegalStateException("Must have a user access ID");
                }
                _Instance = new InstallStateDatabase(context, String.format(Locale.US, "%1$s%2$d", new Object[]{DATABASE_NAME_PREFIX, Integer.valueOf(AuthManager.getInstance().getUserAccessId().hashCode())}));
            } else {
                throw new IllegalStateException("InstallStateDatabase has already been initialized");
            }
        }
    }

    private InstallStateDatabase(Context context, String name) {
        super(context, name, (SQLiteDatabase.CursorFactory) null, 1);
        Logger.m644i(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "InstallStateDatabase: Opened user specific database '%1$s%2$d'", new Object[]{DATABASE_NAME_PREFIX, Integer.valueOf(AuthManager.getInstance().getUserAccessId().hashCode())}));
    }

    /* access modifiers changed from: protected */
    public String getTableCreateSQL() {
        return "CREATE TABLE IF NOT EXISTS installState (id INTEGER PRIMARY KEY AUTOINCREMENT, packageName TEXT NOT NULL UNIQUE, timestamp INTEGER NOT NULL, status TEXT NOT NULL, synced INTEGER NOT NULL DEFAULT 0);";
    }

    /* access modifiers changed from: protected */
    public String getTableName() {
        return DATABASE_TABLE;
    }

    /* access modifiers changed from: protected */
    public int getLRUCap() {
        return LRU_CAP;
    }

    /* access modifiers changed from: protected */
    public InstallStateRecord loadFromDB(Cursor results) {
        return InstallStateRecord.loadFromDB(results);
    }

    public void addRecord(String packageName) {
        synchronized (this._databaseAccessLock) {
            if (StringUtility.isNullOrEmpty(packageName)) {
                throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
            } else if (checkForRecord(packageName)) {
                Logger.m646v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "InstallStateDatabase: Preexisting record found for '%1$s'", new Object[]{packageName}));
            } else {
                ContentValues values = new ContentValues();
                values.put("packageName", packageName);
                values.put("timestamp", Long.valueOf(System.currentTimeMillis()));
                values.put("status", InstallStateManager.InstallState.FOUND_INSTALLED.name());
                values.put("synced", 0);
                getWritableDatabase().insert(DATABASE_TABLE, (String) null, values);
                Logger.m646v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "InstallStateDatabase: Added a FOUND_INSTALLED record for '%1$s'", new Object[]{packageName}));
                trimLruEntries();
            }
        }
    }

    public void updateState(long id, InstallStateManager.InstallState installState) {
        if (installState == null) {
            throw new IllegalArgumentException("'installState' cannot be NULL");
        }
        synchronized (this._databaseAccessLock) {
            if (checkForRecord(id)) {
                ContentValues values = new ContentValues();
                values.put("status", installState.name());
                values.put("synced", 0);
                getWritableDatabase().update(DATABASE_TABLE, values, String.format(Locale.US, "id = %1$d", new Object[]{Long.valueOf(id)}), (String[]) null);
            } else {
                Logger.m648w(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "InstallStateDatabase: updateState() failed to find record %1$d", new Object[]{Long.valueOf(id)}));
            }
        }
    }

    private boolean checkForRecord(String packageName) {
        boolean z = true;
        SQLiteStatement dbStatement = null;
        try {
            dbStatement = getReadableDatabase().compileStatement(String.format(Locale.US, "SELECT count(*) FROM %1$s WHERE packageName = ?", new Object[]{DATABASE_TABLE}));
            dbStatement.bindString(1, packageName);
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

    public void purgeSyncedRecords() {
        throw new UnsupportedOperationException("In this database we do not purge synced records as the set of records is used over time to send delta updates");
    }
}
