package com.getjar.sdk.comm.persistence;

import com.getjar.sdk.utilities.Constants;
import com.getjar.sdk.utilities.StringUtility;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.HashMap;
/* loaded from: classes.dex */
public class RelatedManagedOfferData implements Serializable {
    private static final long serialVersionUID = 1387628907828312943L;
    private String _offerId;
    private HashMap<String, String> _purchaseMetadata;
    private HashMap<String, String> _trackingMetadata;

    public RelatedManagedOfferData() {
    }

    public RelatedManagedOfferData(HashMap<String, String> purchaseMetadata) {
        if (purchaseMetadata == null || purchaseMetadata.isEmpty()) {
            throw new IllegalArgumentException("'itemMetadata' cannot be null or empty");
        }
        this._purchaseMetadata = purchaseMetadata;
        this._purchaseMetadata.put(Constants.MARKETPLACE, "marketplace.google_play");
    }

    public RelatedManagedOfferData(String offerId, HashMap<String, String> purchaseMetadata, HashMap<String, String> trackingMetadata) {
        if (StringUtility.isNullOrEmpty(offerId)) {
            throw new IllegalArgumentException("'productId' cannot be null or empty");
        }
        if (purchaseMetadata == null || purchaseMetadata.isEmpty()) {
            throw new IllegalArgumentException("'itemMetadata' cannot be null or empty");
        }
        if (trackingMetadata == null || trackingMetadata.isEmpty()) {
            throw new IllegalArgumentException("'trackingMetadata' cannot be null or empty");
        }
        this._offerId = offerId;
        this._purchaseMetadata = purchaseMetadata;
        this._trackingMetadata = trackingMetadata;
        this._purchaseMetadata.put(Constants.MARKETPLACE, "marketplace.google_play");
    }

    public String getOfferToken() {
        return this._offerId;
    }

    public HashMap<String, String> getTrackingMetadata() {
        return this._trackingMetadata;
    }

    public HashMap<String, String> getPurchaseMetadata() {
        return this._purchaseMetadata;
    }

    public void addGooglePlayTransactionData(String purchaseData, String signature) {
        if (StringUtility.isNullOrEmpty(purchaseData)) {
            throw new IllegalArgumentException("'purchaseData' cannot be null or empty");
        }
        if (StringUtility.isNullOrEmpty(signature)) {
            throw new IllegalArgumentException("'signature' cannot be null or empty");
        }
        if (this._purchaseMetadata == null) {
            this._purchaseMetadata = new HashMap<>();
            this._purchaseMetadata.put(Constants.MARKETPLACE, "marketplace.google_play");
        }
        this._purchaseMetadata.put(Constants.GOOGLE_PLAY_SIGNATURE, signature);
        this._purchaseMetadata.put(Constants.GOOGLE_PLAY_SIGNED_DATA, purchaseData);
    }

    private void writeObject(ObjectOutputStream out) throws IOException {
        if (StringUtility.isNullOrEmpty(this._offerId)) {
            out.writeUTF("");
        } else {
            out.writeUTF(this._offerId);
        }
        if (this._trackingMetadata == null) {
            out.writeObject("");
        } else {
            out.writeObject(this._trackingMetadata);
        }
        if (this._purchaseMetadata == null) {
            out.writeObject("");
        } else {
            out.writeObject(this._purchaseMetadata);
        }
    }

    private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {
        this._offerId = in.readUTF();
        if (StringUtility.isNullOrEmpty(this._offerId)) {
            this._offerId = null;
        }
        try {
            this._trackingMetadata = (HashMap) in.readObject();
        } catch (Exception e) {
            this._trackingMetadata = null;
        }
        try {
            this._purchaseMetadata = (HashMap) in.readObject();
        } catch (Exception e2) {
            this._purchaseMetadata = null;
        }
    }
}
