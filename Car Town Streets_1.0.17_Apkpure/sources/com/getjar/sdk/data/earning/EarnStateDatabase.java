package com.getjar.sdk.data.earning;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteStatement;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.StringUtility;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.UUID;
/* loaded from: classes.dex */
public class EarnStateDatabase extends SQLiteOpenHelper {
    private static final String DATABASE_CREATE = "CREATE TABLE IF NOT EXISTS appState (id INTEGER PRIMARY KEY AUTOINCREMENT, clientTransactionId TEXT NOT NULL UNIQUE, packageName TEXT NOT NULL UNIQUE, timestampCreated INTEGER NOT NULL, timestampModified INTEGER NOT NULL, friendlyName TEXT NOT NULL, applicationMetadata TEXT NOT NULL, trackingMetadata TEXT NOT NULL, status TEXT NOT NULL, earnState TEXT, earnSubstate TEXT, earnAmount INTEGER, notificationState TEXT NOT NULL);";
    private static final String DATABASE_NAME_PREFIX = "GetJarDBAppState";
    private static final String DATABASE_TABLE = "appState";
    private static final int DATABASE_VERSION = 3;
    private static volatile EarnStateDatabase _Instance = null;
    private static final String[] _StatusDownloadedOrInstalledColumnValue = {Status.DOWNLOADED.name(), Status.INSTALLED.name()};
    private volatile Object _databaseAccessLock = new Object();

    /* loaded from: classes.dex */
    public enum EarnState {
        SUCCESS,
        FAIL
    }

    /* loaded from: classes.dex */
    public enum NotificationState {
        NONE,
        INSTALL_REMINDER,
        OPEN_REMINDER,
        DONE
    }

    /* loaded from: classes.dex */
    public enum Status {
        DOWNLOADED,
        INSTALLED,
        OPENED
    }

