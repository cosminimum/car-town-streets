package com.google.android.gms.location;

import android.os.Parcel;
import android.os.SystemClock;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.C1098ee;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;

public final class LocationRequest implements SafeParcelable {
    public static final LocationRequestCreator CREATOR = new LocationRequestCreator();
    public static final int PRIORITY_BALANCED_POWER_ACCURACY = 102;
    public static final int PRIORITY_HIGH_ACCURACY = 100;
    public static final int PRIORITY_LOW_POWER = 104;
    public static final int PRIORITY_NO_POWER = 105;

    /* renamed from: kg */
    private final int f3507kg;
    int mPriority;

    /* renamed from: xB */
    long f3508xB;

    /* renamed from: xC */
    long f3509xC;

    /* renamed from: xD */
    boolean f3510xD;

    /* renamed from: xE */
    int f3511xE;

    /* renamed from: xF */
    float f3512xF;

    /* renamed from: xu */
    long f3513xu;

    public LocationRequest() {
        this.f3507kg = 1;
        this.mPriority = 102;
        this.f3508xB = 3600000;
        this.f3509xC = 600000;
        this.f3510xD = false;
        this.f3513xu = Long.MAX_VALUE;
        this.f3511xE = Integer.MAX_VALUE;
        this.f3512xF = BitmapDescriptorFactory.HUE_RED;
    }

    LocationRequest(int versionCode, int priority, long interval, long fastestInterval, boolean explicitFastestInterval, long expireAt, int numUpdates, float smallestDisplacement) {
        this.f3507kg = versionCode;
        this.mPriority = priority;
        this.f3508xB = interval;
        this.f3509xC = fastestInterval;
        this.f3510xD = explicitFastestInterval;
        this.f3513xu = expireAt;
        this.f3511xE = numUpdates;
        this.f3512xF = smallestDisplacement;
    }

    /* renamed from: a */
    private static void m4086a(float f) {
        if (f < BitmapDescriptorFactory.HUE_RED) {
            throw new IllegalArgumentException("invalid displacement: " + f);
        }
    }

    /* renamed from: aO */
    private static void m4087aO(int i) {
        switch (i) {
            case 100:
            case 102:
            case PRIORITY_LOW_POWER /*104*/:
            case PRIORITY_NO_POWER /*105*/:
                return;
            default:
                throw new IllegalArgumentException("invalid quality: " + i);
        }
    }

    /* renamed from: aP */
    public static String m4088aP(int i) {
        switch (i) {
            case 100:
                return "PRIORITY_HIGH_ACCURACY";
            case 102:
                return "PRIORITY_BALANCED_POWER_ACCURACY";
            case PRIORITY_LOW_POWER /*104*/:
                return "PRIORITY_LOW_POWER";
            case PRIORITY_NO_POWER /*105*/:
                return "PRIORITY_NO_POWER";
            default:
                return "???";
        }
    }

    public static LocationRequest create() {
        return new LocationRequest();
    }

    /* renamed from: m */
    private static void m4089m(long j) {
        if (j < 0) {
            throw new IllegalArgumentException("invalid interval: " + j);
        }
    }

    public int describeContents() {
        return 0;
    }

    public boolean equals(Object object) {
        if (this == object) {
            return true;
        }
        if (!(object instanceof LocationRequest)) {
            return false;
        }
        LocationRequest locationRequest = (LocationRequest) object;
        return this.mPriority == locationRequest.mPriority && this.f3508xB == locationRequest.f3508xB && this.f3509xC == locationRequest.f3509xC && this.f3510xD == locationRequest.f3510xD && this.f3513xu == locationRequest.f3513xu && this.f3511xE == locationRequest.f3511xE && this.f3512xF == locationRequest.f3512xF;
    }

    public long getExpirationTime() {
        return this.f3513xu;
    }

    public long getFastestInterval() {
        return this.f3509xC;
    }

    public long getInterval() {
        return this.f3508xB;
    }

    public int getNumUpdates() {
        return this.f3511xE;
    }

    public int getPriority() {
        return this.mPriority;
    }

    public float getSmallestDisplacement() {
        return this.f3512xF;
    }

    /* access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.f3507kg;
    }

    public int hashCode() {
        return C1098ee.hashCode(Integer.valueOf(this.mPriority), Long.valueOf(this.f3508xB), Long.valueOf(this.f3509xC), Boolean.valueOf(this.f3510xD), Long.valueOf(this.f3513xu), Integer.valueOf(this.f3511xE), Float.valueOf(this.f3512xF));
    }

    public LocationRequest setExpirationDuration(long millis) {
        long elapsedRealtime = SystemClock.elapsedRealtime();
        if (millis > Long.MAX_VALUE - elapsedRealtime) {
            this.f3513xu = Long.MAX_VALUE;
        } else {
            this.f3513xu = elapsedRealtime + millis;
        }
        if (this.f3513xu < 0) {
            this.f3513xu = 0;
        }
        return this;
    }

    public LocationRequest setExpirationTime(long millis) {
        this.f3513xu = millis;
        if (this.f3513xu < 0) {
            this.f3513xu = 0;
        }
        return this;
    }

    public LocationRequest setFastestInterval(long millis) {
        m4089m(millis);
        this.f3510xD = true;
        this.f3509xC = millis;
        return this;
    }

    public LocationRequest setInterval(long millis) {
        m4089m(millis);
        this.f3508xB = millis;
        if (!this.f3510xD) {
            this.f3509xC = (long) (((double) this.f3508xB) / 6.0d);
        }
        return this;
    }

    public LocationRequest setNumUpdates(int numUpdates) {
        if (numUpdates <= 0) {
            throw new IllegalArgumentException("invalid numUpdates: " + numUpdates);
        }
        this.f3511xE = numUpdates;
        return this;
    }

    public LocationRequest setPriority(int priority) {
        m4087aO(priority);
        this.mPriority = priority;
        return this;
    }

    public LocationRequest setSmallestDisplacement(float smallestDisplacementMeters) {
        m4086a(smallestDisplacementMeters);
        this.f3512xF = smallestDisplacementMeters;
        return this;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Request[").append(m4088aP(this.mPriority));
        if (this.mPriority != 105) {
            sb.append(" requested=");
            sb.append(this.f3508xB + "ms");
        }
        sb.append(" fastest=");
        sb.append(this.f3509xC + "ms");
        if (this.f3513xu != Long.MAX_VALUE) {
            long elapsedRealtime = this.f3513xu - SystemClock.elapsedRealtime();
            sb.append(" expireIn=");
            sb.append(elapsedRealtime + "ms");
        }
        if (this.f3511xE != Integer.MAX_VALUE) {
            sb.append(" num=").append(this.f3511xE);
        }
        sb.append(']');
        return sb.toString();
    }

    public void writeToParcel(Parcel parcel, int flags) {
        LocationRequestCreator.m4090a(this, parcel, flags);
    }
}
