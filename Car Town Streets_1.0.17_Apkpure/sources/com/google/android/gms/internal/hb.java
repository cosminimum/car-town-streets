package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
/* loaded from: classes.dex */
public final class hb extends gs implements SafeParcelable {
    private final hd[] AK;
    private final float[] AL;
    final int kg;
    private final long vO;
    public static final hc CREATOR = new hc();
    private static final hb AJ = new hb(0, new hd[0], new float[0], 0);

    /* JADX INFO: Access modifiers changed from: package-private */
    public hb(int i, hd[] hdVarArr, float[] fArr, long j) {
        eg.b(hdVarArr.length == fArr.length, "mismatched places to probabilities arrays");
        this.kg = i;
        this.AK = hdVarArr;
        this.AL = fArr;
        this.vO = j;
    }

    public hd[] dU() {
        return this.AK;
    }

    public float[] dV() {
        return this.AL;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        hc hcVar = CREATOR;
        return 0;
    }

    public boolean equals(Object object) {
        if (this == object) {
            return true;
        }
        if (!(object instanceof hb)) {
            return false;
        }
        hb hbVar = (hb) object;
        return this.AK.equals(hbVar.AK) && this.AL.equals(hbVar.AL);
    }

    public long getTimestampMillis() {
        return this.vO;
    }

    public int hashCode() {
        return ee.hashCode(this.AK, this.AL);
    }

    public String toString() {
        StringBuilder sb = new StringBuilder("PlaceEstimate{");
        for (int i = 0; i < this.AK.length; i++) {
            sb.append(String.format("(%f, %s)", Float.valueOf(this.AL[i]), this.AK[i].toString()));
            if (i != this.AK.length - 1) {
                sb.append(",");
            }
        }
        sb.append("}");
        return sb.toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int flags) {
        hc hcVar = CREATOR;
        hc.a(this, parcel, flags);
    }
}
