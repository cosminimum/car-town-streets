package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
/* loaded from: classes.dex */
public final class LineItem implements SafeParcelable {
    public static final Parcelable.Creator<LineItem> CREATOR = new f();
    String Gj;
    String Gk;
    String Gw;
    String Gx;
    int Gy;
    String description;
    private final int kg;

    /* loaded from: classes.dex */
    public final class Builder {
        private Builder() {
        }

        public LineItem build() {
            return LineItem.this;
        }

        public Builder setCurrencyCode(String currencyCode) {
            LineItem.this.Gk = currencyCode;
            return this;
        }

        public Builder setDescription(String description) {
            LineItem.this.description = description;
            return this;
        }

        public Builder setQuantity(String quantity) {
            LineItem.this.Gw = quantity;
            return this;
        }

        public Builder setRole(int role) {
            LineItem.this.Gy = role;
            return this;
        }

        public Builder setTotalPrice(String totalPrice) {
            LineItem.this.Gj = totalPrice;
            return this;
        }

        public Builder setUnitPrice(String unitPrice) {
            LineItem.this.Gx = unitPrice;
            return this;
        }
    }

    /* loaded from: classes.dex */
    public interface Role {
        public static final int REGULAR = 0;
        public static final int SHIPPING = 2;
        public static final int TAX = 1;
    }

    LineItem() {
        this.kg = 1;
        this.Gy = 0;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public LineItem(int versionCode, String description, String quantity, String unitPrice, String totalPrice, int role, String currencyCode) {
        this.kg = versionCode;
        this.description = description;
        this.Gw = quantity;
        this.Gx = unitPrice;
        this.Gj = totalPrice;
        this.Gy = role;
        this.Gk = currencyCode;
    }

    public static Builder newBuilder() {
        LineItem lineItem = new LineItem();
        lineItem.getClass();
        return new Builder();
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public String getCurrencyCode() {
        return this.Gk;
    }

    public String getDescription() {
        return this.description;
    }

    public String getQuantity() {
        return this.Gw;
    }

    public int getRole() {
        return this.Gy;
    }

    public String getTotalPrice() {
        return this.Gj;
    }

    public String getUnitPrice() {
        return this.Gx;
    }

    public int getVersionCode() {
        return this.kg;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        f.a(this, dest, flags);
    }
}
