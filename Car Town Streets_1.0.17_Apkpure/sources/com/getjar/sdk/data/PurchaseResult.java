package com.getjar.sdk.data;

import android.os.Bundle;
import com.getjar.sdk.utilities.Constants;
/* loaded from: classes.dex */
public class PurchaseResult {
    private long mCost;
    private String mProductId;
    private String mTransactionId;

    public PurchaseResult(Bundle b) {
        this.mTransactionId = "";
        this.mProductId = "";
        this.mCost = 0L;
        if (b == null) {
            throw new IllegalArgumentException("Must have a valid bundle.");
        }
        this.mTransactionId = b.getString(Constants.TRANSACTION_ID);
        this.mProductId = b.getString(Constants.APP_ID);
        this.mCost = b.getLong("price", 0L);
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
