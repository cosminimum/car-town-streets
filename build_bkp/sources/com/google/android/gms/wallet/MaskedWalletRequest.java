package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class MaskedWalletRequest implements SafeParcelable {
    public static final Parcelable.Creator<MaskedWalletRequest> CREATOR = new C1638i();

    /* renamed from: GK */
    boolean f3869GK;

    /* renamed from: GL */
    boolean f3870GL;

    /* renamed from: GM */
    boolean f3871GM;

    /* renamed from: GN */
    String f3872GN;

    /* renamed from: GO */
    String f3873GO;

    /* renamed from: GP */
    boolean f3874GP;

    /* renamed from: GQ */
    boolean f3875GQ;

    /* renamed from: GR */
    CountrySpecification[] f3876GR;

    /* renamed from: GS */
    boolean f3877GS;

    /* renamed from: GT */
    boolean f3878GT;

    /* renamed from: Gk */
    String f3879Gk;

    /* renamed from: Go */
    String f3880Go;

    /* renamed from: Gu */
    Cart f3881Gu;

    /* renamed from: kg */
    private final int f3882kg;

    public final class Builder {
        private Builder() {
        }

        public MaskedWalletRequest build() {
            return MaskedWalletRequest.this;
        }

        public Builder setAllowDebitCard(boolean allowDebitCard) {
            MaskedWalletRequest.this.f3878GT = allowDebitCard;
            return this;
        }

        public Builder setAllowPrepaidCard(boolean allowPrepaidCard) {
            MaskedWalletRequest.this.f3877GS = allowPrepaidCard;
            return this;
        }

        public Builder setAllowedShippingCountrySpecifications(CountrySpecification[] allowedShippingCountrySpecifications) {
            MaskedWalletRequest.this.f3876GR = allowedShippingCountrySpecifications;
            return this;
        }

        public Builder setCart(Cart cart) {
            MaskedWalletRequest.this.f3881Gu = cart;
            return this;
        }

        public Builder setCurrencyCode(String currencyCode) {
            MaskedWalletRequest.this.f3879Gk = currencyCode;
            return this;
        }

        public Builder setEstimatedTotalPrice(String estimatedTotalPrice) {
            MaskedWalletRequest.this.f3872GN = estimatedTotalPrice;
            return this;
        }

        public Builder setIsBillingAgreement(boolean isBillingAgreement) {
            MaskedWalletRequest.this.f3875GQ = isBillingAgreement;
            return this;
        }

        public Builder setMerchantName(String merchantName) {
            MaskedWalletRequest.this.f3873GO = merchantName;
            return this;
        }

        public Builder setMerchantTransactionId(String merchantTransactionId) {
            MaskedWalletRequest.this.f3880Go = merchantTransactionId;
            return this;
        }

        public Builder setPhoneNumberRequired(boolean phoneNumberRequired) {
            MaskedWalletRequest.this.f3869GK = phoneNumberRequired;
            return this;
        }

        public Builder setShippingAddressRequired(boolean shippingAddressRequired) {
            MaskedWalletRequest.this.f3870GL = shippingAddressRequired;
            return this;
        }

        public Builder setShouldRetrieveWalletObjects(boolean shouldRetrieveWalletObjects) {
            MaskedWalletRequest.this.f3874GP = shouldRetrieveWalletObjects;
            return this;
        }

        public Builder setUseMinimalBillingAddress(boolean useMinimalBillingAddress) {
            MaskedWalletRequest.this.f3871GM = useMinimalBillingAddress;
            return this;
        }
    }

    MaskedWalletRequest() {
        this.f3882kg = 3;
        this.f3877GS = true;
        this.f3878GT = true;
    }

    MaskedWalletRequest(int versionCode, String merchantTransactionId, boolean phoneNumberRequired, boolean shippingAddressRequired, boolean useMinimalBillingAddress, String estimatedTotalPrice, String currencyCode, String merchantName, Cart cart, boolean shouldRetrieveWalletObjects, boolean isBillingAgreement, CountrySpecification[] allowedShippingCountrySpecifications, boolean allowPrepaidCard, boolean allowDebitCard) {
        this.f3882kg = versionCode;
        this.f3880Go = merchantTransactionId;
        this.f3869GK = phoneNumberRequired;
        this.f3870GL = shippingAddressRequired;
        this.f3871GM = useMinimalBillingAddress;
        this.f3872GN = estimatedTotalPrice;
        this.f3879Gk = currencyCode;
        this.f3873GO = merchantName;
        this.f3881Gu = cart;
        this.f3874GP = shouldRetrieveWalletObjects;
        this.f3875GQ = isBillingAgreement;
        this.f3876GR = allowedShippingCountrySpecifications;
        this.f3877GS = allowPrepaidCard;
        this.f3878GT = allowDebitCard;
    }

    public static Builder newBuilder() {
        MaskedWalletRequest maskedWalletRequest = new MaskedWalletRequest();
        maskedWalletRequest.getClass();
        return new Builder();
    }

    public boolean allowDebitCard() {
        return this.f3878GT;
    }

    public boolean allowPrepaidCard() {
        return this.f3877GS;
    }

    public int describeContents() {
        return 0;
    }

    public CountrySpecification[] getAllowedShippingCountrySpecifications() {
        return this.f3876GR;
    }

    public Cart getCart() {
        return this.f3881Gu;
    }

    public String getCurrencyCode() {
        return this.f3879Gk;
    }

    public String getEstimatedTotalPrice() {
        return this.f3872GN;
    }

    public String getMerchantName() {
        return this.f3873GO;
    }

    public String getMerchantTransactionId() {
        return this.f3880Go;
    }

    public int getVersionCode() {
        return this.f3882kg;
    }

    public boolean isBillingAgreement() {
        return this.f3875GQ;
    }

    public boolean isPhoneNumberRequired() {
        return this.f3869GK;
    }

    public boolean isShippingAddressRequired() {
        return this.f3870GL;
    }

    public boolean shouldRetrieveWalletObjects() {
        return this.f3874GP;
    }

    public boolean useMinimalBillingAddress() {
        return this.f3871GM;
    }

    public void writeToParcel(Parcel dest, int flags) {
        C1638i.m4364a(this, dest, flags);
    }
}
