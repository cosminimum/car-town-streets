package com.google.android.gms.location;

import android.app.PendingIntent;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

/* renamed from: com.google.android.gms.location.f */
public class C1476f implements SafeParcelable {
    public static final C1477g CREATOR = new C1477g();

    /* renamed from: kg */
    private final int f3521kg;

    /* renamed from: xJ */
    private final String f3522xJ;

    /* renamed from: xr */
    private final PendingIntent f3523xr;

    public C1476f(int i, PendingIntent pendingIntent, String str) {
        this.f3521kg = i;
        this.f3523xr = pendingIntent;
        this.f3522xJ = str;
    }

    /* renamed from: dB */
    public PendingIntent mo8927dB() {
        return this.f3523xr;
    }

    /* renamed from: dC */
    public String mo8928dC() {
        return this.f3522xJ;
    }

    public int describeContents() {
        C1477g gVar = CREATOR;
        return 0;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        C1476f fVar = (C1476f) obj;
        if (this.f3523xr == null) {
            if (fVar.f3523xr != null) {
                return false;
            }
        } else if (!this.f3523xr.equals(fVar.f3523xr)) {
            return false;
        }
        return this.f3522xJ == null ? fVar.f3522xJ == null : this.f3522xJ.equals(fVar.f3522xJ);
    }

    public int getVersionCode() {
        return this.f3521kg;
    }

    public int hashCode() {
        int i = 0;
        int hashCode = ((this.f3523xr == null ? 0 : this.f3523xr.hashCode()) + 31) * 31;
        if (this.f3522xJ != null) {
            i = this.f3522xJ.hashCode();
        }
        return hashCode + i;
    }

    public void writeToParcel(Parcel dest, int flags) {
        C1477g gVar = CREATOR;
        C1477g.m4103a(this, dest, flags);
    }
}
