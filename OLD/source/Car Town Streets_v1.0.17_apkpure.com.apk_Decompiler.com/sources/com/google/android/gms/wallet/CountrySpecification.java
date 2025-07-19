package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class CountrySpecification implements SafeParcelable {
    public static final Parcelable.Creator<CountrySpecification> CREATOR = new c();
    String id;
    private final int kg;

    CountrySpecification(int versionCode, String countryCode) {
        this.kg = versionCode;
        this.id = countryCode;
    }

    public CountrySpecification(String countryCode) {
        this.kg = 1;
        this.id = countryCode;
    }

    public int describeContents() {
        return 0;
    }

    public String getCountryCode() {
        return this.id;
    }

    public int getVersionCode() {
        return this.kg;
    }

    public void writeToParcel(Parcel dest, int flags) {
        c.a(this, dest, flags);
    }
}
