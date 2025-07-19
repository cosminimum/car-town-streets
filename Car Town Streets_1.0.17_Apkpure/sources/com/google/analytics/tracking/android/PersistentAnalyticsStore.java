package com.google.analytics.tracking.android;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import android.os.Build;
import android.text.TextUtils;
import com.getjar.sdk.utilities.Utility;
import com.google.android.gms.analytics.internal.Command;
import com.google.android.gms.common.util.VisibleForTesting;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.apache.http.impl.client.DefaultHttpClient;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class PersistentAnalyticsStore implements AnalyticsStore {
    private static final String DATABASE_FILENAME = "google_analytics_v2.db";
    private Clock mClock;
    private final Context mContext;
    private final String mDatabaseName;
    private final AnalyticsDatabaseHelper mDbHelper;
    private volatile Dispatcher mDispatcher;
    private long mLastDeleteStaleHitsTime;
    private final AnalyticsStoreStateListener mListener;
    @VisibleForTesting
    static final String HITS_TABLE = "hits2";
    @VisibleForTesting
    static final String HIT_ID = "hit_id";
    @VisibleForTesting
    static final String HIT_TIME = "hit_time";
    @VisibleForTesting
    static final String HIT_URL = "hit_url";
    @VisibleForTesting
    static final String HIT_STRING = "hit_string";
    @VisibleForTesting
    static final String HIT_APP_ID = "hit_app_id";
    private static final String CREATE_HITS_TABLE = String.format("CREATE TABLE IF NOT EXISTS %s ( '%s' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, '%s' INTEGER NOT NULL, '%s' TEXT NOT NULL, '%s' TEXT NOT NULL, '%s' INTEGER);", HITS_TABLE, HIT_ID, HIT_TIME, HIT_URL, HIT_STRING, HIT_APP_ID);

    /* JADX INFO: Access modifiers changed from: package-private */
    public PersistentAnalyticsStore(AnalyticsStoreStateListener listener, Context ctx) {
        this(listener, ctx, DATABASE_FILENAME);
    }

    @VisibleForTesting
    PersistentAnalyticsStore(AnalyticsStoreStateListener listener, Context ctx, String databaseName) {
        this.mContext = ctx.getApplicationContext();
        this.mDatabaseName = databaseName;
        this.mListener = listener;
        this.mClock = new Clock() { // from class: com.google.analytics.tracking.android.PersistentAnalyticsStore.1
            @Override // com.google.analytics.tracking.android.Clock
            public long currentTimeMillis() {
                return System.currentTimeMillis();
            }
        };
        this.mDbHelper = new AnalyticsDatabaseHelper(this.mContext, this.mDatabaseName);
        this.mDispatcher = new SimpleNetworkDispatcher(new DefaultHttpClient(), this.mContext);
        this.mLastDeleteStaleHitsTime = 0L;
    }

    @VisibleForTesting
    public void setClock(Clock clock) {
        this.mClock = clock;
    }

    @VisibleForTesting
    public AnalyticsDatabaseHelper getDbHelper() {
        return this.mDbHelper;
    }

    @Override // com.google.analytics.tracking.android.AnalyticsStore
    public void setDispatch(boolean dispatch) {
        this.mDispatcher = dispatch ? new SimpleNetworkDispatcher(new DefaultHttpClient(), this.mContext) : new NoopDispatcher();
    }

    @VisibleForTesting
    void setDispatcher(Dispatcher dispatcher) {
        this.mDispatcher = dispatcher;
    }

    @Override // com.google.analytics.tracking.android.AnalyticsStore
    public void clearHits(long appId) {
        boolean z = true;
        SQLiteDatabase db = getWritableDatabase("Error opening database for clearHits");
        if (db != null) {
            if (appId == 0) {
                db.delete(HITS_TABLE, null, null);
            } else {
                String[] params = {Long.valueOf(appId).toString()};
                db.delete(HITS_TABLE, "hit_app_id = ?", params);
            }
            AnalyticsStoreStateListener analyticsStoreStateListener = this.mListener;
            if (getNumStoredHits() != 0) {
                z = false;
            }
            analyticsStoreStateListener.reportStoreIsEmpty(z);
        }
    }

    @Override // com.google.analytics.tracking.android.AnalyticsStore
    public void putHit(Map<String, String> wireFormatParams, long hitTimeInMilliseconds, String path, Collection<Command> commands) {
        deleteStaleHits();
        removeOldHitIfFull();
        fillVersionParameter(wireFormatParams, commands);
        writeHitToDatabase(wireFormatParams, hitTimeInMilliseconds, path);
    }

    private void fillVersionParameter(Map<String, String> wireFormatParams, Collection<Command> commands) {
        String clientVersionParam = "&_v".substring(1);
        if (commands != null) {
            for (Command command : commands) {
                if (Command.APPEND_VERSION.equals(command.getId())) {
                    wireFormatParams.put(clientVersionParam, command.getValue());
                    return;
                }
            }
        }
    }

    private void removeOldHitIfFull() {
        int hitsOverLimit = (getNumStoredHits() - 2000) + 1;
        if (hitsOverLimit > 0) {
            List<String> hitsToDelete = peekHitIds(hitsOverLimit);
            Log.v("Store full, deleting " + hitsToDelete.size() + " hits to make room.");
            deleteHits((String[]) hitsToDelete.toArray(new String[0]));
        }
    }

    private void writeHitToDatabase(Map<String, String> hit, long hitTimeInMilliseconds, String path) {
        SQLiteDatabase db = getWritableDatabase("Error opening database for putHit");
        if (db != null) {
            ContentValues content = new ContentValues();
            content.put(HIT_STRING, generateHitString(hit));
            content.put(HIT_TIME, Long.valueOf(hitTimeInMilliseconds));
            long appSystemId = 0;
            if (hit.containsKey(Fields.ANDROID_APP_UID)) {
                try {
                    appSystemId = Long.parseLong(hit.get(Fields.ANDROID_APP_UID));
                } catch (NumberFormatException e) {
                }
            }
            content.put(HIT_APP_ID, Long.valueOf(appSystemId));
            if (path == null) {
                path = "http://www.google-analytics.com/collect";
            }
            if (path.length() == 0) {
                Log.w("Empty path: not sending hit");
                return;
            }
            content.put(HIT_URL, path);
            try {
                db.insert(HITS_TABLE, null, content);
                this.mListener.reportStoreIsEmpty(false);
            } catch (SQLiteException e2) {
                Log.w("Error storing hit");
            }
        }
    }

    static String generateHitString(Map<String, String> urlParams) {
        List<String> keyAndValues = new ArrayList<>(urlParams.size());
        for (Map.Entry<String, String> entry : urlParams.entrySet()) {
            keyAndValues.add(HitBuilder.encode(entry.getKey()) + "=" + HitBuilder.encode(entry.getValue()));
        }
        return TextUtils.join(Utility.QUERY_APPENDIX, keyAndValues);
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0054  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    java.util.List<java.lang.String> peekHitIds(int r15) {
        /*
            r14 = this;
            java.util.ArrayList r11 = new java.util.ArrayList
            r11.<init>()
            if (r15 > 0) goto Ld
            java.lang.String r1 = "Invalid maxHits specified. Skipping"
            com.google.analytics.tracking.android.Log.w(r1)
        Lc:
            return r11
        Ld:
            java.lang.String r1 = "Error opening database for peekHitIds."
            android.database.sqlite.SQLiteDatabase r0 = r14.getWritableDatabase(r1)
            if (r0 == 0) goto Lc
            r9 = 0
            java.lang.String r1 = "hits2"
            r2 = 1
            java.lang.String[] r2 = new java.lang.String[r2]     // Catch: android.database.sqlite.SQLiteException -> L58 java.lang.Throwable -> L79
            r3 = 0
            java.lang.String r4 = "hit_id"
            r2[r3] = r4     // Catch: android.database.sqlite.SQLiteException -> L58 java.lang.Throwable -> L79
            r3 = 0
            r4 = 0
            r5 = 0
            r6 = 0
            java.lang.String r7 = "%s ASC"
            r8 = 1
            java.lang.Object[] r8 = new java.lang.Object[r8]     // Catch: android.database.sqlite.SQLiteException -> L58 java.lang.Throwable -> L79
            r12 = 0
            java.lang.String r13 = "hit_id"
            r8[r12] = r13     // Catch: android.database.sqlite.SQLiteException -> L58 java.lang.Throwable -> L79
            java.lang.String r7 = java.lang.String.format(r7, r8)     // Catch: android.database.sqlite.SQLiteException -> L58 java.lang.Throwable -> L79
            java.lang.String r8 = java.lang.Integer.toString(r15)     // Catch: android.database.sqlite.SQLiteException -> L58 java.lang.Throwable -> L79
            android.database.Cursor r9 = r0.query(r1, r2, r3, r4, r5, r6, r7, r8)     // Catch: android.database.sqlite.SQLiteException -> L58 java.lang.Throwable -> L79
            boolean r1 = r9.moveToFirst()     // Catch: android.database.sqlite.SQLiteException -> L58 java.lang.Throwable -> L79
            if (r1 == 0) goto L52
        L40:
            r1 = 0
            long r1 = r9.getLong(r1)     // Catch: android.database.sqlite.SQLiteException -> L58 java.lang.Throwable -> L79
            java.lang.String r1 = java.lang.String.valueOf(r1)     // Catch: android.database.sqlite.SQLiteException -> L58 java.lang.Throwable -> L79
            r11.add(r1)     // Catch: android.database.sqlite.SQLiteException -> L58 java.lang.Throwable -> L79
            boolean r1 = r9.moveToNext()     // Catch: android.database.sqlite.SQLiteException -> L58 java.lang.Throwable -> L79
            if (r1 != 0) goto L40
        L52:
            if (r9 == 0) goto Lc
            r9.close()
            goto Lc
        L58:
            r10 = move-exception
            java.lang.StringBuilder r1 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L79
            r1.<init>()     // Catch: java.lang.Throwable -> L79
            java.lang.String r2 = "Error in peekHits fetching hitIds: "
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch: java.lang.Throwable -> L79
            java.lang.String r2 = r10.getMessage()     // Catch: java.lang.Throwable -> L79
            java.lang.StringBuilder r1 = r1.append(r2)     // Catch: java.lang.Throwable -> L79
            java.lang.String r1 = r1.toString()     // Catch: java.lang.Throwable -> L79
            com.google.analytics.tracking.android.Log.w(r1)     // Catch: java.lang.Throwable -> L79
            if (r9 == 0) goto Lc
            r9.close()
            goto Lc
        L79:
            r1 = move-exception
            if (r9 == 0) goto L7f
            r9.close()
        L7f:
            throw r1
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.analytics.tracking.android.PersistentAnalyticsStore.peekHitIds(int):java.util.List");
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x0064  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x009d A[Catch: SQLiteException -> 0x0127, all -> 0x0178, LOOP:1: B:23:0x009d->B:27:0x00d1, LOOP_START, PHI: r12 
      PHI: (r12v1 'count' int) = (r12v0 'count' int), (r12v2 'count' int) binds: [B:22:0x009b, B:27:0x00d1] A[DONT_GENERATE, DONT_INLINE], TryCatch #1 {SQLiteException -> 0x0127, blocks: (B:21:0x0068, B:23:0x009d, B:25:0x00ab, B:26:0x00cb, B:29:0x0107), top: B:20:0x0068, outer: #3 }] */
    /* JADX WARN: Removed duplicated region for block: B:31:0x00d3  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00d5  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.util.List<com.google.analytics.tracking.android.Hit> peekHits(int r23) {
        /*
            Method dump skipped, instructions count: 393
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.analytics.tracking.android.PersistentAnalyticsStore.peekHits(int):java.util.List");
    }

    @VisibleForTesting
    void setLastDeleteStaleHitsTime(long timeInMilliseconds) {
        this.mLastDeleteStaleHitsTime = timeInMilliseconds;
    }

    int deleteStaleHits() {
        boolean z = true;
        long now = this.mClock.currentTimeMillis();
        if (now <= this.mLastDeleteStaleHitsTime + 86400000) {
            return 0;
        }
        this.mLastDeleteStaleHitsTime = now;
        SQLiteDatabase db = getWritableDatabase("Error opening database for deleteStaleHits.");
        if (db == null) {
            return 0;
        }
        long lastGoodTime = this.mClock.currentTimeMillis() - 2592000000L;
        int rslt = db.delete(HITS_TABLE, "HIT_TIME < ?", new String[]{Long.toString(lastGoodTime)});
        AnalyticsStoreStateListener analyticsStoreStateListener = this.mListener;
        if (getNumStoredHits() != 0) {
            z = false;
        }
        analyticsStoreStateListener.reportStoreIsEmpty(z);
        return rslt;
    }

    @Deprecated
    void deleteHits(Collection<Hit> hits) {
        if (hits == null || hits.isEmpty()) {
            Log.w("Empty/Null collection passed to deleteHits.");
            return;
        }
        String[] hitIds = new String[hits.size()];
        int i = 0;
        for (Hit h : hits) {
            hitIds[i] = String.valueOf(h.getHitId());
            i++;
        }
        deleteHits(hitIds);
    }

    void deleteHits(String[] hitIds) {
        boolean z = true;
        if (hitIds == null || hitIds.length == 0) {
            Log.w("Empty hitIds passed to deleteHits.");
            return;
        }
        SQLiteDatabase db = getWritableDatabase("Error opening database for deleteHits.");
        if (db != null) {
            String whereClause = String.format("HIT_ID in (%s)", TextUtils.join(",", Collections.nCopies(hitIds.length, Utility.QUERY_START)));
            try {
                db.delete(HITS_TABLE, whereClause, hitIds);
                AnalyticsStoreStateListener analyticsStoreStateListener = this.mListener;
                if (getNumStoredHits() != 0) {
                    z = false;
                }
                analyticsStoreStateListener.reportStoreIsEmpty(z);
            } catch (SQLiteException e) {
                Log.w("Error deleting hits " + hitIds);
            }
        }
    }

    int getNumStoredHits() {
        int numStoredHits = 0;
        SQLiteDatabase db = getWritableDatabase("Error opening database for getNumStoredHits.");
        if (db == null) {
            return 0;
        }
        Cursor cursor = null;
        try {
            try {
                cursor = db.rawQuery("SELECT COUNT(*) from hits2", null);
                if (cursor.moveToFirst()) {
                    numStoredHits = (int) cursor.getLong(0);
                }
            } catch (SQLiteException e) {
                Log.w("Error getting numStoredHits");
                if (cursor != null) {
                    cursor.close();
                }
            }
            return numStoredHits;
        } finally {
            if (cursor != null) {
                cursor.close();
            }
        }
    }

    @Override // com.google.analytics.tracking.android.AnalyticsStore
    public void dispatch() {
        Log.v("Dispatch running...");
        if (this.mDispatcher.okToDispatch()) {
            List<Hit> hits = peekHits(40);
            if (hits.isEmpty()) {
                Log.v("...nothing to dispatch");
                this.mListener.reportStoreIsEmpty(true);
                return;
            }
            int hitsDispatched = this.mDispatcher.dispatchHits(hits);
            Log.v("sent " + hitsDispatched + " of " + hits.size() + " hits");
            deleteHits(hits.subList(0, Math.min(hitsDispatched, hits.size())));
            if (hitsDispatched == hits.size() && getNumStoredHits() > 0) {
                GAServiceManager.getInstance().dispatchLocalHits();
            }
        }
    }

    @Override // com.google.analytics.tracking.android.AnalyticsStore
    public Dispatcher getDispatcher() {
        return this.mDispatcher;
    }

    @Override // com.google.analytics.tracking.android.AnalyticsStore
    public void close() {
        try {
            this.mDbHelper.getWritableDatabase().close();
            this.mDispatcher.close();
        } catch (SQLiteException e) {
            Log.w("Error opening database for close");
        }
    }

    @VisibleForTesting
    AnalyticsDatabaseHelper getHelper() {
        return this.mDbHelper;
    }

    private SQLiteDatabase getWritableDatabase(String errorMessage) {
        try {
            SQLiteDatabase db = this.mDbHelper.getWritableDatabase();
            return db;
        } catch (SQLiteException e) {
            Log.w(errorMessage);
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @VisibleForTesting
    /* loaded from: classes.dex */
    public class AnalyticsDatabaseHelper extends SQLiteOpenHelper {
        private boolean mBadDatabase;
        private long mLastDatabaseCheckTime = 0;

        boolean isBadDatabase() {
            return this.mBadDatabase;
        }

        void setBadDatabase(boolean badDatabase) {
            this.mBadDatabase = badDatabase;
        }

        AnalyticsDatabaseHelper(Context context, String databaseName) {
            super(context, databaseName, (SQLiteDatabase.CursorFactory) null, 1);
        }

        private boolean tablePresent(String table, SQLiteDatabase db) {
            Cursor cursor = null;
            try {
                try {
                    cursor = db.query("SQLITE_MASTER", new String[]{"name"}, "name=?", new String[]{table}, null, null, null);
                    boolean moveToFirst = cursor.moveToFirst();
                    if (cursor == null) {
                        return moveToFirst;
                    }
                    cursor.close();
                    return moveToFirst;
                } catch (SQLiteException e) {
                    Log.w("Error querying for table " + table);
                    if (cursor != null) {
                        cursor.close();
                    }
                    return false;
                }
            } catch (Throwable th) {
                if (cursor != null) {
                    cursor.close();
                }
                throw th;
            }
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public SQLiteDatabase getWritableDatabase() {
            if (this.mBadDatabase && this.mLastDatabaseCheckTime + 3600000 > PersistentAnalyticsStore.this.mClock.currentTimeMillis()) {
                throw new SQLiteException("Database creation failed");
            }
            SQLiteDatabase db = null;
            this.mBadDatabase = true;
            this.mLastDatabaseCheckTime = PersistentAnalyticsStore.this.mClock.currentTimeMillis();
            try {
                db = super.getWritableDatabase();
            } catch (SQLiteException e) {
                PersistentAnalyticsStore.this.mContext.getDatabasePath(PersistentAnalyticsStore.this.mDatabaseName).delete();
            }
            if (db == null) {
                db = super.getWritableDatabase();
            }
            this.mBadDatabase = false;
            return db;
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onOpen(SQLiteDatabase db) {
            if (Build.VERSION.SDK_INT < 15) {
                Cursor cursor = db.rawQuery("PRAGMA journal_mode=memory", null);
                try {
                    cursor.moveToFirst();
                } finally {
                    cursor.close();
                }
            }
            if (!tablePresent(PersistentAnalyticsStore.HITS_TABLE, db)) {
                db.execSQL(PersistentAnalyticsStore.CREATE_HITS_TABLE);
            } else {
                validateColumnsPresent(db);
            }
        }

        private void validateColumnsPresent(SQLiteDatabase db) {
            Cursor c = db.rawQuery("SELECT * FROM hits2 WHERE 0", null);
            Set<String> columns = new HashSet<>();
            try {
                String[] columnNames = c.getColumnNames();
                for (String str : columnNames) {
                    columns.add(str);
                }
                c.close();
                if (!columns.remove(PersistentAnalyticsStore.HIT_ID) || !columns.remove(PersistentAnalyticsStore.HIT_URL) || !columns.remove(PersistentAnalyticsStore.HIT_STRING) || !columns.remove(PersistentAnalyticsStore.HIT_TIME)) {
                    throw new SQLiteException("Database column missing");
                }
                boolean needsAppId = !columns.remove(PersistentAnalyticsStore.HIT_APP_ID);
                if (!columns.isEmpty()) {
                    throw new SQLiteException("Database has extra columns");
                }
                if (needsAppId) {
                    db.execSQL("ALTER TABLE hits2 ADD COLUMN hit_app_id");
                }
            } catch (Throwable th) {
                c.close();
                throw th;
            }
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onCreate(SQLiteDatabase db) {
            FutureApis.setOwnerOnlyReadWrite(db.getPath());
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        }
    }
}
