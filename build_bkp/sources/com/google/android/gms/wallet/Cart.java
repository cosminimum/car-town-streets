package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.ArrayList;
import java.util.List;

public final class Cart implements SafeParcelable {
    public static final Parcelable.Creator<Cart> CREATOR = new C1631b();

    /* renamed from: Gj */
    String f3824Gj;

    /* renamed from: Gk */
    String f3825Gk;

    /* renamed from: Gl */
    ArrayList<LineItem> f3826Gl;

    /* renamed from: kg */
    private final int f3827kg;

    public final class Builder {
        private Builder() {
        }

        public Builder addLineItem(LineItem lineItem) {
            Cart.this.f3826Gl.add(lineItem);
            return this;
        }

        public Cart build() {
            return Cart.this;
        }

        public Builder setCurrencyCode(String currencyCode) {
            Cart.this.f3825Gk = currencyCode;
            return this;
        }

        public Builder setLineItems(List<LineItem> lineItems) {
            Cart.this.f3826Gl.clear();
            Cart.this.f3826Gl.addAll(lineItems);
            return this;
        }

        public Builder setTotalPrice(String totalPrice) {
            Cart.this.f3824Gj = totalPrice;
            return this;
        }
    }

    Cart() {
        this.f3827kg = 1;
        this.f3826Gl = new ArrayList<>();
    }

    Cart(int versionCode, String totalPrice, String currencyCode, ArrayList<LineItem> lineItems) {
        this.f3827kg = versionCode;
        this.f3824Gj = totalPrice;
        this.f3825Gk = currencyCode;
        this.f3826Gl = lineItems;
    }

    public static Builder newBuilder() {
        Cart cart = new Cart();
        cart.getClass();
        return new Builder();
    }

    public int describeContents() {
        return 0;
    }

    public String getCurrencyCode() {
        return this.f3825Gk;
    }

    public ArrayList<LineItem> getLineItems() {
        return this.f3826Gl;
    }

    public String getTotalPrice() {
        return this.f3824Gj;
    }

    public int getVersionCode() {
        return this.f3827kg;
    }

    public void writeToParcel(Parcel dest, int flags) {
        C1631b.m4343a(this, dest, flags);
    }
}
