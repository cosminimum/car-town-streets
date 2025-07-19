package com.google.android.gms.drive;

import android.os.Parcel;
import android.os.Parcelable;
import android.util.Base64;
import android.util.Log;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.internal.C0739q;
import com.google.android.gms.internal.C1102eg;
import com.google.android.gms.internal.C1441iy;
import com.google.android.gms.internal.C1442iz;

public class DriveId implements SafeParcelable {
    public static final Parcelable.Creator<DriveId> CREATOR = new C0683c();

    /* renamed from: kg */
    final int f1439kg;

    /* renamed from: qO */
    final String f1440qO;

    /* renamed from: qP */
    final long f1441qP;

    /* renamed from: qQ */
    final long f1442qQ;

    /* renamed from: qR */
    private volatile String f1443qR;

    DriveId(int versionCode, String resourceId, long sqlId, long databaseInstanceId) {
        boolean z = false;
        this.f1443qR = null;
        this.f1439kg = versionCode;
        this.f1440qO = resourceId;
        C1102eg.m2618r(!"".equals(resourceId));
        C1102eg.m2618r((resourceId == null && sqlId == -1) ? z : true);
        this.f1441qP = sqlId;
        this.f1442qQ = databaseInstanceId;
    }

    public DriveId(String resourceId, long sqlId, long databaseInstanceId) {
        this(1, resourceId, sqlId, databaseInstanceId);
    }

    /* renamed from: ab */
    public static DriveId m1418ab(String str) {
        C1102eg.m2616f(str);
        return new DriveId(str, -1, -1);
    }

    /* renamed from: d */
    static DriveId m1419d(byte[] bArr) {
        try {
            C0739q e = C0739q.m1571e(bArr);
            return new DriveId(e.versionCode, "".equals(e.f1554rt) ? null : e.f1554rt, e.f1555ru, e.f1556rv);
        } catch (C1441iy e2) {
            throw new IllegalArgumentException();
        }
    }

    public static DriveId decodeFromString(String s) {
        C1102eg.m2615b(s.startsWith("DriveId:"), (Object) "Invalid DriveId: " + s);
        return m1419d(Base64.decode(s.substring("DriveId:".length()), 10));
    }

    /* access modifiers changed from: package-private */
    /* renamed from: cL */
    public final byte[] mo6073cL() {
        C0739q qVar = new C0739q();
        qVar.versionCode = this.f1439kg;
        qVar.f1554rt = this.f1440qO == null ? "" : this.f1440qO;
        qVar.f1555ru = this.f1441qP;
        qVar.f1556rv = this.f1442qQ;
        return C1442iz.m3985a((C1442iz) qVar);
    }

    public int describeContents() {
        return 0;
    }

    public final String encodeToString() {
        if (this.f1443qR == null) {
            this.f1443qR = "DriveId:" + Base64.encodeToString(mo6073cL(), 10);
        }
        return this.f1443qR;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof DriveId)) {
            return false;
        }
        DriveId driveId = (DriveId) obj;
        if (driveId.f1442qQ != this.f1442qQ) {
            Log.w("DriveId", "Attempt to compare invalid DriveId detected. Has local storage been cleared?");
            return false;
        } else if (driveId.f1441qP == -1 && this.f1441qP == -1) {
            return driveId.f1440qO.equals(this.f1440qO);
        } else {
            return driveId.f1441qP == this.f1441qP;
        }
    }

    public String getResourceId() {
        return this.f1440qO;
    }

    public int hashCode() {
        return this.f1441qP == -1 ? this.f1440qO.hashCode() : (String.valueOf(this.f1442qQ) + String.valueOf(this.f1441qP)).hashCode();
    }

    public String toString() {
        return encodeToString();
    }

    public void writeToParcel(Parcel out, int flags) {
        C0683c.m1430a(this, out, flags);
    }
}
