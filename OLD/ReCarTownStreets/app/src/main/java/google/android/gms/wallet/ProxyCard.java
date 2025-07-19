package google.android.gms.wallet;

import android.os.Parcel;

import google.android.gms.common.internal.safeparcel.SafeParcelable;

public final class ProxyCard implements SafeParcelable {
    public static final Creator<ProxyCard> CREATOR = new l();
    String GY;
    String GZ;
    int Ha;
    int Hb;
    private final int kg;

    ProxyCard(int versionCode, String pan, String cvn, int expirationMonth, int expirationYear) {
        this.kg = versionCode;
        this.GY = pan;
        this.GZ = cvn;
        this.Ha = expirationMonth;
        this.Hb = expirationYear;
    }

    public int describeContents() {
        return 0;
    }

    public String getCvn() {
        return this.GZ;
    }

    public int getExpirationMonth() {
        return this.Ha;
    }

    public int getExpirationYear() {
        return this.Hb;
    }

    public String getPan() {
        return this.GY;
    }

    public int getVersionCode() {
        return this.kg;
    }

    public void writeToParcel(Parcel out, int flags) {
        l.a(this, out, flags);
    }
}
