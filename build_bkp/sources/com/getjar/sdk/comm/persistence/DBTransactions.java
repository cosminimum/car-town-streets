package com.getjar.sdk.comm.persistence;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import com.facebook.internal.ServerProtocol;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.Base64;
import com.getjar.sdk.utilities.StringUtility;
import java.io.IOException;
import java.io.Serializable;
import java.util.Locale;

public class DBTransactions extends SQLiteOpenHelper {
    private static final String DATABASE_CREATE = ("CREATE TABLE IF NOT EXISTS transactions (id INTEGER PRIMARY KEY AUTOINCREMENT, clientTransactionId TEXT NOT NULL UNIQUE, timestampCreated INTEGER NOT NULL, timestampLastUpdated INTEGER NOT NULL, state TEXT NOT NULL, type TEXT NOT NULL, relatedObject TEXT, notificationState TEXT NOT NULL DEFAULT '" + NotificationState.NONE.name() + "'" + ");");
    private static final String DATABASE_NAME_PREFIX = "GetJarDBTransactions";
    private static final String DATABASE_TABLE = "transactions";
    private static final int DATABASE_VERSION = 3;
    private static volatile DBTransactions _Instance = null;
    private volatile Object _databaseAccessLock = new Object();

    public enum EarnState {
        CREATED,
        EARNING,
        DONE
    }

    public enum ManagedOfferState implements TransactionState {
        CREATED,
        RESERVING,
        RESERVED,
        PURCHASING,
        PURCHASED,
        CONFIRMING,
        CONFIRMED,
        CONSUMING,
        CONSUMED,
        CANCELING,
        CANCELLED,
        DONE
    }

    public enum NotificationState {
        NONE,
        NO_GOLD,
        FAILED,
        SUCCEEDED
    }

    public enum PurchaseState implements TransactionState {
        CREATED,
        RESERVING,
        CANCELING,
        CONFIRMING,
        DONE
    }

    private interface TransactionState {
    }

    public enum TransactionType {
        PURCHASE,
        EARN,
        MANAGED_OFFER
    }

