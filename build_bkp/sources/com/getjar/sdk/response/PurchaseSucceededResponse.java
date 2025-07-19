package com.getjar.sdk.response;

import android.os.Parcel;
import android.os.Parcelable;

public class PurchaseSucceededResponse extends PurchaseResponse {
    public static final Parcelable.Creator<PurchaseSucceededResponse> CREATOR = new Parcelable.Creator<PurchaseSucceededResponse>() {
        public PurchaseSucceededResponse createFromParcel(Parcel in) {
            return new PurchaseSucceededResponse(in);
        }

        public PurchaseSucceededResponse[] newArray(int size) {
            return new PurchaseSucceededResponse[size];
        }
    };
    private String _signature;
    private String _signedPayload;

    public PurchaseSucceededResponse(String productId, long amount, String productName, String transactionId, String signedPayload, String signature) {
        super(productId, amount, productName, transactionId);
        this._signedPayload = signedPayload;
        this._signature = signature;
    }

    public PurchaseSucceededResponse(Parcel source) {
        super(source);
        this._signedPayload = source.readString();
        this._signature = source.readString();
    }

    public void writeToParcel(Parcel dest, int flags) {
        super.writeToParcel(dest, flags);
        dest.writeString(this._signedPayload);
        dest.writeString(this._signature);
    }

    public String getSignedPayload() {
        return this._signedPayload;
    }

    public String getSignature() {
        return this._signature;
    }
}
