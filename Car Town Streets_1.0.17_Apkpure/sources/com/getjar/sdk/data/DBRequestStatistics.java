package com.getjar.sdk.data;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteStatement;
import com.getjar.sdk.comm.Request;
import com.getjar.sdk.comm.Result;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.Constants;
import java.util.Locale;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;
/* loaded from: classes.dex */
public class DBRequestStatistics extends SQLiteOpenHelper {
    private static final String _DATABASE_NAME = "GetJarStatisticsDB";
    private static final int _DATABASE_VERSION = 4;
    private static final int _MaxResponseRecordsCap = 600;
    private volatile Object _databaseAccessLock = new Object();
    private static volatile DBRequestStatistics _Instance = null;
    private static final String _DATABASE_TABLE_NAME_REQUESTS = "requests";
    private static final String _DATABASE_TABLE_NAME_RESPONSES = "responses";
    private static final String[] DB_TABLE_NAMES = {_DATABASE_TABLE_NAME_REQUESTS, _DATABASE_TABLE_NAME_RESPONSES};
    private static final String _DB_CREATE_TABLE_REQUESTS = "CREATE TABLE IF NOT EXISTS requests (id INTEGER PRIMARY KEY AUTOINCREMENT, serviceName TEXT NOT NULL, requestType TEXT NOT NULL, requestCount INTEGER NOT NULL, responseCount INTEGER NOT NULL, observedSizeSmallest INTEGER NOT NULL, observedSizeLargest INTEGER NOT NULL);";
    private static final String _DB_CREATE_TABLE_RESPONSES = "CREATE TABLE IF NOT EXISTS responses (id INTEGER PRIMARY KEY AUTOINCREMENT, requestId INTEGER NOT NULL, responseTime INTEGER NOT NULL, responseSize INTEGER NOT NULL,responseCode INTEGER NOT NULL DEFAULT 0);";
    private static final String[] DB_CREATE_TABLE_COMMANDS = {_DB_CREATE_TABLE_REQUESTS, _DB_CREATE_TABLE_RESPONSES};

    private DBRequestStatistics(Context context) {
        super(context, _DATABASE_NAME, (SQLiteDatabase.CursorFactory) null, 4);
    }

