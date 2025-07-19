package com.getjar.sdk.comm.persistence;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.database.sqlite.SQLiteStatement;
import com.facebook.internal.ServerProtocol;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.Base64;
import com.getjar.sdk.utilities.StringUtility;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
/* loaded from: classes.dex */
public class DBTransactions extends SQLiteOpenHelper {
    private static final String DATABASE_NAME_PREFIX = "GetJarDBTransactions";
    private static final String DATABASE_TABLE = "transactions";
    private static final int DATABASE_VERSION = 3;
    private volatile Object _databaseAccessLock = new Object();
    private static volatile DBTransactions _Instance = null;
    private static final String DATABASE_CREATE = "CREATE TABLE IF NOT EXISTS transactions (id INTEGER PRIMARY KEY AUTOINCREMENT, clientTransactionId TEXT NOT NULL UNIQUE, timestampCreated INTEGER NOT NULL, timestampLastUpdated INTEGER NOT NULL, state TEXT NOT NULL, type TEXT NOT NULL, relatedObject TEXT, notificationState TEXT NOT NULL DEFAULT '" + NotificationState.NONE.name() + "');";

    /* loaded from: classes.dex */
    public enum EarnState {
        CREATED,
        EARNING,
        DONE
    }

    /* loaded from: classes.dex */
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

    /* loaded from: classes.dex */
    public enum NotificationState {
        NONE,
        NO_GOLD,
        FAILED,
        SUCCEEDED
    }

    /* loaded from: classes.dex */
    public enum PurchaseState implements TransactionState {
        CREATED,
        RESERVING,
        CANCELING,
        CONFIRMING,
        DONE
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public interface TransactionState {
    }

    /* loaded from: classes.dex */
    public enum TransactionType {
        PURCHASE,
        EARN,
        MANAGED_OFFER
    }

    private DBTransactions(Context context) {
        super(context, String.format(Locale.US, "%1$s%2$d", DATABASE_NAME_PREFIX, Integer.valueOf(AuthManager.getInstance().getUserAccessId().hashCode())), (SQLiteDatabase.CursorFactory) null, 3);
        Logger.i(Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "DBTransactions: Opened user specific database '%1$s%2$d'", DATABASE_NAME_PREFIX, Integer.valueOf(AuthManager.getInstance().getUserAccessId().hashCode())));
    }

    public static synchronized DBTransactions getInstance(Context context) {
        DBTransactions dBTransactions;
        synchronized (DBTransactions.class) {
            if (context == null) {
                throw new IllegalArgumentException("'context' can not be NULL");
            }
            Logger.i(Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "DBTransactions: waitForUserAccess() START [%1$s]", Logger.getShortStack()));
            AuthManager.initialize(context);
            AuthManager.getInstance().waitOnAuth();
            Logger.i(Area.TRANSACTION.value() | Area.STORAGE.value(), "DBTransactions: waitForUserAccess() DONE");
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

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onCreate(SQLiteDatabase db) {
        db.execSQL(DATABASE_CREATE);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        Logger.d(Area.TRANSACTION.value() | Area.STORAGE.value(), String.format(Locale.US, "Upgrading database from version %1$d to %2$d, which will destroy all old data", Integer.valueOf(oldVersion), Integer.valueOf(newVersion)));
        db.execSQL("DROP TABLE IF EXISTS transactions");
        onCreate(db);
    }

    public long getRecordCount() {
        long simpleQueryForLong;
        synchronized (this._databaseAccessLock) {
            SQLiteStatement dbStatement = getReadableDatabase().compileStatement(String.format(Locale.US, "SELECT count(*) FROM %1$s", DATABASE_TABLE));
            simpleQueryForLong = dbStatement.simpleQueryForLong();
            try {
                dbStatement.close();
            } catch (Exception e) {
                Logger.e(Area.TRANSACTION.value() | Area.STORAGE.value(), "SQLiteStatement.close() failed", e);
            }
        }
        return simpleQueryForLong;
    }

    public boolean checkForRecord(String clientTransactionId) {
        boolean z = true;
        if (StringUtility.isNullOrEmpty(clientTransactionId)) {
            throw new IllegalArgumentException("'clientTransactionId' can not be NULL or empty");
        }
        synchronized (this._databaseAccessLock) {
            SQLiteStatement dbStatement = getReadableDatabase().compileStatement(String.format(Locale.US, "SELECT count(*) FROM %1$s WHERE clientTransactionId = ?", DATABASE_TABLE));
            dbStatement.bindString(1, clientTransactionId);
            if (dbStatement.simpleQueryForLong() <= 0) {
                z = false;
            }
            try {
                dbStatement.close();
            } catch (Exception e) {
                Logger.e(Area.TRANSACTION.value() | Area.STORAGE.value(), "SQLiteStatement.close() failed", e);
            }
        }
        return z;
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
        }
        if (relatedData == null) {
            throw new IllegalArgumentException("'relatedData' can not be NULL");
        }
        long currentTime = System.currentTimeMillis();
        ContentValues values = new ContentValues();
        values.put("timestampLastUpdated", Long.valueOf(currentTime));
        values.put("relatedObject", Base64.encodeObject(relatedData));
        synchronized (this._databaseAccessLock) {
            wasUpdated = getWritableDatabase().update(DATABASE_TABLE, values, "clientTransactionId = ?", new String[]{clientTransactionId}) > 0;
        }
        return wasUpdated;
    }

