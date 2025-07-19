package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

/* renamed from: com.google.android.gms.internal.hb */
public final class C1334hb extends C1322gs implements SafeParcelable {

    /* renamed from: AJ */
    private static final C1334hb f3146AJ = new C1334hb(0, new C1336hd[0], new float[0], 0);
    public static final C1335hc CREATOR = new C1335hc();

    /* renamed from: AK */
    private final C1336hd[] f3147AK;

    /* renamed from: AL */
    private final float[] f3148AL;

    /* renamed from: kg */
    final int f3149kg;

    /* renamed from: vO */
    private final long f3150vO;

    C1334hb(int i, C1336hd[] hdVarArr, float[] fArr, long j) {
        C1102eg.m2615b(hdVarArr.length == fArr.length, (Object) "mismatched places to probabilities arrays");
        this.f3149kg = i;
        this.f3147AK = hdVarArr;
        this.f3148AL = fArr;
        this.f3150vO = j;
    }

    /* renamed from: dU */
    public C1336hd[] mo8168dU() {
        return this.f3147AK;
    }

    /* renamed from: dV */
    public float[] mo8169dV() {
        return this.f3148AL;
    }

    public int describeContents() {
        C1335hc hcVar = CREATOR;
        return 0;
    }

    public boolean equals(Object object) {
        if (this == object) {
            return true;
        }
        if (!(object instanceof C1334hb)) {
            return false;
        }
        C1334hb hbVar = (C1334hb) object;
        return this.f3147AK.equals(hbVar.f3147AK) && this.f3148AL.equals(hbVar.f3148AL);
    }

    public long getTimestampMillis() {
        return this.f3150vO;
    }

    public int hashCode() {
        return C1098ee.hashCode(this.f3147AK, this.f3148AL);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder("PlaceEstimate{");
        for (int i = 0; i < this.f3147AK.length; i++) {
            sb.append(String.format("(%f, %s)", new Object[]{Float.valueOf(this.f3148AL[i]), this.f3147AK[i].toString()}));
            if (i != this.f3147AK.length - 1) {
                sb.append(",");
            }
        }
        sb.append("}");
        return sb.toString();
    }

    public void writeToParcel(Parcel parcel, int flags) {
        C1335hc hcVar = CREATOR;
        C1335hc.m3556a(this, parcel, flags);
    }
}
