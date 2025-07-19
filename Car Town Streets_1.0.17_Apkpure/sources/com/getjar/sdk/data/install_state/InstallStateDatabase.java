package com.getjar.sdk.data.install_state;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteStatement;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.data.SyncableDatabase;
import com.getjar.sdk.data.install_state.InstallStateManager;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.StringUtility;
import java.util.Locale;
/* loaded from: classes.dex */
class InstallStateDatabase extends SyncableDatabase<InstallStateRecord> {
    private static final String DATABASE_NAME_PREFIX = "GetJarDBInstallState";
    private static final String DATABASE_TABLE = "installState";
    private static final int DATABASE_VERSION = 1;
    private static volatile InstallStateDatabase _Instance = null;
    private static int LRU_CAP = 1000;

    /* JADX INFO: Access modifiers changed from: protected */
    public static synchronized InstallStateDatabase getInstance() {
        InstallStateDatabase installStateDatabase;
        synchronized (InstallStateDatabase.class) {
            if (_Instance == null) {
                throw new IllegalStateException("initialize() must be called first");
            }
            installStateDatabase = _Instance;
        }
        return installStateDatabase;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static synchronized void initialize(Context context) {
        synchronized (InstallStateDatabase.class) {
            if (context == null) {
                throw new IllegalArgumentException("'context' can not be NULL");
            }
            if (_Instance == null) {
                Logger.i(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "InstallStateDatabase: waitForUserAccess() START [%1$s]", Logger.getShortStack()));
                AuthManager.initialize(context);
                AuthManager.getInstance().waitOnAuth();
                Logger.i(Area.USAGE.value() | Area.STORAGE.value(), "InstallStateDatabase: waitForUserAccess() DONE");
                if (StringUtility.isNullOrEmpty(AuthManager.getInstance().getUserAccessId())) {
                    throw new IllegalStateException("Must have a user access ID");
                }
                _Instance = new InstallStateDatabase(context, String.format(Locale.US, "%1$s%2$d", DATABASE_NAME_PREFIX, Integer.valueOf(AuthManager.getInstance().getUserAccessId().hashCode())));
            } else {
                throw new IllegalStateException("InstallStateDatabase has already been initialized");
            }
        }
    }

    private InstallStateDatabase(Context context, String name) {
        super(context, name, null, 1);
        Logger.i(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "InstallStateDatabase: Opened user specific database '%1$s%2$d'", DATABASE_NAME_PREFIX, Integer.valueOf(AuthManager.getInstance().getUserAccessId().hashCode())));
    }

    @Override // com.getjar.sdk.data.SyncableDatabase
    protected String getTableCreateSQL() {
        return "CREATE TABLE IF NOT EXISTS installState (id INTEGER PRIMARY KEY AUTOINCREMENT, packageName TEXT NOT NULL UNIQUE, timestamp INTEGER NOT NULL, status TEXT NOT NULL, synced INTEGER NOT NULL DEFAULT 0);";
    }

    @Override // com.getjar.sdk.data.SyncableDatabase
    protected String getTableName() {
        return DATABASE_TABLE;
    }

    @Override // com.getjar.sdk.data.SyncableDatabase
    protected int getLRUCap() {
        return LRU_CAP;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.getjar.sdk.data.SyncableDatabase
    public InstallStateRecord loadFromDB(Cursor results) {
        return InstallStateRecord.loadFromDB(results);
    }

    public void addRecord(String packageName) {
        synchronized (this._databaseAccessLock) {
            if (StringUtility.isNullOrEmpty(packageName)) {
                throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
            }
            if (checkForRecord(packageName)) {
                Logger.v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "InstallStateDatabase: Preexisting record found for '%1$s'", packageName));
                return;
            }
            ContentValues values = new ContentValues();
            values.put("packageName", packageName);
            values.put("timestamp", Long.valueOf(System.currentTimeMillis()));
            values.put("status", InstallStateManager.InstallState.FOUND_INSTALLED.name());
            values.put("synced", (Integer) 0);
            getWritableDatabase().insert(DATABASE_TABLE, null, values);
            Logger.v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "InstallStateDatabase: Added a FOUND_INSTALLED record for '%1$s'", packageName));
            trimLruEntries();
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
                values.put("synced", (Integer) 0);
                getWritableDatabase().update(DATABASE_TABLE, values, String.format(Locale.US, "id = %1$d", Long.valueOf(id)), null);
            } else {
                Logger.w(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "InstallStateDatabase: updateState() failed to find record %1$d", Long.valueOf(id)));
            }
        }
    }

    private boolean checkForRecord(String packageName) {
        boolean z = true;
        SQLiteStatement dbStatement = null;
        try {
            dbStatement = getReadableDatabase().compileStatement(String.format(Locale.US, "SELECT count(*) FROM %1$s WHERE packageName = ?", DATABASE_TABLE));
            dbStatement.bindString(1, packageName);
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

    @Override // com.getjar.sdk.data.SyncableDatabase
    public void purgeSyncedRecords() {
        throw new UnsupportedOperationException("In this database we do not purge synced records as the set of records is used over time to send delta updates");
    }
}
