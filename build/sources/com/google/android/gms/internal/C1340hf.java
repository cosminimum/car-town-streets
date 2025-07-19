package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.List;

/* renamed from: com.google.android.gms.internal.hf */
public final class C1340hf implements SafeParcelable {
    public static final C1341hg CREATOR = new C1341hg();

    /* renamed from: Bf */
    public final String f3176Bf;

    /* renamed from: Bg */
    public final String f3177Bg;

    /* renamed from: Bh */
    public final String f3178Bh;

    /* renamed from: Bi */
    public final List<String> f3179Bi;
    public final String name;
    public final int versionCode;

    public C1340hf(int i, String str, String str2, String str3, String str4, List<String> list) {
        this.versionCode = i;
        this.name = str;
        this.f3176Bf = str2;
        this.f3177Bg = str3;
        this.f3178Bh = str4;
        this.f3179Bi = list;
    }

    public int describeContents() {
        C1341hg hgVar = CREATOR;
        return 0;
    }

    public boolean equals(Object object) {
        if (this == object) {
            return true;
        }
        if (!(object instanceof C1340hf)) {
            return false;
        }
        C1340hf hfVar = (C1340hf) object;
        return C1098ee.equal(this.name, hfVar.name) && C1098ee.equal(this.f3176Bf, hfVar.f3176Bf) && C1098ee.equal(this.f3177Bg, hfVar.f3177Bg) && C1098ee.equal(this.f3178Bh, hfVar.f3178Bh) && C1098ee.equal(this.f3179Bi, hfVar.f3179Bi);
    }

    public int hashCode() {
        return C1098ee.hashCode(this.name, this.f3176Bf, this.f3177Bg, this.f3178Bh);
    }

    public String toString() {
        return C1098ee.m2604e(this).mo7535a("name", this.name).mo7535a("address", this.f3176Bf).mo7535a("internationalPhoneNumber", this.f3177Bg).mo7535a("regularOpenHours", this.f3178Bh).mo7535a("attributions", this.f3179Bi).toString();
    }

    public void writeToParcel(Parcel parcel, int flags) {
        C1341hg hgVar = CREATOR;
        C1341hg.m3580a(this, parcel, flags);
    }
}
