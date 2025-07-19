package com.getjar.sdk.data;

import android.content.ContentValues;
import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.StringUtility;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

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
        Logger.m644i(Area.STORAGE.value(), String.format(Locale.US, "DBCache: Opened caching database '%1$s'", new Object[]{databaseName}));
    }

    public static DBCache getInstanceUserSpecific(Context context, String namespace) {
        if (context == null) {
            throw new IllegalArgumentException("'context' can not be NULL");
        }
        Logger.m644i(Area.STORAGE.value(), String.format(Locale.US, "DBCache: waitForUserAccess() START [%1$s] [%2$s]", new Object[]{namespace, Logger.getShortStack()}));
        AuthManager.initialize(context);
        AuthManager.getInstance().waitOnAuth();
        Logger.m644i(Area.STORAGE.value(), String.format(Locale.US, "DBCache: waitForUserAccess() DONE [%1$s]", new Object[]{namespace}));
        if (StringUtility.isNullOrEmpty(AuthManager.getInstance().getUserAccessId())) {
            throw new IllegalStateException("Must have a user access ID");
        } else if (StringUtility.isNullOrEmpty(namespace)) {
            throw new IllegalArgumentException("'namespace' can not be NULL or empty");
        } else {
            String databaseName = String.format(Locale.US, "%1$s%2$d", new Object[]{namespace, Integer.valueOf(AuthManager.getInstance().getUserAccessId().hashCode())});
            if (!_NamespaceToInstance.containsKey(databaseName)) {
                synchronized (_NamespaceToInstanceLock) {
                    if (!_NamespaceToInstance.containsKey(databaseName)) {
                        _NamespaceToInstance.put(databaseName, new DBCache(context, databaseName));
                    }
                }
            }
            return _NamespaceToInstance.get(databaseName);
        }
    }

    public static DBCache getInstanceAllUsers(Context context, String namespace) {
        if (context == null) {
            throw new IllegalArgumentException("'context' can not be NULL");
        } else if (StringUtility.isNullOrEmpty(namespace)) {
            throw new IllegalArgumentException("'namespace' can not be NULL or empty");
        } else {
            if (!_NamespaceToInstance.containsKey(namespace)) {
                synchronized (_NamespaceToInstanceLock) {
                    if (!_NamespaceToInstance.containsKey(namespace)) {
                        _NamespaceToInstance.put(namespace, new DBCache(context, namespace));
                    }
                }
            }
            return _NamespaceToInstance.get(namespace);
        }
    }

    public String getDatabaseName() {
        return this._databaseName;
    }

    public void onCreate(SQLiteDatabase db) {
        synchronized (this._databaseAccessLock) {
            db.execSQL(_DB_CREATE_TABLE);
        }
    }

    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        synchronized (this._databaseAccessLock) {
            Logger.m644i(Area.STORAGE.value(), String.format(Locale.US, "Upgrading database from version %1$d to %2$d, which will destroy all old data", new Object[]{Integer.valueOf(oldVersion), Integer.valueOf(newVersion)}));
            db.execSQL("DROP TABLE IF EXISTS cacheValues");
            onCreate(db);
        }
    }

    /* JADX WARNING: Unknown top exception splitter block from list: {B:29:0x0056=Splitter:B:29:0x0056, B:13:0x0039=Splitter:B:13:0x0039, B:16:0x003d=Splitter:B:16:0x003d} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean checkForCacheEntry(java.lang.String r12) {
        /*
            r11 = this;
            r3 = 0
            r2 = 1
            boolean r4 = com.getjar.sdk.utilities.StringUtility.isNullOrEmpty(r12)
            if (r4 == 0) goto L_0x0010
            java.lang.IllegalArgumentException r2 = new java.lang.IllegalArgumentException
            java.lang.String r3 = "'name' can not be NULL or empty"
            r2.<init>(r3)
            throw r2
        L_0x0010:
            java.lang.Object r4 = r11._databaseAccessLock
            monitor-enter(r4)
            android.database.sqlite.SQLiteDatabase r5 = r11.getReadableDatabase()     // Catch:{ all -> 0x004e }
            java.util.Locale r6 = java.util.Locale.US     // Catch:{ all -> 0x004e }
            java.lang.String r7 = "SELECT count(*) FROM %1$s WHERE name = ?"
            r8 = 1
            java.lang.Object[] r8 = new java.lang.Object[r8]     // Catch:{ all -> 0x004e }
            r9 = 0
            java.lang.String r10 = "cacheValues"
            r8[r9] = r10     // Catch:{ all -> 0x004e }
            java.lang.String r6 = java.lang.String.format(r6, r7, r8)     // Catch:{ all -> 0x004e }
            android.database.sqlite.SQLiteStatement r0 = r5.compileStatement(r6)     // Catch:{ all -> 0x004e }
            r5 = 1
            r0.bindString(r5, r12)     // Catch:{ all -> 0x0051 }
            long r5 = r0.simpleQueryForLong()     // Catch:{ all -> 0x0051 }
            r7 = 0
            int r5 = (r5 > r7 ? 1 : (r5 == r7 ? 0 : -1))
            if (r5 <= 0) goto L_0x003f
        L_0x0039:
            r0.close()     // Catch:{ Exception -> 0x0041 }
            r0 = 0
        L_0x003d:
            monitor-exit(r4)     // Catch:{ all -> 0x004e }
            return r2
        L_0x003f:
            r2 = r3
            goto L_0x0039
        L_0x0041:
            r1 = move-exception
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x004e }
            long r5 = r3.value()     // Catch:{ all -> 0x004e }
            java.lang.String r3 = "SQLiteStatement.close() failed"
            com.getjar.sdk.logging.Logger.m643e(r5, r3, r1)     // Catch:{ all -> 0x004e }
            goto L_0x003d
        L_0x004e:
            r2 = move-exception
            monitor-exit(r4)     // Catch:{ all -> 0x004e }
            throw r2
        L_0x0051:
            r2 = move-exception
            r0.close()     // Catch:{ Exception -> 0x0057 }
            r0 = 0
        L_0x0056:
            throw r2     // Catch:{ all -> 0x004e }
        L_0x0057:
            r1 = move-exception
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x004e }
            long r5 = r3.value()     // Catch:{ all -> 0x004e }
            java.lang.String r3 = "SQLiteStatement.close() failed"
            com.getjar.sdk.logging.Logger.m643e(r5, r3, r1)     // Catch:{ all -> 0x004e }
            goto L_0x0056
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.DBCache.checkForCacheEntry(java.lang.String):boolean");
    }

    /* JADX WARNING: Unknown top exception splitter block from list: {B:27:0x0045=Splitter:B:27:0x0045, B:15:0x0037=Splitter:B:15:0x0037, B:20:0x003d=Splitter:B:20:0x003d} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public com.getjar.sdk.data.CacheEntry loadCacheEntry(java.lang.String r12) throws java.net.URISyntaxException {
        /*
            r11 = this;
            r9 = 0
            boolean r0 = com.getjar.sdk.utilities.StringUtility.isNullOrEmpty(r12)
            if (r0 == 0) goto L_0x000f
            java.lang.IllegalArgumentException r0 = new java.lang.IllegalArgumentException
            java.lang.String r1 = "'name' can not be NULL or empty"
            r0.<init>(r1)
            throw r0
        L_0x000f:
            java.lang.Object r10 = r11._databaseAccessLock
            monitor-enter(r10)
            android.database.sqlite.SQLiteDatabase r0 = r11.getReadableDatabase()     // Catch:{ all -> 0x0046 }
            java.lang.String r1 = "cacheValues"
            r2 = 0
            java.lang.String r3 = "name = ?"
            r4 = 1
            java.lang.String[] r4 = new java.lang.String[r4]     // Catch:{ all -> 0x0046 }
            r5 = 0
            r4[r5] = r12     // Catch:{ all -> 0x0046 }
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r8 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch:{ all -> 0x0046 }
            boolean r0 = r8.moveToNext()     // Catch:{ all -> 0x0040 }
            if (r0 == 0) goto L_0x0039
            com.getjar.sdk.data.CacheEntry r0 = new com.getjar.sdk.data.CacheEntry     // Catch:{ all -> 0x0040 }
            r0.<init>(r8)     // Catch:{ all -> 0x0040 }
            r8.close()     // Catch:{ Exception -> 0x0049 }
            r8 = 0
        L_0x0037:
            monitor-exit(r10)     // Catch:{ all -> 0x0046 }
        L_0x0038:
            return r0
        L_0x0039:
            r8.close()     // Catch:{ Exception -> 0x004b }
            r8 = 0
        L_0x003d:
            monitor-exit(r10)     // Catch:{ all -> 0x0046 }
            r0 = r9
            goto L_0x0038
        L_0x0040:
            r0 = move-exception
            r8.close()     // Catch:{ Exception -> 0x004d }
            r8 = 0
        L_0x0045:
            throw r0     // Catch:{ all -> 0x0046 }
        L_0x0046:
            r0 = move-exception
            monitor-exit(r10)     // Catch:{ all -> 0x0046 }
            throw r0
        L_0x0049:
            r1 = move-exception
            goto L_0x0037
        L_0x004b:
            r0 = move-exception
            goto L_0x003d
        L_0x004d:
            r1 = move-exception
            goto L_0x0045
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.DBCache.loadCacheEntry(java.lang.String):com.getjar.sdk.data.CacheEntry");
    }

    /* JADX WARNING: Unknown top exception splitter block from list: {B:12:0x0030=Splitter:B:12:0x0030, B:19:0x0037=Splitter:B:19:0x0037} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public java.util.ArrayList<com.getjar.sdk.data.CacheEntry> loadAllCacheEntries() throws java.net.URISyntaxException {
        /*
            r11 = this;
            java.lang.Object r10 = r11._databaseAccessLock
            monitor-enter(r10)
            java.util.ArrayList r8 = new java.util.ArrayList     // Catch:{ all -> 0x0038 }
            r8.<init>()     // Catch:{ all -> 0x0038 }
            android.database.sqlite.SQLiteDatabase r0 = r11.getReadableDatabase()     // Catch:{ all -> 0x0038 }
            java.lang.String r1 = "cacheValues"
            r2 = 0
            r3 = 0
            r4 = 0
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r9 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch:{ all -> 0x0038 }
            boolean r0 = r9.moveToFirst()     // Catch:{ all -> 0x0032 }
            if (r0 == 0) goto L_0x002c
        L_0x001e:
            com.getjar.sdk.data.CacheEntry r0 = new com.getjar.sdk.data.CacheEntry     // Catch:{ all -> 0x0032 }
            r0.<init>(r9)     // Catch:{ all -> 0x0032 }
            r8.add(r0)     // Catch:{ all -> 0x0032 }
            boolean r0 = r9.moveToNext()     // Catch:{ all -> 0x0032 }
            if (r0 != 0) goto L_0x001e
        L_0x002c:
            r9.close()     // Catch:{ Exception -> 0x003b }
            r9 = 0
        L_0x0030:
            monitor-exit(r10)     // Catch:{ all -> 0x0038 }
            return r8
        L_0x0032:
            r0 = move-exception
            r9.close()     // Catch:{ Exception -> 0x003d }
            r9 = 0
        L_0x0037:
            throw r0     // Catch:{ all -> 0x0038 }
        L_0x0038:
            r0 = move-exception
            monitor-exit(r10)     // Catch:{ all -> 0x0038 }
            throw r0
        L_0x003b:
            r0 = move-exception
            goto L_0x0030
        L_0x003d:
            r1 = move-exception
            goto L_0x0037
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.DBCache.loadAllCacheEntries():java.util.ArrayList");
    }

    public boolean deleteCacheEntry(String name) {
        boolean z = true;
        if (StringUtility.isNullOrEmpty(name)) {
            throw new IllegalArgumentException("'name' can not be NULL or empty");
        }
        synchronized (this._databaseAccessLock) {
            if (getWritableDatabase().delete(_DATABASE_TABLE_NAME, "name = ?", new String[]{name}) <= 0) {
                z = false;
            }
        }
        return z;
    }

    public int deleteCacheEntries() {
        int delete;
        synchronized (this._databaseAccessLock) {
            delete = getWritableDatabase().delete(_DATABASE_TABLE_NAME, "1", (String[]) null);
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
                    Logger.m646v(Area.STORAGE.value(), String.format(Locale.US, "Updating cache entry %1$s", new Object[]{cacheEntry.toString()}));
                    if (getWritableDatabase().update(_DATABASE_TABLE_NAME, values, "name = ?", new String[]{cacheEntry.getName()}) <= 0) {
                        z = false;
                    }
                }
                return z;
            }
            synchronized (this._databaseAccessLock) {
                values.put("createdTimestamp", Long.valueOf(System.currentTimeMillis()));
                Logger.m646v(Area.STORAGE.value(), String.format(Locale.US, "Inserting cache entry %1$s", new Object[]{cacheEntry.toString()}));
                if (getWritableDatabase().insert(_DATABASE_TABLE_NAME, (String) null, values) == -1) {
                    z = false;
                }
            }
            return z;
        } catch (SQLiteException e) {
            Logger.m643e(Area.STORAGE.value(), "upsertCacheEntry() failed", e);
            return false;
        }
    }

    /* JADX WARNING: Unknown top exception splitter block from list: {B:8:0x0022=Splitter:B:8:0x0022, B:19:0x0038=Splitter:B:19:0x0038} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public long getRecordCount() {
        /*
            r9 = this;
            java.lang.Object r3 = r9._databaseAccessLock
            monitor-enter(r3)
            android.database.sqlite.SQLiteDatabase r2 = r9.getWritableDatabase()     // Catch:{ all -> 0x0031 }
            java.util.Locale r4 = java.util.Locale.US     // Catch:{ all -> 0x0031 }
            java.lang.String r5 = "SELECT count(*) FROM %1$s"
            r6 = 1
            java.lang.Object[] r6 = new java.lang.Object[r6]     // Catch:{ all -> 0x0031 }
            r7 = 0
            java.lang.String r8 = "cacheValues"
            r6[r7] = r8     // Catch:{ all -> 0x0031 }
            java.lang.String r4 = java.lang.String.format(r4, r5, r6)     // Catch:{ all -> 0x0031 }
            android.database.sqlite.SQLiteStatement r0 = r2.compileStatement(r4)     // Catch:{ all -> 0x0031 }
            long r4 = r0.simpleQueryForLong()     // Catch:{ all -> 0x0034 }
            r0.close()     // Catch:{ Exception -> 0x0024 }
        L_0x0022:
            monitor-exit(r3)     // Catch:{ all -> 0x0031 }
            return r4
        L_0x0024:
            r1 = move-exception
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x0031 }
            long r6 = r2.value()     // Catch:{ all -> 0x0031 }
            java.lang.String r2 = "SQLiteStatement.close() failed"
            com.getjar.sdk.logging.Logger.m643e(r6, r2, r1)     // Catch:{ all -> 0x0031 }
            goto L_0x0022
        L_0x0031:
            r2 = move-exception
            monitor-exit(r3)     // Catch:{ all -> 0x0031 }
            throw r2
        L_0x0034:
            r2 = move-exception
            r0.close()     // Catch:{ Exception -> 0x0039 }
        L_0x0038:
            throw r2     // Catch:{ all -> 0x0031 }
        L_0x0039:
            r1 = move-exception
            com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x0031 }
            long r4 = r4.value()     // Catch:{ all -> 0x0031 }
            java.lang.String r6 = "SQLiteStatement.close() failed"
            com.getjar.sdk.logging.Logger.m643e(r4, r6, r1)     // Catch:{ all -> 0x0031 }
            goto L_0x0038
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.DBCache.getRecordCount():long");
    }

    /* JADX WARNING: Unknown top exception splitter block from list: {B:28:0x0081=Splitter:B:28:0x0081, B:17:0x0043=Splitter:B:17:0x0043} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void trimLruEntries(int r13) {
        /*
            r12 = this;
            if (r13 >= 0) goto L_0x000a
            java.lang.IllegalArgumentException r0 = new java.lang.IllegalArgumentException
            java.lang.String r1 = "'maxRecordsCap' can not be negative"
            r0.<init>(r1)
            throw r0
        L_0x000a:
            long r0 = r12.getRecordCount()
            long r2 = (long) r13
            int r0 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1))
            if (r0 >= 0) goto L_0x0014
        L_0x0013:
            return
        L_0x0014:
            java.lang.Object r11 = r12._databaseAccessLock
            monitor-enter(r11)
            r9 = 0
            android.database.sqlite.SQLiteDatabase r0 = r12.getWritableDatabase()     // Catch:{ all -> 0x0079 }
            java.lang.String r1 = "cacheValues"
            r2 = 1
            java.lang.String[] r2 = new java.lang.String[r2]     // Catch:{ all -> 0x0079 }
            r3 = 0
            java.lang.String r4 = "id"
            r2[r3] = r4     // Catch:{ all -> 0x0079 }
            r3 = 0
            r4 = 0
            r5 = 0
            r6 = 0
            java.lang.String r7 = "createdTimestamp DESC"
            android.database.Cursor r10 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch:{ all -> 0x0079 }
            boolean r0 = r10.moveToPosition(r13)     // Catch:{ all -> 0x007c }
            if (r0 == 0) goto L_0x003f
            r0 = 0
            long r0 = r10.getLong(r0)     // Catch:{ all -> 0x007c }
            java.lang.Long r9 = java.lang.Long.valueOf(r0)     // Catch:{ all -> 0x007c }
        L_0x003f:
            r10.close()     // Catch:{ Exception -> 0x0082 }
            r10 = 0
        L_0x0043:
            android.database.sqlite.SQLiteDatabase r0 = r12.getWritableDatabase()     // Catch:{ all -> 0x0079 }
            java.lang.String r1 = "cacheValues"
            java.util.Locale r2 = java.util.Locale.US     // Catch:{ all -> 0x0079 }
            java.lang.String r3 = "id <= %1$d"
            r4 = 1
            java.lang.Object[] r4 = new java.lang.Object[r4]     // Catch:{ all -> 0x0079 }
            r5 = 0
            r4[r5] = r9     // Catch:{ all -> 0x0079 }
            java.lang.String r2 = java.lang.String.format(r2, r3, r4)     // Catch:{ all -> 0x0079 }
            r3 = 0
            int r8 = r0.delete(r1, r2, r3)     // Catch:{ all -> 0x0079 }
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x0079 }
            long r0 = r0.value()     // Catch:{ all -> 0x0079 }
            java.util.Locale r2 = java.util.Locale.US     // Catch:{ all -> 0x0079 }
            java.lang.String r3 = "%1$d LRU rows deleted form the cache DB"
            r4 = 1
            java.lang.Object[] r4 = new java.lang.Object[r4]     // Catch:{ all -> 0x0079 }
            r5 = 0
            java.lang.Integer r6 = java.lang.Integer.valueOf(r8)     // Catch:{ all -> 0x0079 }
            r4[r5] = r6     // Catch:{ all -> 0x0079 }
            java.lang.String r2 = java.lang.String.format(r2, r3, r4)     // Catch:{ all -> 0x0079 }
            com.getjar.sdk.logging.Logger.m646v(r0, r2)     // Catch:{ all -> 0x0079 }
            monitor-exit(r11)     // Catch:{ all -> 0x0079 }
            goto L_0x0013
        L_0x0079:
            r0 = move-exception
            monitor-exit(r11)     // Catch:{ all -> 0x0079 }
            throw r0
        L_0x007c:
            r0 = move-exception
            r10.close()     // Catch:{ Exception -> 0x0084 }
            r10 = 0
        L_0x0081:
            throw r0     // Catch:{ all -> 0x0079 }
        L_0x0082:
            r0 = move-exception
            goto L_0x0043
        L_0x0084:
            r1 = move-exception
            goto L_0x0081
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.DBCache.trimLruEntries(int):void");
    }
}
