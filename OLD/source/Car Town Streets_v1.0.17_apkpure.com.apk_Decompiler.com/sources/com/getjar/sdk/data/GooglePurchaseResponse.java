package com.getjar.sdk.data;

import android.content.Context;
import com.getjar.sdk.rewards.InAppPurchaseManager;
import com.getjar.sdk.utilities.Constants;
import com.getjar.sdk.utilities.StringUtility;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class GooglePurchaseResponse implements Serializable {
    private static final long serialVersionUID = -8955118537657295608L;
    private String developerPayload;
    private String notificationId;
    private String orderId;
    private String productId;
    private short purchaseState;
    private String signature;
    private String signedData;

    public GooglePurchaseResponse(String notificationId2, String orderId2, String productId2, short purchaseState2, String developerPayload2, String signedData2, String signature2) {
        if (StringUtility.isNullOrEmpty(notificationId2)) {
            throw new IllegalArgumentException("notificationId cannot be empty or null");
        } else if (StringUtility.isNullOrEmpty(orderId2)) {
            throw new IllegalArgumentException("orderId cannot be empty or null");
        } else if (StringUtility.isNullOrEmpty(productId2)) {
            throw new IllegalArgumentException("productId cannot be empty or null");
        } else if (StringUtility.isNullOrEmpty(signedData2)) {
            throw new IllegalArgumentException("signedData cannot be empty or null");
        } else if (StringUtility.isNullOrEmpty(signature2)) {
            throw new IllegalArgumentException("signature cannot be empty or null");
        } else {
            this.notificationId = notificationId2;
            this.orderId = orderId2;
            this.productId = productId2;
            this.purchaseState = purchaseState2;
            this.developerPayload = developerPayload2;
            this.signature = signature2;
            this.signedData = signedData2;
        }
    }

    public String getOrderId() {
        return this.orderId;
    }

    public String getProductId() {
        return this.productId;
    }

    public String getDeveloperPayload() {
        return this.developerPayload;
    }

    public String getSignedData() {
        return this.signedData;
    }

    public String getSignature() {
        return this.signature;
    }

    public String getNotificationId() {
        return this.notificationId;
    }

    public short getPurchaseState() {
        return this.purchaseState;
    }

    public Map<String, String> getResponseAsMap(Context context) {
        HashMap<String, String> object = new HashMap<>();
        object.putAll(InAppPurchaseManager.getGoldBucketDetails(this.productId, context));
        object.put(Constants.GOOGLE_PLAY_SIGNED_DATA, this.signedData);
        object.put(Constants.GOOGLE_PLAY_SIGNATURE, this.signature);
        return object;
    }

    private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {
        this.notificationId = in.readUTF();
        this.orderId = in.readUTF();
        this.productId = in.readUTF();
        this.purchaseState = in.readShort();
        this.developerPayload = in.readUTF();
        this.signedData = in.readUTF();
        this.signature = in.readUTF();
    }

    private void writeObject(ObjectOutputStream out) throws IOException {
        out.writeUTF(this.notificationId);
        out.writeUTF(this.orderId);
        out.writeUTF(this.productId);
        out.writeShort(this.purchaseState);
        if (StringUtility.isNullOrEmpty(this.developerPayload)) {
            this.developerPayload = "";
        }
        out.writeUTF(this.developerPayload);
        out.writeUTF(this.signedData);
        out.writeUTF(this.signature);
    }
}
