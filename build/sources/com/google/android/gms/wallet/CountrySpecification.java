package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class CountrySpecification implements SafeParcelable {
    public static final Parcelable.Creator<CountrySpecification> CREATOR = new C1632c();

    /* renamed from: id */
    String f3829id;

    /* renamed from: kg */
    private final int f3830kg;

    CountrySpecification(int versionCode, String countryCode) {
        this.f3830kg = versionCode;
        this.f3829id = countryCode;
    }

    public CountrySpecification(String countryCode) {
        this.f3830kg = 1;
        this.f3829id = countryCode;
    }

    public int describeContents() {
        return 0;
    }

    public String getCountryCode() {
        return this.f3829id;
    }

    public int getVersionCode() {
        return this.f3830kg;
    }

    public void writeToParcel(Parcel dest, int flags) {
        C1632c.m4346a(this, dest, flags);
    }
}
