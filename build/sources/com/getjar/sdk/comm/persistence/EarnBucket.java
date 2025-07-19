package com.getjar.sdk.comm.persistence;

import com.getjar.sdk.comm.persistence.DBTransactions;
import com.getjar.sdk.utilities.Base64;
import com.getjar.sdk.utilities.StringUtility;
import java.io.IOException;
import java.io.Serializable;
import java.util.Locale;

public class EarnBucket extends TransactionBucket {
    public EarnBucket() {
        setType(DBTransactions.TransactionType.EARN);
    }

    public EarnBucket(String clientTransactionId, Serializable relatedObject) throws IOException {
        super(clientTransactionId, DBTransactions.TransactionType.EARN, relatedObject);
    }

    /* access modifiers changed from: protected */
    public void setTypeString(String type) {
        if (StringUtility.isNullOrEmpty(type)) {
            throw new IllegalArgumentException("'type' can not be NULL or empty");
        }
        if (!DBTransactions.TransactionType.EARN.equals((DBTransactions.TransactionType) Enum.valueOf(DBTransactions.TransactionType.class, type))) {
            throw new IllegalArgumentException(String.format(Locale.US, "Can not set the TransactionType for EarnBucket to '%1$s'", new Object[]{type}));
        }
        super.setTypeString(DBTransactions.TransactionType.EARN.name());
    }

    public void setType(DBTransactions.TransactionType type) {
        if (!DBTransactions.TransactionType.EARN.equals(type)) {
            throw new IllegalArgumentException(String.format(Locale.US, "Can not set the TransactionType for EarnBucket to '%1$s'", new Object[]{type.name()}));
        }
        super.setTypeString(DBTransactions.TransactionType.EARN.name());
    }

    public DBTransactions.EarnState getState() {
        return (DBTransactions.EarnState) Enum.valueOf(DBTransactions.EarnState.class, super.getStateString());
    }

    public void setState(DBTransactions.EarnState state) {
        setStateString(state.name());
    }

    /* access modifiers changed from: protected */
    public void setStateString(String state) {
        if (StringUtility.isNullOrEmpty(state)) {
            throw new IllegalArgumentException("'state' can not be NULL or empty");
        }
        try {
            Enum.valueOf(DBTransactions.EarnState.class, state);
            super.setStateString(state);
        } catch (Exception e) {
            throw new IllegalArgumentException(String.format(Locale.US, "Can not set the state for EarnBucket to '%1$s'", new Object[]{state}), e);
        }
    }

    public RelatedEarnData getRelatedObject() throws IOException, ClassNotFoundException {
        if (StringUtility.isNullOrEmpty(this._relatedObject)) {
            return null;
        }
        return (RelatedEarnData) Base64.decodeToObject(this._relatedObject);
    }
}
