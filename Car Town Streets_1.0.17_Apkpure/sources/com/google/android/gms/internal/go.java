package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.location.Geofence;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import java.util.Locale;
/* loaded from: classes.dex */
public class go implements SafeParcelable, Geofence {
    public static final gp CREATOR = new gp();
    private final int kg;
    private final int xA;
    private final String xs;
    private final int xt;
    private final short xv;
    private final double xw;
    private final double xx;
    private final float xy;
    private final int xz;
    private final long ye;

    public go(int i, String str, int i2, short s, double d, double d2, float f, long j, int i3, int i4) {
        ap(str);
        b(f);
        a(d, d2);
        int aV = aV(i2);
        this.kg = i;
        this.xv = s;
        this.xs = str;
        this.xw = d;
        this.xx = d2;
        this.xy = f;
        this.ye = j;
        this.xt = aV;
        this.xz = i3;
        this.xA = i4;
    }

    public go(String str, int i, short s, double d, double d2, float f, long j, int i2, int i3) {
        this(1, str, i, s, d, d2, f, j, i2, i3);
    }

    private static void a(double d, double d2) {
        if (d > 90.0d || d < -90.0d) {
            throw new IllegalArgumentException("invalid latitude: " + d);
        }
        if (d2 <= 180.0d && d2 >= -180.0d) {
            return;
        }
        throw new IllegalArgumentException("invalid longitude: " + d2);
    }

    private static int aV(int i) {
        int i2 = i & 7;
        if (i2 == 0) {
            throw new IllegalArgumentException("No supported transition specified: " + i);
        }
        return i2;
    }

    private static String aW(int i) {
        switch (i) {
            case 1:
                return "CIRCLE";
            default:
                return null;
        }
    }

    private static void ap(String str) {
        if (str == null || str.length() > 100) {
            throw new IllegalArgumentException("requestId is null or too long: " + str);
        }
    }

    private static void b(float f) {
        if (f <= BitmapDescriptorFactory.HUE_RED) {
            throw new IllegalArgumentException("invalid radius: " + f);
        }
    }

    public static go f(byte[] bArr) {
        Parcel obtain = Parcel.obtain();
        obtain.unmarshall(bArr, 0, bArr.length);
        obtain.setDataPosition(0);
        go createFromParcel = CREATOR.createFromParcel(obtain);
        obtain.recycle();
        return createFromParcel;
    }

    public short dK() {
        return this.xv;
    }

    public float dL() {
        return this.xy;
    }

    public int dM() {
        return this.xt;
    }

    public int dN() {
        return this.xA;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        gp gpVar = CREATOR;
        return 0;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && (obj instanceof go)) {
            go goVar = (go) obj;
            return this.xy == goVar.xy && this.xw == goVar.xw && this.xx == goVar.xx && this.xv == goVar.xv;
        }
        return false;
    }

    public long getExpirationTime() {
        return this.ye;
    }

    public double getLatitude() {
        return this.xw;
    }

    public double getLongitude() {
        return this.xx;
    }

    public int getNotificationResponsiveness() {
        return this.xz;
    }

    @Override // com.google.android.gms.location.Geofence
    public String getRequestId() {
        return this.xs;
    }

    public int getVersionCode() {
        return this.kg;
    }

    public int hashCode() {
        long doubleToLongBits = Double.doubleToLongBits(this.xw);
        long doubleToLongBits2 = Double.doubleToLongBits(this.xx);
        return ((((((((((int) (doubleToLongBits ^ (doubleToLongBits >>> 32))) + 31) * 31) + ((int) (doubleToLongBits2 ^ (doubleToLongBits2 >>> 32)))) * 31) + Float.floatToIntBits(this.xy)) * 31) + this.xv) * 31) + this.xt;
    }

    public String toString() {
        return String.format(Locale.US, "Geofence[%s id:%s transitions:%d %.6f, %.6f %.0fm, resp=%ds, dwell=%dms, @%d]", aW(this.xv), this.xs, Integer.valueOf(this.xt), Double.valueOf(this.xw), Double.valueOf(this.xx), Float.valueOf(this.xy), Integer.valueOf(this.xz / 1000), Integer.valueOf(this.xA), Long.valueOf(this.ye));
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int flags) {
        gp gpVar = CREATOR;
        gp.a(this, parcel, flags);
    }
}
