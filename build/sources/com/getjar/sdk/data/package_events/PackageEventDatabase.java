package com.getjar.sdk.data.package_events;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.data.SyncableDatabase;
import com.getjar.sdk.data.package_events.PackageEventManager;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.StringUtility;
import java.util.Locale;

class PackageEventDatabase extends SyncableDatabase<PackageEventRecord> {
    private static final String DATABASE_NAME_PREFIX = "GetJarDBPackageEvents";
    private static final String DATABASE_TABLE = "packageEvents";
    private static final int DATABASE_VERSION = 1;
    private static int LRU_CAP = 1000;
    private static volatile PackageEventDatabase _Instance = null;

    protected static synchronized PackageEventDatabase getInstance() {
        PackageEventDatabase packageEventDatabase;
        synchronized (PackageEventDatabase.class) {
            if (_Instance == null) {
                throw new IllegalStateException("initialize() must be called first");
            }
            packageEventDatabase = _Instance;
        }
        return packageEventDatabase;
    }

    protected static synchronized void initialize(Context context) {
        synchronized (PackageEventDatabase.class) {
            if (context == null) {
                throw new IllegalArgumentException("'context' can not be NULL");
            } else if (_Instance == null) {
                Logger.m644i(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "PackageEventDatabase: waitForUserAccess() START [%1$s]", new Object[]{Logger.getShortStack()}));
                AuthManager.initialize(context);
                AuthManager.getInstance().waitOnAuth();
                Logger.m644i(Area.USAGE.value() | Area.STORAGE.value(), "PackageEventDatabase: waitForUserAccess() DONE");
                if (StringUtility.isNullOrEmpty(AuthManager.getInstance().getUserAccessId())) {
                    throw new IllegalStateException("Must have a user access ID");
                }
                _Instance = new PackageEventDatabase(context, String.format(Locale.US, "%1$s%2$d", new Object[]{DATABASE_NAME_PREFIX, Integer.valueOf(AuthManager.getInstance().getUserAccessId().hashCode())}));
            } else {
                throw new IllegalStateException("PackageEventDatabase has already been initialized");
            }
        }
    }

    private PackageEventDatabase(Context context, String name) {
        super(context, name, (SQLiteDatabase.CursorFactory) null, 1);
        Logger.m644i(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "PackageEventDatabase: Opened user specific database '%1$s%2$d'", new Object[]{DATABASE_NAME_PREFIX, Integer.valueOf(AuthManager.getInstance().getUserAccessId().hashCode())}));
    }

    /* access modifiers changed from: protected */
    public String getTableCreateSQL() {
        return "CREATE TABLE IF NOT EXISTS packageEvents (id INTEGER PRIMARY KEY AUTOINCREMENT, packageName TEXT NOT NULL, timestamp INTEGER NOT NULL, eventType TEXT NOT NULL, synced INTEGER NOT NULL DEFAULT 0, UNIQUE(packageName, timestamp, eventType) ON CONFLICT REPLACE);";
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
    public PackageEventRecord loadFromDB(Cursor results) {
        return PackageEventRecord.loadFromDB(results);
    }

    public void addRecord(String packageName, PackageEventManager.EventType eventType) {
        synchronized (this._databaseAccessLock) {
            if (StringUtility.isNullOrEmpty(packageName)) {
                throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
            } else if (eventType == null) {
                throw new IllegalArgumentException("'eventType' cannot be NULL");
            } else {
                ContentValues values = new ContentValues();
                values.put("packageName", packageName);
                values.put("timestamp", Long.valueOf(System.currentTimeMillis()));
                values.put("eventType", eventType.name());
                values.put("synced", 0);
                getWritableDatabase().insert(DATABASE_TABLE, (String) null, values);
                Logger.m646v(Area.USAGE.value() | Area.STORAGE.value(), String.format(Locale.US, "PackageEventDatabase: Added a '%1$s' record for '%2$s'", new Object[]{eventType.name(), packageName}));
            }
        }
        trimLruEntries();
    }
}
