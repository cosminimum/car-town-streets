package com.getjar.sdk.comm.persistence;

import com.getjar.sdk.comm.persistence.DBTransactions;
import com.getjar.sdk.utilities.Base64;
import com.getjar.sdk.utilities.StringUtility;
import java.io.IOException;
import java.io.Serializable;
import java.util.Locale;
/* loaded from: classes.dex */
public abstract class TransactionBucket {
    private String _clientTransactionId;
    private int _databaseId;
    private boolean _isNewTransaction;
    private DBTransactions.NotificationState _notificationState;
    protected String _relatedObject;
    private String _state;
    private long _timestampCreated;
    private long _timestampLastUpdated;
    private DBTransactions.TransactionType _type;

    /* JADX INFO: Access modifiers changed from: protected */
    public TransactionBucket() {
        this._state = null;
        this._isNewTransaction = false;
        this._relatedObject = null;
        this._notificationState = null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public TransactionBucket(String clientTransactionId, DBTransactions.TransactionType type, Serializable relatedObject) throws IOException {
        this._state = null;
        this._isNewTransaction = false;
        this._relatedObject = null;
        this._notificationState = null;
        if (StringUtility.isNullOrEmpty(clientTransactionId)) {
            throw new IllegalArgumentException("'clientTransactionId' can not be NULL or empty");
        }
        if (type == null) {
            throw new IllegalArgumentException("'type' can not be NULL");
        }
        this._clientTransactionId = clientTransactionId;
        this._type = type;
        if (relatedObject != null) {
            this._relatedObject = Base64.encodeObject(relatedObject);
        }
    }

    public boolean getIsNewTransaction() {
        return this._isNewTransaction;
    }

    protected int getDatabaseId() {
        return this._databaseId;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setDatabaseId(int databaseId) {
        this._databaseId = databaseId;
    }

    public String getClientTransactionId() {
        return this._clientTransactionId;
    }

    public void setClientTransactionId(String clientTransactionId) {
        this._clientTransactionId = clientTransactionId;
    }

    public long getTimestampCreated() {
        return this._timestampCreated;
    }

    public void setTimestampCreated(long timestampCreated) {
        this._timestampCreated = timestampCreated;
    }

    public long getTimestampLastUpdated() {
        return this._timestampLastUpdated;
    }

    public void setTimestampLastUpdated(long timestampLastUpdated) {
        this._timestampLastUpdated = timestampLastUpdated;
    }

    protected String getTypeString() {
        return this._type.name();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setTypeString(String type) {
        this._type = (DBTransactions.TransactionType) Enum.valueOf(DBTransactions.TransactionType.class, type);
    }

    public DBTransactions.TransactionType getType() {
        return this._type;
    }

    public void setType(DBTransactions.TransactionType type) {
        this._type = type;
    }

    public DBTransactions.NotificationState getNotificationState() {
        return this._notificationState;
    }

    public void setNotificationState(DBTransactions.NotificationState notificationState) {
        this._notificationState = notificationState;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public String getStateString() {
        return this._state;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setStateString(String state) {
        try {
            if ((EarnBucket.class.isInstance(this) && ((DBTransactions.EarnState) Enum.valueOf(DBTransactions.EarnState.class, state)).equals(DBTransactions.EarnState.CREATED)) || (PurchaseUnmanagedBucket.class.isInstance(this) && ((DBTransactions.PurchaseState) Enum.valueOf(DBTransactions.PurchaseState.class, state)).equals(DBTransactions.PurchaseState.CREATED))) {
                this._isNewTransaction = true;
            }
            this._state = state;
        } catch (Exception e) {
            throw new IllegalArgumentException(String.format(Locale.US, "Unable to parse the string '%1$s' into one of our transaction state enums", state), e);
        }
    }

    protected String getSerializedRelatedObject() {
        return this._relatedObject;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setSerializedRelatedObject(String relatedObject) {
        this._relatedObject = relatedObject;
    }

    /* renamed from: getRelatedObject */
    public Serializable mo46getRelatedObject() throws IOException, ClassNotFoundException {
        if (StringUtility.isNullOrEmpty(this._relatedObject)) {
            return null;
        }
        return (Serializable) Base64.decodeToObject(this._relatedObject);
    }

    public void setRelatedObject(Serializable relatedObject) throws IOException {
        if (relatedObject == null) {
            this._relatedObject = null;
        } else {
            this._relatedObject = Base64.encodeObject(relatedObject);
        }
    }

    public String toString() {
        return "DB ID: " + this._databaseId + "\r\n      " + this._clientTransactionId + "\r\n      " + this._timestampCreated + "\r\n      " + this._timestampLastUpdated + "\r\n      " + this._type.name() + "\r\n      " + this._state + "\r\n      " + this._relatedObject;
    }
}
