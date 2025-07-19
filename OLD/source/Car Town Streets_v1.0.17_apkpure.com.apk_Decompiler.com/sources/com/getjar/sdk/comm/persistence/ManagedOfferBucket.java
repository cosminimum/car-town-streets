package com.getjar.sdk.comm.persistence;

import com.getjar.sdk.comm.persistence.DBTransactions;
import com.getjar.sdk.utilities.Base64;
import com.getjar.sdk.utilities.StringUtility;
import java.io.IOException;
import java.io.Serializable;
import java.util.Locale;

public class ManagedOfferBucket extends TransactionBucket {
    public ManagedOfferBucket() {
        setType(DBTransactions.TransactionType.MANAGED_OFFER);
    }

    public ManagedOfferBucket(String clientTransactionId, Serializable relatedObject) throws IOException {
        super(clientTransactionId, DBTransactions.TransactionType.MANAGED_OFFER, relatedObject);
    }

    /* access modifiers changed from: protected */
    public void setTypeString(String type) {
        if (StringUtility.isNullOrEmpty(type)) {
            throw new IllegalArgumentException("'type' can not be NULL or empty");
        }
        if (!DBTransactions.TransactionType.MANAGED_OFFER.equals((DBTransactions.TransactionType) Enum.valueOf(DBTransactions.TransactionType.class, type))) {
            throw new IllegalArgumentException(String.format(Locale.US, "Can not set the TransactionType for ManagedOfferBucket to '%1$s'", new Object[]{type}));
        }
        super.setTypeString(DBTransactions.TransactionType.MANAGED_OFFER.name());
    }

    public void setType(DBTransactions.TransactionType type) {
        if (!DBTransactions.TransactionType.MANAGED_OFFER.equals(type)) {
            throw new IllegalArgumentException(String.format(Locale.US, "Can not set the TransactionType for ManagedOfferBucket to '%1$s'", new Object[]{type.name()}));
        }
        super.setTypeString(DBTransactions.TransactionType.MANAGED_OFFER.name());
    }

    public DBTransactions.ManagedOfferState getState() {
        return (DBTransactions.ManagedOfferState) Enum.valueOf(DBTransactions.ManagedOfferState.class, super.getStateString());
    }

    public void setState(DBTransactions.ManagedOfferState state) {
        setStateString(state.name());
    }

    /* access modifiers changed from: protected */
    public void setStateString(String state) {
        if (StringUtility.isNullOrEmpty(state)) {
            throw new IllegalArgumentException("'state' can not be NULL or empty");
        }
        try {
            Enum.valueOf(DBTransactions.ManagedOfferState.class, state);
            super.setStateString(state);
        } catch (Exception e) {
            throw new IllegalArgumentException(String.format(Locale.US, "Can not set the state for ManagedOfferBucket to '%1$s'", new Object[]{state}), e);
        }
    }

    public RelatedManagedOfferData getRelatedObject() throws IOException, ClassNotFoundException {
        if (StringUtility.isNullOrEmpty(this._relatedObject)) {
            return null;
        }
        return (RelatedManagedOfferData) Base64.decodeToObject(this._relatedObject);
    }
}
