package com.getjar.sdk.data;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteStatement;
import com.getjar.sdk.data.DatabaseRecordBase;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import java.util.Locale;

public abstract class SyncableDatabase<T extends DatabaseRecordBase> extends SQLiteOpenHelper {
    protected volatile Object _databaseAccessLock = new Object();

    /* access modifiers changed from: protected */
    public abstract int getLRUCap();

    /* access modifiers changed from: protected */
    public abstract String getTableCreateSQL();

    /* access modifiers changed from: protected */
    public abstract String getTableName();

    /* access modifiers changed from: protected */
    public abstract T loadFromDB(Cursor cursor);

    public SyncableDatabase(Context context, String name, SQLiteDatabase.CursorFactory factory, int version) {
        super(context, name, factory, version);
    }

    public void onCreate(SQLiteDatabase db) {
        synchronized (this._databaseAccessLock) {
            db.execSQL(getTableCreateSQL());
        }
    }

    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        synchronized (this._databaseAccessLock) {
            Logger.d(Area.STORAGE.value(), String.format(Locale.US, "Upgrading database from version %1$d to %2$d [deleting old data from table '%3$s']", new Object[]{Integer.valueOf(oldVersion), Integer.valueOf(newVersion), getTableName()}));
            db.execSQL("DROP TABLE IF EXISTS " + getTableName());
            onCreate(db);
        }
    }

    /* JADX WARNING: Unknown top exception splitter block from list: {B:15:0x0030=Splitter:B:15:0x0030, B:24:0x003a=Splitter:B:24:0x003a} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public java.util.List<T> loadAllRecords() {
        /*
            r11 = this;
            java.lang.Object r10 = r11._databaseAccessLock
            monitor-enter(r10)
            java.util.ArrayList r8 = new java.util.ArrayList     // Catch:{ all -> 0x0031 }
            r8.<init>()     // Catch:{ all -> 0x0031 }
            r9 = 0
            android.database.sqlite.SQLiteDatabase r0 = r11.getReadableDatabase()     // Catch:{ all -> 0x0029 }
            java.lang.String r1 = r11.getTableName()     // Catch:{ all -> 0x0029 }
            r2 = 0
            r3 = 0
            r4 = 0
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r9 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch:{ all -> 0x0029 }
        L_0x001b:
            boolean r0 = r9.moveToNext()     // Catch:{ all -> 0x0029 }
            if (r0 == 0) goto L_0x0034
            com.getjar.sdk.data.DatabaseRecordBase r0 = r11.loadFromDB(r9)     // Catch:{ all -> 0x0029 }
            r8.add(r0)     // Catch:{ all -> 0x0029 }
            goto L_0x001b
        L_0x0029:
            r0 = move-exception
            if (r9 == 0) goto L_0x0030
            r9.close()     // Catch:{ Throwable -> 0x003e }
            r9 = 0
        L_0x0030:
            throw r0     // Catch:{ all -> 0x0031 }
        L_0x0031:
            r0 = move-exception
            monitor-exit(r10)     // Catch:{ all -> 0x0031 }
            throw r0
        L_0x0034:
            if (r9 == 0) goto L_0x003a
            r9.close()     // Catch:{ Throwable -> 0x003c }
            r9 = 0
        L_0x003a:
            monitor-exit(r10)     // Catch:{ all -> 0x0031 }
            return r8
        L_0x003c:
            r0 = move-exception
            goto L_0x003a
        L_0x003e:
            r1 = move-exception
            goto L_0x0030
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.SyncableDatabase.loadAllRecords():java.util.List");
    }

    /* JADX WARNING: Unknown top exception splitter block from list: {B:15:0x0031=Splitter:B:15:0x0031, B:24:0x003b=Splitter:B:24:0x003b} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public java.util.List<T> loadUnsyncedRecords() {
        /*
            r11 = this;
            java.lang.Object r10 = r11._databaseAccessLock
            monitor-enter(r10)
            java.util.ArrayList r9 = new java.util.ArrayList     // Catch:{ all -> 0x0032 }
            r9.<init>()     // Catch:{ all -> 0x0032 }
            r8 = 0
            android.database.sqlite.SQLiteDatabase r0 = r11.getReadableDatabase()     // Catch:{ all -> 0x002a }
            java.lang.String r1 = r11.getTableName()     // Catch:{ all -> 0x002a }
            r2 = 0
            java.lang.String r3 = "synced = 0"
            r4 = 0
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r8 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch:{ all -> 0x002a }
        L_0x001c:
            boolean r0 = r8.moveToNext()     // Catch:{ all -> 0x002a }
            if (r0 == 0) goto L_0x0035
            com.getjar.sdk.data.DatabaseRecordBase r0 = r11.loadFromDB(r8)     // Catch:{ all -> 0x002a }
            r9.add(r0)     // Catch:{ all -> 0x002a }
            goto L_0x001c
        L_0x002a:
            r0 = move-exception
            if (r8 == 0) goto L_0x0031
            r8.close()     // Catch:{ Throwable -> 0x003f }
            r8 = 0
        L_0x0031:
            throw r0     // Catch:{ all -> 0x0032 }
        L_0x0032:
            r0 = move-exception
            monitor-exit(r10)     // Catch:{ all -> 0x0032 }
            throw r0
        L_0x0035:
            if (r8 == 0) goto L_0x003b
            r8.close()     // Catch:{ Throwable -> 0x003d }
            r8 = 0
        L_0x003b:
            monitor-exit(r10)     // Catch:{ all -> 0x0032 }
            return r9
        L_0x003d:
            r0 = move-exception
            goto L_0x003b
        L_0x003f:
            r1 = move-exception
            goto L_0x0031
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.SyncableDatabase.loadUnsyncedRecords():java.util.List");
    }

    public void setRecordAsSynced(long id) {
        synchronized (this._databaseAccessLock) {
            if (checkForRecord(id)) {
                ContentValues values = new ContentValues();
                values.put("synced", 1);
                getWritableDatabase().update(getTableName(), values, String.format(Locale.US, "id = %1$d", new Object[]{Long.valueOf(id)}), (String[]) null);
            } else {
                Logger.w(Area.STORAGE.value(), String.format(Locale.US, "Usage: %1$s: setRecordAsSynced() failed to find record %2$d", new Object[]{getClass().getName(), Long.valueOf(id)}));
            }
        }
    }

    public long getRecordCount() {
        long recordCountInternal;
        synchronized (this._databaseAccessLock) {
            recordCountInternal = getRecordCountInternal();
        }
        return recordCountInternal;
    }

    /* JADX WARNING: Code restructure failed: missing block: B:38:?, code lost:
        return;
     */
    /* JADX WARNING: Unknown top exception splitter block from list: {B:23:0x0050=Splitter:B:23:0x0050, B:33:0x00a3=Splitter:B:33:0x00a3} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void trimLruEntries() {
        /*
            r13 = this;
            java.lang.Object r12 = r13._databaseAccessLock
            monitor-enter(r12)
            int r10 = r13.getLRUCap()     // Catch:{ all -> 0x0011 }
            if (r10 >= 0) goto L_0x0014
            java.lang.IllegalStateException r0 = new java.lang.IllegalStateException     // Catch:{ all -> 0x0011 }
            java.lang.String r1 = "'maxRecordsCap' can not be negative"
            r0.<init>(r1)     // Catch:{ all -> 0x0011 }
            throw r0     // Catch:{ all -> 0x0011 }
        L_0x0011:
            r0 = move-exception
            monitor-exit(r12)     // Catch:{ all -> 0x0011 }
            throw r0
        L_0x0014:
            long r0 = r13.getRecordCountInternal()     // Catch:{ all -> 0x0011 }
            long r2 = (long) r10     // Catch:{ all -> 0x0011 }
            int r0 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1))
            if (r0 >= 0) goto L_0x001f
            monitor-exit(r12)     // Catch:{ all -> 0x0011 }
        L_0x001e:
            return
        L_0x001f:
            r9 = 0
            r11 = 0
            android.database.sqlite.SQLiteDatabase r0 = r13.getReadableDatabase()     // Catch:{ all -> 0x009c }
            java.lang.String r1 = r13.getTableName()     // Catch:{ all -> 0x009c }
            r2 = 1
            java.lang.String[] r2 = new java.lang.String[r2]     // Catch:{ all -> 0x009c }
            r3 = 0
            java.lang.String r4 = "id"
            r2[r3] = r4     // Catch:{ all -> 0x009c }
            r3 = 0
            r4 = 0
            r5 = 0
            r6 = 0
            java.lang.String r7 = "timestamp DESC"
            android.database.Cursor r11 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch:{ all -> 0x009c }
            boolean r0 = r11.moveToPosition(r10)     // Catch:{ all -> 0x009c }
            if (r0 == 0) goto L_0x004a
            r0 = 0
            long r0 = r11.getLong(r0)     // Catch:{ all -> 0x009c }
            java.lang.Long r9 = java.lang.Long.valueOf(r0)     // Catch:{ all -> 0x009c }
        L_0x004a:
            if (r11 == 0) goto L_0x0050
            r11.close()     // Catch:{ Exception -> 0x00a4 }
            r11 = 0
        L_0x0050:
            android.database.sqlite.SQLiteDatabase r0 = r13.getWritableDatabase()     // Catch:{ all -> 0x0011 }
            java.lang.String r1 = r13.getTableName()     // Catch:{ all -> 0x0011 }
            java.util.Locale r2 = java.util.Locale.US     // Catch:{ all -> 0x0011 }
            java.lang.String r3 = "id <= %1$d"
            r4 = 1
            java.lang.Object[] r4 = new java.lang.Object[r4]     // Catch:{ all -> 0x0011 }
            r5 = 0
            r4[r5] = r9     // Catch:{ all -> 0x0011 }
            java.lang.String r2 = java.lang.String.format(r2, r3, r4)     // Catch:{ all -> 0x0011 }
            r3 = 0
            int r8 = r0.delete(r1, r2, r3)     // Catch:{ all -> 0x0011 }
            if (r8 <= 0) goto L_0x009a
            com.getjar.sdk.logging.Area r0 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x0011 }
            long r0 = r0.value()     // Catch:{ all -> 0x0011 }
            java.util.Locale r2 = java.util.Locale.US     // Catch:{ all -> 0x0011 }
            java.lang.String r3 = "Usage: %1$s: trimLruEntries() %2$d LRU rows deleted form %3$s"
            r4 = 3
            java.lang.Object[] r4 = new java.lang.Object[r4]     // Catch:{ all -> 0x0011 }
            r5 = 0
            java.lang.Class r6 = r13.getClass()     // Catch:{ all -> 0x0011 }
            java.lang.String r6 = r6.getName()     // Catch:{ all -> 0x0011 }
            r4[r5] = r6     // Catch:{ all -> 0x0011 }
            r5 = 1
            java.lang.Integer r6 = java.lang.Integer.valueOf(r8)     // Catch:{ all -> 0x0011 }
            r4[r5] = r6     // Catch:{ all -> 0x0011 }
            r5 = 2
            java.lang.String r6 = r13.getTableName()     // Catch:{ all -> 0x0011 }
            r4[r5] = r6     // Catch:{ all -> 0x0011 }
            java.lang.String r2 = java.lang.String.format(r2, r3, r4)     // Catch:{ all -> 0x0011 }
            com.getjar.sdk.logging.Logger.v(r0, r2)     // Catch:{ all -> 0x0011 }
        L_0x009a:
            monitor-exit(r12)     // Catch:{ all -> 0x0011 }
            goto L_0x001e
        L_0x009c:
            r0 = move-exception
            if (r11 == 0) goto L_0x00a3
            r11.close()     // Catch:{ Exception -> 0x00a6 }
            r11 = 0
        L_0x00a3:
            throw r0     // Catch:{ all -> 0x0011 }
        L_0x00a4:
            r0 = move-exception
            goto L_0x0050
        L_0x00a6:
            r1 = move-exception
            goto L_0x00a3
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.SyncableDatabase.trimLruEntries():void");
    }

    public void purgeSyncedRecords() {
        synchronized (this._databaseAccessLock) {
            getWritableDatabase().delete(getTableName(), "synced = 1", (String[]) null);
        }
    }

    public void deleteRecord(long id) {
        synchronized (this._databaseAccessLock) {
            getWritableDatabase().delete(getTableName(), String.format(Locale.US, "id = %1$d", new Object[]{Long.valueOf(id)}), (String[]) null);
        }
    }

    /* access modifiers changed from: protected */
    public void deleteAllRecords() {
        getWritableDatabase().delete(getTableName(), (String) null, (String[]) null);
    }

    /* access modifiers changed from: protected */
    public boolean checkForRecord(long id) {
        boolean z = true;
        SQLiteStatement dbStatement = null;
        try {
            dbStatement = getReadableDatabase().compileStatement(String.format(Locale.US, "SELECT count(*) FROM %1$s WHERE id = ?", new Object[]{getTableName()}));
            dbStatement.bindLong(1, id);
            if (dbStatement.simpleQueryForLong() <= 0) {
                z = false;
            }
            if (dbStatement != null) {
                try {
                } catch (Exception e) {
                    Logger.e(Area.STORAGE.value(), "SQLiteStatement.close() failed", e);
                }
            }
            return z;
        } finally {
            if (dbStatement != null) {
                try {
                    dbStatement.close();
                } catch (Exception e2) {
                    Logger.e(Area.STORAGE.value(), "SQLiteStatement.close() failed", e2);
                }
            }
        }
    }

    private long getRecordCountInternal() {
        SQLiteStatement dbStatement = getReadableDatabase().compileStatement(String.format(Locale.US, "SELECT count(*) FROM %1$s", new Object[]{getTableName()}));
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
}
