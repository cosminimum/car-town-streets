package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class OfferWalletObject implements SafeParcelable {
    public static final Parcelable.Creator<OfferWalletObject> CREATOR = new k();
    String GA;
    String GX;
    private final int kg;

    OfferWalletObject() {
        this.kg = 2;
    }

    OfferWalletObject(int versionCode, String id, String redemptionCode) {
        this.kg = versionCode;
        this.GA = id;
        this.GX = redemptionCode;
    }

    public int describeContents() {
        return 0;
    }

    public String getId() {
        return this.GA;
    }

    public String getRedemptionCode() {
        return this.GX;
    }

    public int getVersionCode() {
        return this.kg;
    }

    public void writeToParcel(Parcel dest, int flags) {
        k.a(this, dest, flags);
    }
}
