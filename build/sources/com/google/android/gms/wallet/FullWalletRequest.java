package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class FullWalletRequest implements SafeParcelable {
    public static final Parcelable.Creator<FullWalletRequest> CREATOR = new C1634e();

    /* renamed from: Gn */
    String f3839Gn;

    /* renamed from: Go */
    String f3840Go;

    /* renamed from: Gu */
    Cart f3841Gu;

    /* renamed from: kg */
    private final int f3842kg;

    public final class Builder {
        private Builder() {
        }

        public FullWalletRequest build() {
            return FullWalletRequest.this;
        }

        public Builder setCart(Cart cart) {
            FullWalletRequest.this.f3841Gu = cart;
            return this;
        }

        public Builder setGoogleTransactionId(String googleTransactionId) {
            FullWalletRequest.this.f3839Gn = googleTransactionId;
            return this;
        }

        public Builder setMerchantTransactionId(String merchantTransactionId) {
            FullWalletRequest.this.f3840Go = merchantTransactionId;
            return this;
        }
    }

    FullWalletRequest() {
        this.f3842kg = 1;
    }

    FullWalletRequest(int versionCode, String googleTransactionId, String merchantTransactionId, Cart cart) {
        this.f3842kg = versionCode;
        this.f3839Gn = googleTransactionId;
        this.f3840Go = merchantTransactionId;
        this.f3841Gu = cart;
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
        return this.f3841Gu;
    }

    public String getGoogleTransactionId() {
        return this.f3839Gn;
    }

    public String getMerchantTransactionId() {
        return this.f3840Go;
    }

    public int getVersionCode() {
        return this.f3842kg;
    }

    public void writeToParcel(Parcel dest, int flags) {
        C1634e.m4352a(this, dest, flags);
    }
}
