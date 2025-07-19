package com.getjar.sdk;

import android.os.Parcel;
import android.os.Parcelable;
import com.getjar.sdk.License;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
/* loaded from: classes.dex */
public class LicensableProduct extends Product implements Parcelable {
    public static final Parcelable.Creator<LicensableProduct> CREATOR = new Parcelable.Creator<LicensableProduct>() { // from class: com.getjar.sdk.LicensableProduct.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public LicensableProduct mo26createFromParcel(Parcel in) {
            return new LicensableProduct(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public LicensableProduct[] mo27newArray(int size) {
            return new LicensableProduct[size];
        }
    };
    private License.LicenseScope licenseScope;

    public LicensableProduct(String theProductId, String theProductName, String theProductDescription, long theAmount, License.LicenseScope licenseScope) {
        super(theProductId, theProductName, theProductDescription, theAmount);
        if (licenseScope == null) {
            throw new IllegalArgumentException("licenseScope cannot be null");
        }
        this.licenseScope = licenseScope;
    }

    public LicensableProduct(String theProductId, String theProductName, String theProductDescription, long theAmount, int imageResourceId, License.LicenseScope licenseScope) {
        super(theProductId, theProductName, theProductDescription, theAmount, imageResourceId);
        if (licenseScope == null) {
            throw new IllegalArgumentException("licenseScope cannot be null");
        }
        this.licenseScope = licenseScope;
    }

    public LicensableProduct(String theProductId, String theProductName, String theProductDescription, long theAmount, int imageResourceId, License.LicenseScope licenseScope, String developerPayload) {
        super(theProductId, theProductName, theProductDescription, theAmount, imageResourceId, developerPayload);
        if (licenseScope == null) {
            throw new IllegalArgumentException("licenseScope cannot be null");
        }
        this.licenseScope = licenseScope;
    }

    public License.LicenseScope getLicenseScope() {
        return this.licenseScope;
    }

    @Override // com.getjar.sdk.Product, android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // com.getjar.sdk.Product, android.os.Parcelable
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
