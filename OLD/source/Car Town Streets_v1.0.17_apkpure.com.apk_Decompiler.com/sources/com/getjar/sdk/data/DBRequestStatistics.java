package com.getjar.sdk.data;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import com.getjar.sdk.comm.Request;
import com.getjar.sdk.comm.Result;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import java.util.Locale;

public class DBRequestStatistics extends SQLiteOpenHelper {
    private static final String[] DB_CREATE_TABLE_COMMANDS = {_DB_CREATE_TABLE_REQUESTS, _DB_CREATE_TABLE_RESPONSES};
    private static final String[] DB_TABLE_NAMES = {_DATABASE_TABLE_NAME_REQUESTS, _DATABASE_TABLE_NAME_RESPONSES};
    private static final String _DATABASE_NAME = "GetJarStatisticsDB";
    private static final String _DATABASE_TABLE_NAME_REQUESTS = "requests";
    private static final String _DATABASE_TABLE_NAME_RESPONSES = "responses";
    private static final int _DATABASE_VERSION = 4;
    private static final String _DB_CREATE_TABLE_REQUESTS = "CREATE TABLE IF NOT EXISTS requests (id INTEGER PRIMARY KEY AUTOINCREMENT, serviceName TEXT NOT NULL, requestType TEXT NOT NULL, requestCount INTEGER NOT NULL, responseCount INTEGER NOT NULL, observedSizeSmallest INTEGER NOT NULL, observedSizeLargest INTEGER NOT NULL);";
    private static final String _DB_CREATE_TABLE_RESPONSES = "CREATE TABLE IF NOT EXISTS responses (id INTEGER PRIMARY KEY AUTOINCREMENT, requestId INTEGER NOT NULL, responseTime INTEGER NOT NULL, responseSize INTEGER NOT NULL,responseCode INTEGER NOT NULL DEFAULT 0);";
    private static volatile DBRequestStatistics _Instance = null;
    private static final int _MaxResponseRecordsCap = 600;
    private volatile Object _databaseAccessLock = new Object();

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

