package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class MaskedWallet implements SafeParcelable {
    public static final Parcelable.Creator<MaskedWallet> CREATOR = new C1637h();

    /* renamed from: GI */
    LoyaltyWalletObject[] f3860GI;

    /* renamed from: GJ */
    OfferWalletObject[] f3861GJ;

    /* renamed from: Gn */
    String f3862Gn;

    /* renamed from: Go */
    String f3863Go;

    /* renamed from: Gq */
    String f3864Gq;

    /* renamed from: Gr */
    Address f3865Gr;

    /* renamed from: Gs */
    Address f3866Gs;

    /* renamed from: Gt */
    String[] f3867Gt;

    /* renamed from: kg */
    private final int f3868kg;

    MaskedWallet() {
        this.f3868kg = 2;
    }

    MaskedWallet(int versionCode, String googleTransactionId, String merchantTransactionId, String[] paymentDescriptions, String email, Address billingAddress, Address shippingAddress, LoyaltyWalletObject[] loyaltyWalletObjects, OfferWalletObject[] offerWalletObjects) {
        this.f3868kg = versionCode;
        this.f3862Gn = googleTransactionId;
        this.f3863Go = merchantTransactionId;
        this.f3867Gt = paymentDescriptions;
        this.f3864Gq = email;
        this.f3865Gr = billingAddress;
        this.f3866Gs = shippingAddress;
        this.f3860GI = loyaltyWalletObjects;
        this.f3861GJ = offerWalletObjects;
    }

    public int describeContents() {
        return 0;
    }

    public Address getBillingAddress() {
        return this.f3865Gr;
    }

    public String getEmail() {
        return this.f3864Gq;
    }

    public String getGoogleTransactionId() {
        return this.f3862Gn;
    }

    public LoyaltyWalletObject[] getLoyaltyWalletObjects() {
        return this.f3860GI;
    }

    public String getMerchantTransactionId() {
        return this.f3863Go;
    }

    public OfferWalletObject[] getOfferWalletObjects() {
        return this.f3861GJ;
    }

    public String[] getPaymentDescriptions() {
        return this.f3867Gt;
    }

    public Address getShippingAddress() {
        return this.f3866Gs;
    }

    public int getVersionCode() {
        return this.f3868kg;
    }

    public void writeToParcel(Parcel dest, int flags) {
        C1637h.m4361a(this, dest, flags);
    }
}
