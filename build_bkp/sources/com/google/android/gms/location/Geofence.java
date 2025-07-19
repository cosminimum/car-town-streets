package com.google.android.gms.location;

import android.os.SystemClock;
import com.google.android.gms.internal.C1318go;

public interface Geofence {
    public static final int GEOFENCE_TRANSITION_DWELL = 4;
    public static final int GEOFENCE_TRANSITION_ENTER = 1;
    public static final int GEOFENCE_TRANSITION_EXIT = 2;
    public static final long NEVER_EXPIRE = -1;

    public static final class Builder {

        /* renamed from: xA */
        private int f3497xA = -1;

        /* renamed from: xs */
        private String f3498xs = null;

        /* renamed from: xt */
        private int f3499xt = 0;

        /* renamed from: xu */
        private long f3500xu = Long.MIN_VALUE;

        /* renamed from: xv */
        private short f3501xv = -1;

        /* renamed from: xw */
        private double f3502xw;

        /* renamed from: xx */
        private double f3503xx;

        /* renamed from: xy */
        private float f3504xy;

        /* renamed from: xz */
        private int f3505xz = 0;

        public Geofence build() {
            if (this.f3498xs == null) {
                throw new IllegalArgumentException("Request ID not set.");
            } else if (this.f3499xt == 0) {
                throw new IllegalArgumentException("Transitions types not set.");
            } else if ((this.f3499xt & 4) != 0 && this.f3497xA < 0) {
                throw new IllegalArgumentException("Non-negative loitering delay needs to be set when transition types include GEOFENCE_TRANSITION_DWELLING.");
            } else if (this.f3500xu == Long.MIN_VALUE) {
                throw new IllegalArgumentException("Expiration not set.");
            } else if (this.f3501xv == -1) {
                throw new IllegalArgumentException("Geofence region not set.");
            } else if (this.f3505xz >= 0) {
                return new C1318go(this.f3498xs, this.f3499xt, 1, this.f3502xw, this.f3503xx, this.f3504xy, this.f3500xu, this.f3505xz, this.f3497xA);
            } else {
                throw new IllegalArgumentException("Notification responsiveness should be nonnegative.");
            }
        }

        public Builder setCircularRegion(double latitude, double longitude, float radius) {
            this.f3501xv = 1;
            this.f3502xw = latitude;
            this.f3503xx = longitude;
            this.f3504xy = radius;
            return this;
        }

        public Builder setExpirationDuration(long durationMillis) {
            if (durationMillis < 0) {
                this.f3500xu = -1;
            } else {
                this.f3500xu = SystemClock.elapsedRealtime() + durationMillis;
            }
            return this;
        }

        public Builder setLoiteringDelay(int loiteringDelayMs) {
            this.f3497xA = loiteringDelayMs;
            return this;
        }

        public Builder setNotificationResponsiveness(int notificationResponsivenessMs) {
            this.f3505xz = notificationResponsivenessMs;
            return this;
        }

        public Builder setRequestId(String requestId) {
            this.f3498xs = requestId;
            return this;
        }

        public Builder setTransitionTypes(int transitionTypes) {
            this.f3499xt = transitionTypes;
            return this;
        }
    }

    String getRequestId();
}