    public boolean updateEarnTransactionNotificationState(EarnBucket transaction, NotificationState newState) {
        boolean wasUpdated;
        if (transaction == null) {
            throw new IllegalArgumentException("'transaction' can not be NULL");
        }
        if (StringUtility.isNullOrEmpty(transaction.getClientTransactionId())) {
            throw new IllegalArgumentException("'clientTransactionId' can not be NULL or empty");
        }
        if (newState == null) {
            throw new IllegalArgumentException("'newState' can not be NULL");
        }
        NotificationState oldState = transaction.getNotificationState();
        if (!NotificationState.NONE.equals(oldState) && NotificationState.NONE.equals(newState)) {
            throw new IllegalStateException("We can not update state from having sent a notification to not having sent a notification");
        }
        if ((NotificationState.FAILED.equals(oldState) || NotificationState.SUCCEEDED.equals(oldState)) && NotificationState.NO_GOLD.equals(newState)) {
            throw new IllegalStateException("We can not update state from having sent a final notification to having sent a NO_GOLD notification");
        }
        if (NotificationState.FAILED.equals(oldState) && NotificationState.SUCCEEDED.equals(newState)) {
            throw new IllegalStateException("We can not update state from having sent a failed notification to having sent a succeeded notification");
        }
        if (NotificationState.SUCCEEDED.equals(oldState) && NotificationState.FAILED.equals(newState)) {
            throw new IllegalStateException("We can not update state from having sent a succeeded notification to having sent a failed notification");
        }
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
            Logger.v(Area.TRANSACTION.value() | Area.STORAGE.value() | Area.EARN.value(), String.format(Locale.US, "DBTransactions: updateEarnTransactionNotificationState() Updated from %1$s to %2$s", oldState, newState));
        }
        return wasUpdated;
    }

    public boolean deleteTransaction(String clientTransactionId) {
        boolean z = true;
        if (StringUtility.isNullOrEmpty(clientTransactionId)) {
            throw new IllegalArgumentException("'clientTransactionId' can not be NULL or empty");
        }
        synchronized (this._databaseAccessLock) {
            int deleteCount = getWritableDatabase().delete(DATABASE_TABLE, "clientTransactionId = ?", new String[]{clientTransactionId});
            if (deleteCount <= 0) {
                z = false;
            }
        }
        return z;
    }

    public TransactionBucket loadTransaction(String clientTransactionId) {
        TransactionBucket transaction;
        if (StringUtility.isNullOrEmpty(clientTransactionId)) {
            throw new IllegalArgumentException("'clientTransactionId' can not be NULL or empty");
        }
        synchronized (this._databaseAccessLock) {
            transaction = null;
            Cursor results = getReadableDatabase().query(DATABASE_TABLE, null, "clientTransactionId = ?", new String[]{clientTransactionId}, null, null, null);
            if (results.moveToNext()) {
                transaction = getTransactionBucketInstance(results);
            }
            try {
                results.close();
            } catch (Throwable th) {
            }
        }
        return transaction;
    }

    public List<TransactionBucket> loadAllTransactions() {
        List<TransactionBucket> transactionList;
        synchronized (this._databaseAccessLock) {
            transactionList = new ArrayList<>();
            Cursor results = getReadableDatabase().query(DATABASE_TABLE, null, null, null, null, null, "timestampCreated DESC");
            while (results.moveToNext()) {
                transactionList.add(getTransactionBucketInstance(results));
            }
            try {
                results.close();
            } catch (Throwable th) {
            }
        }
        return transactionList;
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
            throw new IllegalStateException(String.format(Locale.US, "Unrecognized transaction type '%1$s'", type.name()));
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
        }
        if (checkForRecord(clientTransactionId)) {
            throw new IllegalStateException(String.format(Locale.US, "A record with a client transaction ID of '%1$s' already exists in the database", clientTransactionId));
        }
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
            if (getWritableDatabase().insert(DATABASE_TABLE, null, values) == -1) {
                z = false;
            }
        }
        return z;
    }

    private boolean updateTransaction(TransactionBucket transaction, String state) {
        boolean wasUpdated;
        if (transaction == null) {
            throw new IllegalArgumentException("'transaction' can not be NULL");
        }
        if (StringUtility.isNullOrEmpty(transaction.getClientTransactionId())) {
            throw new IllegalArgumentException("'clientTransactionId' can not be NULL or empty");
        }
        if (StringUtility.isNullOrEmpty(state)) {
            throw new IllegalArgumentException("'state' can not be NULL or empty");
        }
        Logger.v(Area.STORAGE.value() | Area.TRANSACTION.value(), String.format(Locale.US, "DBTransactions updateTransaction [clientTransactionId:%1$s] [newState:%2$s]", transaction.getClientTransactionId(), state));
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
