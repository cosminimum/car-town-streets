package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class LineItem implements SafeParcelable {
    public static final Parcelable.Creator<LineItem> CREATOR = new C1635f();

    /* renamed from: Gj */
    String f3844Gj;

    /* renamed from: Gk */
    String f3845Gk;

    /* renamed from: Gw */
    String f3846Gw;

    /* renamed from: Gx */
    String f3847Gx;

    /* renamed from: Gy */
    int f3848Gy;
    String description;

    /* renamed from: kg */
    private final int f3849kg;

    public final class Builder {
        private Builder() {
        }

        public LineItem build() {
            return LineItem.this;
        }

        public Builder setCurrencyCode(String currencyCode) {
            LineItem.this.f3845Gk = currencyCode;
            return this;
        }

        public Builder setDescription(String description) {
            LineItem.this.description = description;
            return this;
        }

        public Builder setQuantity(String quantity) {
            LineItem.this.f3846Gw = quantity;
            return this;
        }

        public Builder setRole(int role) {
            LineItem.this.f3848Gy = role;
            return this;
        }

        public Builder setTotalPrice(String totalPrice) {
            LineItem.this.f3844Gj = totalPrice;
            return this;
        }

        public Builder setUnitPrice(String unitPrice) {
            LineItem.this.f3847Gx = unitPrice;
            return this;
        }
    }

    public interface Role {
        public static final int REGULAR = 0;
        public static final int SHIPPING = 2;
        public static final int TAX = 1;
    }

    LineItem() {
        this.f3849kg = 1;
        this.f3848Gy = 0;
    }

    LineItem(int versionCode, String description2, String quantity, String unitPrice, String totalPrice, int role, String currencyCode) {
        this.f3849kg = versionCode;
        this.description = description2;
        this.f3846Gw = quantity;
        this.f3847Gx = unitPrice;
        this.f3844Gj = totalPrice;
        this.f3848Gy = role;
        this.f3845Gk = currencyCode;
    }

    public static Builder newBuilder() {
        LineItem lineItem = new LineItem();
        lineItem.getClass();
        return new Builder();
    }

    public int describeContents() {
        return 0;
    }

    public String getCurrencyCode() {
        return this.f3845Gk;
    }

    public String getDescription() {
        return this.description;
    }

    public String getQuantity() {
        return this.f3846Gw;
    }

    public int getRole() {
        return this.f3848Gy;
    }

    public String getTotalPrice() {
        return this.f3844Gj;
    }

    public String getUnitPrice() {
        return this.f3847Gx;
    }

    public int getVersionCode() {
        return this.f3849kg;
    }

    public void writeToParcel(Parcel dest, int flags) {
        C1635f.m4355a(this, dest, flags);
    }
}
