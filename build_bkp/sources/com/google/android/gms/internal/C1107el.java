package com.google.android.gms.internal;

import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

/* renamed from: com.google.android.gms.internal.el */
public final class C1107el implements SafeParcelable {
    public static final C1108em CREATOR = new C1108em();

    /* renamed from: kg */
    private final int f2634kg;
    @Deprecated

    /* renamed from: nN */
    private final Bundle f2635nN;

    /* renamed from: os */
    private final int f2636os;

    /* renamed from: pX */
    private final int f2637pX;

    /* renamed from: pY */
    private final String f2638pY;

    /* renamed from: pZ */
    private final String f2639pZ;

    /* renamed from: qa */
    private final String f2640qa;

    /* renamed from: qb */
    private final String f2641qb;

    C1107el(int i, int i2, int i3, String str, String str2, String str3, String str4, Bundle bundle) {
        this.f2634kg = i;
        this.f2636os = i2;
        this.f2637pX = i3;
        this.f2638pY = str;
        this.f2639pZ = str2;
        this.f2640qa = str3;
        this.f2641qb = str4;
        this.f2635nN = bundle == null ? new Bundle() : bundle;
    }

    /* renamed from: bY */
    public int mo7550bY() {
        return this.f2637pX;
    }

    /* renamed from: bZ */
    public String mo7551bZ() {
        return this.f2638pY;
    }

    /* renamed from: ca */
    public String mo7552ca() {
        return this.f2639pZ;
    }

    /* renamed from: cb */
    public String mo7553cb() {
        return this.f2641qb;
    }

    /* renamed from: cc */
    public boolean mo7554cc() {
        return this.f2636os == 1 && this.f2637pX == -1;
    }

    /* renamed from: cd */
    public boolean mo7555cd() {
        return this.f2636os == 2;
    }

    public int describeContents() {
        return 0;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof C1107el)) {
            return false;
        }
        C1107el elVar = (C1107el) obj;
        return this.f2634kg == elVar.f2634kg && this.f2636os == elVar.f2636os && this.f2637pX == elVar.f2637pX && C1098ee.equal(this.f2638pY, elVar.f2638pY) && C1098ee.equal(this.f2639pZ, elVar.f2639pZ);
    }

    public String getDisplayName() {
        return this.f2640qa;
    }

    @Deprecated
    public Bundle getMetadata() {
        return this.f2635nN;
    }

    public int getType() {
        return this.f2636os;
    }

    public int getVersionCode() {
        return this.f2634kg;
    }

    public int hashCode() {
        return C1098ee.hashCode(Integer.valueOf(this.f2634kg), Integer.valueOf(this.f2636os), Integer.valueOf(this.f2637pX), this.f2638pY, this.f2639pZ);
    }

    public String toString() {
        if (mo7555cd()) {
            return String.format("Person [%s] %s", new Object[]{mo7552ca(), getDisplayName()});
        } else if (mo7554cc()) {
            return String.format("Circle [%s] %s", new Object[]{mo7551bZ(), getDisplayName()});
        } else {
            return String.format("Group [%s] %s", new Object[]{mo7551bZ(), getDisplayName()});
        }
    }

    public void writeToParcel(Parcel out, int flags) {
        C1108em.m2636a(this, out, flags);
    }
}
