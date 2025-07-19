package com.getjar.sdk.data;

import android.os.Bundle;
import com.getjar.sdk.utilities.Constants;

public class PurchaseResult {
    private long mCost = 0;
    private String mProductId = "";
    private String mTransactionId = "";

    public PurchaseResult(Bundle b) {
        if (b == null) {
            throw new IllegalArgumentException("Must have a valid bundle.");
        }
        this.mTransactionId = b.getString(Constants.TRANSACTION_ID);
        this.mProductId = b.getString(Constants.APP_ID);
        this.mCost = b.getLong("price", 0);
    }

    public String getProductId() {
        return this.mProductId;
    }

    public String getTransactionId() {
        return this.mTransactionId;
    }

    public long getCost() {
        return this.mCost;
    }
}
