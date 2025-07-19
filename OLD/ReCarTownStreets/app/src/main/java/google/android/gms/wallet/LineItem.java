package google.android.gms.wallet;

import android.os.Parcel;

import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class LineItem implements SafeParcelable {
    public static final Creator<LineItem> CREATOR = new f();
    String Gj;
    String Gk;
    String Gw;
    String Gx;
    int Gy;
    String description;
    private final int kg;

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

    public interface Role {
        public static final int REGULAR = 0;
        public static final int SHIPPING = 2;
        public static final int TAX = 1;
    }

    LineItem() {
        this.kg = 1;
        this.Gy = 0;
    }

    LineItem(int versionCode, String description2, String quantity, String unitPrice, String totalPrice, int role, String currencyCode) {
        this.kg = versionCode;
        this.description = description2;
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

    public void writeToParcel(Parcel dest, int flags) {
        f.a(this, dest, flags);
    }
}
