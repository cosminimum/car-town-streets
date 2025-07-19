package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.auth.GoogleAuthUtil;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

/* renamed from: com.google.android.gms.internal.hi */
public class C1343hi implements SafeParcelable {
    public static final C1344hj CREATOR = new C1344hj();

    /* renamed from: Bn */
    public final String f3185Bn;

    /* renamed from: Bo */
    public final String f3186Bo;
    public final int versionCode;

    public C1343hi(int i, String str, String str2) {
        this.versionCode = i;
        this.f3185Bn = str;
        this.f3186Bo = str2;
    }

    public int describeContents() {
        C1344hj hjVar = CREATOR;
        return 0;
    }

    public boolean equals(Object object) {
        if (this == object) {
            return true;
        }
        if (object == null || !(object instanceof C1343hi)) {
            return false;
        }
        C1343hi hiVar = (C1343hi) object;
        return this.f3186Bo.equals(hiVar.f3186Bo) && this.f3185Bn.equals(hiVar.f3185Bn);
    }

    public int hashCode() {
        return C1098ee.hashCode(this.f3185Bn, this.f3186Bo);
    }

    public String toString() {
        return C1098ee.m2604e(this).mo7535a(GoogleAuthUtil.KEY_CLIENT_PACKAGE_NAME, this.f3185Bn).mo7535a("locale", this.f3186Bo).toString();
    }

    public void writeToParcel(Parcel out, int flags) {
        C1344hj hjVar = CREATOR;
        C1344hj.m3584a(this, out, flags);
    }
}
