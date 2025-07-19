package com.getjar.sdk;

import android.os.Parcel;
import android.os.Parcelable;
import com.getjar.sdk.License;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;

public class LicensableProduct extends Product implements Parcelable {
    public static final Parcelable.Creator<LicensableProduct> CREATOR = new Parcelable.Creator<LicensableProduct>() {
        public LicensableProduct createFromParcel(Parcel in) {
            return new LicensableProduct(in);
        }

        public LicensableProduct[] newArray(int size) {
            return new LicensableProduct[size];
        }
    };
    private License.LicenseScope licenseScope;

    public LicensableProduct(String theProductId, String theProductName, String theProductDescription, long theAmount, License.LicenseScope licenseScope2) {
        super(theProductId, theProductName, theProductDescription, theAmount);
        if (licenseScope2 == null) {
            throw new IllegalArgumentException("licenseScope cannot be null");
        }
        this.licenseScope = licenseScope2;
    }

    public LicensableProduct(String theProductId, String theProductName, String theProductDescription, long theAmount, int imageResourceId, License.LicenseScope licenseScope2) {
        super(theProductId, theProductName, theProductDescription, theAmount, imageResourceId);
        if (licenseScope2 == null) {
            throw new IllegalArgumentException("licenseScope cannot be null");
        }
        this.licenseScope = licenseScope2;
    }

    public LicensableProduct(String theProductId, String theProductName, String theProductDescription, long theAmount, int imageResourceId, License.LicenseScope licenseScope2, String developerPayload) {
        super(theProductId, theProductName, theProductDescription, theAmount, imageResourceId, developerPayload);
        if (licenseScope2 == null) {
            throw new IllegalArgumentException("licenseScope cannot be null");
        }
        this.licenseScope = licenseScope2;
    }

    public License.LicenseScope getLicenseScope() {
        return this.licenseScope;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        try {
            super.writeToParcel(dest, flags);
            dest.writeString(this.licenseScope.name());
        } catch (Exception e) {
            Logger.e(Area.LICENSING.value() | Area.STORAGE.value(), "LicensableProduct: failed", e);
        }
    }

    private LicensableProduct(Parcel in) {
        super(in);
        this.licenseScope = License.LicenseScope.valueOf(in.readString());
    }
}
