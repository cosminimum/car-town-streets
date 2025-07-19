package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class LoyaltyWalletObject implements SafeParcelable {
    public static final Parcelable.Creator<LoyaltyWalletObject> CREATOR = new C1636g();

    /* renamed from: GA */
    String f3851GA;

    /* renamed from: GB */
    String f3852GB;

    /* renamed from: GC */
    String f3853GC;

    /* renamed from: GD */
    String f3854GD;

    /* renamed from: GE */
    String f3855GE;

    /* renamed from: GF */
    String f3856GF;

    /* renamed from: GG */
    String f3857GG;

    /* renamed from: GH */
    String f3858GH;

    /* renamed from: kg */
    private final int f3859kg;

    LoyaltyWalletObject() {
        this.f3859kg = 3;
    }

    LoyaltyWalletObject(int versionCode, String id, String accountId, String issuerName, String programName, String accountName, String barcodeAlternateText, String barcodeType, String barcodeValue) {
        this.f3859kg = versionCode;
        this.f3851GA = id;
        this.f3852GB = accountId;
        this.f3853GC = issuerName;
        this.f3854GD = programName;
        this.f3855GE = accountName;
        this.f3856GF = barcodeAlternateText;
        this.f3857GG = barcodeType;
        this.f3858GH = barcodeValue;
    }

    public int describeContents() {
        return 0;
    }

    public String getAccountId() {
        return this.f3852GB;
    }

    public String getAccountName() {
        return this.f3855GE;
    }

    public String getBarcodeAlternateText() {
        return this.f3856GF;
    }

    public String getBarcodeType() {
        return this.f3857GG;
    }

    public String getBarcodeValue() {
        return this.f3858GH;
    }

    public String getId() {
        return this.f3851GA;
    }

    public String getIssuerName() {
        return this.f3853GC;
    }

    public String getProgramName() {
        return this.f3854GD;
    }

    public int getVersionCode() {
        return this.f3859kg;
    }

    public void writeToParcel(Parcel dest, int flags) {
        C1636g.m4358a(this, dest, flags);
    }
}
