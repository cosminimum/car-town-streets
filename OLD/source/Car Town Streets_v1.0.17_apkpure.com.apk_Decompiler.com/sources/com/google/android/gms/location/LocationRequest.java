package com.google.android.gms.location;

import android.os.Parcel;
import android.os.SystemClock;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.ee;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;

public final class LocationRequest implements SafeParcelable {
    public static final LocationRequestCreator CREATOR = new LocationRequestCreator();
    public static final int PRIORITY_BALANCED_POWER_ACCURACY = 102;
    public static final int PRIORITY_HIGH_ACCURACY = 100;
    public static final int PRIORITY_LOW_POWER = 104;
    public static final int PRIORITY_NO_POWER = 105;
    private final int kg;
    int mPriority;
    long xB;
    long xC;
    boolean xD;
    int xE;
    float xF;
    long xu;

    public LocationRequest() {
        this.kg = 1;
        this.mPriority = 102;
        this.xB = 3600000;
        this.xC = 600000;
        this.xD = false;
        this.xu = Long.MAX_VALUE;
        this.xE = Integer.MAX_VALUE;
        this.xF = BitmapDescriptorFactory.HUE_RED;
    }

    LocationRequest(int versionCode, int priority, long interval, long fastestInterval, boolean explicitFastestInterval, long expireAt, int numUpdates, float smallestDisplacement) {
        this.kg = versionCode;
        this.mPriority = priority;
        this.xB = interval;
        this.xC = fastestInterval;
        this.xD = explicitFastestInterval;
        this.xu = expireAt;
        this.xE = numUpdates;
        this.xF = smallestDisplacement;
    }

    private static void a(float f) {
        if (f < BitmapDescriptorFactory.HUE_RED) {
            throw new IllegalArgumentException("invalid displacement: " + f);
        }
    }

    private static void aO(int i) {
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

    public static String aP(int i) {
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

    private static void m(long j) {
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
        return this.mPriority == locationRequest.mPriority && this.xB == locationRequest.xB && this.xC == locationRequest.xC && this.xD == locationRequest.xD && this.xu == locationRequest.xu && this.xE == locationRequest.xE && this.xF == locationRequest.xF;
    }

    public long getExpirationTime() {
        return this.xu;
    }

    public long getFastestInterval() {
        return this.xC;
    }

    public long getInterval() {
        return this.xB;
    }

    public int getNumUpdates() {
        return this.xE;
    }

    public int getPriority() {
        return this.mPriority;
    }

    public float getSmallestDisplacement() {
        return this.xF;
    }

    /* access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.kg;
    }

    public int hashCode() {
        return ee.hashCode(Integer.valueOf(this.mPriority), Long.valueOf(this.xB), Long.valueOf(this.xC), Boolean.valueOf(this.xD), Long.valueOf(this.xu), Integer.valueOf(this.xE), Float.valueOf(this.xF));
    }

    public LocationRequest setExpirationDuration(long millis) {
        long elapsedRealtime = SystemClock.elapsedRealtime();
        if (millis > Long.MAX_VALUE - elapsedRealtime) {
            this.xu = Long.MAX_VALUE;
        } else {
            this.xu = elapsedRealtime + millis;
        }
        if (this.xu < 0) {
            this.xu = 0;
        }
        return this;
    }

    public LocationRequest setExpirationTime(long millis) {
        this.xu = millis;
        if (this.xu < 0) {
            this.xu = 0;
        }
        return this;
    }

    public LocationRequest setFastestInterval(long millis) {
        m(millis);
        this.xD = true;
        this.xC = millis;
        return this;
    }

    public LocationRequest setInterval(long millis) {
        m(millis);
        this.xB = millis;
        if (!this.xD) {
            this.xC = (long) (((double) this.xB) / 6.0d);
        }
        return this;
    }

    public LocationRequest setNumUpdates(int numUpdates) {
        if (numUpdates <= 0) {
            throw new IllegalArgumentException("invalid numUpdates: " + numUpdates);
        }
        this.xE = numUpdates;
        return this;
    }

    public LocationRequest setPriority(int priority) {
        aO(priority);
        this.mPriority = priority;
        return this;
    }

    public LocationRequest setSmallestDisplacement(float smallestDisplacementMeters) {
        a(smallestDisplacementMeters);
        this.xF = smallestDisplacementMeters;
        return this;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Request[").append(aP(this.mPriority));
        if (this.mPriority != 105) {
            sb.append(" requested=");
            sb.append(this.xB + "ms");
        }
        sb.append(" fastest=");
        sb.append(this.xC + "ms");
        if (this.xu != Long.MAX_VALUE) {
            long elapsedRealtime = this.xu - SystemClock.elapsedRealtime();
            sb.append(" expireIn=");
            sb.append(elapsedRealtime + "ms");
        }
        if (this.xE != Integer.MAX_VALUE) {
            sb.append(" num=").append(this.xE);
        }
        sb.append(']');
        return sb.toString();
    }

    public void writeToParcel(Parcel parcel, int flags) {
        LocationRequestCreator.a(this, parcel, flags);
    }
}
