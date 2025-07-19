package com.google.android.gms.ads;

import android.content.Context;
import android.location.Location;
import com.google.android.gms.ads.mediation.NetworkExtras;
import com.google.android.gms.internal.C0864af;
import java.util.Date;
import java.util.Set;

public final class AdRequest {
    public static final String DEVICE_ID_EMULATOR = C0864af.DEVICE_ID_EMULATOR;
    public static final int ERROR_CODE_INTERNAL_ERROR = 0;
    public static final int ERROR_CODE_INVALID_REQUEST = 1;
    public static final int ERROR_CODE_NETWORK_ERROR = 2;
    public static final int ERROR_CODE_NO_FILL = 3;
    public static final int GENDER_FEMALE = 2;
    public static final int GENDER_MALE = 1;
    public static final int GENDER_UNKNOWN = 0;

    /* renamed from: dW */
    private final C0864af f1108dW;

    public static final class Builder {
        /* access modifiers changed from: private */

        /* renamed from: dX */
        public final C0864af.C0865a f1109dX = new C0864af.C0865a();

        public Builder addKeyword(String keyword) {
            this.f1109dX.mo7035g(keyword);
            return this;
        }

        public Builder addNetworkExtras(NetworkExtras networkExtras) {
            this.f1109dX.mo7030a(networkExtras);
            return this;
        }

        public Builder addTestDevice(String deviceId) {
            this.f1109dX.mo7036h(deviceId);
            return this;
        }

        public AdRequest build() {
            return new AdRequest(this);
        }

        public Builder setBirthday(Date birthday) {
            this.f1109dX.mo7031a(birthday);
            return this;
        }

        public Builder setGender(int gender) {
            this.f1109dX.mo7032d(gender);
            return this;
        }

        public Builder setLocation(Location location) {
            this.f1109dX.mo7029a(location);
            return this;
        }

        public Builder tagForChildDirectedTreatment(boolean tagForChildDirectedTreatment) {
            this.f1109dX.mo7034e(tagForChildDirectedTreatment);
            return this;
        }
    }

    private AdRequest(Builder builder) {
        this.f1108dW = new C0864af(builder.f1109dX);
    }

    public Date getBirthday() {
        return this.f1108dW.getBirthday();
    }

    public int getGender() {
        return this.f1108dW.getGender();
    }

    public Set<String> getKeywords() {
        return this.f1108dW.getKeywords();
    }

    public Location getLocation() {
        return this.f1108dW.getLocation();
    }

    public <T extends NetworkExtras> T getNetworkExtras(Class<T> networkExtrasClass) {
        return this.f1108dW.getNetworkExtras(networkExtrasClass);
    }

    public boolean isTestDevice(Context context) {
        return this.f1108dW.isTestDevice(context);
    }

    /* access modifiers changed from: package-private */
    /* renamed from: v */
    public C0864af mo5435v() {
        return this.f1108dW;
    }
}
