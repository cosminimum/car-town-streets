package com.google.tagmanager;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteOpenHelper;
import android.os.Build;
import android.text.TextUtils;
import com.getjar.sdk.utilities.Utility;
import com.google.android.gms.common.util.VisibleForTesting;
import com.google.tagmanager.SimpleNetworkDispatcher;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import org.apache.http.impl.client.DefaultHttpClient;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class PersistentHitStore implements HitStore {
    private static final String DATABASE_FILENAME = "gtm_urls.db";
    static final long HIT_DISPATCH_RETRY_WINDOW = 14400000;
    private static final String HIT_ID_WHERE_CLAUSE = "hit_id=?";
    private Clock mClock;
    private final Context mContext;
    private final String mDatabaseName;
    private final UrlDatabaseHelper mDbHelper;
    private volatile Dispatcher mDispatcher;
    private long mLastDeleteStaleHitsTime;
    private final HitStoreStateListener mListener;
    @VisibleForTesting
    static final String HITS_TABLE = "gtm_hits";
    @VisibleForTesting
    static final String HIT_ID = "hit_id";
    @VisibleForTesting
    static final String HIT_TIME = "hit_time";
    @VisibleForTesting
    static final String HIT_URL = "hit_url";
    @VisibleForTesting
    static final String HIT_FIRST_DISPATCH_TIME = "hit_first_send_time";
    private static final String CREATE_HITS_TABLE = String.format("CREATE TABLE IF NOT EXISTS %s ( '%s' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, '%s' INTEGER NOT NULL, '%s' TEXT NOT NULL,'%s' INTEGER NOT NULL);", HITS_TABLE, HIT_ID, HIT_TIME, HIT_URL, HIT_FIRST_DISPATCH_TIME);

    /* JADX INFO: Access modifiers changed from: package-private */
    public PersistentHitStore(HitStoreStateListener listener, Context ctx) {
        this(listener, ctx, DATABASE_FILENAME);
    }

    @VisibleForTesting
    PersistentHitStore(HitStoreStateListener listener, Context ctx, String databaseName) {
        this.mContext = ctx.getApplicationContext();
        this.mDatabaseName = databaseName;
        this.mListener = listener;
        this.mClock = new Clock() { // from class: com.google.tagmanager.PersistentHitStore.1
            @Override // com.google.tagmanager.Clock
            public long currentTimeMillis() {
                return System.currentTimeMillis();
            }
        };
        this.mDbHelper = new UrlDatabaseHelper(this.mContext, this.mDatabaseName);
        this.mDispatcher = new SimpleNetworkDispatcher(new DefaultHttpClient(), this.mContext, new StoreDispatchListener());
        this.mLastDeleteStaleHitsTime = 0L;
    }

    @VisibleForTesting
    public void setClock(Clock clock) {
        this.mClock = clock;
    }

    @VisibleForTesting
    public UrlDatabaseHelper getDbHelper() {
        return this.mDbHelper;
    }

    @VisibleForTesting
    void setDispatcher(Dispatcher dispatcher) {
        this.mDispatcher = dispatcher;
    }

    @Override // com.google.tagmanager.HitStore
    public void putHit(long hitTimeInMilliseconds, String path) {
        deleteStaleHits();
        removeOldHitIfFull();
        writeHitToDatabase(hitTimeInMilliseconds, path);
    }

    private void removeOldHitIfFull() {
        int hitsOverLimit = (getNumStoredHits() - 2000) + 1;
        if (hitsOverLimit > 0) {
            List<String> hitsToDelete = peekHitIds(hitsOverLimit);
            Log.v("Store full, deleting " + hitsToDelete.size() + " hits to make room.");
            deleteHits((String[]) hitsToDelete.toArray(new String[0]));
        }
    }

    private void writeHitToDatabase(long hitTimeInMilliseconds, String path) {
        SQLiteDatabase db = getWritableDatabase("Error opening database for putHit");
        if (db != null) {
            ContentValues content = new ContentValues();
            content.put(HIT_TIME, Long.valueOf(hitTimeInMilliseconds));
            content.put(HIT_URL, path);
            content.put(HIT_FIRST_DISPATCH_TIME, (Integer) 0);
            try {
                db.insert(HITS_TABLE, null, content);
                this.mListener.reportStoreIsEmpty(false);
            } catch (SQLiteException e) {
                Log.w("Error storing hit");
            }
        }
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
            com.google.tagmanager.Log.w(r1)
        Lc:
            return r11
        Ld:
            java.lang.String r1 = "Error opening database for peekHitIds."
            android.database.sqlite.SQLiteDatabase r0 = r14.getWritableDatabase(r1)
            if (r0 == 0) goto Lc
            r9 = 0
            java.lang.String r1 = "gtm_hits"
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
            com.google.tagmanager.Log.w(r1)     // Catch: java.lang.Throwable -> L79
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
        throw new UnsupportedOperationException("Method not decompiled: com.google.tagmanager.PersistentHitStore.peekHitIds(int):java.util.List");
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x006d  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x00a1 A[Catch: SQLiteException -> 0x011b, all -> 0x016c, LOOP:1: B:23:0x00a1->B:27:0x00c5, LOOP_START, PHI: r12 
      PHI: (r12v1 'count' int) = (r12v0 'count' int), (r12v2 'count' int) binds: [B:22:0x009f, B:27:0x00c5] A[DONT_GENERATE, DONT_INLINE], TryCatch #5 {SQLiteException -> 0x011b, blocks: (B:21:0x0071, B:23:0x00a1, B:25:0x00af, B:26:0x00bf, B:29:0x00fb), top: B:20:0x0071, outer: #4 }] */
    /* JADX WARN: Removed duplicated region for block: B:31:0x00c7  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00c9  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.util.List<com.google.tagmanager.Hit> peekHits(int r23) {
        /*
            Method dump skipped, instructions count: 381
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.tagmanager.PersistentHitStore.peekHits(int):java.util.List");
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
        HitStoreStateListener hitStoreStateListener = this.mListener;
        if (getNumStoredHits() != 0) {
            z = false;
        }
        hitStoreStateListener.reportStoreIsEmpty(z);
        return rslt;
    }

    void deleteHits(String[] hitIds) {
        SQLiteDatabase db;
        boolean z = true;
        if (hitIds != null && hitIds.length != 0 && (db = getWritableDatabase("Error opening database for deleteHits.")) != null) {
            String whereClause = String.format("HIT_ID in (%s)", TextUtils.join(",", Collections.nCopies(hitIds.length, Utility.QUERY_START)));
            try {
                db.delete(HITS_TABLE, whereClause, hitIds);
                HitStoreStateListener hitStoreStateListener = this.mListener;
                if (getNumStoredHits() != 0) {
                    z = false;
                }
                hitStoreStateListener.reportStoreIsEmpty(z);
            } catch (SQLiteException e) {
                Log.w("Error deleting hits");
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void deleteHit(long hitId) {
        deleteHits(new String[]{String.valueOf(hitId)});
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void setHitFirstDispatchTime(long hitId, long firstDispatchTime) {
        SQLiteDatabase db = getWritableDatabase("Error opening database for getNumStoredHits.");
        if (db != null) {
            ContentValues cv = new ContentValues();
            cv.put(HIT_FIRST_DISPATCH_TIME, Long.valueOf(firstDispatchTime));
            try {
                db.update(HITS_TABLE, cv, HIT_ID_WHERE_CLAUSE, new String[]{String.valueOf(hitId)});
            } catch (SQLiteException e) {
                Log.w("Error setting HIT_FIRST_DISPATCH_TIME for hitId: " + hitId);
                deleteHit(hitId);
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
                cursor = db.rawQuery("SELECT COUNT(*) from gtm_hits", null);
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

    int getNumStoredUntriedHits() {
        int numStoredHits = 0;
        SQLiteDatabase db = getWritableDatabase("Error opening database for getNumStoredHits.");
        if (db == null) {
            return 0;
        }
        Cursor cursor = null;
        try {
            try {
                cursor = db.query(HITS_TABLE, new String[]{HIT_ID, HIT_FIRST_DISPATCH_TIME}, "hit_first_send_time=0", null, null, null, null);
                numStoredHits = cursor.getCount();
            } catch (SQLiteException e) {
                Log.w("Error getting num untried hits");
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

    @Override // com.google.tagmanager.HitStore
    public void dispatch() {
        Log.v("GTM Dispatch running...");
        if (this.mDispatcher.okToDispatch()) {
            List<Hit> hits = peekHits(40);
            if (hits.isEmpty()) {
                Log.v("...nothing to dispatch");
                this.mListener.reportStoreIsEmpty(true);
                return;
            }
            this.mDispatcher.dispatchHits(hits);
            if (getNumStoredUntriedHits() > 0) {
                ServiceManagerImpl.getInstance().dispatch();
            }
        }
    }

    @VisibleForTesting
    /* loaded from: classes.dex */
    class StoreDispatchListener implements SimpleNetworkDispatcher.DispatchListener {
        StoreDispatchListener() {
        }

        @Override // com.google.tagmanager.SimpleNetworkDispatcher.DispatchListener
        public void onHitDispatched(Hit hit) {
            PersistentHitStore.this.deleteHit(hit.getHitId());
        }

        @Override // com.google.tagmanager.SimpleNetworkDispatcher.DispatchListener
        public void onHitPermanentDispatchFailure(Hit hit) {
            PersistentHitStore.this.deleteHit(hit.getHitId());
            Log.v("Permanent failure dispatching hitId: " + hit.getHitId());
        }

        @Override // com.google.tagmanager.SimpleNetworkDispatcher.DispatchListener
        public void onHitTransientDispatchFailure(Hit hit) {
            long firstDispatchTime = hit.getHitFirstDispatchTime();
            if (firstDispatchTime == 0) {
                PersistentHitStore.this.setHitFirstDispatchTime(hit.getHitId(), PersistentHitStore.this.mClock.currentTimeMillis());
            } else if (PersistentHitStore.HIT_DISPATCH_RETRY_WINDOW + firstDispatchTime < PersistentHitStore.this.mClock.currentTimeMillis()) {
                PersistentHitStore.this.deleteHit(hit.getHitId());
                Log.v("Giving up on failed hitId: " + hit.getHitId());
            }
        }
    }

    @Override // com.google.tagmanager.HitStore
    public Dispatcher getDispatcher() {
        return this.mDispatcher;
    }

    @Override // com.google.tagmanager.HitStore
    public void close() {
        try {
            this.mDbHelper.getWritableDatabase().close();
            this.mDispatcher.close();
        } catch (SQLiteException e) {
            Log.w("Error opening database for close");
        }
    }

    @VisibleForTesting
    UrlDatabaseHelper getHelper() {
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
    public class UrlDatabaseHelper extends SQLiteOpenHelper {
        private boolean mBadDatabase;
        private long mLastDatabaseCheckTime = 0;

        boolean isBadDatabase() {
            return this.mBadDatabase;
        }

        void setBadDatabase(boolean badDatabase) {
            this.mBadDatabase = badDatabase;
        }

        UrlDatabaseHelper(Context context, String databaseName) {
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
            if (this.mBadDatabase && this.mLastDatabaseCheckTime + 3600000 > PersistentHitStore.this.mClock.currentTimeMillis()) {
                throw new SQLiteException("Database creation failed");
            }
            SQLiteDatabase db = null;
            this.mBadDatabase = true;
            this.mLastDatabaseCheckTime = PersistentHitStore.this.mClock.currentTimeMillis();
            try {
                db = super.getWritableDatabase();
            } catch (SQLiteException e) {
                PersistentHitStore.this.mContext.getDatabasePath(PersistentHitStore.this.mDatabaseName).delete();
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
            if (!tablePresent(PersistentHitStore.HITS_TABLE, db)) {
                db.execSQL(PersistentHitStore.CREATE_HITS_TABLE);
            } else {
                validateColumnsPresent(db);
            }
        }

        private void validateColumnsPresent(SQLiteDatabase db) {
            Cursor c = db.rawQuery("SELECT * FROM gtm_hits WHERE 0", null);
            Set<String> columns = new HashSet<>();
            try {
                String[] columnNames = c.getColumnNames();
                for (String str : columnNames) {
                    columns.add(str);
                }
                c.close();
                if (!columns.remove(PersistentHitStore.HIT_ID) || !columns.remove(PersistentHitStore.HIT_URL) || !columns.remove(PersistentHitStore.HIT_TIME) || !columns.remove(PersistentHitStore.HIT_FIRST_DISPATCH_TIME)) {
                    throw new SQLiteException("Database column missing");
                }
                if (!columns.isEmpty()) {
                    throw new SQLiteException("Database has extra columns");
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
