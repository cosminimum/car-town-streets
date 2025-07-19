package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public final class Cart implements SafeParcelable {
    public static final Parcelable.Creator<Cart> CREATOR = new b();
    String Gj;
    String Gk;
    ArrayList<LineItem> Gl;
    private final int kg;

    /* loaded from: classes.dex */
    public final class Builder {
        private Builder() {
        }

        public Builder addLineItem(LineItem lineItem) {
            Cart.this.Gl.add(lineItem);
            return this;
        }

        public Cart build() {
            return Cart.this;
        }

        public Builder setCurrencyCode(String currencyCode) {
            Cart.this.Gk = currencyCode;
            return this;
        }

        public Builder setLineItems(List<LineItem> lineItems) {
            Cart.this.Gl.clear();
            Cart.this.Gl.addAll(lineItems);
            return this;
        }

        public Builder setTotalPrice(String totalPrice) {
            Cart.this.Gj = totalPrice;
            return this;
        }
    }

    Cart() {
        this.kg = 1;
        this.Gl = new ArrayList<>();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Cart(int versionCode, String totalPrice, String currencyCode, ArrayList<LineItem> lineItems) {
        this.kg = versionCode;
        this.Gj = totalPrice;
        this.Gk = currencyCode;
        this.Gl = lineItems;
    }

    public static Builder newBuilder() {
        Cart cart = new Cart();
        cart.getClass();
        return new Builder();
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public String getCurrencyCode() {
        return this.Gk;
    }

    public ArrayList<LineItem> getLineItems() {
        return this.Gl;
    }

    public String getTotalPrice() {
        return this.Gj;
    }

    public int getVersionCode() {
        return this.kg;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        b.a(this, dest, flags);
    }
}
