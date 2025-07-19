package com.getjar.sdk.comm.persistence;

import com.getjar.sdk.comm.persistence.DBTransactions;
import com.getjar.sdk.utilities.Base64;
import com.getjar.sdk.utilities.StringUtility;
import java.io.IOException;
import java.io.Serializable;
import java.util.Locale;
/* loaded from: classes.dex */
public class EarnBucket extends TransactionBucket {
    public EarnBucket() {
        setType(DBTransactions.TransactionType.EARN);
    }

    public EarnBucket(String clientTransactionId, Serializable relatedObject) throws IOException {
        super(clientTransactionId, DBTransactions.TransactionType.EARN, relatedObject);
    }

    @Override // com.getjar.sdk.comm.persistence.TransactionBucket
    protected void setTypeString(String type) {
        if (StringUtility.isNullOrEmpty(type)) {
            throw new IllegalArgumentException("'type' can not be NULL or empty");
        }
        DBTransactions.TransactionType transactionType = (DBTransactions.TransactionType) Enum.valueOf(DBTransactions.TransactionType.class, type);
        if (!DBTransactions.TransactionType.EARN.equals(transactionType)) {
            throw new IllegalArgumentException(String.format(Locale.US, "Can not set the TransactionType for EarnBucket to '%1$s'", type));
        }
        super.setTypeString(DBTransactions.TransactionType.EARN.name());
    }

    @Override // com.getjar.sdk.comm.persistence.TransactionBucket
    public void setType(DBTransactions.TransactionType type) {
        if (!DBTransactions.TransactionType.EARN.equals(type)) {
            throw new IllegalArgumentException(String.format(Locale.US, "Can not set the TransactionType for EarnBucket to '%1$s'", type.name()));
        }
        super.setTypeString(DBTransactions.TransactionType.EARN.name());
    }

    public DBTransactions.EarnState getState() {
        return (DBTransactions.EarnState) Enum.valueOf(DBTransactions.EarnState.class, super.getStateString());
    }

    public void setState(DBTransactions.EarnState state) {
        setStateString(state.name());
    }

    @Override // com.getjar.sdk.comm.persistence.TransactionBucket
    protected void setStateString(String state) {
        if (StringUtility.isNullOrEmpty(state)) {
            throw new IllegalArgumentException("'state' can not be NULL or empty");
        }
        try {
            Enum.valueOf(DBTransactions.EarnState.class, state);
            super.setStateString(state);
        } catch (Exception e) {
            throw new IllegalArgumentException(String.format(Locale.US, "Can not set the state for EarnBucket to '%1$s'", state), e);
        }
    }

    @Override // com.getjar.sdk.comm.persistence.TransactionBucket
    /* renamed from: getRelatedObject */
    public RelatedEarnData mo46getRelatedObject() throws IOException, ClassNotFoundException {
        if (StringUtility.isNullOrEmpty(this._relatedObject)) {
            return null;
        }
        return (RelatedEarnData) Base64.decodeToObject(this._relatedObject);
    }
}
