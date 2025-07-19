package google.android.gms.wallet;

import android.os.Parcel;

import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class FullWalletRequest implements SafeParcelable {
    public static final Creator<FullWalletRequest> CREATOR = new e();
    String Gn;
    String Go;
    Cart Gu;
    private final int kg;

    public final class Builder {
        private Builder() {
        }

        public FullWalletRequest build() {
            return FullWalletRequest.this;
        }

        public Builder setCart(Cart cart) {
            FullWalletRequest.this.Gu = cart;
            return this;
        }

        public Builder setGoogleTransactionId(String googleTransactionId) {
            FullWalletRequest.this.Gn = googleTransactionId;
            return this;
        }

        public Builder setMerchantTransactionId(String merchantTransactionId) {
            FullWalletRequest.this.Go = merchantTransactionId;
            return this;
        }
    }

    FullWalletRequest() {
        this.kg = 1;
    }

    FullWalletRequest(int versionCode, String googleTransactionId, String merchantTransactionId, Cart cart) {
        this.kg = versionCode;
        this.Gn = googleTransactionId;
        this.Go = merchantTransactionId;
        this.Gu = cart;
    }

    public static Builder newBuilder() {
        FullWalletRequest fullWalletRequest = new FullWalletRequest();
        fullWalletRequest.getClass();
        return new Builder();
    }

    public int describeContents() {
        return 0;
    }

    public Cart getCart() {
        return this.Gu;
    }

    public String getGoogleTransactionId() {
        return this.Gn;
    }

    public String getMerchantTransactionId() {
        return this.Go;
    }

    public int getVersionCode() {
        return this.kg;
    }

    public void writeToParcel(Parcel dest, int flags) {
        e.a(this, dest, flags);
    }
}
