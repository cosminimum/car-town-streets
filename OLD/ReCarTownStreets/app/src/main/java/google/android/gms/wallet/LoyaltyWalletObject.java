package google.android.gms.wallet;

import android.os.Parcel;

import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class LoyaltyWalletObject implements SafeParcelable {
    public static final Creator<LoyaltyWalletObject> CREATOR = new g();
    String GA;
    String GB;
    String GC;
    String GD;
    String GE;
    String GF;
    String GG;
    String GH;
    private final int kg;

    LoyaltyWalletObject() {
        this.kg = 3;
    }

    LoyaltyWalletObject(int versionCode, String id, String accountId, String issuerName, String programName, String accountName, String barcodeAlternateText, String barcodeType, String barcodeValue) {
        this.kg = versionCode;
        this.GA = id;
        this.GB = accountId;
        this.GC = issuerName;
        this.GD = programName;
        this.GE = accountName;
        this.GF = barcodeAlternateText;
        this.GG = barcodeType;
        this.GH = barcodeValue;
    }

    public int describeContents() {
        return 0;
    }

    public String getAccountId() {
        return this.GB;
    }

    public String getAccountName() {
        return this.GE;
    }

    public String getBarcodeAlternateText() {
        return this.GF;
    }

    public String getBarcodeType() {
        return this.GG;
    }

    public String getBarcodeValue() {
        return this.GH;
    }

    public String getId() {
        return this.GA;
    }

    public String getIssuerName() {
        return this.GC;
    }

    public String getProgramName() {
        return this.GD;
    }

    public int getVersionCode() {
        return this.kg;
    }

    public void writeToParcel(Parcel dest, int flags) {
        g.a(this, dest, flags);
    }
}
