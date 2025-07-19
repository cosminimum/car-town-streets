package com.getjar.sdk.comm.persistence;

import com.getjar.sdk.License;
import com.getjar.sdk.utilities.StringUtility;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.HashMap;
/* loaded from: classes.dex */
public class RelatedPurchaseData implements Serializable {
    private static final long serialVersionUID = 1387628907828312943L;
    private Integer _amount;
    private String _developerPayload;
    private License.LicenseScope _licenseScope;
    private String _productDescription;
    private String _productId;
    private String _productName;
    private HashMap<String, String> _trackingMetadata;

    public RelatedPurchaseData() {
        this._productId = "";
        this._productName = "";
        this._productDescription = "";
        this._developerPayload = "";
        this._trackingMetadata = new HashMap<>();
        this._licenseScope = null;
    }

    public RelatedPurchaseData(String productId, String productName, String productDescription, int amount, String developerPayload, License.LicenseScope licenseScope, HashMap<String, String> trackingMetadata) {
        this._productId = "";
        this._productName = "";
        this._productDescription = "";
        this._developerPayload = "";
        this._trackingMetadata = new HashMap<>();
        this._licenseScope = null;
        if (StringUtility.isNullOrEmpty(productId)) {
            throw new IllegalArgumentException("'productId' cannot be null or empty");
        }
        if (StringUtility.isNullOrEmpty(productName)) {
            throw new IllegalArgumentException("'productName' cannot be null or empty");
        }
        if (amount < 0) {
            throw new IllegalArgumentException("'amount' cannot be less than 0");
        }
        this._productId = productId;
        this._productName = productName;
        this._productDescription = productDescription == null ? "" : productDescription;
        this._amount = Integer.valueOf(amount);
        this._developerPayload = developerPayload == null ? "" : developerPayload;
        if (trackingMetadata != null) {
            this._trackingMetadata = trackingMetadata;
        }
        this._licenseScope = licenseScope;
    }

    public String getProductId() {
        return this._productId;
    }

    public String getProductName() {
        return this._productName;
    }

    public String getProductDescription() {
        return this._productDescription;
    }

    public Integer getAmount() {
        return this._amount;
    }

    public String getDeveloperPayload() {
        return this._developerPayload;
    }

    public License.LicenseScope getLicenseScope() {
        return this._licenseScope;
    }

    public HashMap<String, String> getTrackingMetadata() {
        return this._trackingMetadata;
    }

    private void validateObjectState() {
        if (this._amount == null || this._amount.intValue() < 0) {
            throw new IllegalStateException("'amount' can not be NULL or less than 0");
        }
        if (StringUtility.isNullOrEmpty(this._productId)) {
            throw new IllegalStateException("'productId' can not be NULL or empty");
        }
        if (!StringUtility.isNullOrEmpty(this._productName)) {
            return;
        }
        throw new IllegalStateException("'productName' can not be NULL or empty");
    }

    private void writeObject(ObjectOutputStream out) throws IOException {
        out.writeUTF(this._developerPayload);
        out.writeInt(this._amount.intValue());
        out.writeUTF(this._productDescription);
        out.writeUTF(this._productId);
        out.writeUTF(this._productName);
        out.writeObject(this._trackingMetadata);
        if (this._licenseScope != null) {
            out.writeUTF(this._licenseScope.name());
        } else {
            out.writeUTF("");
        }
    }

    private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {
        this._developerPayload = in.readUTF();
        this._amount = Integer.valueOf(in.readInt());
        this._productDescription = in.readUTF();
        this._productId = in.readUTF();
        this._productName = in.readUTF();
        this._trackingMetadata = (HashMap) in.readObject();
        String licenseScopeString = in.readUTF();
        if (!StringUtility.isNullOrEmpty(licenseScopeString)) {
            this._licenseScope = License.LicenseScope.valueOf(licenseScopeString);
        } else {
            this._licenseScope = null;
        }
        validateObjectState();
    }
}
