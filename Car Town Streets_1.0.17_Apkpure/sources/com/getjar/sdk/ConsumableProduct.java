package com.getjar.sdk;

import android.os.Parcel;
import android.os.Parcelable;
/* loaded from: classes.dex */
public class ConsumableProduct extends Product {
    public static final Parcelable.Creator<ConsumableProduct> CREATOR = new Parcelable.Creator<ConsumableProduct>() { // from class: com.getjar.sdk.ConsumableProduct.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public ConsumableProduct mo24createFromParcel(Parcel in) {
            return new ConsumableProduct(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public ConsumableProduct[] mo25newArray(int size) {
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
