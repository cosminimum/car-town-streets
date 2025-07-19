package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.Collections;
import java.util.List;

/* renamed from: com.google.android.gms.internal.cb */
public final class C0976cb implements SafeParcelable {
    public static final C0977cc CREATOR = new C0977cc();
    public final int errorCode;

    /* renamed from: fK */
    public final List<String> f2320fK;

    /* renamed from: fL */
    public final List<String> f2321fL;

    /* renamed from: fO */
    public final long f2322fO;

    /* renamed from: gL */
    public final String f2323gL;

    /* renamed from: hA */
    public final List<String> f2324hA;

    /* renamed from: hB */
    public final String f2325hB;

    /* renamed from: hw */
    public final String f2326hw;

    /* renamed from: hx */
    public final long f2327hx;

    /* renamed from: hy */
    public final boolean f2328hy;

    /* renamed from: hz */
    public final long f2329hz;
    public final int orientation;
    public final int versionCode;

    public C0976cb(int i) {
        this(2, (String) null, (String) null, (List<String>) null, i, (List<String>) null, -1, false, -1, (List<String>) null, -1, -1, (String) null);
    }

    C0976cb(int i, String str, String str2, List<String> list, int i2, List<String> list2, long j, boolean z, long j2, List<String> list3, long j3, int i3, String str3) {
        this.versionCode = i;
        this.f2323gL = str;
        this.f2326hw = str2;
        this.f2320fK = list != null ? Collections.unmodifiableList(list) : null;
        this.errorCode = i2;
        this.f2321fL = list2 != null ? Collections.unmodifiableList(list2) : null;
        this.f2327hx = j;
        this.f2328hy = z;
        this.f2329hz = j2;
        this.f2324hA = list3 != null ? Collections.unmodifiableList(list3) : null;
        this.f2322fO = j3;
        this.orientation = i3;
        this.f2325hB = str3;
    }

    public C0976cb(String str, String str2, List<String> list, List<String> list2, long j, boolean z, long j2, List<String> list3, long j3, int i, String str3) {
        this(2, str, str2, list, -2, list2, j, z, j2, list3, j3, i, str3);
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel out, int flags) {
        C0977cc.m2119a(this, out, flags);
    }
}
