package com.getjar.sdk.data;

public class TransactionItem {
    private String mClientTransactionID;
    private String mItemId;
    private String mItemMetaData;
    private String mPackageName;
    private String mTrackingData;

    public TransactionItem(String packageName, String itemId, String transactionId, String metadata, String trackingData) {
        this.mPackageName = packageName;
        this.mItemId = itemId;
        this.mClientTransactionID = transactionId;
        this.mItemMetaData = metadata;
        this.mTrackingData = trackingData;
    }

    public String getPackageName() {
        return this.mPackageName;
    }

    public String getItemId() {
        return this.mItemId;
    }

    public String getTransactionId() {
        return this.mClientTransactionID;
    }

    public String getMetaData() {
        return this.mItemMetaData;
    }

    public String getTrackingData() {
        return this.mTrackingData;
    }
}