    private EarnStateDatabase(Context context, String name) {
        super(context, name, (SQLiteDatabase.CursorFactory) null, 3);
        Logger.i(Area.EARN.value() | Area.STORAGE.value(), String.format(Locale.US, "EarnStateDatabase: Opened user specific database '%1$s%2$d'", DATABASE_NAME_PREFIX, Integer.valueOf(AuthManager.getInstance().getUserAccessId().hashCode())));
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
                _Instance = new EarnStateDatabase(context, String.format(Locale.US, "%1$s%2$d", DATABASE_NAME_PREFIX, Integer.valueOf(AuthManager.getInstance().getUserAccessId().hashCode())));
            }
            earnStateDatabase = _Instance;
        }
        return earnStateDatabase;
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
            Logger.d(Area.EARN.value() | Area.STORAGE.value(), String.format(Locale.US, "Upgrading database '%1$s' from version %2$d to %3$d, which will destroy all old data", DATABASE_NAME_PREFIX, Integer.valueOf(oldVersion), Integer.valueOf(newVersion)));
            db.execSQL("DROP TABLE IF EXISTS appState");
            onCreate(db);
        }
    }

    protected long getRecordCount() {
        long simpleQueryForLong;
        synchronized (this._databaseAccessLock) {
            SQLiteStatement dbStatement = getReadableDatabase().compileStatement(String.format(Locale.US, "SELECT count(*) FROM %1$s", DATABASE_TABLE));
            simpleQueryForLong = dbStatement.simpleQueryForLong();
            try {
                dbStatement.close();
            } catch (Exception e) {
                Logger.e(Area.EARN.value() | Area.STORAGE.value(), "SQLiteStatement.close() failed", e);
            }
        }
        return simpleQueryForLong;
    }

    public EarnStateRecord getAppState(String packageName) {
        EarnStateRecord appState;
        synchronized (this._databaseAccessLock) {
            if (StringUtility.isNullOrEmpty(packageName)) {
                throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
            }
            appState = null;
            Cursor results = getReadableDatabase().query(DATABASE_TABLE, null, "packageName = ?", new String[]{packageName}, null, null, null);
            try {
                if (results.moveToNext()) {
                    EarnStateRecord appState2 = new EarnStateRecord(results);
                    try {
                        Logger.v(Area.EARN.value() | Area.STORAGE.value(), String.format(Locale.US, "Earning: EarnStateDatabase: getAppState() loaded: %1$s", appState2.toString()));
                        appState = appState2;
                    } catch (Throwable th) {
                        th = th;
                        try {
                            results.close();
                        } catch (Exception e) {
                            Logger.e(Area.EARN.value() | Area.STORAGE.value(), "Earning: EarnStateDatabase: getStatus() failed", e);
                        }
                        throw th;
                    }
                }
                try {
                    results.close();
                } catch (Exception e2) {
                    Logger.e(Area.EARN.value() | Area.STORAGE.value(), "Earning: EarnStateDatabase: getStatus() failed", e2);
                }
            } catch (Throwable th2) {
                th = th2;
            }
        }
        return appState;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public List<EarnStateRecord> getAllDownloadedOrInstalledAppStates() {
        List<EarnStateRecord> appStates;
        synchronized (this._databaseAccessLock) {
            appStates = new ArrayList<>();
            Cursor results = getReadableDatabase().query(DATABASE_TABLE, null, "status = ? OR status = ?", _StatusDownloadedOrInstalledColumnValue, null, null, null);
            while (results.moveToNext()) {
                appStates.add(new EarnStateRecord(results));
            }
            try {
                results.close();
            } catch (Exception e) {
                Logger.e(Area.EARN.value() | Area.STORAGE.value(), "Earning: EarnStateDatabase: getAllAppStates() failed", e);
            }
            if (appStates.size() > 0) {
                Logger.v(Area.EARN.value() | Area.STORAGE.value(), String.format(Locale.US, "Earning: EarnStateDatabase: getAllAppStates() loaded %1$d records", Integer.valueOf(appStates.size())));
            }
        }
        return appStates;
    }

    protected List<EarnStateRecord> getAllAppStates() {
        List<EarnStateRecord> appStates;
        synchronized (this._databaseAccessLock) {
            appStates = new ArrayList<>();
            Cursor results = getReadableDatabase().query(DATABASE_TABLE, null, null, null, null, null, null);
            while (results.moveToNext()) {
                appStates.add(new EarnStateRecord(results));
            }
            try {
                results.close();
            } catch (Exception e) {
                Logger.e(Area.EARN.value() | Area.STORAGE.value(), "Earning: EarnStateDatabase: getAllAppStates() failed", e);
            }
            if (appStates.size() > 0) {
                Logger.v(Area.EARN.value() | Area.STORAGE.value(), String.format(Locale.US, "Earning: EarnStateDatabase: getAllAppStates() loaded %1$d records", Integer.valueOf(appStates.size())));
            }
        }
        return appStates;
    }

    protected void deleteAppState(String packageName) {
        synchronized (this._databaseAccessLock) {
            getWritableDatabase().delete(DATABASE_TABLE, "packageName = ?", new String[]{packageName});
            Logger.v(Area.EARN.value() | Area.STORAGE.value(), String.format(Locale.US, "Earning: EarnStateDatabase: deleteAppState() deleted '%1$s'", packageName));
        }
    }

    public void deleteOldRecords(long olderThanMilliseconds) {
        synchronized (this._databaseAccessLock) {
            long cutoff = System.currentTimeMillis() - olderThanMilliseconds;
            int deleteCount = getWritableDatabase().delete(DATABASE_TABLE, String.format(Locale.US, "timestampCreated < %1$d", Long.valueOf(cutoff)), null);
            Logger.v(Area.EARN.value() | Area.STORAGE.value(), String.format(Locale.US, "Earning: EarnStateDatabase: deleteOldRecords() deleted %1$d records", Integer.valueOf(deleteCount)));
        }
    }

    private boolean checkForAppState(String packageName) {
        boolean z = true;
        if (StringUtility.isNullOrEmpty(packageName)) {
            throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
        }
        SQLiteStatement dbStatement = getReadableDatabase().compileStatement(String.format(Locale.US, "SELECT count(*) FROM %1$s WHERE packageName = ?", DATABASE_TABLE));
        try {
            dbStatement.bindString(1, packageName);
            if (dbStatement.simpleQueryForLong() <= 0) {
                z = false;
            }
            return z;
        } finally {
            try {
                dbStatement.close();
            } catch (Exception e) {
                Logger.e(Area.EARN.value() | Area.STORAGE.value(), "SQLiteStatement.close() failed", e);
            }
        }
    }

    public void addAppState(String packageName, String friendlyName, String applicationMetadata, String trackingMetadata) {
        synchronized (this._databaseAccessLock) {
            if (StringUtility.isNullOrEmpty(packageName)) {
                throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
            }
            if (StringUtility.isNullOrEmpty(friendlyName)) {
                throw new IllegalArgumentException("'friendlyName' cannot be NULL or empty");
            }
            if (StringUtility.isNullOrEmpty(applicationMetadata)) {
                throw new IllegalArgumentException("'applicationMetadata' cannot be NULL or empty");
            }
            if (StringUtility.isNullOrEmpty(trackingMetadata)) {
                throw new IllegalArgumentException("'trackingMetadata' cannot be NULL or empty");
            }
            if (checkForAppState(packageName)) {
                Logger.v(Area.EARN.value() | Area.STORAGE.value(), String.format(Locale.US, "Earning: EarnStateDatabase: Preexisting record found for '%1$s'", packageName));
                return;
            }
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
            getWritableDatabase().insert(DATABASE_TABLE, null, values);
            Logger.v(Area.EARN.value() | Area.STORAGE.value(), String.format(Locale.US, "Earning: EarnStateDatabase: Added a DOWNLOADED record for '%1$s'", packageName));
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
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
            Logger.v(Area.EARN.value() | Area.STORAGE.value(), String.format(Locale.US, "Earning: EarnStateDatabase: setNotificationShown() Updated record for '%1$s'", packageName));
        }
    }

    public void updateApplicationMetadata(String packageName, String applicationMetadata) {
        synchronized (this._databaseAccessLock) {
            if (StringUtility.isNullOrEmpty(packageName)) {
                throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
            }
            if (StringUtility.isNullOrEmpty(applicationMetadata)) {
                throw new IllegalArgumentException("'applicationMetadata' cannot be NULL or empty");
            }
            long now = System.currentTimeMillis();
            ContentValues values = new ContentValues();
            values.put("timestampModified", Long.valueOf(now));
            values.put("applicationMetadata", applicationMetadata);
            getWritableDatabase().update(DATABASE_TABLE, values, "packageName = ?", new String[]{packageName});
            Logger.v(Area.EARN.value() | Area.STORAGE.value(), String.format(Locale.US, "Earning: EarnStateDatabase: updateApplicationMetadata() Updated record for '%1$s' with applicationMetadata:%2$s", packageName, applicationMetadata));
        }
    }

    public void updateStatus(String packageName, Status status) {
        synchronized (this._databaseAccessLock) {
            if (StringUtility.isNullOrEmpty(packageName)) {
                throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
            }
            if (status == null) {
                throw new IllegalArgumentException("'status' cannot be NULL");
            }
            long now = System.currentTimeMillis();
            ContentValues values = new ContentValues();
            values.put("timestampModified", Long.valueOf(now));
            values.put("status", status.name());
            getWritableDatabase().update(DATABASE_TABLE, values, "packageName = ?", new String[]{packageName});
            Logger.v(Area.EARN.value() | Area.STORAGE.value(), String.format(Locale.US, "Earning: EarnStateDatabase: updateStatus() Updated record for '%1$s' with status:%2$s", packageName, status.name()));
        }
    }

    public void updateEarnAmount(String packageName, long amount) {
        synchronized (this._databaseAccessLock) {
            if (StringUtility.isNullOrEmpty(packageName)) {
                throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
            }
            if (amount < 0) {
                throw new IllegalArgumentException("'amount' cannot be less than zero");
            }
            long now = System.currentTimeMillis();
            ContentValues values = new ContentValues();
            values.put("timestampModified", Long.valueOf(now));
            values.put("earnAmount", Long.valueOf(amount));
            getWritableDatabase().update(DATABASE_TABLE, values, "packageName = ?", new String[]{packageName});
            Logger.v(Area.EARN.value() | Area.STORAGE.value(), String.format(Locale.US, "Earning: EarnStateDatabase: updateEarnAmount() Updated record for '%1$s' with amount:%2$d", packageName, Long.valueOf(amount)));
        }
    }

    public void updateEarnState(String packageName, EarnState earnState, String earnSubstate) {
        synchronized (this._databaseAccessLock) {
            if (StringUtility.isNullOrEmpty(packageName)) {
                throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
            }
            if (earnState == null) {
                throw new IllegalArgumentException("'earnState' cannot be NULL");
            }
            if (StringUtility.isNullOrEmpty(earnSubstate)) {
                throw new IllegalArgumentException("'earnSubstate' cannot be NULL or empty");
            }
            long now = System.currentTimeMillis();
            ContentValues values = new ContentValues();
            values.put("timestampModified", Long.valueOf(now));
            values.put("earnState", earnState.name());
            values.put("earnSubstate", earnSubstate);
            getWritableDatabase().update(DATABASE_TABLE, values, "packageName = ?", new String[]{packageName});
            Logger.v(Area.EARN.value() | Area.STORAGE.value(), String.format(Locale.US, "Earning: EarnStateDatabase: updateEarnState() Updated record for '%1$s' with earnState:%2$s and earnSubstate:%3$s", packageName, earnState.name(), earnSubstate));
        }
    }
}
