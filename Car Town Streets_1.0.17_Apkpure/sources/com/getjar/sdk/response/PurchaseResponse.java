package com.getjar.sdk.response;

import android.os.Parcel;
/* loaded from: classes.dex */
public abstract class PurchaseResponse extends Response {
    private long _amount;
    private String _productId;
    private String _productName;
    private String _transactionId;

    public PurchaseResponse(String productId, long amount, String productName, String transactionId) {
        this._productId = productId;
        this._amount = amount;
        this._productName = productName;
        this._transactionId = transactionId;
    }

    public PurchaseResponse(Parcel source) {
        super(source);
        this._productId = source.readString();
        this._amount = source.readLong();
        this._productName = source.readString();
        this._transactionId = source.readString();
    }

    @Override // com.getjar.sdk.response.Response, android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        super.writeToParcel(dest, flags);
        dest.writeString(this._productId);
        dest.writeLong(this._amount);
        dest.writeString(this._productName);
        dest.writeString(this._transactionId);
    }

    public String getProductId() {
        return this._productId;
    }

    public long getAmount() {
        return this._amount;
    }

    public String getProductName() {
        return this._productName;
    }

    public String getTransactionId() {
        return this._transactionId;
    }
}
