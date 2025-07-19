package com.google.android.gms.drive;

import android.os.Parcel;
import android.os.Parcelable;
import android.util.Base64;
import android.util.Log;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.internal.q;
import com.google.android.gms.internal.eg;
import com.google.android.gms.internal.iy;
import com.google.android.gms.internal.iz;

public class DriveId implements SafeParcelable {
    public static final Parcelable.Creator<DriveId> CREATOR = new c();
    final int kg;
    final String qO;
    final long qP;
    final long qQ;
    private volatile String qR;

    DriveId(int versionCode, String resourceId, long sqlId, long databaseInstanceId) {
        boolean z = false;
        this.qR = null;
        this.kg = versionCode;
        this.qO = resourceId;
        eg.r(!"".equals(resourceId));
        eg.r((resourceId == null && sqlId == -1) ? z : true);
        this.qP = sqlId;
        this.qQ = databaseInstanceId;
    }

    public DriveId(String resourceId, long sqlId, long databaseInstanceId) {
        this(1, resourceId, sqlId, databaseInstanceId);
    }

    public static DriveId ab(String str) {
        eg.f(str);
        return new DriveId(str, -1, -1);
    }

    static DriveId d(byte[] bArr) {
        try {
            q e = q.e(bArr);
            return new DriveId(e.versionCode, "".equals(e.rt) ? null : e.rt, e.ru, e.rv);
        } catch (iy e2) {
            throw new IllegalArgumentException();
        }
    }

    public static DriveId decodeFromString(String s) {
        eg.b(s.startsWith("DriveId:"), (Object) "Invalid DriveId: " + s);
        return d(Base64.decode(s.substring("DriveId:".length()), 10));
    }

    /* access modifiers changed from: package-private */
    public final byte[] cL() {
        q qVar = new q();
        qVar.versionCode = this.kg;
        qVar.rt = this.qO == null ? "" : this.qO;
        qVar.ru = this.qP;
        qVar.rv = this.qQ;
        return iz.a((iz) qVar);
    }

    public int describeContents() {
        return 0;
    }

    public final String encodeToString() {
        if (this.qR == null) {
            this.qR = "DriveId:" + Base64.encodeToString(cL(), 10);
        }
        return this.qR;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof DriveId)) {
            return false;
        }
        DriveId driveId = (DriveId) obj;
        if (driveId.qQ != this.qQ) {
            Log.w("DriveId", "Attempt to compare invalid DriveId detected. Has local storage been cleared?");
            return false;
        } else if (driveId.qP == -1 && this.qP == -1) {
            return driveId.qO.equals(this.qO);
        } else {
            return driveId.qP == this.qP;
        }
    }

    public String getResourceId() {
        return this.qO;
    }

    public int hashCode() {
        return this.qP == -1 ? this.qO.hashCode() : (String.valueOf(this.qQ) + String.valueOf(this.qP)).hashCode();
    }

    public String toString() {
        return encodeToString();
    }

    public void writeToParcel(Parcel out, int flags) {
        c.a(this, out, flags);
    }
}
