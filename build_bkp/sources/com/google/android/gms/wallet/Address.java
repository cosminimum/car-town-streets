package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class Address implements SafeParcelable {
    public static final Parcelable.Creator<Address> CREATOR = new C1630a();

    /* renamed from: Ga */
    String f3813Ga;

    /* renamed from: Gb */
    String f3814Gb;

    /* renamed from: Gc */
    String f3815Gc;

    /* renamed from: Gd */
    String f3816Gd;

    /* renamed from: Ge */
    String f3817Ge;

    /* renamed from: Gf */
    String f3818Gf;

    /* renamed from: Gg */
    String f3819Gg;

    /* renamed from: Gh */
    boolean f3820Gh;

    /* renamed from: Gi */
    String f3821Gi;

    /* renamed from: id */
    String f3822id;

    /* renamed from: kg */
    private final int f3823kg;
    String name;

    Address() {
        this.f3823kg = 1;
    }

    Address(int versionCode, String name2, String address1, String address2, String address3, String countryCode, String city, String state, String postalCode, String phoneNumber, boolean isPostBox, String companyName) {
        this.f3823kg = versionCode;
        this.name = name2;
        this.f3813Ga = address1;
        this.f3814Gb = address2;
        this.f3815Gc = address3;
        this.f3822id = countryCode;
        this.f3816Gd = city;
        this.f3817Ge = state;
        this.f3818Gf = postalCode;
        this.f3819Gg = phoneNumber;
        this.f3820Gh = isPostBox;
        this.f3821Gi = companyName;
    }

    public int describeContents() {
        return 0;
    }

    public String getAddress1() {
        return this.f3813Ga;
    }

    public String getAddress2() {
        return this.f3814Gb;
    }

    public String getAddress3() {
        return this.f3815Gc;
    }

    public String getCity() {
        return this.f3816Gd;
    }

    public String getCompanyName() {
        return this.f3821Gi;
    }

    public String getCountryCode() {
        return this.f3822id;
    }

    public String getName() {
        return this.name;
    }

    public String getPhoneNumber() {
        return this.f3819Gg;
    }

    public String getPostalCode() {
        return this.f3818Gf;
    }

    public String getState() {
        return this.f3817Ge;
    }

    public int getVersionCode() {
        return this.f3823kg;
    }

    public boolean isPostBox() {
        return this.f3820Gh;
    }

    public void writeToParcel(Parcel out, int flags) {
        C1630a.m4340a(this, out, flags);
    }
}