    public static synchronized DBRequestStatistics getInstance(Context context) {
        DBRequestStatistics dBRequestStatistics;
        synchronized (DBRequestStatistics.class) {
            if (_Instance == null) {
                _Instance = new DBRequestStatistics(context);
            }
            dBRequestStatistics = _Instance;
        }
        return dBRequestStatistics;
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onCreate(SQLiteDatabase db) {
        for (int i = 0; i < DB_CREATE_TABLE_COMMANDS.length; i++) {
            db.execSQL(DB_CREATE_TABLE_COMMANDS[i]);
        }
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        Logger.i(Area.STORAGE.value() | Area.STATS.value(), String.format(Locale.US, "DBRequestStatistics: onUpgrade() Upgrading DB %1$s from version %2$d to %3$d (deletes all data)", _DATABASE_NAME, Integer.valueOf(oldVersion), Integer.valueOf(newVersion)));
        for (int i = 0; i < DB_TABLE_NAMES.length; i++) {
            db.execSQL("DROP TABLE IF EXISTS " + DB_TABLE_NAMES[i]);
        }
        onCreate(db);
    }

    public long getResponseRecordCount() {
        long simpleQueryForLong;
        synchronized (this._databaseAccessLock) {
            SQLiteStatement dbStatement = getReadableDatabase().compileStatement(String.format(Locale.US, "SELECT count(*) FROM %1$s", _DATABASE_TABLE_NAME_RESPONSES));
            simpleQueryForLong = dbStatement.simpleQueryForLong();
            try {
                dbStatement.close();
            } catch (Exception e) {
            }
        }
        return simpleQueryForLong;
    }

    private void lruCapResponsesAtMaxRecords() {
        synchronized (this._databaseAccessLock) {
            if (getResponseRecordCount() >= 600) {
                Cursor results = getWritableDatabase().query(_DATABASE_TABLE_NAME_RESPONSES, new String[]{Constants.APP_ID}, null, null, null, null, "id DESC");
                Long id = null;
                if (results.moveToPosition(_MaxResponseRecordsCap)) {
                    id = Long.valueOf(results.getLong(0));
                }
                results.close();
                int count = getWritableDatabase().delete(_DATABASE_TABLE_NAME_RESPONSES, String.format(Locale.US, "id <= %1$d", id), null);
                Logger.v(Area.STORAGE.value() | Area.STATS.value(), String.format(Locale.US, "DBRequestStatistics: lruCapResponsesAtMaxRecords() %1$d LRU rows deleted form the response statistics DB", Integer.valueOf(count)));
            }
        }
    }

    public boolean addResponseRecord(Request request, Result response) {
        boolean result;
        if (request == null) {
            throw new IllegalArgumentException("'request' can not be NULL");
        }
        if (response == null) {
            throw new IllegalArgumentException("'response' can not be NULL");
        }
        if (!checkForRequestEntry(request)) {
            upsertRequestRecord(request);
        }
        synchronized (this._databaseAccessLock) {
            Cursor existingRequestStats = getWritableDatabase().query(_DATABASE_TABLE_NAME_REQUESTS, null, "serviceName = ? AND requestType = ?", new String[]{request.getServiceName().name(), request.getRequestType()}, null, null, null);
            if (existingRequestStats.moveToNext()) {
                int requestId = existingRequestStats.getInt(0);
                int responseCount = existingRequestStats.getInt(4);
                ContentValues values = new ContentValues();
                values.put("responseCount", Integer.valueOf(responseCount + 1));
                Logger.v(Area.STORAGE.value() | Area.STATS.value(), String.format(Locale.US, "DBRequestStatistics: addResponseRecord() Updating request stats record [serviceName:%1$s requestType:%2$s responseCount:%3$d]", request.getServiceName().name(), request.getRequestType(), Integer.valueOf(responseCount + 1)));
                getWritableDatabase().update(_DATABASE_TABLE_NAME_REQUESTS, values, "id = " + Integer.toString(requestId), null);
                existingRequestStats.close();
                int responseSizeInBytes = response.getEstimatedResponseSizeInBytes();
                ContentValues values2 = new ContentValues();
                values2.put("requestId", Integer.valueOf(requestId));
                values2.put("responseTime", Integer.valueOf(response.getResponseTime()));
                values2.put("responseSize", Integer.valueOf(responseSizeInBytes));
                values2.put("responseCode", Integer.valueOf(response.getResponseCode()));
                Logger.v(Area.STORAGE.value() | Area.STATS.value(), String.format(Locale.US, "DBRequestStatistics: addResponseRecord() Inserting response stats record [serviceName:%1$s requestType:%2$s responseTime:%3$d responseSize:%4$d responseCode:%5$d]", request.getServiceName().name(), request.getRequestType(), Integer.valueOf(response.getResponseTime()), Integer.valueOf(responseSizeInBytes), Integer.valueOf(response.getResponseCode())));
                result = getWritableDatabase().insert(_DATABASE_TABLE_NAME_RESPONSES, null, values2) != -1;
            } else {
                throw new IllegalStateException("Unable to find or create a request statistics record");
            }
        }
        lruCapResponsesAtMaxRecords();
        return result;
    }

    public boolean upsertRequestRecord(Request request) {
        boolean z;
        if (request == null) {
            throw new IllegalArgumentException("'request' can not be NULL");
        }
        synchronized (this._databaseAccessLock) {
            Cursor existingRequestStats = getWritableDatabase().query(_DATABASE_TABLE_NAME_REQUESTS, null, "serviceName = ? AND requestType = ?", new String[]{request.getServiceName().name(), request.getRequestType()}, null, null, null);
            if (existingRequestStats.moveToNext()) {
                int id = existingRequestStats.getInt(0);
                int requestCount = existingRequestStats.getInt(3);
                int responseCount = existingRequestStats.getInt(4);
                int observedSizeSmallest = existingRequestStats.getInt(5);
                int observedSizeLarges = existingRequestStats.getInt(6);
                int requestSize = request.getEstimatedRequestSizeInBytes();
                ContentValues values = new ContentValues();
                values.put("requestCount", Integer.valueOf(requestCount + 1));
                if (requestSize < observedSizeSmallest) {
                    observedSizeSmallest = requestSize;
                }
                if (requestSize > observedSizeLarges) {
                    observedSizeLarges = requestSize;
                }
                values.put("observedSizeSmallest", Integer.valueOf(observedSizeSmallest));
                values.put("observedSizeLargest", Integer.valueOf(observedSizeLarges));
                Logger.v(Area.STORAGE.value() | Area.STATS.value(), String.format(Locale.US, "DBRequestStatistics: upsertRequestRecord() Updating request stats record [serviceName:%1$s requestType:%2$s requestCount:%3$d responseCount:%4$d observedSizeSmallest:%5$d observedSizeLargest:%6$d]", request.getServiceName().name(), request.getRequestType(), Integer.valueOf(requestCount + 1), Integer.valueOf(responseCount), Integer.valueOf(observedSizeSmallest), Integer.valueOf(observedSizeLarges)));
                z = getWritableDatabase().update(_DATABASE_TABLE_NAME_REQUESTS, values, new StringBuilder().append("id = ").append(Integer.toString(id)).toString(), null) > 0;
                existingRequestStats.close();
            } else {
                int requestSize2 = request.getEstimatedRequestSizeInBytes();
                ContentValues values2 = new ContentValues();
                values2.put("serviceName", request.getServiceName().name());
                values2.put("requestType", request.getRequestType());
                values2.put("requestCount", (Integer) 1);
                values2.put("responseCount", (Integer) 0);
                values2.put("observedSizeSmallest", Integer.valueOf(requestSize2));
                values2.put("observedSizeLargest", Integer.valueOf(requestSize2));
                Logger.v(Area.STORAGE.value() | Area.STATS.value(), String.format(Locale.US, "DBRequestStatistics: upsertRequestRecord() Inserting request stats record [serviceName:%1$s requestType:%2$s requestCount:%3$d responseCount:%4$d observedSizeSmallest:%5$d observedSizeLargest:%6$d]", request.getServiceName().name(), request.getRequestType(), 1, 0, Integer.valueOf(requestSize2), Integer.valueOf(requestSize2)));
                z = getWritableDatabase().insert(_DATABASE_TABLE_NAME_REQUESTS, null, values2) != -1;
                existingRequestStats.close();
            }
        }
        return z;
    }

    public boolean checkForRequestEntry(Request request) {
        boolean z = true;
        if (request == null) {
            throw new IllegalArgumentException("'request' can not be NULL");
        }
        synchronized (this._databaseAccessLock) {
            SQLiteStatement dbStatement = getReadableDatabase().compileStatement(String.format(Locale.US, "SELECT count(*) FROM %1$s WHERE serviceName = ? AND requestType = ?", _DATABASE_TABLE_NAME_REQUESTS));
            dbStatement.bindString(1, request.getServiceName().name());
            dbStatement.bindString(2, request.getRequestType());
            if (dbStatement.simpleQueryForLong() <= 0) {
                z = false;
            }
            try {
                dbStatement.close();
            } catch (Exception e) {
                Logger.e(Area.STORAGE.value() | Area.STATS.value(), "DBRequestStatistics: checkForRequestEntry() SQLiteOpenHelper.close() failed", e);
            }
        }
        return z;
    }

    public Map<String, Float> getAnalyticData() {
        SortedMap<String, Float> resultMap = new TreeMap<>();
        synchronized (this._databaseAccessLock) {
            SQLiteStatement dbStatement = getReadableDatabase().compileStatement(String.format(Locale.US, "SELECT count(requestCount) FROM %1$s", _DATABASE_TABLE_NAME_REQUESTS));
            resultMap.put("Overall: total number of requests", Float.valueOf((float) dbStatement.simpleQueryForLong()));
            try {
                dbStatement.close();
            } catch (Exception e) {
            }
            SQLiteStatement dbStatement2 = getReadableDatabase().compileStatement(String.format(Locale.US, "SELECT count(responseCount) FROM %1$s", _DATABASE_TABLE_NAME_REQUESTS));
            resultMap.put("Overall: total number of responses", Float.valueOf((float) dbStatement2.simpleQueryForLong()));
            try {
                dbStatement2.close();
            } catch (Exception e2) {
            }
            Cursor cursor = getReadableDatabase().query(_DATABASE_TABLE_NAME_RESPONSES, new String[]{"responseCode", "count(responseCode)"}, null, null, "responseCode", null, null);
            while (cursor.moveToNext()) {
                resultMap.put(String.format(Locale.US, "Overall: number of responses [response code: %1$d]", Integer.valueOf(cursor.getInt(0))), Float.valueOf(cursor.getInt(1)));
            }
            try {
                cursor.close();
            } catch (Exception e3) {
            }
            Cursor cursor2 = getReadableDatabase().query(_DATABASE_TABLE_NAME_RESPONSES, new String[]{"min(responseTime)", "max(responseTime)", "avg(responseTime)", "min(responseSize)", "max(responseSize)", "avg(responseSize)"}, null, null, null, null, null);
            if (cursor2.moveToNext()) {
                resultMap.put("Overall: min response time", Float.valueOf(cursor2.getFloat(0)));
                resultMap.put("Overall: max response time", Float.valueOf(cursor2.getFloat(1)));
                resultMap.put("Overall: avg response time", Float.valueOf(cursor2.getFloat(2)));
                resultMap.put("Overall: min response size", Float.valueOf(cursor2.getFloat(3)));
                resultMap.put("Overall: max response size", Float.valueOf(cursor2.getFloat(4)));
                resultMap.put("Overall: avg response size", Float.valueOf(cursor2.getFloat(5)));
            }
            try {
                cursor2.close();
            } catch (Exception e4) {
            }
        }
        return resultMap;
    }
}
