package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.location.Geofence;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import java.util.Locale;

/* renamed from: com.google.android.gms.internal.go */
public class C1318go implements SafeParcelable, Geofence {
    public static final C1319gp CREATOR = new C1319gp();

    /* renamed from: kg */
    private final int f2993kg;

    /* renamed from: xA */
    private final int f2994xA;

    /* renamed from: xs */
    private final String f2995xs;

    /* renamed from: xt */
    private final int f2996xt;

    /* renamed from: xv */
    private final short f2997xv;

    /* renamed from: xw */
    private final double f2998xw;

    /* renamed from: xx */
    private final double f2999xx;

    /* renamed from: xy */
    private final float f3000xy;

    /* renamed from: xz */
    private final int f3001xz;

    /* renamed from: ye */
    private final long f3002ye;

    public C1318go(int i, String str, int i2, short s, double d, double d2, float f, long j, int i3, int i4) {
        m3514ap(str);
        m3515b(f);
        m3511a(d, d2);
        int aV = m3512aV(i2);
        this.f2993kg = i;
        this.f2997xv = s;
        this.f2995xs = str;
        this.f2998xw = d;
        this.f2999xx = d2;
        this.f3000xy = f;
        this.f3002ye = j;
        this.f2996xt = aV;
        this.f3001xz = i3;
        this.f2994xA = i4;
    }

    public C1318go(String str, int i, short s, double d, double d2, float f, long j, int i2, int i3) {
        this(1, str, i, s, d, d2, f, j, i2, i3);
    }

    /* renamed from: a */
    private static void m3511a(double d, double d2) {
        if (d > 90.0d || d < -90.0d) {
            throw new IllegalArgumentException("invalid latitude: " + d);
        } else if (d2 > 180.0d || d2 < -180.0d) {
            throw new IllegalArgumentException("invalid longitude: " + d2);
        }
    }

    /* renamed from: aV */
    private static int m3512aV(int i) {
        int i2 = i & 7;
        if (i2 != 0) {
            return i2;
        }
        throw new IllegalArgumentException("No supported transition specified: " + i);
    }

    /* renamed from: aW */
    private static String m3513aW(int i) {
        switch (i) {
            case 1:
                return "CIRCLE";
            default:
                return null;
        }
    }

    /* renamed from: ap */
    private static void m3514ap(String str) {
        if (str == null || str.length() > 100) {
            throw new IllegalArgumentException("requestId is null or too long: " + str);
        }
    }

    /* renamed from: b */
    private static void m3515b(float f) {
        if (f <= BitmapDescriptorFactory.HUE_RED) {
            throw new IllegalArgumentException("invalid radius: " + f);
        }
    }

    /* renamed from: f */
    public static C1318go m3516f(byte[] bArr) {
        Parcel obtain = Parcel.obtain();
        obtain.unmarshall(bArr, 0, bArr.length);
        obtain.setDataPosition(0);
        C1318go ai = CREATOR.createFromParcel(obtain);
        obtain.recycle();
        return ai;
    }

    /* renamed from: dK */
    public short mo8104dK() {
        return this.f2997xv;
    }

    /* renamed from: dL */
    public float mo8105dL() {
        return this.f3000xy;
    }

    /* renamed from: dM */
    public int mo8106dM() {
        return this.f2996xt;
    }

    /* renamed from: dN */
    public int mo8107dN() {
        return this.f2994xA;
    }

    public int describeContents() {
        C1319gp gpVar = CREATOR;
        return 0;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (!(obj instanceof C1318go)) {
            return false;
        }
        C1318go goVar = (C1318go) obj;
        if (this.f3000xy != goVar.f3000xy) {
            return false;
        }
        if (this.f2998xw != goVar.f2998xw) {
            return false;
        }
        if (this.f2999xx != goVar.f2999xx) {
            return false;
        }
        return this.f2997xv == goVar.f2997xv;
    }

    public long getExpirationTime() {
        return this.f3002ye;
    }

    public double getLatitude() {
        return this.f2998xw;
    }

    public double getLongitude() {
        return this.f2999xx;
    }

    public int getNotificationResponsiveness() {
        return this.f3001xz;
    }

    public String getRequestId() {
        return this.f2995xs;
    }

    public int getVersionCode() {
        return this.f2993kg;
    }

    public int hashCode() {
        long doubleToLongBits = Double.doubleToLongBits(this.f2998xw);
        long doubleToLongBits2 = Double.doubleToLongBits(this.f2999xx);
        return ((((((((((int) (doubleToLongBits ^ (doubleToLongBits >>> 32))) + 31) * 31) + ((int) (doubleToLongBits2 ^ (doubleToLongBits2 >>> 32)))) * 31) + Float.floatToIntBits(this.f3000xy)) * 31) + this.f2997xv) * 31) + this.f2996xt;
    }

    public String toString() {
        return String.format(Locale.US, "Geofence[%s id:%s transitions:%d %.6f, %.6f %.0fm, resp=%ds, dwell=%dms, @%d]", new Object[]{m3513aW(this.f2997xv), this.f2995xs, Integer.valueOf(this.f2996xt), Double.valueOf(this.f2998xw), Double.valueOf(this.f2999xx), Float.valueOf(this.f3000xy), Integer.valueOf(this.f3001xz / 1000), Integer.valueOf(this.f2994xA), Long.valueOf(this.f3002ye)});
    }

    public void writeToParcel(Parcel parcel, int flags) {
        C1319gp gpVar = CREATOR;
        C1319gp.m3521a(this, parcel, flags);
    }
}
