package com.google.android.gms.location;

import android.os.SystemClock;
import com.google.android.gms.internal.go;
/* loaded from: classes.dex */
public interface Geofence {
    public static final int GEOFENCE_TRANSITION_DWELL = 4;
    public static final int GEOFENCE_TRANSITION_ENTER = 1;
    public static final int GEOFENCE_TRANSITION_EXIT = 2;
    public static final long NEVER_EXPIRE = -1;

    /* loaded from: classes.dex */
    public static final class Builder {
        private double xw;
        private double xx;
        private float xy;
        private String xs = null;
        private int xt = 0;
        private long xu = Long.MIN_VALUE;
        private short xv = -1;
        private int xz = 0;
        private int xA = -1;

        public Geofence build() {
            if (this.xs == null) {
                throw new IllegalArgumentException("Request ID not set.");
            }
            if (this.xt == 0) {
                throw new IllegalArgumentException("Transitions types not set.");
            }
            if ((this.xt & 4) != 0 && this.xA < 0) {
                throw new IllegalArgumentException("Non-negative loitering delay needs to be set when transition types include GEOFENCE_TRANSITION_DWELLING.");
            }
            if (this.xu == Long.MIN_VALUE) {
                throw new IllegalArgumentException("Expiration not set.");
            }
            if (this.xv == -1) {
                throw new IllegalArgumentException("Geofence region not set.");
            }
            if (this.xz >= 0) {
                return new go(this.xs, this.xt, (short) 1, this.xw, this.xx, this.xy, this.xu, this.xz, this.xA);
            }
            throw new IllegalArgumentException("Notification responsiveness should be nonnegative.");
        }

        public Builder setCircularRegion(double latitude, double longitude, float radius) {
            this.xv = (short) 1;
            this.xw = latitude;
            this.xx = longitude;
            this.xy = radius;
            return this;
        }

        public Builder setExpirationDuration(long durationMillis) {
            if (durationMillis < 0) {
                this.xu = -1L;
            } else {
                this.xu = SystemClock.elapsedRealtime() + durationMillis;
            }
            return this;
        }

        public Builder setLoiteringDelay(int loiteringDelayMs) {
            this.xA = loiteringDelayMs;
            return this;
        }

        public Builder setNotificationResponsiveness(int notificationResponsivenessMs) {
            this.xz = notificationResponsivenessMs;
            return this;
        }

        public Builder setRequestId(String requestId) {
            this.xs = requestId;
            return this;
        }

        public Builder setTransitionTypes(int transitionTypes) {
            this.xt = transitionTypes;
            return this;
        }
    }

    String getRequestId();
}
