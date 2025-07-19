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
import com.getjar.sdk.utilities.Constants;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
/* loaded from: classes.dex */
public abstract class SyncableDatabase<T extends DatabaseRecordBase> extends SQLiteOpenHelper {
    protected volatile Object _databaseAccessLock = new Object();

    protected abstract int getLRUCap();

    protected abstract String getTableCreateSQL();

    protected abstract String getTableName();

    protected abstract T loadFromDB(Cursor cursor);

    public SyncableDatabase(Context context, String name, SQLiteDatabase.CursorFactory factory, int version) {
        super(context, name, factory, version);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onCreate(SQLiteDatabase db) {
        synchronized (this._databaseAccessLock) {
            db.execSQL(getTableCreateSQL());
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        synchronized (this._databaseAccessLock) {
            Logger.d(Area.STORAGE.value(), String.format(Locale.US, "Upgrading database from version %1$d to %2$d [deleting old data from table '%3$s']", Integer.valueOf(oldVersion), Integer.valueOf(newVersion), getTableName()));
            db.execSQL("DROP TABLE IF EXISTS " + getTableName());
            onCreate(db);
        }
    }

    public List<T> loadAllRecords() {
        List<T> records;
        synchronized (this._databaseAccessLock) {
            records = new ArrayList<>();
            Cursor results = getReadableDatabase().query(getTableName(), null, null, null, null, null, null);
            while (results.moveToNext()) {
                records.add(loadFromDB(results));
            }
            if (results != null) {
                try {
                    results.close();
                } catch (Throwable th) {
                }
            }
        }
        return records;
    }

    public List<T> loadUnsyncedRecords() {
        List<T> unsyncedRecords;
        synchronized (this._databaseAccessLock) {
            unsyncedRecords = new ArrayList<>();
            Cursor results = getReadableDatabase().query(getTableName(), null, "synced = 0", null, null, null, null);
            while (results.moveToNext()) {
                unsyncedRecords.add(loadFromDB(results));
            }
            if (results != null) {
                try {
                    results.close();
                } catch (Throwable th) {
                }
            }
        }
        return unsyncedRecords;
    }

    public void setRecordAsSynced(long id) {
        synchronized (this._databaseAccessLock) {
            if (checkForRecord(id)) {
                ContentValues values = new ContentValues();
                values.put("synced", (Integer) 1);
                getWritableDatabase().update(getTableName(), values, String.format(Locale.US, "id = %1$d", Long.valueOf(id)), null);
            } else {
                Logger.w(Area.STORAGE.value(), String.format(Locale.US, "Usage: %1$s: setRecordAsSynced() failed to find record %2$d", getClass().getName(), Long.valueOf(id)));
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

    public void trimLruEntries() {
        synchronized (this._databaseAccessLock) {
            int maxRecordsCap = getLRUCap();
            if (maxRecordsCap < 0) {
                throw new IllegalStateException("'maxRecordsCap' can not be negative");
            }
            if (getRecordCountInternal() >= maxRecordsCap) {
                Long id = null;
                Cursor results = getReadableDatabase().query(getTableName(), new String[]{Constants.APP_ID}, null, null, null, null, "timestamp DESC");
                if (results.moveToPosition(maxRecordsCap)) {
                    id = Long.valueOf(results.getLong(0));
                }
                if (results != null) {
                    try {
                        results.close();
                    } catch (Exception e) {
                    }
                }
                int count = getWritableDatabase().delete(getTableName(), String.format(Locale.US, "id <= %1$d", id), null);
                if (count > 0) {
                    Logger.v(Area.STORAGE.value(), String.format(Locale.US, "Usage: %1$s: trimLruEntries() %2$d LRU rows deleted form %3$s", getClass().getName(), Integer.valueOf(count), getTableName()));
                }
            }
        }
    }

    public void purgeSyncedRecords() {
        synchronized (this._databaseAccessLock) {
            getWritableDatabase().delete(getTableName(), "synced = 1", null);
        }
    }

    public void deleteRecord(long id) {
        synchronized (this._databaseAccessLock) {
            getWritableDatabase().delete(getTableName(), String.format(Locale.US, "id = %1$d", Long.valueOf(id)), null);
        }
    }

    protected void deleteAllRecords() {
        getWritableDatabase().delete(getTableName(), null, null);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean checkForRecord(long id) {
        boolean z = true;
        SQLiteStatement dbStatement = null;
        try {
            dbStatement = getReadableDatabase().compileStatement(String.format(Locale.US, "SELECT count(*) FROM %1$s WHERE id = ?", getTableName()));
            dbStatement.bindLong(1, id);
            if (dbStatement.simpleQueryForLong() <= 0) {
                z = false;
            }
            return z;
        } finally {
            if (dbStatement != null) {
                try {
                    dbStatement.close();
                } catch (Exception e) {
                    Logger.e(Area.STORAGE.value(), "SQLiteStatement.close() failed", e);
                }
            }
        }
    }

    private long getRecordCountInternal() {
        SQLiteStatement dbStatement = getReadableDatabase().compileStatement(String.format(Locale.US, "SELECT count(*) FROM %1$s", getTableName()));
        try {
            return dbStatement.simpleQueryForLong();
        } finally {
            try {
                dbStatement.close();
            } catch (Exception e) {
                Logger.e(Area.STORAGE.value(), "SQLiteStatement.close() failed", e);
            }
        }
    }
}
