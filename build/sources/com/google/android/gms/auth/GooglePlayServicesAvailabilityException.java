package com.google.android.gms.auth;

import android.content.Intent;

public class GooglePlayServicesAvailabilityException extends UserRecoverableAuthException {

    /* renamed from: kf */
    private final int f1194kf;

    GooglePlayServicesAvailabilityException(int connectionStatusCode, String msg, Intent intent) {
        super(msg, intent);
        this.f1194kf = connectionStatusCode;
    }

    public int getConnectionStatusCode() {
        return this.f1194kf;
    }
}
