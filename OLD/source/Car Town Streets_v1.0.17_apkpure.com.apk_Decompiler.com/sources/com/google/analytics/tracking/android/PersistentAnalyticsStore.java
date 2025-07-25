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

class PersistentAnalyticsStore implements AnalyticsStore {
    /* access modifiers changed from: private */
    public static final String CREATE_HITS_TABLE = String.format("CREATE TABLE IF NOT EXISTS %s ( '%s' INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, '%s' INTEGER NOT NULL, '%s' TEXT NOT NULL, '%s' TEXT NOT NULL, '%s' INTEGER);", new Object[]{HITS_TABLE, HIT_ID, HIT_TIME, HIT_URL, HIT_STRING, HIT_APP_ID});
    private static final String DATABASE_FILENAME = "google_analytics_v2.db";
    @VisibleForTesting
    static final String HITS_TABLE = "hits2";
    @VisibleForTesting
    static final String HIT_APP_ID = "hit_app_id";
    @VisibleForTesting
    static final String HIT_ID = "hit_id";
    @VisibleForTesting
    static final String HIT_STRING = "hit_string";
    @VisibleForTesting
    static final String HIT_TIME = "hit_time";
    @VisibleForTesting
    static final String HIT_URL = "hit_url";
    /* access modifiers changed from: private */
    public Clock mClock;
    /* access modifiers changed from: private */
    public final Context mContext;
    /* access modifiers changed from: private */
    public final String mDatabaseName;
    private final AnalyticsDatabaseHelper mDbHelper;
    private volatile Dispatcher mDispatcher;
    private long mLastDeleteStaleHitsTime;
    private final AnalyticsStoreStateListener mListener;

    PersistentAnalyticsStore(AnalyticsStoreStateListener listener, Context ctx) {
        this(listener, ctx, DATABASE_FILENAME);
    }

    @VisibleForTesting
    PersistentAnalyticsStore(AnalyticsStoreStateListener listener, Context ctx, String databaseName) {
        this.mContext = ctx.getApplicationContext();
        this.mDatabaseName = databaseName;
        this.mListener = listener;
        this.mClock = new Clock() {
            public long currentTimeMillis() {
                return System.currentTimeMillis();
            }
        };
        this.mDbHelper = new AnalyticsDatabaseHelper(this.mContext, this.mDatabaseName);
        this.mDispatcher = new SimpleNetworkDispatcher(new DefaultHttpClient(), this.mContext);
        this.mLastDeleteStaleHitsTime = 0;
    }

    @VisibleForTesting
    public void setClock(Clock clock) {
        this.mClock = clock;
    }

    @VisibleForTesting
    public AnalyticsDatabaseHelper getDbHelper() {
        return this.mDbHelper;
    }

    public void setDispatch(boolean dispatch) {
        this.mDispatcher = dispatch ? new SimpleNetworkDispatcher(new DefaultHttpClient(), this.mContext) : new NoopDispatcher();
    }

    /* access modifiers changed from: package-private */
    @VisibleForTesting
    public void setDispatcher(Dispatcher dispatcher) {
        this.mDispatcher = dispatcher;
    }

    public void clearHits(long appId) {
        boolean z = true;
        SQLiteDatabase db = getWritableDatabase("Error opening database for clearHits");
        if (db != null) {
            if (appId == 0) {
                db.delete(HITS_TABLE, (String) null, (String[]) null);
            } else {
                db.delete(HITS_TABLE, "hit_app_id = ?", new String[]{Long.valueOf(appId).toString()});
            }
            AnalyticsStoreStateListener analyticsStoreStateListener = this.mListener;
            if (getNumStoredHits() != 0) {
                z = false;
            }
            analyticsStoreStateListener.reportStoreIsEmpty(z);
        }
    }

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
                db.insert(HITS_TABLE, (String) null, content);
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

    /* access modifiers changed from: package-private */
    public List<String> peekHitIds(int maxHits) {
        List<String> hitIds = new ArrayList<>();
        if (maxHits <= 0) {
            Log.w("Invalid maxHits specified. Skipping");
        } else {
            SQLiteDatabase db = getWritableDatabase("Error opening database for peekHitIds.");
            if (db != null) {
                Cursor cursor = null;
                try {
                    Cursor cursor2 = db.query(HITS_TABLE, new String[]{HIT_ID}, (String) null, (String[]) null, (String) null, (String) null, String.format("%s ASC", new Object[]{HIT_ID}), Integer.toString(maxHits));
                    if (cursor2.moveToFirst()) {
                        do {
                            hitIds.add(String.valueOf(cursor2.getLong(0)));
                        } while (cursor2.moveToNext());
                    }
                    if (cursor2 != null) {
                        cursor2.close();
                    }
                } catch (SQLiteException e) {
                    Log.w("Error in peekHits fetching hitIds: " + e.getMessage());
                    if (cursor != null) {
                        cursor.close();
                    }
                } catch (Throwable th) {
                    if (cursor != null) {
                        cursor.close();
                    }
                    throw th;
                }
            }
        }
        return hitIds;
    }

