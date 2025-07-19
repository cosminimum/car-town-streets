package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class Address implements SafeParcelable {
    public static final Parcelable.Creator<Address> CREATOR = new a();
    String Ga;
    String Gb;
    String Gc;
    String Gd;
    String Ge;
    String Gf;
    String Gg;
    boolean Gh;
    String Gi;
    String id;
    private final int kg;
    String name;

    Address() {
        this.kg = 1;
    }

    Address(int versionCode, String name2, String address1, String address2, String address3, String countryCode, String city, String state, String postalCode, String phoneNumber, boolean isPostBox, String companyName) {
        this.kg = versionCode;
        this.name = name2;
        this.Ga = address1;
        this.Gb = address2;
        this.Gc = address3;
        this.id = countryCode;
        this.Gd = city;
        this.Ge = state;
        this.Gf = postalCode;
        this.Gg = phoneNumber;
        this.Gh = isPostBox;
        this.Gi = companyName;
    }

    public int describeContents() {
        return 0;
    }

    public String getAddress1() {
        return this.Ga;
    }

    public String getAddress2() {
        return this.Gb;
    }

    public String getAddress3() {
        return this.Gc;
    }

    public String getCity() {
        return this.Gd;
    }

    public String getCompanyName() {
        return this.Gi;
    }

    public String getCountryCode() {
        return this.id;
    }

    public String getName() {
        return this.name;
    }

    public String getPhoneNumber() {
        return this.Gg;
    }

    public String getPostalCode() {
        return this.Gf;
    }

    public String getState() {
        return this.Ge;
    }

    public int getVersionCode() {
        return this.kg;
    }

    public boolean isPostBox() {
        return this.Gh;
    }

    public void writeToParcel(Parcel out, int flags) {
        a.a(this, out, flags);
    }
}
