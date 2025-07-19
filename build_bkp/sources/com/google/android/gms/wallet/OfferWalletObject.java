package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class OfferWalletObject implements SafeParcelable {
    public static final Parcelable.Creator<OfferWalletObject> CREATOR = new C1640k();

    /* renamed from: GA */
    String f3888GA;

    /* renamed from: GX */
    String f3889GX;

    /* renamed from: kg */
    private final int f3890kg;

    OfferWalletObject() {
        this.f3890kg = 2;
    }

    OfferWalletObject(int versionCode, String id, String redemptionCode) {
        this.f3890kg = versionCode;
        this.f3888GA = id;
        this.f3889GX = redemptionCode;
    }

    public int describeContents() {
        return 0;
    }

    public String getId() {
        return this.f3888GA;
    }

    public String getRedemptionCode() {
        return this.f3889GX;
    }

    public int getVersionCode() {
        return this.f3890kg;
    }

    public void writeToParcel(Parcel dest, int flags) {
        C1640k.m4370a(this, dest, flags);
    }
}
