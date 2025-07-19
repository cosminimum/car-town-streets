package com.google.android.gms.ads.doubleclick;

import android.content.Context;
import android.location.Location;
import com.google.android.gms.ads.mediation.NetworkExtras;
import com.google.android.gms.internal.af;
import java.util.Date;
import java.util.Set;
/* loaded from: classes.dex */
public final class PublisherAdRequest {
    public static final String DEVICE_ID_EMULATOR = af.DEVICE_ID_EMULATOR;
    public static final int ERROR_CODE_INTERNAL_ERROR = 0;
    public static final int ERROR_CODE_INVALID_REQUEST = 1;
    public static final int ERROR_CODE_NETWORK_ERROR = 2;
    public static final int ERROR_CODE_NO_FILL = 3;
    public static final int GENDER_FEMALE = 2;
    public static final int GENDER_MALE = 1;
    public static final int GENDER_UNKNOWN = 0;
    private final af dW;

    /* loaded from: classes.dex */
    public static final class Builder {
        private final af.a dX = new af.a();

        public Builder addKeyword(String keyword) {
            this.dX.g(keyword);
            return this;
        }

        public Builder addNetworkExtras(NetworkExtras networkExtras) {
            this.dX.a(networkExtras);
            return this;
        }

        public Builder addTestDevice(String deviceId) {
            this.dX.h(deviceId);
            return this;
        }

        public PublisherAdRequest build() {
            return new PublisherAdRequest(this);
        }

        public Builder setBirthday(Date birthday) {
            this.dX.a(birthday);
            return this;
        }

        public Builder setGender(int gender) {
            this.dX.d(gender);
            return this;
        }

        public Builder setLocation(Location location) {
            this.dX.a(location);
            return this;
        }

        public Builder setManualImpressionsEnabled(boolean manualImpressionsEnabled) {
            this.dX.d(manualImpressionsEnabled);
            return this;
        }

        public Builder setPublisherProvidedId(String publisherProvidedId) {
            this.dX.i(publisherProvidedId);
            return this;
        }

        public Builder tagForChildDirectedTreatment(boolean tagForChildDirectedTreatment) {
            this.dX.e(tagForChildDirectedTreatment);
            return this;
        }
    }

    private PublisherAdRequest(Builder builder) {
        this.dW = new af(builder.dX);
    }

    public Date getBirthday() {
        return this.dW.getBirthday();
    }

    public int getGender() {
        return this.dW.getGender();
    }

    public Set<String> getKeywords() {
        return this.dW.getKeywords();
    }

    public Location getLocation() {
        return this.dW.getLocation();
    }

    public boolean getManualImpressionsEnabled() {
        return this.dW.getManualImpressionsEnabled();
    }

    public <T extends NetworkExtras> T getNetworkExtras(Class<T> networkExtrasClass) {
        return (T) this.dW.getNetworkExtras(networkExtrasClass);
    }

    public String getPublisherProvidedId() {
        return this.dW.getPublisherProvidedId();
    }

    public boolean isTestDevice(Context context) {
        return this.dW.isTestDevice(context);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public af v() {
        return this.dW;
    }
}
