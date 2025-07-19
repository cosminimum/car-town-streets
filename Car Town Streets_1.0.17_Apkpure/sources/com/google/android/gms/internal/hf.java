package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.List;
/* loaded from: classes.dex */
public final class hf implements SafeParcelable {
    public static final hg CREATOR = new hg();
    public final String Bf;
    public final String Bg;
    public final String Bh;
    public final List<String> Bi;
    public final String name;
    public final int versionCode;

    public hf(int i, String str, String str2, String str3, String str4, List<String> list) {
        this.versionCode = i;
        this.name = str;
        this.Bf = str2;
        this.Bg = str3;
        this.Bh = str4;
        this.Bi = list;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        hg hgVar = CREATOR;
        return 0;
    }

    public boolean equals(Object object) {
        if (this == object) {
            return true;
        }
        if (!(object instanceof hf)) {
            return false;
        }
        hf hfVar = (hf) object;
        return ee.equal(this.name, hfVar.name) && ee.equal(this.Bf, hfVar.Bf) && ee.equal(this.Bg, hfVar.Bg) && ee.equal(this.Bh, hfVar.Bh) && ee.equal(this.Bi, hfVar.Bi);
    }

    public int hashCode() {
        return ee.hashCode(this.name, this.Bf, this.Bg, this.Bh);
    }

    public String toString() {
        return ee.e(this).a("name", this.name).a("address", this.Bf).a("internationalPhoneNumber", this.Bg).a("regularOpenHours", this.Bh).a("attributions", this.Bi).toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int flags) {
        hg hgVar = CREATOR;
        hg.a(this, parcel, flags);
    }
}
