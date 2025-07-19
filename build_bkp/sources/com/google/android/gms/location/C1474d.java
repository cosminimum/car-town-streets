package com.google.android.gms.location;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.C1098ee;

/* renamed from: com.google.android.gms.location.d */
public class C1474d implements SafeParcelable {
    public static final C1475e CREATOR = new C1475e();

    /* renamed from: kg */
    private final int f3517kg;

    /* renamed from: xG */
    int f3518xG;

    /* renamed from: xH */
    int f3519xH;

    /* renamed from: xI */
    long f3520xI;

    C1474d(int i, int i2, int i3, long j) {
        this.f3517kg = i;
        this.f3518xG = i2;
        this.f3519xH = i3;
        this.f3520xI = j;
    }

    /* renamed from: aQ */
    private String m4097aQ(int i) {
        switch (i) {
            case 0:
                return "STATUS_SUCCESSFUL";
            case 2:
                return "STATUS_TIMED_OUT_ON_SCAN";
            case 3:
                return "STATUS_NO_INFO_IN_DATABASE";
            case 4:
                return "STATUS_INVALID_SCAN";
            case 5:
                return "STATUS_UNABLE_TO_QUERY_DATABASE";
            case 6:
                return "STATUS_SCANS_DISABLED_IN_SETTINGS";
            case 7:
                return "STATUS_LOCATION_DISABLED_IN_SETTINGS";
            case 8:
                return "STATUS_IN_PROGRESS";
            default:
                return "STATUS_UNKNOWN";
        }
    }

    public int describeContents() {
        return 0;
    }

    public boolean equals(Object other) {
        if (!(other instanceof C1474d)) {
            return false;
        }
        C1474d dVar = (C1474d) other;
        return this.f3518xG == dVar.f3518xG && this.f3519xH == dVar.f3519xH && this.f3520xI == dVar.f3520xI;
    }

    /* access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.f3517kg;
    }

    public int hashCode() {
        return C1098ee.hashCode(Integer.valueOf(this.f3518xG), Integer.valueOf(this.f3519xH), Long.valueOf(this.f3520xI));
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("LocationStatus[cell status: ").append(m4097aQ(this.f3518xG));
        sb.append(", wifi status: ").append(m4097aQ(this.f3519xH));
        sb.append(", elapsed realtime ns: ").append(this.f3520xI);
        sb.append(']');
        return sb.toString();
    }

    public void writeToParcel(Parcel parcel, int flags) {
        C1475e.m4098a(this, parcel, flags);
    }
}
