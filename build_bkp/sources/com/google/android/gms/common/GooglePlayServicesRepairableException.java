package com.google.android.gms.common;

import android.content.Intent;

public class GooglePlayServicesRepairableException extends UserRecoverableException {

    /* renamed from: kf */
    private final int f1302kf;

    GooglePlayServicesRepairableException(int connectionStatusCode, String msg, Intent intent) {
        super(msg, intent);
        this.f1302kf = connectionStatusCode;
    }

    public int getConnectionStatusCode() {
        return this.f1302kf;
    }
}
