package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.Collections;
import java.util.List;
/* loaded from: classes.dex */
public final class cb implements SafeParcelable {
    public static final cc CREATOR = new cc();
    public final int errorCode;
    public final List<String> fK;
    public final List<String> fL;
    public final long fO;
    public final String gL;
    public final List<String> hA;
    public final String hB;
    public final String hw;
    public final long hx;
    public final boolean hy;
    public final long hz;
    public final int orientation;
    public final int versionCode;

    public cb(int i) {
        this(2, null, null, null, i, null, -1L, false, -1L, null, -1L, -1, null);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public cb(int i, String str, String str2, List<String> list, int i2, List<String> list2, long j, boolean z, long j2, List<String> list3, long j3, int i3, String str3) {
        this.versionCode = i;
        this.gL = str;
        this.hw = str2;
        this.fK = list != null ? Collections.unmodifiableList(list) : null;
        this.errorCode = i2;
        this.fL = list2 != null ? Collections.unmodifiableList(list2) : null;
        this.hx = j;
        this.hy = z;
        this.hz = j2;
        this.hA = list3 != null ? Collections.unmodifiableList(list3) : null;
        this.fO = j3;
        this.orientation = i3;
        this.hB = str3;
    }

    public cb(String str, String str2, List<String> list, List<String> list2, long j, boolean z, long j2, List<String> list3, long j3, int i, String str3) {
        this(2, str, str2, list, -2, list2, j, z, j2, list3, j3, i, str3);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel out, int flags) {
        cc.a(this, out, flags);
    }
}
