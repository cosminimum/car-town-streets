package com.getjar.sdk;

import android.os.Parcel;
import android.os.Parcelable;

public class ConsumableProduct extends Product {
    public static final Parcelable.Creator<ConsumableProduct> CREATOR = new Parcelable.Creator<ConsumableProduct>() {
        public ConsumableProduct createFromParcel(Parcel in) {
            return new ConsumableProduct(in);
        }

        public ConsumableProduct[] newArray(int size) {
            return new ConsumableProduct[size];
        }
    };

    public ConsumableProduct(String theProductId, String theProductName, String theProductDescription, long theAmount) {
        super(theProductId, theProductName, theProductDescription, theAmount);
    }

    public ConsumableProduct(String theProductId, String theProductName, String theProductDescription, long theAmount, int imageResourceId) {
        super(theProductId, theProductName, theProductDescription, theAmount, imageResourceId);
    }

    public ConsumableProduct(String theProductId, String theProductName, String theProductDescription, long theAmount, int imageResourceId, String developerPayload) {
        super(theProductId, theProductName, theProductDescription, theAmount, imageResourceId, developerPayload);
    }

    private ConsumableProduct(Parcel in) {
        super(in);
    }
}