    /* JADX WARNING: Removed duplicated region for block: B:29:0x00f9  */
    /* JADX WARNING: Removed duplicated region for block: B:33:0x0103  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public java.util.List<com.google.analytics.tracking.android.Hit> peekHits(int r23) {
        /*
            r22 = this;
            java.util.ArrayList r17 = new java.util.ArrayList
            r17.<init>()
            java.lang.String r3 = "Error opening database for peekHits"
            r0 = r22
            android.database.sqlite.SQLiteDatabase r1 = r0.getWritableDatabase(r3)
            if (r1 != 0) goto L_0x0012
            r18 = r17
        L_0x0011:
            return r18
        L_0x0012:
            r13 = 0
            java.lang.String r2 = "hits2"
            r3 = 2
            java.lang.String[] r3 = new java.lang.String[r3]     // Catch:{ SQLiteException -> 0x00dc }
            r4 = 0
            java.lang.String r5 = "hit_id"
            r3[r4] = r5     // Catch:{ SQLiteException -> 0x00dc }
            r4 = 1
            java.lang.String r5 = "hit_time"
            r3[r4] = r5     // Catch:{ SQLiteException -> 0x00dc }
            r4 = 0
            r5 = 0
            r6 = 0
            r7 = 0
            java.lang.String r8 = "%s ASC"
            r9 = 1
            java.lang.Object[] r9 = new java.lang.Object[r9]     // Catch:{ SQLiteException -> 0x00dc }
            r10 = 0
            java.lang.String r11 = "hit_id"
            r9[r10] = r11     // Catch:{ SQLiteException -> 0x00dc }
            java.lang.String r8 = java.lang.String.format(r8, r9)     // Catch:{ SQLiteException -> 0x00dc }
            java.lang.String r9 = java.lang.Integer.toString(r23)     // Catch:{ SQLiteException -> 0x00dc }
            android.database.Cursor r13 = r1.query(r2, r3, r4, r5, r6, r7, r8, r9)     // Catch:{ SQLiteException -> 0x00dc }
            java.util.ArrayList r18 = new java.util.ArrayList     // Catch:{ SQLiteException -> 0x00dc }
            r18.<init>()     // Catch:{ SQLiteException -> 0x00dc }
            boolean r3 = r13.moveToFirst()     // Catch:{ SQLiteException -> 0x0184, all -> 0x017f }
            if (r3 == 0) goto L_0x0062
        L_0x0047:
            com.google.analytics.tracking.android.Hit r2 = new com.google.analytics.tracking.android.Hit     // Catch:{ SQLiteException -> 0x0184, all -> 0x017f }
            r3 = 0
            r4 = 0
            long r4 = r13.getLong(r4)     // Catch:{ SQLiteException -> 0x0184, all -> 0x017f }
            r6 = 1
            long r6 = r13.getLong(r6)     // Catch:{ SQLiteException -> 0x0184, all -> 0x017f }
            r2.<init>(r3, r4, r6)     // Catch:{ SQLiteException -> 0x0184, all -> 0x017f }
            r0 = r18
            r0.add(r2)     // Catch:{ SQLiteException -> 0x0184, all -> 0x017f }
            boolean r3 = r13.moveToNext()     // Catch:{ SQLiteException -> 0x0184, all -> 0x017f }
            if (r3 != 0) goto L_0x0047
        L_0x0062:
            if (r13 == 0) goto L_0x0067
            r13.close()
        L_0x0067:
            r12 = 0
            java.lang.String r4 = "hits2"
            r3 = 3
            java.lang.String[] r5 = new java.lang.String[r3]     // Catch:{ SQLiteException -> 0x0127 }
            r3 = 0
            java.lang.String r6 = "hit_id"
            r5[r3] = r6     // Catch:{ SQLiteException -> 0x0127 }
            r3 = 1
            java.lang.String r6 = "hit_string"
            r5[r3] = r6     // Catch:{ SQLiteException -> 0x0127 }
            r3 = 2
            java.lang.String r6 = "hit_url"
            r5[r3] = r6     // Catch:{ SQLiteException -> 0x0127 }
            r6 = 0
            r7 = 0
            r8 = 0
            r9 = 0
            java.lang.String r3 = "%s ASC"
            r10 = 1
            java.lang.Object[] r10 = new java.lang.Object[r10]     // Catch:{ SQLiteException -> 0x0127 }
            r11 = 0
            java.lang.String r21 = "hit_id"
            r10[r11] = r21     // Catch:{ SQLiteException -> 0x0127 }
            java.lang.String r10 = java.lang.String.format(r3, r10)     // Catch:{ SQLiteException -> 0x0127 }
            java.lang.String r11 = java.lang.Integer.toString(r23)     // Catch:{ SQLiteException -> 0x0127 }
            r3 = r1
            android.database.Cursor r13 = r3.query(r4, r5, r6, r7, r8, r9, r10, r11)     // Catch:{ SQLiteException -> 0x0127 }
            boolean r3 = r13.moveToFirst()     // Catch:{ SQLiteException -> 0x0127 }
            if (r3 == 0) goto L_0x00d3
        L_0x009d:
            r0 = r13
            android.database.sqlite.SQLiteCursor r0 = (android.database.sqlite.SQLiteCursor) r0     // Catch:{ SQLiteException -> 0x0127 }
            r3 = r0
            android.database.CursorWindow r14 = r3.getWindow()     // Catch:{ SQLiteException -> 0x0127 }
            int r3 = r14.getNumRows()     // Catch:{ SQLiteException -> 0x0127 }
            if (r3 <= 0) goto L_0x0107
            r0 = r18
            java.lang.Object r3 = r0.get(r12)     // Catch:{ SQLiteException -> 0x0127 }
            com.google.analytics.tracking.android.Hit r3 = (com.google.analytics.tracking.android.Hit) r3     // Catch:{ SQLiteException -> 0x0127 }
            r4 = 1
            java.lang.String r4 = r13.getString(r4)     // Catch:{ SQLiteException -> 0x0127 }
            r3.setHitString(r4)     // Catch:{ SQLiteException -> 0x0127 }
            r0 = r18
            java.lang.Object r3 = r0.get(r12)     // Catch:{ SQLiteException -> 0x0127 }
            com.google.analytics.tracking.android.Hit r3 = (com.google.analytics.tracking.android.Hit) r3     // Catch:{ SQLiteException -> 0x0127 }
            r4 = 2
            java.lang.String r4 = r13.getString(r4)     // Catch:{ SQLiteException -> 0x0127 }
            r3.setHitUrl(r4)     // Catch:{ SQLiteException -> 0x0127 }
        L_0x00cb:
            int r12 = r12 + 1
            boolean r3 = r13.moveToNext()     // Catch:{ SQLiteException -> 0x0127 }
            if (r3 != 0) goto L_0x009d
        L_0x00d3:
            if (r13 == 0) goto L_0x00d8
            r13.close()
        L_0x00d8:
            r17 = r18
            goto L_0x0011
        L_0x00dc:
            r15 = move-exception
        L_0x00dd:
            java.lang.StringBuilder r3 = new java.lang.StringBuilder     // Catch:{ all -> 0x0100 }
            r3.<init>()     // Catch:{ all -> 0x0100 }
            java.lang.String r4 = "Error in peekHits fetching hitIds: "
            java.lang.StringBuilder r3 = r3.append(r4)     // Catch:{ all -> 0x0100 }
            java.lang.String r4 = r15.getMessage()     // Catch:{ all -> 0x0100 }
            java.lang.StringBuilder r3 = r3.append(r4)     // Catch:{ all -> 0x0100 }
            java.lang.String r3 = r3.toString()     // Catch:{ all -> 0x0100 }
            com.google.analytics.tracking.android.Log.w(r3)     // Catch:{ all -> 0x0100 }
            if (r13 == 0) goto L_0x00fc
            r13.close()
        L_0x00fc:
            r18 = r17
            goto L_0x0011
        L_0x0100:
            r3 = move-exception
        L_0x0101:
            if (r13 == 0) goto L_0x0106
            r13.close()
        L_0x0106:
            throw r3
        L_0x0107:
            java.lang.String r4 = "HitString for hitId %d too large.  Hit will be deleted."
            r3 = 1
            java.lang.Object[] r5 = new java.lang.Object[r3]     // Catch:{ SQLiteException -> 0x0127 }
            r6 = 0
            r0 = r18
            java.lang.Object r3 = r0.get(r12)     // Catch:{ SQLiteException -> 0x0127 }
            com.google.analytics.tracking.android.Hit r3 = (com.google.analytics.tracking.android.Hit) r3     // Catch:{ SQLiteException -> 0x0127 }
            long r7 = r3.getHitId()     // Catch:{ SQLiteException -> 0x0127 }
            java.lang.Long r3 = java.lang.Long.valueOf(r7)     // Catch:{ SQLiteException -> 0x0127 }
            r5[r6] = r3     // Catch:{ SQLiteException -> 0x0127 }
            java.lang.String r3 = java.lang.String.format(r4, r5)     // Catch:{ SQLiteException -> 0x0127 }
            com.google.analytics.tracking.android.Log.w(r3)     // Catch:{ SQLiteException -> 0x0127 }
            goto L_0x00cb
        L_0x0127:
            r15 = move-exception
            java.lang.StringBuilder r3 = new java.lang.StringBuilder     // Catch:{ all -> 0x0178 }
            r3.<init>()     // Catch:{ all -> 0x0178 }
            java.lang.String r4 = "Error in peekHits fetching hitString: "
            java.lang.StringBuilder r3 = r3.append(r4)     // Catch:{ all -> 0x0178 }
            java.lang.String r4 = r15.getMessage()     // Catch:{ all -> 0x0178 }
            java.lang.StringBuilder r3 = r3.append(r4)     // Catch:{ all -> 0x0178 }
            java.lang.String r3 = r3.toString()     // Catch:{ all -> 0x0178 }
            com.google.analytics.tracking.android.Log.w(r3)     // Catch:{ all -> 0x0178 }
            java.util.ArrayList r20 = new java.util.ArrayList     // Catch:{ all -> 0x0178 }
            r20.<init>()     // Catch:{ all -> 0x0178 }
            r16 = 0
            java.util.Iterator r19 = r18.iterator()     // Catch:{ all -> 0x0178 }
        L_0x014d:
            boolean r3 = r19.hasNext()     // Catch:{ all -> 0x0178 }
            if (r3 == 0) goto L_0x0165
            java.lang.Object r2 = r19.next()     // Catch:{ all -> 0x0178 }
            com.google.analytics.tracking.android.Hit r2 = (com.google.analytics.tracking.android.Hit) r2     // Catch:{ all -> 0x0178 }
            java.lang.String r3 = r2.getHitParams()     // Catch:{ all -> 0x0178 }
            boolean r3 = android.text.TextUtils.isEmpty(r3)     // Catch:{ all -> 0x0178 }
            if (r3 == 0) goto L_0x0172
            if (r16 == 0) goto L_0x0170
        L_0x0165:
            if (r13 == 0) goto L_0x016a
            r13.close()
        L_0x016a:
            r17 = r18
            r18 = r20
            goto L_0x0011
        L_0x0170:
            r16 = 1
        L_0x0172:
            r0 = r20
            r0.add(r2)     // Catch:{ all -> 0x0178 }
            goto L_0x014d
        L_0x0178:
            r3 = move-exception
            if (r13 == 0) goto L_0x017e
            r13.close()
        L_0x017e:
            throw r3
        L_0x017f:
            r3 = move-exception
            r17 = r18
            goto L_0x0101
        L_0x0184:
            r15 = move-exception
            r17 = r18
            goto L_0x00dd
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.analytics.tracking.android.PersistentAnalyticsStore.peekHits(int):java.util.List");
    }

    /* access modifiers changed from: package-private */
    @VisibleForTesting
    public void setLastDeleteStaleHitsTime(long timeInMilliseconds) {
        this.mLastDeleteStaleHitsTime = timeInMilliseconds;
    }

