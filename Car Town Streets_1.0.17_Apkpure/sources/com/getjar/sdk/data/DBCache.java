package com.getjar.sdk.data;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteStatement;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.Constants;
import com.getjar.sdk.utilities.StringUtility;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
/* loaded from: classes.dex */
public class DBCache extends SQLiteOpenHelper {
    private static final String _DATABASE_TABLE_NAME = "cacheValues";
    private static final int _DATABASE_VERSION = 5;
    private static final String _DB_CREATE_TABLE = "CREATE TABLE IF NOT EXISTS cacheValues (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL UNIQUE, value TEXT, createdTimestamp INTEGER NOT NULL, lastUpdated INTEGER NOT NULL, ttl INTEGER NOT NULL, uri TEXT, etag TEXT);";
    private static Map<String, DBCache> _NamespaceToInstance = new HashMap();
    private static volatile Object _NamespaceToInstanceLock = new Object();
    private volatile Object _databaseAccessLock = new Object();
    private final String _databaseName;

    private DBCache(Context context, String databaseName) {
        super(context, databaseName, (SQLiteDatabase.CursorFactory) null, 5);
        this._databaseName = databaseName;
        Logger.i(Area.STORAGE.value(), String.format(Locale.US, "DBCache: Opened caching database '%1$s'", databaseName));
    }

    public static DBCache getInstanceUserSpecific(Context context, String namespace) {
        if (context == null) {
            throw new IllegalArgumentException("'context' can not be NULL");
        }
        Logger.i(Area.STORAGE.value(), String.format(Locale.US, "DBCache: waitForUserAccess() START [%1$s] [%2$s]", namespace, Logger.getShortStack()));
        AuthManager.initialize(context);
        AuthManager.getInstance().waitOnAuth();
        Logger.i(Area.STORAGE.value(), String.format(Locale.US, "DBCache: waitForUserAccess() DONE [%1$s]", namespace));
        if (StringUtility.isNullOrEmpty(AuthManager.getInstance().getUserAccessId())) {
            throw new IllegalStateException("Must have a user access ID");
        }
        if (StringUtility.isNullOrEmpty(namespace)) {
            throw new IllegalArgumentException("'namespace' can not be NULL or empty");
        }
        String databaseName = String.format(Locale.US, "%1$s%2$d", namespace, Integer.valueOf(AuthManager.getInstance().getUserAccessId().hashCode()));
        if (!_NamespaceToInstance.containsKey(databaseName)) {
            synchronized (_NamespaceToInstanceLock) {
                if (!_NamespaceToInstance.containsKey(databaseName)) {
                    _NamespaceToInstance.put(databaseName, new DBCache(context, databaseName));
                }
            }
        }
        return _NamespaceToInstance.get(databaseName);
    }

