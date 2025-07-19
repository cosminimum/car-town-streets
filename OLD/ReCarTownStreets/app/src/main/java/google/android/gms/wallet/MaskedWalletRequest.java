package google.android.gms.wallet;

import android.os.Parcel;

import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class MaskedWalletRequest implements SafeParcelable {
    public static final Creator<MaskedWalletRequest> CREATOR = new i();
    boolean GK;
    boolean GL;
    boolean GM;
    String GN;
    String GO;
    boolean GP;
    boolean GQ;
    CountrySpecification[] GR;
    boolean GS;
    boolean GT;
    String Gk;
    String Go;
    Cart Gu;
    private final int kg;

    public final class Builder {
        private Builder() {
        }

        public MaskedWalletRequest build() {
            return MaskedWalletRequest.this;
        }

        public Builder setAllowDebitCard(boolean allowDebitCard) {
            MaskedWalletRequest.this.GT = allowDebitCard;
            return this;
        }

        public Builder setAllowPrepaidCard(boolean allowPrepaidCard) {
            MaskedWalletRequest.this.GS = allowPrepaidCard;
            return this;
        }

        public Builder setAllowedShippingCountrySpecifications(CountrySpecification[] allowedShippingCountrySpecifications) {
            MaskedWalletRequest.this.GR = allowedShippingCountrySpecifications;
            return this;
        }

        public Builder setCart(Cart cart) {
            MaskedWalletRequest.this.Gu = cart;
            return this;
        }

        public Builder setCurrencyCode(String currencyCode) {
            MaskedWalletRequest.this.Gk = currencyCode;
            return this;
        }

        public Builder setEstimatedTotalPrice(String estimatedTotalPrice) {
            MaskedWalletRequest.this.GN = estimatedTotalPrice;
            return this;
        }

        public Builder setIsBillingAgreement(boolean isBillingAgreement) {
            MaskedWalletRequest.this.GQ = isBillingAgreement;
            return this;
        }

        public Builder setMerchantName(String merchantName) {
            MaskedWalletRequest.this.GO = merchantName;
            return this;
        }

        public Builder setMerchantTransactionId(String merchantTransactionId) {
            MaskedWalletRequest.this.Go = merchantTransactionId;
            return this;
        }

        public Builder setPhoneNumberRequired(boolean phoneNumberRequired) {
            MaskedWalletRequest.this.GK = phoneNumberRequired;
            return this;
        }

        public Builder setShippingAddressRequired(boolean shippingAddressRequired) {
            MaskedWalletRequest.this.GL = shippingAddressRequired;
            return this;
        }

        public Builder setShouldRetrieveWalletObjects(boolean shouldRetrieveWalletObjects) {
            MaskedWalletRequest.this.GP = shouldRetrieveWalletObjects;
            return this;
        }

        public Builder setUseMinimalBillingAddress(boolean useMinimalBillingAddress) {
            MaskedWalletRequest.this.GM = useMinimalBillingAddress;
            return this;
        }
    }

    MaskedWalletRequest() {
        this.kg = 3;
        this.GS = true;
        this.GT = true;
    }

    MaskedWalletRequest(int versionCode, String merchantTransactionId, boolean phoneNumberRequired, boolean shippingAddressRequired, boolean useMinimalBillingAddress, String estimatedTotalPrice, String currencyCode, String merchantName, Cart cart, boolean shouldRetrieveWalletObjects, boolean isBillingAgreement, CountrySpecification[] allowedShippingCountrySpecifications, boolean allowPrepaidCard, boolean allowDebitCard) {
        this.kg = versionCode;
        this.Go = merchantTransactionId;
        this.GK = phoneNumberRequired;
        this.GL = shippingAddressRequired;
        this.GM = useMinimalBillingAddress;
        this.GN = estimatedTotalPrice;
        this.Gk = currencyCode;
        this.GO = merchantName;
        this.Gu = cart;
        this.GP = shouldRetrieveWalletObjects;
        this.GQ = isBillingAgreement;
        this.GR = allowedShippingCountrySpecifications;
        this.GS = allowPrepaidCard;
        this.GT = allowDebitCard;
    }

    public static Builder newBuilder() {
        MaskedWalletRequest maskedWalletRequest = new MaskedWalletRequest();
        maskedWalletRequest.getClass();
        return new Builder();
    }

    public boolean allowDebitCard() {
        return this.GT;
    }

    public boolean allowPrepaidCard() {
        return this.GS;
    }

    public int describeContents() {
        return 0;
    }

    public CountrySpecification[] getAllowedShippingCountrySpecifications() {
        return this.GR;
    }

    public Cart getCart() {
        return this.Gu;
    }

    public String getCurrencyCode() {
        return this.Gk;
    }

    public String getEstimatedTotalPrice() {
        return this.GN;
    }

    public String getMerchantName() {
        return this.GO;
    }

    public String getMerchantTransactionId() {
        return this.Go;
    }

    public int getVersionCode() {
        return this.kg;
    }

    public boolean isBillingAgreement() {
        return this.GQ;
    }

    public boolean isPhoneNumberRequired() {
        return this.GK;
    }

    public boolean isShippingAddressRequired() {
        return this.GL;
    }

    public boolean shouldRetrieveWalletObjects() {
        return this.GP;
    }

    public boolean useMinimalBillingAddress() {
        return this.GM;
    }

    public void writeToParcel(Parcel dest, int flags) {
        i.a(this, dest, flags);
    }
}