    /* access modifiers changed from: package-private */
    public int deleteStaleHits() {
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
        int rslt = db.delete(HITS_TABLE, "HIT_TIME < ?", new String[]{Long.toString(this.mClock.currentTimeMillis() - 2592000000L)});
        AnalyticsStoreStateListener analyticsStoreStateListener = this.mListener;
        if (getNumStoredHits() != 0) {
            z = false;
        }
        analyticsStoreStateListener.reportStoreIsEmpty(z);
        return rslt;
    }

    /* access modifiers changed from: package-private */
    @Deprecated
    public void deleteHits(Collection<Hit> hits) {
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

    /* access modifiers changed from: package-private */
    public void deleteHits(String[] hitIds) {
        boolean z = true;
        if (hitIds == null || hitIds.length == 0) {
            Log.w("Empty hitIds passed to deleteHits.");
            return;
        }
        SQLiteDatabase db = getWritableDatabase("Error opening database for deleteHits.");
        if (db != null) {
            try {
                db.delete(HITS_TABLE, String.format("HIT_ID in (%s)", new Object[]{TextUtils.join(",", Collections.nCopies(hitIds.length, Utility.QUERY_START))}), hitIds);
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

    /* access modifiers changed from: package-private */
    public int getNumStoredHits() {
        int numStoredHits = 0;
        SQLiteDatabase db = getWritableDatabase("Error opening database for getNumStoredHits.");
        if (db == null) {
            return 0;
        }
        Cursor cursor = null;
        try {
            Cursor cursor2 = db.rawQuery("SELECT COUNT(*) from hits2", (String[]) null);
            if (cursor2.moveToFirst()) {
                numStoredHits = (int) cursor2.getLong(0);
            }
            if (cursor2 != null) {
                cursor2.close();
            }
        } catch (SQLiteException e) {
            Log.w("Error getting numStoredHits");
            if (cursor != null) {
                cursor.close();
            }
        } catch (Throwable th) {
            if (cursor != null) {
                cursor.close();
            }
            throw th;
        }
        return numStoredHits;
    }

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
            deleteHits((Collection<Hit>) hits.subList(0, Math.min(hitsDispatched, hits.size())));
            if (hitsDispatched == hits.size() && getNumStoredHits() > 0) {
                GAServiceManager.getInstance().dispatchLocalHits();
            }
        }
    }

    public Dispatcher getDispatcher() {
        return this.mDispatcher;
    }

    public void close() {
        try {
            this.mDbHelper.getWritableDatabase().close();
            this.mDispatcher.close();
        } catch (SQLiteException e) {
            Log.w("Error opening database for close");
        }
    }

    /* access modifiers changed from: package-private */
    @VisibleForTesting
    public AnalyticsDatabaseHelper getHelper() {
        return this.mDbHelper;
    }

    private SQLiteDatabase getWritableDatabase(String errorMessage) {
        try {
            return this.mDbHelper.getWritableDatabase();
        } catch (SQLiteException e) {
            Log.w(errorMessage);
            return null;
        }
    }

    @VisibleForTesting
    class AnalyticsDatabaseHelper extends SQLiteOpenHelper {
        private boolean mBadDatabase;
        private long mLastDatabaseCheckTime = 0;

        /* access modifiers changed from: package-private */
        public boolean isBadDatabase() {
            return this.mBadDatabase;
        }

        /* access modifiers changed from: package-private */
        public void setBadDatabase(boolean badDatabase) {
            this.mBadDatabase = badDatabase;
        }

        AnalyticsDatabaseHelper(Context context, String databaseName) {
            super(context, databaseName, (SQLiteDatabase.CursorFactory) null, 1);
        }

        private boolean tablePresent(String table, SQLiteDatabase db) {
            Cursor cursor = null;
            try {
                cursor = db.query("SQLITE_MASTER", new String[]{"name"}, "name=?", new String[]{table}, (String) null, (String) null, (String) null);
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
            } catch (Throwable th) {
                if (cursor != null) {
                    cursor.close();
                }
                throw th;
            }
        }

        public SQLiteDatabase getWritableDatabase() {
            if (!this.mBadDatabase || this.mLastDatabaseCheckTime + 3600000 <= PersistentAnalyticsStore.this.mClock.currentTimeMillis()) {
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
            throw new SQLiteException("Database creation failed");
        }

        public void onOpen(SQLiteDatabase db) {
            if (Build.VERSION.SDK_INT < 15) {
                Cursor cursor = db.rawQuery("PRAGMA journal_mode=memory", (String[]) null);
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

        /* JADX INFO: finally extract failed */
        private void validateColumnsPresent(SQLiteDatabase db) {
            Cursor c = db.rawQuery("SELECT * FROM hits2 WHERE 0", (String[]) null);
            Set<String> columns = new HashSet<>();
            try {
                String[] columnNames = c.getColumnNames();
                for (String add : columnNames) {
                    columns.add(add);
                }
                c.close();
                if (!columns.remove(PersistentAnalyticsStore.HIT_ID) || !columns.remove(PersistentAnalyticsStore.HIT_URL) || !columns.remove(PersistentAnalyticsStore.HIT_STRING) || !columns.remove(PersistentAnalyticsStore.HIT_TIME)) {
                    throw new SQLiteException("Database column missing");
                }
                boolean needsAppId = !columns.remove(PersistentAnalyticsStore.HIT_APP_ID);
                if (!columns.isEmpty()) {
                    throw new SQLiteException("Database has extra columns");
                } else if (needsAppId) {
                    db.execSQL("ALTER TABLE hits2 ADD COLUMN hit_app_id");
                }
            } catch (Throwable th) {
                c.close();
                throw th;
            }
        }

        public void onCreate(SQLiteDatabase db) {
            FutureApis.setOwnerOnlyReadWrite(db.getPath());
        }

        public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        }
    }
}