    private DBTransactions(Context context) {
        super(context, String.format(Locale.US, "%1$s%2$d", new Object[]{DATABASE_NAME_PREFIX, Integer.valueOf(AuthManager.getInstance().getUserAccessId().hashCode())}), (SQLiteDatabase.CursorFactory) null, 3);
        Logger.m644i(Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "DBTransactions: Opened user specific database '%1$s%2$d'", new Object[]{DATABASE_NAME_PREFIX, Integer.valueOf(AuthManager.getInstance().getUserAccessId().hashCode())}));
    }

    public static synchronized DBTransactions getInstance(Context context) {
        DBTransactions dBTransactions;
        synchronized (DBTransactions.class) {
            if (context == null) {
                throw new IllegalArgumentException("'context' can not be NULL");
            }
            Logger.m644i(Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "DBTransactions: waitForUserAccess() START [%1$s]", new Object[]{Logger.getShortStack()}));
            AuthManager.initialize(context);
            AuthManager.getInstance().waitOnAuth();
            Logger.m644i(Area.TRANSACTION.value() | Area.STORAGE.value(), "DBTransactions: waitForUserAccess() DONE");
            if (StringUtility.isNullOrEmpty(AuthManager.getInstance().getUserAccessId())) {
                throw new IllegalStateException("Must have a user access ID");
            }
            if (_Instance == null) {
                _Instance = new DBTransactions(context);
            }
            dBTransactions = _Instance;
        }
        return dBTransactions;
    }

    public void onCreate(SQLiteDatabase db) {
        db.execSQL(DATABASE_CREATE);
    }

    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        Logger.m640d(Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "Upgrading database from version %1$d to %2$d, which will destroy all old data", new Object[]{Integer.valueOf(oldVersion), Integer.valueOf(newVersion)}));
        db.execSQL("DROP TABLE IF EXISTS transactions");
        onCreate(db);
    }

    /* JADX WARNING: Unknown top exception splitter block from list: {B:21:0x0041=Splitter:B:21:0x0041, B:9:0x0023=Splitter:B:9:0x0023} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public long getRecordCount() {
        /*
            r10 = this;
            java.lang.Object r3 = r10._databaseAccessLock
            monitor-enter(r3)
            android.database.sqlite.SQLiteDatabase r2 = r10.getReadableDatabase()     // Catch:{ all -> 0x0039 }
            java.util.Locale r4 = java.util.Locale.US     // Catch:{ all -> 0x0039 }
            java.lang.String r5 = "SELECT count(*) FROM %1$s"
            r6 = 1
            java.lang.Object[] r6 = new java.lang.Object[r6]     // Catch:{ all -> 0x0039 }
            r7 = 0
            java.lang.String r8 = "transactions"
            r6[r7] = r8     // Catch:{ all -> 0x0039 }
            java.lang.String r4 = java.lang.String.format(r4, r5, r6)     // Catch:{ all -> 0x0039 }
            android.database.sqlite.SQLiteStatement r0 = r2.compileStatement(r4)     // Catch:{ all -> 0x0039 }
            long r4 = r0.simpleQueryForLong()     // Catch:{ all -> 0x003c }
            r0.close()     // Catch:{ Exception -> 0x0025 }
            r0 = 0
        L_0x0023:
            monitor-exit(r3)     // Catch:{ all -> 0x0039 }
            return r4
        L_0x0025:
            r1 = move-exception
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ all -> 0x0039 }
            long r6 = r2.value()     // Catch:{ all -> 0x0039 }
            com.getjar.sdk.logging.Area r2 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x0039 }
            long r8 = r2.value()     // Catch:{ all -> 0x0039 }
            long r6 = r6 | r8
            java.lang.String r2 = "SQLiteStatement.close() failed"
            com.getjar.sdk.logging.Logger.m643e(r6, r2, r1)     // Catch:{ all -> 0x0039 }
            goto L_0x0023
        L_0x0039:
            r2 = move-exception
            monitor-exit(r3)     // Catch:{ all -> 0x0039 }
            throw r2
        L_0x003c:
            r2 = move-exception
            r0.close()     // Catch:{ Exception -> 0x0042 }
            r0 = 0
        L_0x0041:
            throw r2     // Catch:{ all -> 0x0039 }
        L_0x0042:
            r1 = move-exception
            com.getjar.sdk.logging.Area r4 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ all -> 0x0039 }
            long r4 = r4.value()     // Catch:{ all -> 0x0039 }
            com.getjar.sdk.logging.Area r6 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x0039 }
            long r6 = r6.value()     // Catch:{ all -> 0x0039 }
            long r4 = r4 | r6
            java.lang.String r6 = "SQLiteStatement.close() failed"
            com.getjar.sdk.logging.Logger.m643e(r4, r6, r1)     // Catch:{ all -> 0x0039 }
            goto L_0x0041
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.comm.persistence.DBTransactions.getRecordCount():long");
    }

    /* JADX WARNING: Unknown top exception splitter block from list: {B:13:0x0039=Splitter:B:13:0x0039, B:16:0x003d=Splitter:B:16:0x003d, B:29:0x005d=Splitter:B:29:0x005d} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean checkForRecord(java.lang.String r12) {
        /*
            r11 = this;
            r3 = 0
            r2 = 1
            boolean r4 = com.getjar.sdk.utilities.StringUtility.isNullOrEmpty(r12)
            if (r4 == 0) goto L_0x0010
            java.lang.IllegalArgumentException r2 = new java.lang.IllegalArgumentException
            java.lang.String r3 = "'clientTransactionId' can not be NULL or empty"
            r2.<init>(r3)
            throw r2
        L_0x0010:
            java.lang.Object r4 = r11._databaseAccessLock
            monitor-enter(r4)
            android.database.sqlite.SQLiteDatabase r5 = r11.getReadableDatabase()     // Catch:{ all -> 0x0055 }
            java.util.Locale r6 = java.util.Locale.US     // Catch:{ all -> 0x0055 }
            java.lang.String r7 = "SELECT count(*) FROM %1$s WHERE clientTransactionId = ?"
            r8 = 1
            java.lang.Object[] r8 = new java.lang.Object[r8]     // Catch:{ all -> 0x0055 }
            r9 = 0
            java.lang.String r10 = "transactions"
            r8[r9] = r10     // Catch:{ all -> 0x0055 }
            java.lang.String r6 = java.lang.String.format(r6, r7, r8)     // Catch:{ all -> 0x0055 }
            android.database.sqlite.SQLiteStatement r0 = r5.compileStatement(r6)     // Catch:{ all -> 0x0055 }
            r5 = 1
            r0.bindString(r5, r12)     // Catch:{ all -> 0x0058 }
            long r5 = r0.simpleQueryForLong()     // Catch:{ all -> 0x0058 }
            r7 = 0
            int r5 = (r5 > r7 ? 1 : (r5 == r7 ? 0 : -1))
            if (r5 <= 0) goto L_0x003f
        L_0x0039:
            r0.close()     // Catch:{ Exception -> 0x0041 }
            r0 = 0
        L_0x003d:
            monitor-exit(r4)     // Catch:{ all -> 0x0055 }
            return r2
        L_0x003f:
            r2 = r3
            goto L_0x0039
        L_0x0041:
            r1 = move-exception
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ all -> 0x0055 }
            long r5 = r3.value()     // Catch:{ all -> 0x0055 }
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x0055 }
            long r7 = r3.value()     // Catch:{ all -> 0x0055 }
            long r5 = r5 | r7
            java.lang.String r3 = "SQLiteStatement.close() failed"
            com.getjar.sdk.logging.Logger.m643e(r5, r3, r1)     // Catch:{ all -> 0x0055 }
            goto L_0x003d
        L_0x0055:
            r2 = move-exception
            monitor-exit(r4)     // Catch:{ all -> 0x0055 }
            throw r2
        L_0x0058:
            r2 = move-exception
            r0.close()     // Catch:{ Exception -> 0x005e }
            r0 = 0
        L_0x005d:
            throw r2     // Catch:{ all -> 0x0055 }
        L_0x005e:
            r1 = move-exception
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.TRANSACTION     // Catch:{ all -> 0x0055 }
            long r5 = r3.value()     // Catch:{ all -> 0x0055 }
            com.getjar.sdk.logging.Area r3 = com.getjar.sdk.logging.Area.STORAGE     // Catch:{ all -> 0x0055 }
            long r7 = r3.value()     // Catch:{ all -> 0x0055 }
            long r5 = r5 | r7
            java.lang.String r3 = "SQLiteStatement.close() failed"
            com.getjar.sdk.logging.Logger.m643e(r5, r3, r1)     // Catch:{ all -> 0x0055 }
            goto L_0x005d
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.comm.persistence.DBTransactions.checkForRecord(java.lang.String):boolean");
    }

    public boolean insertPurchaseTransaction(String clientTransactionId, Serializable relatedObject) throws IOException {
        return insertTransaction(clientTransactionId, relatedObject, TransactionType.PURCHASE.name(), PurchaseState.CREATED);
    }

    public boolean insertManagedOfferTransaction(String clientTransactionId, Serializable relatedObject, ManagedOfferState managedOfferState) throws IOException {
        return insertTransaction(clientTransactionId, relatedObject, TransactionType.MANAGED_OFFER.name(), managedOfferState);
    }

    public boolean insertEarnTransaction(String clientTransactionId, Serializable relatedObject) throws IOException {
        return insertTransaction(clientTransactionId, relatedObject, TransactionType.EARN.name(), PurchaseState.CREATED);
    }

    public boolean updatePurchaseTransaction(PurchaseUnmanagedBucket transaction, PurchaseState state) {
        return updateTransaction(transaction, state.name());
    }

    public boolean updateEarnTransaction(EarnBucket transaction, EarnState state) {
        return updateTransaction(transaction, state.name());
    }

    public boolean updateManagedOfferTransaction(ManagedOfferBucket transaction, ManagedOfferState state) {
        return updateTransaction(transaction, state.name());
    }

    public boolean updateManagedOfferTransaction(String clientTransactionId, RelatedManagedOfferData relatedData) throws IOException {
        boolean wasUpdated;
        if (StringUtility.isNullOrEmpty(clientTransactionId)) {
            throw new IllegalArgumentException("'clientTransactionId' can not be NULL or empty");
        } else if (relatedData == null) {
            throw new IllegalArgumentException("'relatedData' can not be NULL");
        } else {
            long currentTime = System.currentTimeMillis();
            ContentValues values = new ContentValues();
            values.put("timestampLastUpdated", Long.valueOf(currentTime));
            values.put("relatedObject", Base64.encodeObject(relatedData));
            synchronized (this._databaseAccessLock) {
                if (getWritableDatabase().update(DATABASE_TABLE, values, "clientTransactionId = ?", new String[]{clientTransactionId}) > 0) {
                    wasUpdated = true;
                } else {
                    wasUpdated = false;
                }
            }
            return wasUpdated;
        }
    }

    public boolean updateEarnTransactionNotificationState(EarnBucket transaction, NotificationState newState) {
        boolean wasUpdated;
        if (transaction == null) {
            throw new IllegalArgumentException("'transaction' can not be NULL");
        } else if (StringUtility.isNullOrEmpty(transaction.getClientTransactionId())) {
            throw new IllegalArgumentException("'clientTransactionId' can not be NULL or empty");
        } else if (newState == null) {
            throw new IllegalArgumentException("'newState' can not be NULL");
        } else {
            NotificationState oldState = transaction.getNotificationState();
            if (!NotificationState.NONE.equals(oldState) && NotificationState.NONE.equals(newState)) {
                throw new IllegalStateException("We can not update state from having sent a notification to not having sent a notification");
            } else if ((NotificationState.FAILED.equals(oldState) || NotificationState.SUCCEEDED.equals(oldState)) && NotificationState.NO_GOLD.equals(newState)) {
                throw new IllegalStateException("We can not update state from having sent a final notification to having sent a NO_GOLD notification");
            } else if (NotificationState.FAILED.equals(oldState) && NotificationState.SUCCEEDED.equals(newState)) {
                throw new IllegalStateException("We can not update state from having sent a failed notification to having sent a succeeded notification");
            } else if (!NotificationState.SUCCEEDED.equals(oldState) || !NotificationState.FAILED.equals(newState)) {
                long currentTime = System.currentTimeMillis();
                ContentValues values = new ContentValues();
                values.put("timestampLastUpdated", Long.valueOf(currentTime));
                values.put("notificationState", newState.name());
                synchronized (this._databaseAccessLock) {
                    wasUpdated = getWritableDatabase().update(DATABASE_TABLE, values, "clientTransactionId = ?", new String[]{transaction.getClientTransactionId()}) > 0;
                }
                if (wasUpdated) {
                    transaction.setNotificationState(newState);
                    transaction.setTimestampLastUpdated(currentTime);
                    Logger.m646v(Area.TRANSACTION.value() | Area.STORAGE.value() | Area.EARN.value(), String.format(Locale.US, "DBTransactions: updateEarnTransactionNotificationState() Updated from %1$s to %2$s", new Object[]{oldState, newState}));
                }
                return wasUpdated;
            } else {
                throw new IllegalStateException("We can not update state from having sent a succeeded notification to having sent a failed notification");
            }
        }
    }

    public boolean deleteTransaction(String clientTransactionId) {
        boolean z = true;
        if (StringUtility.isNullOrEmpty(clientTransactionId)) {
            throw new IllegalArgumentException("'clientTransactionId' can not be NULL or empty");
        }
        synchronized (this._databaseAccessLock) {
            if (getWritableDatabase().delete(DATABASE_TABLE, "clientTransactionId = ?", new String[]{clientTransactionId}) <= 0) {
                z = false;
            }
        }
        return z;
    }

    /* JADX WARNING: Unknown top exception splitter block from list: {B:16:0x0036=Splitter:B:16:0x0036, B:23:0x003d=Splitter:B:23:0x003d} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public com.getjar.sdk.comm.persistence.TransactionBucket loadTransaction(java.lang.String r12) {
        /*
            r11 = this;
            boolean r0 = com.getjar.sdk.utilities.StringUtility.isNullOrEmpty(r12)
            if (r0 == 0) goto L_0x000e
            java.lang.IllegalArgumentException r0 = new java.lang.IllegalArgumentException
            java.lang.String r1 = "'clientTransactionId' can not be NULL or empty"
            r0.<init>(r1)
            throw r0
        L_0x000e:
            java.lang.Object r10 = r11._databaseAccessLock
            monitor-enter(r10)
            r9 = 0
            android.database.sqlite.SQLiteDatabase r0 = r11.getReadableDatabase()     // Catch:{ all -> 0x003e }
            java.lang.String r1 = "transactions"
            r2 = 0
            java.lang.String r3 = "clientTransactionId = ?"
            r4 = 1
            java.lang.String[] r4 = new java.lang.String[r4]     // Catch:{ all -> 0x003e }
            r5 = 0
            r4[r5] = r12     // Catch:{ all -> 0x003e }
            r5 = 0
            r6 = 0
            r7 = 0
            android.database.Cursor r8 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch:{ all -> 0x003e }
            boolean r0 = r8.moveToNext()     // Catch:{ all -> 0x0038 }
            if (r0 == 0) goto L_0x0032
            com.getjar.sdk.comm.persistence.TransactionBucket r9 = r11.getTransactionBucketInstance(r8)     // Catch:{ all -> 0x0038 }
        L_0x0032:
            r8.close()     // Catch:{ Throwable -> 0x0041 }
            r8 = 0
        L_0x0036:
            monitor-exit(r10)     // Catch:{ all -> 0x003e }
            return r9
        L_0x0038:
            r0 = move-exception
            r8.close()     // Catch:{ Throwable -> 0x0043 }
            r8 = 0
        L_0x003d:
            throw r0     // Catch:{ all -> 0x003e }
        L_0x003e:
            r0 = move-exception
            monitor-exit(r10)     // Catch:{ all -> 0x003e }
            throw r0
        L_0x0041:
            r0 = move-exception
            goto L_0x0036
        L_0x0043:
            r1 = move-exception
            goto L_0x003d
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.comm.persistence.DBTransactions.loadTransaction(java.lang.String):com.getjar.sdk.comm.persistence.TransactionBucket");
    }

    /* JADX WARNING: Unknown top exception splitter block from list: {B:20:0x0034=Splitter:B:20:0x0034, B:12:0x002c=Splitter:B:12:0x002c} */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public java.util.List<com.getjar.sdk.comm.persistence.TransactionBucket> loadAllTransactions() {
        /*
            r11 = this;
            java.lang.Object r10 = r11._databaseAccessLock
            monitor-enter(r10)
            java.util.ArrayList r9 = new java.util.ArrayList     // Catch:{ all -> 0x002d }
            r9.<init>()     // Catch:{ all -> 0x002d }
            android.database.sqlite.SQLiteDatabase r0 = r11.getReadableDatabase()     // Catch:{ all -> 0x002d }
            java.lang.String r1 = "transactions"
            r2 = 0
            r3 = 0
            r4 = 0
            r5 = 0
            r6 = 0
            java.lang.String r7 = "timestampCreated DESC"
            android.database.Cursor r8 = r0.query(r1, r2, r3, r4, r5, r6, r7)     // Catch:{ all -> 0x002d }
        L_0x0019:
            boolean r0 = r8.moveToNext()     // Catch:{ all -> 0x0027 }
            if (r0 == 0) goto L_0x0030
            com.getjar.sdk.comm.persistence.TransactionBucket r0 = r11.getTransactionBucketInstance(r8)     // Catch:{ all -> 0x0027 }
            r9.add(r0)     // Catch:{ all -> 0x0027 }
            goto L_0x0019
        L_0x0027:
            r0 = move-exception
            r8.close()     // Catch:{ Throwable -> 0x0038 }
            r8 = 0
        L_0x002c:
            throw r0     // Catch:{ all -> 0x002d }
        L_0x002d:
            r0 = move-exception
            monitor-exit(r10)     // Catch:{ all -> 0x002d }
            throw r0
        L_0x0030:
            r8.close()     // Catch:{ Throwable -> 0x0036 }
            r8 = 0
        L_0x0034:
            monitor-exit(r10)     // Catch:{ all -> 0x002d }
            return r9
        L_0x0036:
            r0 = move-exception
            goto L_0x0034
        L_0x0038:
            r1 = move-exception
            goto L_0x002c
        */
        throw new UnsupportedOperationException("Method not decompiled: com.getjar.sdk.comm.persistence.DBTransactions.loadAllTransactions():java.util.List");
    }

    private TransactionBucket getTransactionBucketInstance(Cursor results) {
        TransactionBucket transaction;
        int id = results.getInt(0);
        String clientTransactionId = results.getString(1);
        long timestampCreated = results.getLong(2);
        long timestampLastUpdated = results.getLong(3);
        String stateString = results.getString(4);
        TransactionType type = (TransactionType) Enum.valueOf(TransactionType.class, results.getString(5));
        String relatedObject = results.getString(6);
        NotificationState notificationState = (NotificationState) Enum.valueOf(NotificationState.class, results.getString(7));
        if (TransactionType.PURCHASE.equals(type)) {
            transaction = new PurchaseUnmanagedBucket();
        } else if (TransactionType.EARN.equals(type)) {
            transaction = new EarnBucket();
        } else if (TransactionType.MANAGED_OFFER.equals(type)) {
            transaction = new ManagedOfferBucket();
        } else {
            throw new IllegalStateException(String.format(Locale.US, "Unrecognized transaction type '%1$s'", new Object[]{type.name()}));
        }
        transaction.setClientTransactionId(clientTransactionId);
        transaction.setDatabaseId(id);
        transaction.setSerializedRelatedObject(relatedObject);
        transaction.setStateString(stateString);
        transaction.setTimestampCreated(timestampCreated);
        transaction.setTimestampLastUpdated(timestampLastUpdated);
        transaction.setType(type);
        transaction.setNotificationState(notificationState);
        return transaction;
    }

    private boolean insertTransaction(String clientTransactionId, Serializable relatedObject, String type, TransactionState state) throws IOException {
        boolean z = true;
        if (StringUtility.isNullOrEmpty(clientTransactionId)) {
            throw new IllegalArgumentException("'clientTransactionId' can not be NULL or empty");
        } else if (checkForRecord(clientTransactionId)) {
            throw new IllegalStateException(String.format(Locale.US, "A record with a client transaction ID of '%1$s' already exists in the database", new Object[]{clientTransactionId}));
        } else {
            ContentValues values = new ContentValues();
            values.put("clientTransactionId", clientTransactionId);
            if (relatedObject == null) {
                values.putNull("relatedObject");
            } else {
                values.put("relatedObject", Base64.encodeObject(relatedObject));
            }
            if (PurchaseState.class.isAssignableFrom(state.getClass())) {
                values.put("state", ((PurchaseState) state).name());
            } else if (ManagedOfferState.class.isAssignableFrom(state.getClass())) {
                values.put("state", ((ManagedOfferState) state).name());
            }
            values.put(ServerProtocol.DIALOG_PARAM_TYPE, type);
            long timestamp = System.currentTimeMillis();
            values.put("timestampCreated", Long.valueOf(timestamp));
            values.put("timestampLastUpdated", Long.valueOf(timestamp));
            synchronized (this._databaseAccessLock) {
                if (getWritableDatabase().insert(DATABASE_TABLE, (String) null, values) == -1) {
                    z = false;
                }
            }
            return z;
        }
    }

    private boolean updateTransaction(TransactionBucket transaction, String state) {
        boolean wasUpdated;
        if (transaction == null) {
            throw new IllegalArgumentException("'transaction' can not be NULL");
        } else if (StringUtility.isNullOrEmpty(transaction.getClientTransactionId())) {
            throw new IllegalArgumentException("'clientTransactionId' can not be NULL or empty");
        } else if (StringUtility.isNullOrEmpty(state)) {
            throw new IllegalArgumentException("'state' can not be NULL or empty");
        } else {
            Logger.m646v(Area.STORAGE.value() | Area.TRANSACTION.value(), String.format(Locale.US, "DBTransactions updateTransaction [clientTransactionId:%1$s] [newState:%2$s]", new Object[]{transaction.getClientTransactionId(), state}));
            long currentTime = System.currentTimeMillis();
            ContentValues values = new ContentValues();
            values.put("timestampLastUpdated", Long.valueOf(currentTime));
            values.put("state", state);
            synchronized (this._databaseAccessLock) {
                wasUpdated = getWritableDatabase().update(DATABASE_TABLE, values, "clientTransactionId = ?", new String[]{transaction.getClientTransactionId()}) > 0;
            }
            if (wasUpdated) {
                transaction.setStateString(state);
                transaction.setTimestampLastUpdated(currentTime);
            }
            return wasUpdated;
        }
    }
}
