package com.getjar.sdk.comm.persistence;

import com.getjar.sdk.comm.persistence.DBTransactions;
import com.getjar.sdk.utilities.Base64;
import com.getjar.sdk.utilities.StringUtility;
import java.io.IOException;
import java.io.Serializable;
import java.util.Locale;
/* loaded from: classes.dex */
public class PurchaseUnmanagedBucket extends TransactionBucket {
    public PurchaseUnmanagedBucket() {
        setType(DBTransactions.TransactionType.PURCHASE);
    }

    public PurchaseUnmanagedBucket(String clientTransactionId, Serializable relatedObject) throws IOException {
        super(clientTransactionId, DBTransactions.TransactionType.PURCHASE, relatedObject);
    }

    @Override // com.getjar.sdk.comm.persistence.TransactionBucket
    protected void setTypeString(String type) {
        if (StringUtility.isNullOrEmpty(type)) {
            throw new IllegalArgumentException("'type' can not be NULL or empty");
        }
        DBTransactions.TransactionType transactionType = (DBTransactions.TransactionType) Enum.valueOf(DBTransactions.TransactionType.class, type);
        if (!DBTransactions.TransactionType.PURCHASE.equals(transactionType)) {
            throw new IllegalArgumentException(String.format(Locale.US, "Can not set the TransactionType for PurchaseBucket to '%1$s'", type));
        }
        super.setTypeString(DBTransactions.TransactionType.PURCHASE.name());
    }

    @Override // com.getjar.sdk.comm.persistence.TransactionBucket
    public void setType(DBTransactions.TransactionType type) {
        if (!DBTransactions.TransactionType.PURCHASE.equals(type)) {
            throw new IllegalArgumentException(String.format(Locale.US, "Can not set the TransactionType for PurchaseBucket to '%1$s'", type.name()));
        }
        super.setTypeString(DBTransactions.TransactionType.PURCHASE.name());
    }

    public DBTransactions.PurchaseState getState() {
        return (DBTransactions.PurchaseState) Enum.valueOf(DBTransactions.PurchaseState.class, super.getStateString());
    }

    public void setState(DBTransactions.PurchaseState state) {
        setStateString(state.name());
    }

    @Override // com.getjar.sdk.comm.persistence.TransactionBucket
    protected void setStateString(String state) {
        if (StringUtility.isNullOrEmpty(state)) {
            throw new IllegalArgumentException("'state' can not be NULL or empty");
        }
        try {
            Enum.valueOf(DBTransactions.PurchaseState.class, state);
            super.setStateString(state);
        } catch (Exception e) {
            throw new IllegalArgumentException(String.format(Locale.US, "Can not set the state for PurchaseBucket to '%1$s'", state), e);
        }
    }

    @Override // com.getjar.sdk.comm.persistence.TransactionBucket
    /* renamed from: getRelatedObject */
    public RelatedPurchaseData mo46getRelatedObject() throws IOException, ClassNotFoundException {
        if (StringUtility.isNullOrEmpty(this._relatedObject)) {
            return null;
        }
        return (RelatedPurchaseData) Base64.decodeToObject(this._relatedObject);
    }
}
