package com.getjar.sdk;

import android.os.Parcel;
import android.os.Parcelable;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.StringUtility;
import java.util.Locale;
import java.util.regex.Pattern;
import org.json.JSONException;
import org.json.JSONObject;

public class Product implements Parcelable {
    public static final Parcelable.Creator<Product> CREATOR = new Parcelable.Creator<Product>() {
        public Product createFromParcel(Parcel in) {
            return new Product(in);
        }

        public Product[] newArray(int size) {
            return new Product[size];
        }
    };
    public static final Pattern ITEM_ID_PATTERN = Pattern.compile(ITEM_ID_REGEX);
    public static final String ITEM_ID_REGEX = "[\\w\\-_\\.]{1,100}";
    protected String mDeveloperPayload;
    protected long mProductAmount;
    protected String mProductDescription;
    protected String mProductId;
    protected Integer mProductImageResourceId;
    protected String mProductName;

    protected Product(String theProductId, String theProductName, String theProductDescription, long theAmount) {
        this.mProductId = "";
        this.mProductName = "";
        this.mProductDescription = "";
        this.mDeveloperPayload = "";
        this.mProductImageResourceId = null;
        validateProductId(theProductId);
        if (StringUtility.isNullOrEmpty(theProductName)) {
            throw new IllegalArgumentException(String.format(Locale.US, "product '%s' needs a name", new Object[]{theProductId}));
        } else if (theAmount < 0) {
            throw new IllegalArgumentException(String.format(Locale.US, "product '%s' needs an amount greater than or equal to zero", new Object[]{theProductId}));
        } else {
            this.mProductId = theProductId;
            this.mProductName = theProductName;
            this.mProductDescription = theProductDescription == null ? "" : theProductDescription;
            this.mProductAmount = theAmount;
        }
    }

    protected Product(String theProductId, String theProductName, String theProductDescription, long theAmount, int imageResourceId) {
        this(theProductId, theProductName, theProductDescription, theAmount);
        if (imageResourceId < 0) {
            Logger.w(Area.PURCHASE.value() | Area.DEVELOPER_API.value(), "'imageResourceId' cannot be less than 0");
        }
        this.mProductImageResourceId = Integer.valueOf(imageResourceId);
    }

    protected Product(String theProductId, String theProductName, String theProductDescription, long theAmount, int imageResourceId, String developerPayload) {
        this(theProductId, theProductName, theProductDescription, theAmount, imageResourceId);
        this.mDeveloperPayload = developerPayload == null ? "" : developerPayload;
    }

    public static void validateProductId(String theProductId) {
        if (StringUtility.isNullOrEmpty(theProductId)) {
            throw new IllegalArgumentException("'theProductId' cannot be NULL or empty");
        } else if (!ITEM_ID_PATTERN.matcher(theProductId).matches()) {
            throw new IllegalArgumentException(String.format(Locale.US, "'theProductId' is too long or contains invalid characters. Product IDs must match the RegEx pattern '%1$s'.", new Object[]{ITEM_ID_REGEX}));
        }
    }

    public String getProductId() {
        return this.mProductId;
    }

    public String getProductName() {
        return this.mProductName;
    }

    public String getProductDescription() {
        return this.mProductDescription;
    }

    public long getAmount() {
        return this.mProductAmount;
    }

    public String getDeveloperPayload() {
        return this.mDeveloperPayload;
    }

    public int getImageResourceId() {
        return this.mProductImageResourceId.intValue();
    }

    public JSONObject toJSONObject() throws JSONException {
        JSONObject jo = new JSONObject();
        jo.put("amount", this.mProductAmount);
        jo.put("product_id", this.mProductId);
        jo.put("product_description", this.mProductDescription);
        jo.put("product_name", this.mProductName);
        jo.put("developer_payload", this.mDeveloperPayload);
        return jo;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.mProductId);
        dest.writeString(this.mProductName);
        dest.writeString(this.mProductDescription);
        dest.writeLong(this.mProductAmount);
        if (this.mProductImageResourceId == null) {
            this.mProductImageResourceId = -1;
        }
        dest.writeInt(this.mProductImageResourceId.intValue());
        dest.writeString(this.mDeveloperPayload);
    }

    protected Product(Parcel in) {
        this.mProductId = "";
        this.mProductName = "";
        this.mProductDescription = "";
        this.mDeveloperPayload = "";
        this.mProductImageResourceId = null;
        this.mProductId = in.readString();
        this.mProductName = in.readString();
        this.mProductDescription = in.readString();
        this.mProductAmount = in.readLong();
        this.mProductImageResourceId = Integer.valueOf(in.readInt());
        if (this.mProductImageResourceId.intValue() == -1) {
            this.mProductImageResourceId = null;
        }
        this.mDeveloperPayload = in.readString();
    }
}
