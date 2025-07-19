package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class ProxyCard implements SafeParcelable {
    public static final Parcelable.Creator<ProxyCard> CREATOR = new C1641l();

    /* renamed from: GY */
    String f3891GY;

    /* renamed from: GZ */
    String f3892GZ;

    /* renamed from: Ha */
    int f3893Ha;

    /* renamed from: Hb */
    int f3894Hb;

    /* renamed from: kg */
    private final int f3895kg;

    ProxyCard(int versionCode, String pan, String cvn, int expirationMonth, int expirationYear) {
        this.f3895kg = versionCode;
        this.f3891GY = pan;
        this.f3892GZ = cvn;
        this.f3893Ha = expirationMonth;
        this.f3894Hb = expirationYear;
    }

    public int describeContents() {
        return 0;
    }

    public String getCvn() {
        return this.f3892GZ;
    }

    public int getExpirationMonth() {
        return this.f3893Ha;
    }

    public int getExpirationYear() {
        return this.f3894Hb;
    }

    public String getPan() {
        return this.f3891GY;
    }

    public int getVersionCode() {
        return this.f3895kg;
    }

    public void writeToParcel(Parcel out, int flags) {
        C1641l.m4373a(this, out, flags);
    }
}