    public void onCreate(SQLiteDatabase db) {
        for (String execSQL : DB_CREATE_TABLE_COMMANDS) {
            db.execSQL(execSQL);
        }
    }

    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        Logger.i(Area.STORAGE.value() | Area.STATS.value(), String.format(Locale.US, "DBRequestStatistics: onUpgrade() Upgrading DB %1$s from version %2$d to %3$d (deletes all data)", new Object[]{_DATABASE_NAME, Integer.valueOf(oldVersion), Integer.valueOf(newVersion)}));
        for (int i = 0; i < DB_TABLE_NAMES.length; i++) {
            db.execSQL("DROP TABLE IF EXISTS " + DB_TABLE_NAMES[i]);
        }
        onCreate(db);
    }

    /* JADX WARNING: Unknown top exception splitter block from list: {B:9:0x0023=Splitter:B:9:0x0023, B:16:0x002a=Splitter:B:16:0x002a} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public long getResponseRecordCount() {
        /*
            r8 = this;
            java.lang.Object r2 = r8._databaseAccessLock
            monitor-enter(r2)
            android.database.sqlite.SQLiteDatabase r1 = r8.getReadableDatabase()     // Catch:{ all -> 0x002b }
            java.util.Locale r3 = java.util.Locale.US     // Catch:{ all -> 0x002b }
            java.lang.String r4 = "SELECT count(*) FROM %1$s"
            r5 = 1
            java.lang.Object[] r5 = new java.lang.Object[r5]     // Catch:{ all -> 0x002b }
            r6 = 0
            java.lang.String r7 = "responses"
            r5[r6] = r7     // Catch:{ all -> 0x002b }
            java.lang.String r3 = java.lang.String.format(r3, r4, r5)     // Catch:{ all -> 0x002b }
            android.database.sqlite.SQLiteStatement r0 = r1.compileStatement(r3)     // Catch:{ all -> 0x002b }
            long r3 = r0.simpleQueryForLong()     // Catch:{ all -> 0x0025 }
            r0.close()     // Catch:{ Exception -> 0x002e }
            r0 = 0
        L_0x0023:
            monitor-exit(r2)     // Catch:{ all -> 0x002b }
            return r3
        L_0x0025:
            r1 = move-exception
            r0.close()     // Catch:{ Exception -> 0x0030 }
            r0 = 0
        L_0x002a:
            throw r1     // Catch:{ all -> 0x002b }
        L_0x002b:
            r1 = move-exception
            monitor-exit(r2)     // Catch:{ all -> 0x002b }
            throw r1
        L_0x002e:
            r1 = move-exception
            goto L_0x0023
        L_0x0030:
            r3 = move-exception
            goto L_0x002a
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.DBRequestStatistics.getResponseRecordCount():long");
    }

    /* JADX INFO: finally extract failed */
    /* JADX WARNING: No exception handlers in catch block: Catch:{  } */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private void lruCapResponsesAtMaxRecords() {
        /*
            r12 = this;
            java.lang.Object r11 = r12._databaseAccessLock
            monitor-enter(r11)
            long r0 = r12.getResponseRecordCount()     // Catch:{ all -> 0x0079 }
            r2 = 600(0x258, double:2.964E-321)
            int r0 = (r0 > r2 ? 1 : (r0 == r2 ? 0 : -1))
            if (r0 >= 0) goto L_0x000f
            monitor-exit(r11)     // Catch:{ all -> 0x0079 }
        L_0x000e:
            return
        L_0x000f:
            android.database.sqlite.SQLiteDatabase r0 = r12.getWritableDatabase()     // Catch:{ all -> 0x0079 }
            java.lang.String r1 = "responses"
            r2 = 1
            java.lang.String[] r2 = new java.lang.String[r2]     // Catch:{ all -> 0x0079 }
            r3 = 0
            java.lang.String r4 = "id"
            r2[r3] = r4     // Catch:{ all -> 0x0079 }
            r3 = 0
            r4 = 0
            r5 = 0
            r6 = 0
            java.lang.String r7 = "id DESC"
            android.database.Cursor r10 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch:{ all -> 0x0079 }
            r9 = 0
            r0 = 600(0x258, float:8.41E-43)
            boolean r0 = r10.moveToPosition(r0)     // Catch:{ all -> 0x007c }
            if (r0 == 0) goto L_0x0039
            r0 = 0
            long r0 = r10.getLong(r0)     // Catch:{ all -> 0x007c }
            java.lang.Long r9 = java.lang.Long.valueOf(r0)     // Catch:{ all -> 0x007c }
        L_0x0039:
            r10.close()     // Catch:{ all -> 0x0079 }
            android.database.sqlite.SQLiteDatabase r0 = r12.getWritableDatabase()     // Catch:{ all -> 0x0079 }
            java.lang.String r1 = "responses"
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
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.STATS     // Catch:{ all -> 0x0079 }
            long r2 = r2.value()     // Catch:{ all -> 0x0079 }
            long r0 = r0 | r2
            java.util.Locale r2 = java.util.Locale.US     // Catch:{ all -> 0x0079 }
            java.lang.String r3 = "DBRequestStatistics: lruCapResponsesAtMaxRecords() %1$d LRU rows deleted form the response statistics DB"
            r4 = 1
            java.lang.Object[] r4 = new java.lang.Object[r4]     // Catch:{ all -> 0x0079 }
            r5 = 0
            java.lang.Integer r6 = java.lang.Integer.valueOf(r8)     // Catch:{ all -> 0x0079 }
            r4[r5] = r6     // Catch:{ all -> 0x0079 }
            java.lang.String r2 = java.lang.String.format(r2, r3, r4)     // Catch:{ all -> 0x0079 }
            com.getjar.sdk.logging.Logger.v(r0, r2)     // Catch:{ all -> 0x0079 }
            monitor-exit(r11)     // Catch:{ all -> 0x0079 }
            goto L_0x000e
        L_0x0079:
            r0 = move-exception
            monitor-exit(r11)     // Catch:{ all -> 0x0079 }
            throw r0
        L_0x007c:
            r0 = move-exception
            r10.close()     // Catch:{ all -> 0x0079 }
            throw r0     // Catch:{ all -> 0x0079 }
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.DBRequestStatistics.lruCapResponsesAtMaxRecords():void");
    }

    public boolean addResponseRecord(Request request, Result response) {
        boolean result;
        if (request == null) {
            throw new IllegalArgumentException("'request' can not be NULL");
        } else if (response == null) {
            throw new IllegalArgumentException("'response' can not be NULL");
        } else {
            if (!checkForRequestEntry(request)) {
                upsertRequestRecord(request);
            }
            synchronized (this._databaseAccessLock) {
                Cursor existingRequestStats = getWritableDatabase().query(_DATABASE_TABLE_NAME_REQUESTS, (String[]) null, "serviceName = ? AND requestType = ?", new String[]{request.getServiceName().name(), request.getRequestType()}, (String) null, (String) null, (String) null);
                try {
                    if (existingRequestStats.moveToNext()) {
                        int requestId = existingRequestStats.getInt(0);
                        int responseCount = existingRequestStats.getInt(4);
                        ContentValues values = new ContentValues();
                        values.put("responseCount", Integer.valueOf(responseCount + 1));
                        Logger.v(Area.STORAGE.value() | Area.STATS.value(), String.format(Locale.US, "DBRequestStatistics: addResponseRecord() Updating request stats record [serviceName:%1$s requestType:%2$s responseCount:%3$d]", new Object[]{request.getServiceName().name(), request.getRequestType(), Integer.valueOf(responseCount + 1)}));
                        getWritableDatabase().update(_DATABASE_TABLE_NAME_REQUESTS, values, "id = " + Integer.toString(requestId), (String[]) null);
                        existingRequestStats.close();
                        int responseSizeInBytes = response.getEstimatedResponseSizeInBytes();
                        ContentValues values2 = new ContentValues();
                        values2.put("requestId", Integer.valueOf(requestId));
                        values2.put("responseTime", Integer.valueOf(response.getResponseTime()));
                        values2.put("responseSize", Integer.valueOf(responseSizeInBytes));
                        values2.put("responseCode", Integer.valueOf(response.getResponseCode()));
                        Logger.v(Area.STORAGE.value() | Area.STATS.value(), String.format(Locale.US, "DBRequestStatistics: addResponseRecord() Inserting response stats record [serviceName:%1$s requestType:%2$s responseTime:%3$d responseSize:%4$d responseCode:%5$d]", new Object[]{request.getServiceName().name(), request.getRequestType(), Integer.valueOf(response.getResponseTime()), Integer.valueOf(responseSizeInBytes), Integer.valueOf(response.getResponseCode())}));
                        result = getWritableDatabase().insert(_DATABASE_TABLE_NAME_RESPONSES, (String) null, values2) != -1;
                    } else {
                        throw new IllegalStateException("Unable to find or create a request statistics record");
                    }
                } catch (Throwable th) {
                    existingRequestStats.close();
                    throw th;
                }
            }
            lruCapResponsesAtMaxRecords();
            return result;
        }
    }

    /* JADX WARNING: Unknown top exception splitter block from list: {B:28:0x01b1=Splitter:B:28:0x01b1, B:18:0x00f9=Splitter:B:18:0x00f9} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean upsertRequestRecord(com.getjar.sdk.comm.Request r19) {
        /*
            r18 = this;
            if (r19 != 0) goto L_0x000a
            java.lang.IllegalArgumentException r1 = new java.lang.IllegalArgumentException
            java.lang.String r2 = "'request' can not be NULL"
            r1.<init>(r2)
            throw r1
        L_0x000a:
            r0 = r18
            java.lang.Object r0 = r0._databaseAccessLock
            r17 = r0
            monitor-enter(r17)
            android.database.sqlite.SQLiteDatabase r1 = r18.getWritableDatabase()     // Catch:{ all -> 0x01b8 }
            java.lang.String r2 = "requests"
            r3 = 0
            java.lang.String r4 = "serviceName = ? AND requestType = ?"
            r5 = 2
            java.lang.String[] r5 = new java.lang.String[r5]     // Catch:{ all -> 0x01b8 }
            r6 = 0
            com.getjar.sdk.comm.Request$ServiceName r7 = r19.getServiceName()     // Catch:{ all -> 0x01b8 }
            java.lang.String r7 = r7.name()     // Catch:{ all -> 0x01b8 }
            r5[r6] = r7     // Catch:{ all -> 0x01b8 }
            r6 = 1
            java.lang.String r7 = r19.getRequestType()     // Catch:{ all -> 0x01b8 }
            r5[r6] = r7     // Catch:{ all -> 0x01b8 }
            r6 = 0
            r7 = 0
            r8 = 0
            android.database.Cursor r9 = r1.query(r2, r3, r4, r5, r6, r7, r8)     // Catch:{ all -> 0x01b8 }
            boolean r1 = r9.moveToNext()     // Catch:{ all -> 0x01bd }
            if (r1 == 0) goto L_0x0101
            r1 = 0
            int r10 = r9.getInt(r1)     // Catch:{ all -> 0x01bd }
            r1 = 3
            int r13 = r9.getInt(r1)     // Catch:{ all -> 0x01bd }
            r1 = 4
            int r15 = r9.getInt(r1)     // Catch:{ all -> 0x01bd }
            r1 = 5
            int r12 = r9.getInt(r1)     // Catch:{ all -> 0x01bd }
            r1 = 6
            int r11 = r9.getInt(r1)     // Catch:{ all -> 0x01bd }
            int r14 = r19.getEstimatedRequestSizeInBytes()     // Catch:{ all -> 0x01bd }
            android.content.ContentValues r16 = new android.content.ContentValues     // Catch:{ all -> 0x01bd }
            r16.<init>()     // Catch:{ all -> 0x01bd }
            java.lang.String r1 = "requestCount"
            int r2 = r13 + 1
            java.lang.Integer r2 = java.lang.Integer.valueOf(r2)     // Catch:{ all -> 0x01bd }
            r0 = r16
            r0.put(r1, r2)     // Catch:{ all -> 0x01bd }
            if (r14 >= r12) goto L_0x006e
            r12 = r14
        L_0x006e:
            if (r14 <= r11) goto L_0x0071
            r11 = r14
        L_0x0071:
            java.lang.String r1 = "observedSizeSmallest"
            java.lang.Integer r2 = java.lang.Integer.valueOf(r12)     // Catch:{ all -> 0x01bd }
            r0 = r16
            r0.put(r1, r2)     // Catch:{ all -> 0x01bd }
            java.lang.String r1 = "observedSizeLargest"
            java.lang.Integer r2 = java.lang.Integer.valueOf(r11)     // Catch:{ all -> 0x01bd }
            r0 = r16
            r0.put(r1, r2)     // Catch:{ all -> 0x01bd }
            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x01bd }
            long r1 = r1.value()     // Catch:{ all -> 0x01bd }
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.STATS     // Catch:{ all -> 0x01bd }
            long r3 = r3.value()     // Catch:{ all -> 0x01bd }
            long r1 = r1 | r3
            java.util.Locale r3 = java.util.Locale.US     // Catch:{ all -> 0x01bd }
            java.lang.String r4 = "DBRequestStatistics: upsertRequestRecord() Updating request stats record [serviceName:%1$s requestType:%2$s requestCount:%3$d responseCount:%4$d observedSizeSmallest:%5$d observedSizeLargest:%6$d]"
            r5 = 6
            java.lang.Object[] r5 = new java.lang.Object[r5]     // Catch:{ all -> 0x01bd }
            r6 = 0
            com.getjar.sdk.comm.Request$ServiceName r7 = r19.getServiceName()     // Catch:{ all -> 0x01bd }
            java.lang.String r7 = r7.name()     // Catch:{ all -> 0x01bd }
            r5[r6] = r7     // Catch:{ all -> 0x01bd }
            r6 = 1
            java.lang.String r7 = r19.getRequestType()     // Catch:{ all -> 0x01bd }
            r5[r6] = r7     // Catch:{ all -> 0x01bd }
            r6 = 2
            int r7 = r13 + 1
            java.lang.Integer r7 = java.lang.Integer.valueOf(r7)     // Catch:{ all -> 0x01bd }
            r5[r6] = r7     // Catch:{ all -> 0x01bd }
            r6 = 3
            java.lang.Integer r7 = java.lang.Integer.valueOf(r15)     // Catch:{ all -> 0x01bd }
            r5[r6] = r7     // Catch:{ all -> 0x01bd }
            r6 = 4
            java.lang.Integer r7 = java.lang.Integer.valueOf(r12)     // Catch:{ all -> 0x01bd }
            r5[r6] = r7     // Catch:{ all -> 0x01bd }
            r6 = 5
            java.lang.Integer r7 = java.lang.Integer.valueOf(r11)     // Catch:{ all -> 0x01bd }
            r5[r6] = r7     // Catch:{ all -> 0x01bd }
            java.lang.String r3 = java.lang.String.format(r3, r4, r5)     // Catch:{ all -> 0x01bd }
            com.getjar.sdk.logging.Logger.v(r1, r3)     // Catch:{ all -> 0x01bd }
            android.database.sqlite.SQLiteDatabase r1 = r18.getWritableDatabase()     // Catch:{ all -> 0x01bd }
            java.lang.String r2 = "requests"
            java.lang.StringBuilder r3 = new java.lang.StringBuilder     // Catch:{ all -> 0x01bd }
            r3.<init>()     // Catch:{ all -> 0x01bd }
            java.lang.String r4 = "id = "
            java.lang.StringBuilder r3 = r3.append(r4)     // Catch:{ all -> 0x01bd }
            java.lang.String r4 = java.lang.Integer.toString(r10)     // Catch:{ all -> 0x01bd }
            java.lang.StringBuilder r3 = r3.append(r4)     // Catch:{ all -> 0x01bd }
            java.lang.String r3 = r3.toString()     // Catch:{ all -> 0x01bd }
            r4 = 0
            r0 = r16
            int r1 = r1.update(r2, r0, r3, r4)     // Catch:{ all -> 0x01bd }
            if (r1 <= 0) goto L_0x00ff
            r1 = 1
        L_0x00f9:
            r9.close()     // Catch:{ all -> 0x01b8 }
            r9 = 0
            monitor-exit(r17)     // Catch:{ all -> 0x01b8 }
        L_0x00fe:
            return r1
        L_0x00ff:
            r1 = 0
            goto L_0x00f9
        L_0x0101:
            int r14 = r19.getEstimatedRequestSizeInBytes()     // Catch:{ all -> 0x01bd }
            android.content.ContentValues r16 = new android.content.ContentValues     // Catch:{ all -> 0x01bd }
            r16.<init>()     // Catch:{ all -> 0x01bd }
            java.lang.String r1 = "serviceName"
            com.getjar.sdk.comm.Request$ServiceName r2 = r19.getServiceName()     // Catch:{ all -> 0x01bd }
            java.lang.String r2 = r2.name()     // Catch:{ all -> 0x01bd }
            r0 = r16
            r0.put(r1, r2)     // Catch:{ all -> 0x01bd }
            java.lang.String r1 = "requestType"
            java.lang.String r2 = r19.getRequestType()     // Catch:{ all -> 0x01bd }
            r0 = r16
            r0.put(r1, r2)     // Catch:{ all -> 0x01bd }
            java.lang.String r1 = "requestCount"
            r2 = 1
            java.lang.Integer r2 = java.lang.Integer.valueOf(r2)     // Catch:{ all -> 0x01bd }
            r0 = r16
            r0.put(r1, r2)     // Catch:{ all -> 0x01bd }
            java.lang.String r1 = "responseCount"
            r2 = 0
            java.lang.Integer r2 = java.lang.Integer.valueOf(r2)     // Catch:{ all -> 0x01bd }
            r0 = r16
            r0.put(r1, r2)     // Catch:{ all -> 0x01bd }
            java.lang.String r1 = "observedSizeSmallest"
            java.lang.Integer r2 = java.lang.Integer.valueOf(r14)     // Catch:{ all -> 0x01bd }
            r0 = r16
            r0.put(r1, r2)     // Catch:{ all -> 0x01bd }
            java.lang.String r1 = "observedSizeLargest"
            java.lang.Integer r2 = java.lang.Integer.valueOf(r14)     // Catch:{ all -> 0x01bd }
            r0 = r16
            r0.put(r1, r2)     // Catch:{ all -> 0x01bd }
            com.getjar.sdk.logging.Area r1 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x01bd }
            long r1 = r1.value()     // Catch:{ all -> 0x01bd }
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.STATS     // Catch:{ all -> 0x01bd }
            long r3 = r3.value()     // Catch:{ all -> 0x01bd }
            long r1 = r1 | r3
            java.util.Locale r3 = java.util.Locale.US     // Catch:{ all -> 0x01bd }
            java.lang.String r4 = "DBRequestStatistics: upsertRequestRecord() Inserting request stats record [serviceName:%1$s requestType:%2$s requestCount:%3$d responseCount:%4$d observedSizeSmallest:%5$d observedSizeLargest:%6$d]"
            r5 = 6
            java.lang.Object[] r5 = new java.lang.Object[r5]     // Catch:{ all -> 0x01bd }
            r6 = 0
            com.getjar.sdk.comm.Request$ServiceName r7 = r19.getServiceName()     // Catch:{ all -> 0x01bd }
            java.lang.String r7 = r7.name()     // Catch:{ all -> 0x01bd }
            r5[r6] = r7     // Catch:{ all -> 0x01bd }
            r6 = 1
            java.lang.String r7 = r19.getRequestType()     // Catch:{ all -> 0x01bd }
            r5[r6] = r7     // Catch:{ all -> 0x01bd }
            r6 = 2
            r7 = 1
            java.lang.Integer r7 = java.lang.Integer.valueOf(r7)     // Catch:{ all -> 0x01bd }
            r5[r6] = r7     // Catch:{ all -> 0x01bd }
            r6 = 3
            r7 = 0
            java.lang.Integer r7 = java.lang.Integer.valueOf(r7)     // Catch:{ all -> 0x01bd }
            r5[r6] = r7     // Catch:{ all -> 0x01bd }
            r6 = 4
            java.lang.Integer r7 = java.lang.Integer.valueOf(r14)     // Catch:{ all -> 0x01bd }
            r5[r6] = r7     // Catch:{ all -> 0x01bd }
            r6 = 5
            java.lang.Integer r7 = java.lang.Integer.valueOf(r14)     // Catch:{ all -> 0x01bd }
            r5[r6] = r7     // Catch:{ all -> 0x01bd }
            java.lang.String r3 = java.lang.String.format(r3, r4, r5)     // Catch:{ all -> 0x01bd }
            com.getjar.sdk.logging.Logger.v(r1, r3)     // Catch:{ all -> 0x01bd }
            android.database.sqlite.SQLiteDatabase r1 = r18.getWritableDatabase()     // Catch:{ all -> 0x01bd }
            java.lang.String r2 = "requests"
            r3 = 0
            r0 = r16
            long r1 = r1.insert(r2, r3, r0)     // Catch:{ all -> 0x01bd }
            r3 = -1
            int r1 = (r1 > r3 ? 1 : (r1 == r3 ? 0 : -1))
            if (r1 == 0) goto L_0x01bb
            r1 = 1
        L_0x01b1:
            r9.close()     // Catch:{ all -> 0x01b8 }
            r9 = 0
            monitor-exit(r17)     // Catch:{ all -> 0x01b8 }
            goto L_0x00fe
        L_0x01b8:
            r1 = move-exception
            monitor-exit(r17)     // Catch:{ all -> 0x01b8 }
            throw r1
        L_0x01bb:
            r1 = 0
            goto L_0x01b1
        L_0x01bd:
            r1 = move-exception
            r9.close()     // Catch:{ all -> 0x01b8 }
            r9 = 0
            throw r1     // Catch:{ all -> 0x01b8 }
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.DBRequestStatistics.upsertRequestRecord(com.getjar.sdk.comm.Request):boolean");
    }

    /* JADX WARNING: Unknown top exception splitter block from list: {B:13:0x0045=Splitter:B:13:0x0045, B:16:0x0049=Splitter:B:16:0x0049, B:29:0x0069=Splitter:B:29:0x0069} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean checkForRequestEntry(com.getjar.sdk.comm.Request r12) {
        /*
            r11 = this;
            r3 = 0
            r2 = 1
            if (r12 != 0) goto L_0x000c
            java.lang.IllegalArgumentException r2 = new java.lang.IllegalArgumentException
            java.lang.String r3 = "'request' can not be NULL"
            r2.<init>(r3)
            throw r2
        L_0x000c:
            java.lang.Object r4 = r11._databaseAccessLock
            monitor-enter(r4)
            android.database.sqlite.SQLiteDatabase r5 = r11.getReadableDatabase()     // Catch:{ all -> 0x0061 }
            java.util.Locale r6 = java.util.Locale.US     // Catch:{ all -> 0x0061 }
            java.lang.String r7 = "SELECT count(*) FROM %1$s WHERE serviceName = ? AND requestType = ?"
            r8 = 1
            java.lang.Object[] r8 = new java.lang.Object[r8]     // Catch:{ all -> 0x0061 }
            r9 = 0
            java.lang.String r10 = "requests"
            r8[r9] = r10     // Catch:{ all -> 0x0061 }
            java.lang.String r6 = java.lang.String.format(r6, r7, r8)     // Catch:{ all -> 0x0061 }
            android.database.sqlite.SQLiteStatement r0 = r5.compileStatement(r6)     // Catch:{ all -> 0x0061 }
            r5 = 1
            com.getjar.sdk.comm.Request$ServiceName r6 = r12.getServiceName()     // Catch:{ all -> 0x0064 }
            java.lang.String r6 = r6.name()     // Catch:{ all -> 0x0064 }
            r0.bindString(r5, r6)     // Catch:{ all -> 0x0064 }
            r5 = 2
            java.lang.String r6 = r12.getRequestType()     // Catch:{ all -> 0x0064 }
            r0.bindString(r5, r6)     // Catch:{ all -> 0x0064 }
            long r5 = r0.simpleQueryForLong()     // Catch:{ all -> 0x0064 }
            r7 = 0
            int r5 = (r5 > r7 ? 1 : (r5 == r7 ? 0 : -1))
            if (r5 <= 0) goto L_0x004b
        L_0x0045:
            r0.close()     // Catch:{ Exception -> 0x004d }
            r0 = 0
        L_0x0049:
            monitor-exit(r4)     // Catch:{ all -> 0x0061 }
            return r2
        L_0x004b:
            r2 = r3
            goto L_0x0045
        L_0x004d:
            r1 = move-exception
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x0061 }
            long r5 = r3.value()     // Catch:{ all -> 0x0061 }
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.STATS     // Catch:{ all -> 0x0061 }
            long r7 = r3.value()     // Catch:{ all -> 0x0061 }
            long r5 = r5 | r7
            java.lang.String r3 = "DBRequestStatistics: checkForRequestEntry() SQLiteOpenHelper.close() failed"
            com.getjar.sdk.logging.Logger.e(r5, r3, r1)     // Catch:{ all -> 0x0061 }
            goto L_0x0049
        L_0x0061:
            r2 = move-exception
            monitor-exit(r4)     // Catch:{ all -> 0x0061 }
            throw r2
        L_0x0064:
            r2 = move-exception
            r0.close()     // Catch:{ Exception -> 0x006a }
            r0 = 0
        L_0x0069:
            throw r2     // Catch:{ all -> 0x0061 }
        L_0x006a:
            r1 = move-exception
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x0061 }
            long r5 = r3.value()     // Catch:{ all -> 0x0061 }
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.STATS     // Catch:{ all -> 0x0061 }
            long r7 = r3.value()     // Catch:{ all -> 0x0061 }
            long r5 = r5 | r7
            java.lang.String r3 = "DBRequestStatistics: checkForRequestEntry() SQLiteOpenHelper.close() failed"
            com.getjar.sdk.logging.Logger.e(r5, r3, r1)     // Catch:{ all -> 0x0061 }
            goto L_0x0069
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.DBRequestStatistics.checkForRequestEntry(com.getjar.sdk.comm.Request):boolean");
    }

    /* JADX WARNING: Unknown top exception splitter block from list: {B:10:0x0032=Splitter:B:10:0x0032, B:37:0x00b2=Splitter:B:37:0x00b2, B:64:0x0152=Splitter:B:64:0x0152, B:43:0x00b8=Splitter:B:43:0x00b8, B:28:0x00a9=Splitter:B:28:0x00a9, B:57:0x014b=Splitter:B:57:0x014b, B:18:0x005c=Splitter:B:18:0x005c, B:48:0x00bd=Splitter:B:48:0x00bd} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public java.util.Map<java.lang.String, java.lang.Float> getAnalyticData() {
        /*
            r12 = this;
            java.util.TreeMap r10 = new java.util.TreeMap
            r10.<init>()
            java.lang.Object r11 = r12._databaseAccessLock
            monitor-enter(r11)
            android.database.sqlite.SQLiteDatabase r0 = r12.getReadableDatabase()     // Catch:{ all -> 0x00aa }
            java.util.Locale r1 = java.util.Locale.US     // Catch:{ all -> 0x00aa }
            java.lang.String r2 = "SELECT count(requestCount) FROM %1$s"
            r3 = 1
            java.lang.Object[] r3 = new java.lang.Object[r3]     // Catch:{ all -> 0x00aa }
            r4 = 0
            java.lang.String r5 = "requests"
            r3[r4] = r5     // Catch:{ all -> 0x00aa }
            java.lang.String r1 = java.lang.String.format(r1, r2, r3)     // Catch:{ all -> 0x00aa }
            android.database.sqlite.SQLiteStatement r9 = r0.compileStatement(r1)     // Catch:{ all -> 0x00aa }
            java.lang.String r0 = "Overall: total number of requests"
            long r1 = r9.simpleQueryForLong()     // Catch:{ all -> 0x00ad }
            float r1 = (float) r1     // Catch:{ all -> 0x00ad }
            java.lang.Float r1 = java.lang.Float.valueOf(r1)     // Catch:{ all -> 0x00ad }
            r10.put(r0, r1)     // Catch:{ all -> 0x00ad }
            r9.close()     // Catch:{ Exception -> 0x0153 }
            r9 = 0
        L_0x0032:
            android.database.sqlite.SQLiteDatabase r0 = r12.getReadableDatabase()     // Catch:{ all -> 0x00aa }
            java.util.Locale r1 = java.util.Locale.US     // Catch:{ all -> 0x00aa }
            java.lang.String r2 = "SELECT count(responseCount) FROM %1$s"
            r3 = 1
            java.lang.Object[] r3 = new java.lang.Object[r3]     // Catch:{ all -> 0x00aa }
            r4 = 0
            java.lang.String r5 = "requests"
            r3[r4] = r5     // Catch:{ all -> 0x00aa }
            java.lang.String r1 = java.lang.String.format(r1, r2, r3)     // Catch:{ all -> 0x00aa }
            android.database.sqlite.SQLiteStatement r9 = r0.compileStatement(r1)     // Catch:{ all -> 0x00aa }
            java.lang.String r0 = "Overall: total number of responses"
            long r1 = r9.simpleQueryForLong()     // Catch:{ all -> 0x00b3 }
            float r1 = (float) r1     // Catch:{ all -> 0x00b3 }
            java.lang.Float r1 = java.lang.Float.valueOf(r1)     // Catch:{ all -> 0x00b3 }
            r10.put(r0, r1)     // Catch:{ all -> 0x00b3 }
            r9.close()     // Catch:{ Exception -> 0x0159 }
            r9 = 0
        L_0x005c:
            android.database.sqlite.SQLiteDatabase r0 = r12.getReadableDatabase()     // Catch:{ all -> 0x00aa }
            java.lang.String r1 = "responses"
            r2 = 2
            java.lang.String[] r2 = new java.lang.String[r2]     // Catch:{ all -> 0x00aa }
            r3 = 0
            java.lang.String r4 = "responseCode"
            r2[r3] = r4     // Catch:{ all -> 0x00aa }
            r3 = 1
            java.lang.String r4 = "count(responseCode)"
            r2[r3] = r4     // Catch:{ all -> 0x00aa }
            r3 = 0
            r4 = 0
            java.lang.String r5 = "responseCode"
            r6 = 0
            r7 = 0
            android.database.Cursor r8 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch:{ all -> 0x00aa }
        L_0x0079:
            boolean r0 = r8.moveToNext()     // Catch:{ all -> 0x00a4 }
            if (r0 == 0) goto L_0x00b9
            java.util.Locale r0 = java.util.Locale.US     // Catch:{ all -> 0x00a4 }
            java.lang.String r1 = "Overall: number of responses [response code: %1$d]"
            r2 = 1
            java.lang.Object[] r2 = new java.lang.Object[r2]     // Catch:{ all -> 0x00a4 }
            r3 = 0
            r4 = 0
            int r4 = r8.getInt(r4)     // Catch:{ all -> 0x00a4 }
            java.lang.Integer r4 = java.lang.Integer.valueOf(r4)     // Catch:{ all -> 0x00a4 }
            r2[r3] = r4     // Catch:{ all -> 0x00a4 }
            java.lang.String r0 = java.lang.String.format(r0, r1, r2)     // Catch:{ all -> 0x00a4 }
            r1 = 1
            int r1 = r8.getInt(r1)     // Catch:{ all -> 0x00a4 }
            float r1 = (float) r1     // Catch:{ all -> 0x00a4 }
            java.lang.Float r1 = java.lang.Float.valueOf(r1)     // Catch:{ all -> 0x00a4 }
            r10.put(r0, r1)     // Catch:{ all -> 0x00a4 }
            goto L_0x0079
        L_0x00a4:
            r0 = move-exception
            r8.close()     // Catch:{ Exception -> 0x0162 }
            r8 = 0
        L_0x00a9:
            throw r0     // Catch:{ all -> 0x00aa }
        L_0x00aa:
            r0 = move-exception
            monitor-exit(r11)     // Catch:{ all -> 0x00aa }
            throw r0
        L_0x00ad:
            r0 = move-exception
            r9.close()     // Catch:{ Exception -> 0x0156 }
            r9 = 0
        L_0x00b2:
            throw r0     // Catch:{ all -> 0x00aa }
        L_0x00b3:
            r0 = move-exception
            r9.close()     // Catch:{ Exception -> 0x015c }
            r9 = 0
        L_0x00b8:
            throw r0     // Catch:{ all -> 0x00aa }
        L_0x00b9:
            r8.close()     // Catch:{ Exception -> 0x015f }
            r8 = 0
        L_0x00bd:
            android.database.sqlite.SQLiteDatabase r0 = r12.getReadableDatabase()     // Catch:{ all -> 0x00aa }
            java.lang.String r1 = "responses"
            r2 = 6
            java.lang.String[] r2 = new java.lang.String[r2]     // Catch:{ all -> 0x00aa }
            r3 = 0
            java.lang.String r4 = "min(responseTime)"
            r2[r3] = r4     // Catch:{ all -> 0x00aa }
            r3 = 1
            java.lang.String r4 = "max(responseTime)"
            r2[r3] = r4     // Catch:{ all -> 0x00aa }
            r3 = 2
            java.lang.String r4 = "avg(responseTime)"
            r2[r3] = r4     // Catch:{ all -> 0x00aa }
            r3 = 3
            java.lang.String r4 = "min(responseSize)"
            r2[r3] = r4     // Catch:{ all -> 0x00aa }
            r3 = 4
            java.lang.String r4 = "max(responseSize)"
            r2[r3] = r4     // Catch:{ all -> 0x00aa }
            r3 = 5
            java.lang.String r4 = "avg(responseSize)"
            r2[r3] = r4     // Catch:{ all -> 0x00aa }
            r3 = 0
            r4 = 0
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r8 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch:{ all -> 0x00aa }
            boolean r0 = r8.moveToNext()     // Catch:{ all -> 0x014d }
            if (r0 == 0) goto L_0x0147
            java.lang.String r0 = "Overall: min response time"
            r1 = 0
            float r1 = r8.getFloat(r1)     // Catch:{ all -> 0x014d }
            java.lang.Float r1 = java.lang.Float.valueOf(r1)     // Catch:{ all -> 0x014d }
            r10.put(r0, r1)     // Catch:{ all -> 0x014d }
            java.lang.String r0 = "Overall: max response time"
            r1 = 1
            float r1 = r8.getFloat(r1)     // Catch:{ all -> 0x014d }
            java.lang.Float r1 = java.lang.Float.valueOf(r1)     // Catch:{ all -> 0x014d }
            r10.put(r0, r1)     // Catch:{ all -> 0x014d }
            java.lang.String r0 = "Overall: avg response time"
            r1 = 2
            float r1 = r8.getFloat(r1)     // Catch:{ all -> 0x014d }
            java.lang.Float r1 = java.lang.Float.valueOf(r1)     // Catch:{ all -> 0x014d }
            r10.put(r0, r1)     // Catch:{ all -> 0x014d }
            java.lang.String r0 = "Overall: min response size"
            r1 = 3
            float r1 = r8.getFloat(r1)     // Catch:{ all -> 0x014d }
            java.lang.Float r1 = java.lang.Float.valueOf(r1)     // Catch:{ all -> 0x014d }
            r10.put(r0, r1)     // Catch:{ all -> 0x014d }
            java.lang.String r0 = "Overall: max response size"
            r1 = 4
            float r1 = r8.getFloat(r1)     // Catch:{ all -> 0x014d }
            java.lang.Float r1 = java.lang.Float.valueOf(r1)     // Catch:{ all -> 0x014d }
            r10.put(r0, r1)     // Catch:{ all -> 0x014d }
            java.lang.String r0 = "Overall: avg response size"
            r1 = 5
            float r1 = r8.getFloat(r1)     // Catch:{ all -> 0x014d }
            java.lang.Float r1 = java.lang.Float.valueOf(r1)     // Catch:{ all -> 0x014d }
            r10.put(r0, r1)     // Catch:{ all -> 0x014d }
        L_0x0147:
            r8.close()     // Catch:{ Exception -> 0x0165 }
            r8 = 0
        L_0x014b:
            monitor-exit(r11)     // Catch:{ all -> 0x00aa }
            return r10
        L_0x014d:
            r0 = move-exception
            r8.close()     // Catch:{ Exception -> 0x0167 }
            r8 = 0
        L_0x0152:
            throw r0     // Catch:{ all -> 0x00aa }
        L_0x0153:
            r0 = move-exception
            goto L_0x0032
        L_0x0156:
            r1 = move-exception
            goto L_0x00b2
        L_0x0159:
            r0 = move-exception
            goto L_0x005c
        L_0x015c:
            r1 = move-exception
            goto L_0x00b8
        L_0x015f:
            r0 = move-exception
            goto L_0x00bd
        L_0x0162:
            r1 = move-exception
            goto L_0x00a9
        L_0x0165:
            r0 = move-exception
            goto L_0x014b
        L_0x0167:
            r1 = move-exception
            goto L_0x0152
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.data.DBRequestStatistics.getAnalyticData():java.util.Map");
    }
}