    public static DBCache getInstanceAllUsers(Context context, String namespace) {
        if (context == null) {
            throw new IllegalArgumentException("'context' can not be NULL");
        }
        if (StringUtility.isNullOrEmpty(namespace)) {
            throw new IllegalArgumentException("'namespace' can not be NULL or empty");
        }
        if (!_NamespaceToInstance.containsKey(namespace)) {
            synchronized (_NamespaceToInstanceLock) {
                if (!_NamespaceToInstance.containsKey(namespace)) {
                    _NamespaceToInstance.put(namespace, new DBCache(context, namespace));
                }
            }
        }
        return _NamespaceToInstance.get(namespace);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public String getDatabaseName() {
        return this._databaseName;
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onCreate(SQLiteDatabase db) {
        synchronized (this._databaseAccessLock) {
            db.execSQL(_DB_CREATE_TABLE);
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        synchronized (this._databaseAccessLock) {
            Logger.i(Area.STORAGE.value(), String.format(Locale.US, "Upgrading database from version %1$d to %2$d, which will destroy all old data", Integer.valueOf(oldVersion), Integer.valueOf(newVersion)));
            db.execSQL("DROP TABLE IF EXISTS cacheValues");
            onCreate(db);
        }
    }

    public boolean checkForCacheEntry(String name) {
        boolean z = true;
        if (StringUtility.isNullOrEmpty(name)) {
            throw new IllegalArgumentException("'name' can not be NULL or empty");
        }
        synchronized (this._databaseAccessLock) {
            SQLiteStatement dbStatement = getReadableDatabase().compileStatement(String.format(Locale.US, "SELECT count(*) FROM %1$s WHERE name = ?", _DATABASE_TABLE_NAME));
            dbStatement.bindString(1, name);
            if (dbStatement.simpleQueryForLong() <= 0) {
                z = false;
            }
            try {
                dbStatement.close();
            } catch (Exception e) {
                Logger.e(Area.STORAGE.value(), "SQLiteStatement.close() failed", e);
            }
        }
        return z;
    }

    public CacheEntry loadCacheEntry(String name) throws URISyntaxException {
        if (StringUtility.isNullOrEmpty(name)) {
            throw new IllegalArgumentException("'name' can not be NULL or empty");
        }
        synchronized (this._databaseAccessLock) {
            Cursor results = getReadableDatabase().query(_DATABASE_TABLE_NAME, null, "name = ?", new String[]{name}, null, null, null);
            if (!results.moveToNext()) {
                try {
                    results.close();
                } catch (Exception e) {
                }
                return null;
            }
            CacheEntry cacheEntry = new CacheEntry(results);
            try {
                results.close();
            } catch (Exception e2) {
            }
            return cacheEntry;
        }
    }

    public ArrayList<CacheEntry> loadAllCacheEntries() throws URISyntaxException {
        ArrayList<CacheEntry> cacheEntries;
        synchronized (this._databaseAccessLock) {
            cacheEntries = new ArrayList<>();
            Cursor results = getReadableDatabase().query(_DATABASE_TABLE_NAME, null, null, null, null, null, null);
            if (results.moveToFirst()) {
                do {
                    cacheEntries.add(new CacheEntry(results));
                } while (results.moveToNext());
                try {
                    results.close();
                } catch (Exception e) {
                }
            } else {
                results.close();
            }
        }
        return cacheEntries;
    }

    public boolean deleteCacheEntry(String name) {
        boolean z = true;
        if (StringUtility.isNullOrEmpty(name)) {
            throw new IllegalArgumentException("'name' can not be NULL or empty");
        }
        synchronized (this._databaseAccessLock) {
            int deleteCount = getWritableDatabase().delete(_DATABASE_TABLE_NAME, "name = ?", new String[]{name});
            if (deleteCount <= 0) {
                z = false;
            }
        }
        return z;
    }

    public int deleteCacheEntries() {
        int delete;
        synchronized (this._databaseAccessLock) {
            delete = getWritableDatabase().delete(_DATABASE_TABLE_NAME, "1", null);
        }
        return delete;
    }

    public boolean upsertCacheEntry(CacheEntry cacheEntry) {
        boolean z = true;
        if (cacheEntry == null) {
            throw new IllegalArgumentException("'cacheEntry' can not be null");
        }
        ContentValues values = new ContentValues();
        values.put("name", cacheEntry.getName());
        if (cacheEntry.getValue() == null) {
            values.putNull("value");
        } else {
            values.put("value", cacheEntry.getValue());
        }
        values.put("ttl", cacheEntry.getTtl());
        if (cacheEntry.getUri() == null) {
            values.putNull("uri");
        } else {
            values.put("uri", cacheEntry.getUri().toString());
        }
        if (cacheEntry.getEtag() == null) {
            values.putNull("etag");
        } else {
            values.put("etag", cacheEntry.getEtag());
        }
        values.put("lastUpdated", Long.valueOf(System.currentTimeMillis()));
        try {
            if (checkForCacheEntry(cacheEntry.getName())) {
                synchronized (this._databaseAccessLock) {
                    Logger.v(Area.STORAGE.value(), String.format(Locale.US, "Updating cache entry %1$s", cacheEntry.toString()));
                    if (getWritableDatabase().update(_DATABASE_TABLE_NAME, values, "name = ?", new String[]{cacheEntry.getName()}) <= 0) {
                        z = false;
                    }
                }
            } else {
                synchronized (this._databaseAccessLock) {
                    values.put("createdTimestamp", Long.valueOf(System.currentTimeMillis()));
                    Logger.v(Area.STORAGE.value(), String.format(Locale.US, "Inserting cache entry %1$s", cacheEntry.toString()));
                    if (getWritableDatabase().insert(_DATABASE_TABLE_NAME, null, values) == -1) {
                        z = false;
                    }
                }
            }
            return z;
        } catch (SQLiteException e) {
            Logger.e(Area.STORAGE.value(), "upsertCacheEntry() failed", e);
            return false;
        }
    }

    public long getRecordCount() {
        long simpleQueryForLong;
        synchronized (this._databaseAccessLock) {
            SQLiteStatement dbStatement = getWritableDatabase().compileStatement(String.format(Locale.US, "SELECT count(*) FROM %1$s", _DATABASE_TABLE_NAME));
            simpleQueryForLong = dbStatement.simpleQueryForLong();
            try {
                dbStatement.close();
            } catch (Exception e) {
                Logger.e(Area.STORAGE.value(), "SQLiteStatement.close() failed", e);
            }
        }
        return simpleQueryForLong;
    }

    public void trimLruEntries(int maxRecordsCap) {
        if (maxRecordsCap < 0) {
            throw new IllegalArgumentException("'maxRecordsCap' can not be negative");
        }
        if (getRecordCount() >= maxRecordsCap) {
            synchronized (this._databaseAccessLock) {
                Long id = null;
                Cursor results = getWritableDatabase().query(_DATABASE_TABLE_NAME, new String[]{Constants.APP_ID}, null, null, null, null, "createdTimestamp DESC");
                if (results.moveToPosition(maxRecordsCap)) {
                    id = Long.valueOf(results.getLong(0));
                }
                try {
                    results.close();
                } catch (Exception e) {
                }
                int count = getWritableDatabase().delete(_DATABASE_TABLE_NAME, String.format(Locale.US, "id <= %1$d", id), null);
                Logger.v(Area.STORAGE.value(), String.format(Locale.US, "%1$d LRU rows deleted form the cache DB", Integer.valueOf(count)));
            }
        }
    }
}
