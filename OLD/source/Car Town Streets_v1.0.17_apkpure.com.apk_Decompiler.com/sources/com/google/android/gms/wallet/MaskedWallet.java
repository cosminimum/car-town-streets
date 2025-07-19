package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class MaskedWallet implements SafeParcelable {
    public static final Parcelable.Creator<MaskedWallet> CREATOR = new h();
    LoyaltyWalletObject[] GI;
    OfferWalletObject[] GJ;
    String Gn;
    String Go;
    String Gq;
    Address Gr;
    Address Gs;
    String[] Gt;
    private final int kg;

    MaskedWallet() {
        this.kg = 2;
    }

    MaskedWallet(int versionCode, String googleTransactionId, String merchantTransactionId, String[] paymentDescriptions, String email, Address billingAddress, Address shippingAddress, LoyaltyWalletObject[] loyaltyWalletObjects, OfferWalletObject[] offerWalletObjects) {
        this.kg = versionCode;
        this.Gn = googleTransactionId;
        this.Go = merchantTransactionId;
        this.Gt = paymentDescriptions;
        this.Gq = email;
        this.Gr = billingAddress;
        this.Gs = shippingAddress;
        this.GI = loyaltyWalletObjects;
        this.GJ = offerWalletObjects;
    }

    public int describeContents() {
        return 0;
    }

    public Address getBillingAddress() {
        return this.Gr;
    }

    public String getEmail() {
        return this.Gq;
    }

    public String getGoogleTransactionId() {
        return this.Gn;
    }

    public LoyaltyWalletObject[] getLoyaltyWalletObjects() {
        return this.GI;
    }

    public String getMerchantTransactionId() {
        return this.Go;
    }

    public OfferWalletObject[] getOfferWalletObjects() {
        return this.GJ;
    }

    public String[] getPaymentDescriptions() {
        return this.Gt;
    }

    public Address getShippingAddress() {
        return this.Gs;
    }

    public int getVersionCode() {
        return this.kg;
    }

    public void writeToParcel(Parcel dest, int flags) {
        h.a(this, dest, flags);
    }
}
